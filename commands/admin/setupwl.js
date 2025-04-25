const { SlashCommandBuilder, PermissionFlagsBits, EmbedBuilder, ActionRowBuilder, ButtonBuilder, ButtonStyle, ModalBuilder, TextInputBuilder, TextInputStyle } = require('discord.js');
const pool = require('../../config/database');
const logger = require('../../utils/logger');
const axios = require('axios');

module.exports = {
    data: new SlashCommandBuilder()
        .setName('setupwl')
        .setDescription('Configura o sistema de whitelist automática')
        .addChannelOption(option => 
            option.setName('canal')
                .setDescription('Canal onde a mensagem de whitelist será enviada')
                .setRequired(true))
        .setDefaultMemberPermissions(PermissionFlagsBits.Administrator),

    async execute(interaction, client) {
        // Verificar permissões
        if (!interaction.member.permissions.has(PermissionFlagsBits.Administrator)) {
            return interaction.reply({ 
                content: '❌ Você não tem permissão para usar este comando.', 
                ephemeral: true 
            });
        }

        const channel = interaction.options.getChannel('canal');

        try {
            // Criar embed para whitelist
            const embed = new EmbedBuilder()
                .setColor(0x0099FF)
                .setTitle('🔓 Sistema de Whitelist')
                .setDescription('Faça a liberação rápida do seu ID na cidade clicando no botão abaixo.')
                .addFields(
                    { name: 'Como funciona?', value: 'Ao clicar no botão, você precisará preencher algumas informações básicas para liberar seu acesso à cidade.' },
                    { name: 'Requisitos', value: 'Você deve fornecer seu ID, nome completo e informar como conheceu nosso servidor.' }
                )
                .setFooter({ text: 'Após a aprovação, você receberá o cargo de Whitelist automaticamente.' })
                .setTimestamp();

            // Criar botão para whitelist
            const row = new ActionRowBuilder()
                .addComponents(
                    new ButtonBuilder()
                        .setCustomId('whitelist_button')
                        .setLabel('Solicitar Whitelist')
                        .setStyle(ButtonStyle.Success)
                        .setEmoji('🔑')
                );

            // Enviar mensagem no canal especificado
            await channel.send({ embeds: [embed], components: [row] });

            await logger.logCommand(
                interaction,
                "Setup de Whitelist",
                `Sistema de whitelist configurado no canal ${channel}`
            );

            return interaction.reply({ 
                content: `✅ Sistema de whitelist configurado com sucesso no canal ${channel}!`, 
                ephemeral: true 
            });
        } catch (error) {
            console.error(error);
            await logger.logError(`Comando ${interaction.commandName}`, error);
            return interaction.reply({ 
                content: '❌ Ocorreu um erro ao configurar o sistema de whitelist.', 
                ephemeral: true 
            });
        }
    },

    // Handler para o botão de whitelist
    async handleButton(interaction, client) {
        try {
            // Criar modal para whitelist
            const modal = new ModalBuilder()
                .setCustomId('whitelist_modal')
                .setTitle('Solicitação de Whitelist');

            // Input para ID
            const idInput = new TextInputBuilder()
                .setCustomId('id_input')
                .setLabel('Seu ID na cidade')
                .setPlaceholder('Digite apenas números (ex: 1234)')
                .setStyle(TextInputStyle.Short)
                .setRequired(true)
                .setMinLength(1)
                .setMaxLength(10);

            // Input para nome completo
            const nameInput = new TextInputBuilder()
                .setCustomId('name_input')
                .setLabel('Nome e Sobrenome')
                .setPlaceholder('Digite seu nome completo (ex: João Silva)')
                .setStyle(TextInputStyle.Short)
                .setRequired(true)
                .setMinLength(5)
                .setMaxLength(50);

            // Input para como conheceu o servidor
            const sourceInput = new TextInputBuilder()
                .setCustomId('source_input')
                .setLabel('Como você nos encontrou?')
                .setPlaceholder('Redes sociais, Discord, Lista, Amigos, etc.')
                .setStyle(TextInputStyle.Paragraph)
                .setRequired(true)
                .setMinLength(5)
                .setMaxLength(200);

            // Adicionar inputs ao modal
            const firstActionRow = new ActionRowBuilder().addComponents(idInput);
            const secondActionRow = new ActionRowBuilder().addComponents(nameInput);
            const thirdActionRow = new ActionRowBuilder().addComponents(sourceInput);

            modal.addComponents(firstActionRow, secondActionRow, thirdActionRow);

            // Mostrar o modal
            await interaction.showModal(modal);
        } catch (error) {
            console.error(error);
            await logger.logError('Whitelist Button', error);
        }
    },

    // Handler para o modal de whitelist
    async handleModal(interaction, client) {
        try {
            await interaction.deferReply({ ephemeral: true });

            // Obter valores do modal
            const id = interaction.fields.getTextInputValue('id_input');
            const name = interaction.fields.getTextInputValue('name_input');
            const source = interaction.fields.getTextInputValue('source_input');

            // Verificar se o ID existe
            const [rows] = await pool.execute('SELECT * FROM accounts WHERE id = ?', [id]);
            if (rows.length === 0) {
                return interaction.editReply({ 
                    content: `❌ ID ${id} não encontrado no banco de dados! Verifique se digitou corretamente.`, 
                    ephemeral: true 
                });
            }

            // Verificar se já possui whitelist
            if (rows[0].whitelist === 1) {
                return interaction.editReply({ 
                    content: `❌ Este ID já possui whitelist ativa!`, 
                    ephemeral: true 
                });
            }

            // Atualizar whitelist e vincular Discord
            await pool.execute('UPDATE accounts SET whitelist = 1, discord = ? WHERE id = ?', [interaction.user.id, id]);

            // Adicionar cargo de whitelist
            const member = await interaction.guild.members.fetch(interaction.user.id);
            const whitelistRole = interaction.guild.roles.cache.get(client.config.ROLES.WHITELIST);
            
            if (whitelistRole) {
                await member.roles.add(whitelistRole);
            }

            // Remover cargo de boas-vindas
            const welcomeRole = interaction.guild.roles.cache.get(client.config.ROLES.WELCOME);
            if (welcomeRole && member.roles.cache.has(welcomeRole.id)) {
                await member.roles.remove(welcomeRole);
            }

            // Enviar log via webhook
try {
    const webhookUrl = client.config.LOGS.WEBHOOK_URL;
    
    if (webhookUrl) {
        const logData = {
            embeds: [{
                title: 'Whitelist Aprovada Automaticamente',
                description: `<@${interaction.user.id}> foi aprovado na whitelist!`,
                color: 0x00FF00,
                fields: [
                    { name: 'ID', value: id, inline: true },
                    { name: 'Nome', value: name, inline: true },
                    { name: 'Como nos encontrou', value: source, inline: false }
                ],
                timestamp: new Date().toISOString()
            }]
        };
        
        await axios.post(webhookUrl, logData);
        console.log('Log de whitelist enviado via webhook com sucesso!');
    } else {
        console.log('URL do webhook de whitelist não configurada');
    }
} catch (error) {
    console.error('Erro ao enviar log via webhook:', error);
}

            return interaction.editReply({ 
                content: `✅ Whitelist aprovada com sucesso! Você já pode acessar a cidade.`, 
                ephemeral: true 
            });
        } catch (error) {
            console.error(error);
            await logger.logError('Whitelist Modal', error);
            return interaction.editReply({ 
                content: '❌ Ocorreu um erro ao processar sua solicitação de whitelist.', 
                ephemeral: true 
            });
        }
    }
};
