const logger = require('../utils/logger');

module.exports = {
  name: 'ready',
  once: true,
  async execute(client) {
    console.log(`Bot iniciado como ${client.user.tag}!`);
    
    // Definir status do bot
    client.user.setPresence({
      activities: [{ name: 'Servidor FiveM', type: 3 }],
      status: 'online',
    });
    
    // Registrar no log
    await logger.logDatabase("Bot Iniciado", `Bot iniciado com sucesso como ${client.user.tag}`);
  },
};
