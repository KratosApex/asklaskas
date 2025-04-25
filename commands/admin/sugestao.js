const { SlashCommandBuilder, EmbedBuilder, ActionRowBuilder, ButtonBuilder, ButtonStyle } = require('discord.js');
const logger = require('../../utils/logger');

module.exports = {
    data: new SlashCommandBuilder()
        .setName('sugestao')
        .setDescription('Envia uma sugestão para o servidor')
        .addStringOption(option =>
            option.setName('titulo')
                .setDescription('Título da sugestão')
                .setRequired(true))
        .addStringOption(option =>
            option.setName('descricao')
                .setDescription('Descrição detalhada da sugestão')
                .setRequired(true)),

    async execute(interaction, client) {
        const titulo = interaction.options.getString('titulo');
        const descricao = interaction.options.getString('descricao');

        try {
            const suggestionsChannel = client.channels.cache.get(client.config.SUGGESTION_CHANNEL_ID);
            if (!suggestionsChannel) {
                return interaction.reply({
                    content: '❌ Canal de sugestões não configurado. Contate um administrador.',
                    ephemeral: true
                });
            }

            const embed = new EmbedBuilder()
                .setColor(0x0099FF)
                .setTitle(`Sugestão: ${titulo}`)
                .setDescription(descricao)
                .addFields(
                    { name: 'Autor', value: `<@${interaction.user.id}>`, inline: true },
                    { name: 'Status', value: '⏳ Em análise', inline: true },
                    { name: 'Data', value: new Date().toLocaleDateString('pt-BR'), inline: true }
                )
                .setFooter({ text: 'Use os botões abaixo para votar nesta sugestão' })
                .setTimestamp();

            const row = new ActionRowBuilder()
                .addComponents(
                    new ButtonBuilder()
                        .setCustomId('suggestion_upvote')
                        .setLabel('👍 A favor')
                        .setStyle(ButtonStyle.Success),
                    new ButtonBuilder()
                        .setCustomId('suggestion_downvote')
                        .setLabel('👎 Contra')
                        .setStyle(ButtonStyle.Danger),
                    new ButtonBuilder()
                        .setCustomId('suggestion_comment')
                        .setLabel('💬 Comentar')
                        .setStyle(ButtonStyle.Primary)
                );

            const message = await suggestionsChannel.send({ embeds: [embed], components: [row] });

            // Adicionar reações iniciais
            await message.react('👍');
            await message.react('👎');

            await logger.logCommand(
                interaction,
                "Sugestão enviada",
                `Autor: <@${interaction.user.id}>\nTítulo: ${titulo}\nMensagem: ${message.url}`
            );

            return interaction.reply({
                content: `✅ Sua sugestão foi enviada com sucesso! Você pode vê-la em <#${suggestionsChannel.id}>.`,
                ephemeral: true
            });
        } catch (error) {
            console.error(error);
            await logger.logError(`Comando ${interaction.commandName}`, error);
            return interaction.reply({
                content: '❌ Ocorreu um erro ao enviar sua sugestão.',
                ephemeral: true
            });
        }
    },

    // Adicionar o manipulador de interações para os botões
    async handleInteraction(interaction, client) {
        if (!interaction.isButton()) return;

        // Verificar se é um dos botões de sugestão
        if (interaction.customId.startsWith('suggestion_')) {
            try {
                // Primeiro, informar ao Discord que recebemos a interação
                await interaction.deferUpdate();

                const userId = interaction.user.id;
                const messageId = interaction.message.id;
                
                // Tratar cada tipo de botão
                switch (interaction.customId) {
                    case 'suggestion_upvote':
                        // Aqui você pode adicionar lógica para armazenar votos em um banco de dados
                        console.log(`Usuário ${userId} votou a favor da sugestão ${messageId}`);
                        await logger.logInteraction(
                            interaction,
                            "Voto positivo em sugestão",
                            `Usuário: <@${userId}>\nMensagem: ${interaction.message.url}`
                        );
                        break;
                        
                    case 'suggestion_downvote':
                        // Lógica para votos negativos
                        console.log(`Usuário ${userId} votou contra a sugestão ${messageId}`);
                        await logger.logInteraction(
                            interaction,
                            "Voto negativo em sugestão",
                            `Usuário: <@${userId}>\nMensagem: ${interaction.message.url}`
                        );
                        break;
                        
                    case 'suggestion_comment':
                        // Para comentários, enviamos uma mensagem efêmera
                        await interaction.followUp({
                            content: 'Para comentar nesta sugestão, responda diretamente à mensagem no canal.',
                            ephemeral: true
                        });
                        
                        console.log(`Usuário ${userId} tentou comentar na sugestão ${messageId}`);
                        await logger.logInteraction(
                            interaction,
                            "Tentativa de comentário em sugestão",
                            `Usuário: <@${userId}>\nMensagem: ${interaction.message.url}`
                        );
                        break;
                }
            } catch (error) {
                console.error(error);
                await logger.logError(`Interação de botão ${interaction.customId}`, error);
                
                // Tentar enviar uma mensagem de erro para o usuário
                try {
                    await interaction.followUp({
                        content: '❌ Ocorreu um erro ao processar sua interação.',
                        ephemeral: true
                    });
                } catch (followUpError) {
                    console.error('Erro ao enviar mensagem de erro:', followUpError);
                }
            }
        }
    }
};
