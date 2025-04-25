const { SlashCommandBuilder, EmbedBuilder } = require('discord.js');

module.exports = {
    data: new SlashCommandBuilder()
        .setName('ping')
        .setDescription('Mostra a latência do bot e do websocket'),

    async execute(interaction, client) {
        try {
            // Enviar uma resposta inicial
            await interaction.deferReply();
            
            // Obter o timestamp da resposta
            const reply = await interaction.fetchReply();
            
            // Calcular a diferença de tempo entre a interação e a resposta
            const ping = reply.createdTimestamp - interaction.createdTimestamp;
            
            // Criar embed com as informações de latência
            const embed = new EmbedBuilder()
                .setColor(0x0099FF)
                .setTitle('🏓 Pong!')
                .addFields(
                    { name: 'Latência do Bot', value: `${ping}ms`, inline: true },
                    { name: 'Latência do WebSocket', value: `${client.ws.ping}ms`, inline: true }
                )
                .setFooter({ text: 'Brasil fivem Host ✅' })
                .setTimestamp();
            
            // Editar a resposta com o embed
            await interaction.editReply({ embeds: [embed] });
        } catch (error) {
            console.error('Erro no comando ping:', error);
            await interaction.editReply('❌ Ocorreu um erro ao verificar a latência.');
        }
    },
};
