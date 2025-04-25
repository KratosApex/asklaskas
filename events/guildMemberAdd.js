const { EmbedBuilder } = require('discord.js');
const logger = require('../utils/logger');

module.exports = {
  name: 'guildMemberAdd',
  once: false,
  async execute(member, client) {
    try {
      // Adicionar cargo de boas-vindas
      const welcomeRole = member.guild.roles.cache.get(client.config.ROLES.WELCOME);
      if (welcomeRole) {
        await member.roles.add(welcomeRole);
      }
      
      // Enviar mensagem de boas-vindas
      const welcomeChannel = member.guild.channels.cache.get(client.config.WELCOME_CHANNEL_ID);
      if (!welcomeChannel) return;
      
      const embed = new EmbedBuilder()
        .setColor(0x00FF00)
        .setTitle(`Bem-vindo(a) ${member.user.username}!`)
        .setDescription(`Olá <@${member.id}>, seja bem-vindo(a) ao servidor **${member.guild.name}**!`)
        .setThumbnail(member.user.displayAvatarURL({ dynamic: true }))
        .addFields(
          { name: 'Membro', value: `${member.user.tag}`, inline: true },
          { name: 'ID', value: `${member.id}`, inline: true },
          { name: 'Entrou em', value: `<t:${Math.floor(member.joinedTimestamp / 1000)}:F>`, inline: true }
        )
        .setImage('https://usagif.com/wp-content/uploads/2021/4fh5wi/bemvindo-15.gif')
        .setFooter({ text: `Agora temos ${member.guild.memberCount} membros!` })
        .setTimestamp();
      
      await welcomeChannel.send({ embeds: [embed] });
      
      await logger.logDatabase(
        "Novo Membro", 
        `Usuário: ${member.user.tag} (${member.id})\nCargo adicionado: ${welcomeRole ? welcomeRole.name : 'Nenhum'}`
      );
    } catch (error) {
      console.error('Erro ao processar novo membro:', error);
      await logger.logError("Evento guildMemberAdd", error);
    }
  },
};
