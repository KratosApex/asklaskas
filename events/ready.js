const { ActivityType } = require('discord.js');
const logger = require('../utils/logger');

module.exports = {
    name: 'ready',
    once: true,
    async execute(client) {
        console.log(`Bot iniciado como ${client.user.tag}!`);

        // Definir o status personalizado com emoji
        client.user.setPresence({
            activities: [{ 
                name: 'Bot Desenvolvido por Brasil fivem Host',
                type: ActivityType.Custom, // Tipo 4 para Custom Status
                state: '🤖 Bot Desenvolvido por Brasil fivem Host ✅'
            }],
            status: 'online',
        });

        // Registrar no log
        await logger.logDatabase("Bot Iniciado", `Bot iniciado com sucesso como ${client.user.tag}`);
        
        // Exibir informações do bot no console
        console.log(`
        ╔════════════════════════════════════════════════╗
        ║                BOT INICIADO                    ║
        ╠════════════════════════════════════════════════╣
        ║ Nome: ${client.user.tag}                       
        ║ Servidores: ${client.guilds.cache.size}        
        ║ Usuários: ${client.users.cache.size}           
        ║ Canais: ${client.channels.cache.size}          
        ║ Data: ${new Date().toLocaleString('pt-BR')}    
        ╚════════════════════════════════════════════════╝
        `);
    },
};
