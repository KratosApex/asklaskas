const pool = require('../config/database');
const logger = require('../utils/logger');

module.exports = {
  name: 'guildMemberRemove',
  once: false,
  async execute(member, client) {
    try {
      // Verificar se o usuário tem uma conta vinculada
      const [rows] = await pool.execute('SELECT * FROM accounts WHERE discord = ?', [member.id]);
      
      if (rows.length > 0) {
        // Remover whitelist
        await pool.execute('UPDATE accounts SET whitelist = 0 WHERE discord = ?', [member.id]);
        
        await logger.logDatabase(
          "Whitelist Removida (Anti-Leave)", 
          `Usuário: ${member.user.tag} (${member.id})\nID na conta: ${rows[0].id}`
        );
        
        console.log(`Whitelist removida do usuário ${member.user.tag} (ID: ${member.id}) por ter saído do servidor.`);
      }
    } catch (error) {
      console.error('Erro ao remover whitelist:', error);
      await logger.logError("Evento guildMemberRemove", error);
    }
  },
};
