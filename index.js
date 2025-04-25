const { Client, GatewayIntentBits, Collection } = require('discord.js');
const fs = require('fs');
const path = require('path');
const cron = require('node-cron');

async function startBot() {
    // Carregar configuração
    const configPath = path.join(__dirname, 'config', 'config.json');
    let config = {};
    if (fs.existsSync(configPath)) {
        try {
            config = JSON.parse(fs.readFileSync(configPath, 'utf8'));
        } catch (error) {
            console.error('Erro ao ler arquivo de configuração:', error);
            config = {};
        }
    }

    // Inicializar o cliente do Discord
    const client = new Client({
        intents: [
            GatewayIntentBits.Guilds,
            GatewayIntentBits.GuildMembers,
            GatewayIntentBits.GuildMessages,
            GatewayIntentBits.MessageContent
        ]
    });

    // Coleções para comandos e eventos
    client.commands = new Collection();
    client.events = new Collection();
    client.config = config; // Disponibilizar config para todo o bot
    client.tempConfig = null; // Configuração temporária para edição
    client.statusMessages = new Map(); // Armazenar mensagens de status para atualização

    // Carregar handlers
    const handlersPath = path.join(__dirname, 'handlers');
    const handlerFiles = fs.readdirSync(handlersPath).filter(file => file.endsWith('.js'));
    for (const file of handlerFiles) {
        require(`./handlers/${file}`)(client);
    }

    // Manipulador de interações para botões
    client.on('interactionCreate', async interaction => {
        try {
            // Se for um comando slash, já está sendo tratado pelos handlers
            if (interaction.isChatInputCommand()) return;
            
            // Tratar interações de botões
            if (interaction.isButton()) {
                // Verificar se é um botão de sugestão
                if (interaction.customId.startsWith('suggestion_')) {
                    // Primeiro, informar ao Discord que recebemos a interação
                    await interaction.deferUpdate();
                    
                    const userId = interaction.user.id;
                    const messageId = interaction.message.id;
                    
                    // Lógica específica para cada tipo de botão
                    switch (interaction.customId) {
                        case 'suggestion_upvote':
                            console.log(`Usuário ${userId} votou a favor da sugestão ${messageId}`);
                            // Aqui você pode adicionar lógica para armazenar votos
                            break;
                            
                        case 'suggestion_downvote':
                            console.log(`Usuário ${userId} votou contra a sugestão ${messageId}`);
                            // Lógica para votos negativos
                            break;
                            
                        case 'suggestion_comment':
                            // Para comentários, enviamos uma mensagem efêmera
                            await interaction.followUp({
                                content: 'Para comentar nesta sugestão, responda diretamente à mensagem no canal.',
                                ephemeral: true
                            });
                            console.log(`Usuário ${userId} tentou comentar na sugestão ${messageId}`);
                            break;
                    }
                    
                    // Se você tiver um módulo de logger configurado
                    if (client.logger) {
                        client.logger.log('info', `Interação de botão ${interaction.customId} por ${userId}`);
                    }
                }
            }
        } catch (error) {
            console.error('Erro ao processar interação:', error);
            // Tentar enviar uma mensagem de erro para o usuário
            try {
                if (!interaction.replied && !interaction.deferred) {
                    await interaction.reply({
                        content: '❌ Ocorreu um erro ao processar sua interação.',
                        ephemeral: true
                    });
                } else {
                    await interaction.followUp({
                        content: '❌ Ocorreu um erro ao processar sua interação.',
                        ephemeral: true
                    });
                }
            } catch (followUpError) {
                console.error('Erro ao enviar mensagem de erro:', followUpError);
            }
        }
    });

    // Iniciar tarefas agendadas
    const backupTask = require('./tasks/backup');
    const backupJob = cron.schedule('0 */2 * * *', () => backupTask(client)); // A cada 2 horas
    //const backupJob = cron.schedule('* * * * *', () => backupTask(client)); // A cada 1 minuto

    // Configurar limpeza de recursos ao desligar
    const cleanup = () => {
        console.log('Desligando bot...');
        // Limpar intervalo de atualização de status
        if (client.statusUpdateInterval) {
            clearInterval(client.statusUpdateInterval);
        }

        // Parar tarefas cron
        backupJob.stop();
        console.log('Recursos limpos. Desligando...');
        process.exit(0);
    };

    // Registrar handlers de desligamento
    process.on('SIGINT', cleanup);
    process.on('SIGTERM', cleanup);
    process.on('uncaughtException', (error) => {
        console.error('Erro não tratado:', error);
        cleanup();
    });

    // Login do bot
    if (config.BOT_TOKEN) {
        client.login(config.BOT_TOKEN).catch(err => {
            console.error('Erro ao fazer login com o token fornecido:', err);
            console.log('Verifique se o token é válido e tente novamente.');
        });
    } else {
        console.log('Token do bot não configurado. Use o comando /config após adicionar o bot ao servidor.');
        console.log('Para a primeira execução, você precisa editar manualmente o arquivo config/config.json e adicionar pelo menos o BOT_TOKEN.');
        // Criar um arquivo de configuração básico se não existir
        if (!fs.existsSync(configPath)) {
            const basicConfig = {
                BOT_TOKEN: "INSIRA_SEU_TOKEN_AQUI",
                CLIENT_ID: "",
                GUILD_ID: "",
                DB_HOST: "localhost",
                DB_USER: "root",
                DB_PASSWORD: "",
                DB_NAME: "fivem_db",
                HOST_FIVEM: "localhost",
                PORT_FIVEM: "30120",
                CFX_CODE: "",
                CONNECT_DOMAIN: "",
                ROLES: {},
                LOGS: {},
                SOCIAL: {}
            };

            // Garantir que o diretório config existe
            if (!fs.existsSync(path.join(__dirname, 'config'))) {
                fs.mkdirSync(path.join(__dirname, 'config'), { recursive: true });
            }

            fs.writeFileSync(configPath, JSON.stringify(basicConfig, null, 2));
            console.log(`Arquivo de configuração básico criado em ${configPath}`);
            console.log('Edite este arquivo para adicionar seu token e reinicie o bot.');
        }
    }
}

startBot().catch(error => {
    console.error('Erro ao iniciar o bot:', error);
    process.exit(1);
});
