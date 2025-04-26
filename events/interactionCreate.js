const { EmbedBuilder, ActionRowBuilder, ButtonBuilder, ButtonStyle, ChannelType, PermissionFlagsBits, AttachmentBuilder } = require('discord.js');
const fs = require('fs');
const path = require('path');
const logger = require('../utils/logger');
const configFunctions = require('../utils/configFunctions');
const { showMainConfigMenu } = require('../commands/admin/config');

module.exports = {
  name: 'interactionCreate',
  once: false,
  async execute(interaction, client) {
    try {
      // Lidar com comandos slash
      if (interaction.isChatInputCommand()) {
        const command = client.commands.get(interaction.commandName);
        if (!command) return;

        try {
          await command.execute(interaction, client);
        } catch (error) {
          console.error(error);
          await logger.logError(`Comando ${interaction.commandName}`, error);
          if (interaction.replied || interaction.deferred) {
            await interaction.followUp({ content: 'Ocorreu um erro ao executar este comando!', flags: 64 });
          } else {
            await interaction.reply({ content: 'Ocorreu um erro ao executar este comando!', flags: 64 });
          }
        }
        return;
      }

      // Lidar com seleção de canais
      if (interaction.isChannelSelectMenu()) {
        // Verificar se é o dono do servidor
        if (interaction.guild.ownerId !== interaction.user.id) {
          return interaction.reply({
            content: '❌ Apenas o dono do servidor pode acessar as configurações do bot.',
            flags: 64
          });
        }

        const channelId = interaction.values[0];
        client.tempConfig = client.tempConfig || JSON.parse(JSON.stringify(client.config));
        
        if (interaction.customId === 'select_welcome_channel') {
          client.tempConfig.WELCOME_CHANNEL_ID = channelId;
          await interaction.reply({
            content: `✅ Canal de boas-vindas definido como <#${channelId}>. Lembre-se de salvar as configurações.`,
            flags: 64
          });
        } else if (interaction.customId === 'select_suggestion_channel') {
          client.tempConfig.SUGGESTION_CHANNEL_ID = channelId;
          await interaction.reply({
            content: `✅ Canal de sugestões definido como <#${channelId}>. Lembre-se de salvar as configurações.`,
            flags: 64
          });
        } else if (interaction.customId === 'select_ticket_logs_channel') {
          client.tempConfig.TICKET_LOGS_CHANNEL_ID = channelId;
          await interaction.reply({
            content: `✅ Canal de logs de tickets definido como <#${channelId}>. Lembre-se de salvar as configurações.`,
            flags: 64
          });
        } else if (interaction.customId === 'select_backup_channel') {
          client.tempConfig.BACKUP_CHANNEL_ID = channelId;
          await interaction.reply({
            content: `✅ Canal de backups definido como <#${channelId}>. Lembre-se de salvar as configurações.`,
            flags: 64
          });
        } else if (interaction.customId === 'select_ticket_category') {
          client.tempConfig.TICKET_CATEGORY_ID = channelId;
          await interaction.reply({
            content: `✅ Categoria para tickets definida como <#${channelId}>. Lembre-se de salvar as configurações.`,
            flags: 64
          });
        } else if (interaction.customId === 'select_verification_channel') {
          client.tempConfig.roleSystem = client.tempConfig.roleSystem || {};
          client.tempConfig.roleSystem.verificationChannel = channelId;
          await interaction.reply({
            content: `✅ Canal de verificação definido como <#${channelId}>. Lembre-se de salvar as configurações.`,
            flags: 64
          });
        }
        return;
      }

      // Lidar com seleção de cargos
      if (interaction.isRoleSelectMenu()) {
        // Verificar se é o dono do servidor
        if (interaction.guild.ownerId !== interaction.user.id) {
          return interaction.reply({
            content: '❌ Apenas o dono do servidor pode acessar as configurações do bot.',
            flags: 64
          });
        }

        const roleId = interaction.values[0];
        client.tempConfig = client.tempConfig || JSON.parse(JSON.stringify(client.config));
        if (!client.tempConfig.ROLES) client.tempConfig.ROLES = {};
        
        if (interaction.customId === 'select_admin_role') {
          client.tempConfig.ROLES.ADMIN = roleId;
          await interaction.reply({
            content: `✅ Cargo de Administrador definido como <@&${roleId}>. Lembre-se de salvar as configurações.`,
            flags: 64
          });
        } else if (interaction.customId === 'select_staff_role') {
          client.tempConfig.ROLES.STAFF = roleId;
          await interaction.reply({
            content: `✅ Cargo de Staff definido como <@&${roleId}>. Lembre-se de salvar as configurações.`,
            flags: 64
          });
        } else if (interaction.customId === 'select_welcome_role') {
          client.tempConfig.ROLES.WELCOME = roleId;
          await interaction.reply({
            content: `✅ Cargo de Boas-vindas definido como <@&${roleId}>. Lembre-se de salvar as configurações.`,
            flags: 64
          });
        } else if (interaction.customId === 'select_whitelist_role') {
          client.tempConfig.ROLES.WHITELIST = roleId;
          await interaction.reply({
            content: `✅ Cargo de Whitelist definido como <@&${roleId}>. Lembre-se de salvar as configurações.`,
            flags: 64
          });
        } else if (interaction.customId === 'select_remove_after_wl_role') {
          client.tempConfig.ROLES.REMOVE_AFTER_WL = roleId;
          await interaction.reply({
            content: `✅ Cargo a ser removido após WL definido como <@&${roleId}>. Lembre-se de salvar as configurações.`,
            flags: 64
          });
        }
        return;
      }

      // Lidar com modais
      if (interaction.isModalSubmit()) {
        if (interaction.customId === 'modal_config_bot') {
          await configFunctions.handleBotConfigModal(interaction, client);
        } else if (interaction.customId === 'modal_config_database') {
          await configFunctions.handleDatabaseConfigModal(interaction, client);
        } else if (interaction.customId === 'modal_config_fivem') {
          await configFunctions.handleFivemConfigModal(interaction, client);
        } else if (interaction.customId === 'modal_config_webhook') {
          await configFunctions.handleWebhookConfigModal(interaction, client);
        } else if (interaction.customId === 'modal_config_social') {
          await configFunctions.handleSocialConfigModal(interaction, client);
        } else if (interaction.customId === 'whitelist_modal') {
          const setupWlCommand = client.commands.get('setupwl');
          if (setupWlCommand && setupWlCommand.handleModal) {
            await setupWlCommand.handleModal(interaction, client);
          }
        }
        return;
      }

      // Lidar com botões
      if (interaction.isButton()) {
        // Botões de sugestão
        if (interaction.customId.startsWith('suggestion_')) {
          const suggestionCommand = client.commands.get('sugestao');
          if (suggestionCommand && suggestionCommand.handleInteraction) {
            try {
              await suggestionCommand.handleInteraction(interaction, client);
            } catch (error) {
              console.error('Erro ao processar interação de sugestão:', error);
              if (!interaction.replied && !interaction.deferred) {
                await interaction.reply({
                  content: '❌ Ocorreu um erro ao processar sua interação.',
                  flags: 64
                });
              }
            }
          }
          return;
        }
        
        // Botões de autorole
        if (interaction.customId === 'autorole_type_auto') {
          client.tempConfig = client.tempConfig || JSON.parse(JSON.stringify(client.config));
          if (!client.tempConfig.roleSystem) client.tempConfig.roleSystem = {};
          client.tempConfig.roleSystem.type = 'auto';
          await interaction.update({
            content: '✅ Modo de autorole alterado para: Automático',
            components: interaction.message.components
          });
          return;
        }

        if (interaction.customId === 'autorole_type_verification') {
          client.tempConfig = client.tempConfig || JSON.parse(JSON.stringify(client.config));
          if (!client.tempConfig.roleSystem) client.tempConfig.roleSystem = {};
          client.tempConfig.roleSystem.type = 'verification';
          await interaction.update({
            content: '✅ Modo de autorole alterado para: Verificação por Botão',
            components: interaction.message.components
          });
          return;
        }

        // Sistema de verificação por botão
        if (interaction.customId === 'verify-button') {
          try {
            // Verificar se o sistema está configurado para verificação por botão
            if (!client.config.roleSystem || client.config.roleSystem.type !== 'verification') {
              return await interaction.reply({
                content: 'O sistema de verificação por botão não está ativado.',
                flags: 64
              });
            }

            // Obter o cargo WELCOME
            const welcomeRoleId = client.config.ROLES.WELCOME;
            if (!welcomeRoleId) {
              return await interaction.reply({
                content: 'Erro: Cargo de boas-vindas não configurado.',
                flags: 64
              });
            }

            // Verificar se o cargo existe
            const welcomeRole = interaction.guild.roles.cache.get(welcomeRoleId);
            if (!welcomeRole) {
              return await interaction.reply({
                content: 'Erro: Cargo de boas-vindas não encontrado no servidor.',
                flags: 64
              });
            }

            // Verificar se o usuário já possui o cargo
            if (interaction.member.roles.cache.has(welcomeRoleId)) {
              return await interaction.reply({
                content: 'Você já está verificado!',
                flags: 64
              });
            }

            // Adicionar o cargo ao usuário
            await interaction.member.roles.add(welcomeRoleId);
            await interaction.reply({
              content: 'Verificação concluída! Você agora tem acesso ao servidor.',
              flags: 64
            });
            // Registrar no log
            await logger.logCommand(
              interaction,
              "Verificação",
              `Usuário: ${interaction.user.tag} (${interaction.user.id})\nCargo adicionado: ${welcomeRole.name}`
            );
          } catch (error) {
            console.error('Erro ao processar verificação:', error);
            await logger.logError("Sistema de Verificação", error);
            if (!interaction.replied && !interaction.deferred) {
              await interaction.reply({
                content: 'Ocorreu um erro ao processar sua verificação. Por favor, tente novamente mais tarde.',
                flags: 64
              });
            }
          }
          return;
        }

        // Sistema de configuração
        if (interaction.customId.startsWith('config_')) {
          // Verificar se é o dono do servidor
          if (interaction.guild.ownerId !== interaction.user.id) {
            return interaction.reply({
              content: '❌ Apenas o dono do servidor pode acessar as configurações do bot.',
              flags: 64
            });
          }

          const configType = interaction.customId.split('_')[1];
          switch (configType) {
            case 'bot':
              await configFunctions.showBotConfig(interaction, client);
              break;
            case 'database':
              await configFunctions.showDatabaseConfig(interaction, client);
              break;
            case 'fivem':
              await configFunctions.showFivemConfig(interaction, client);
              break;
            case 'channels':
              await configFunctions.showChannelsConfig(interaction, client);
              break;
            case 'roles':
              await configFunctions.showRolesConfig(interaction, client);
              break;
            case 'logs':
              await configFunctions.showLogsConfig(interaction, client);
              break;
            case 'social':
              await configFunctions.showSocialConfig(interaction, client);
              break;
            case 'autorole':
              await configFunctions.showAutoRoleConfig(interaction, client);
              break;
            case 'save':
              await configFunctions.saveConfig(interaction, client);
              break;
            case 'back':
              await showMainConfigMenu(interaction, client);
              break;
          }
          return;
        }

        // Botão para copiar comando de conexão
        if (interaction.customId === 'copy_connect_command') {
          const connectCommand = `connect ${client.config.CONNECT_DOMAIN || client.config.HOST_FIVEM + ':' + client.config.PORT_FIVEM}`;
          await interaction.reply({
            content: `Comando copiado: \`${connectCommand}\`\nCole este comando no console do FiveM (F8) para conectar ao servidor.`,
            flags: 64
          });
          return;
        }

        // Botão de whitelist
        if (interaction.customId === 'whitelist_button') {
          const setupWlCommand = client.commands.get('setupwl');
          if (setupWlCommand && setupWlCommand.handleButton) {
            await setupWlCommand.handleButton(interaction, client);
          }
          return;
        }

        // Sistema de tickets
        if (interaction.customId.startsWith('ticket_')) {
          const ticketType = interaction.customId.split('_')[1];
          let categoryName = '';
          let ticketName = '';
          
          switch (ticketType) {
            case 'compra':
              categoryName = 'Compras';
              ticketName = `compra-${interaction.user.username}`;
              break;
            case 'suporte':
              categoryName = 'Suporte';
              ticketName = `suporte-${interaction.user.username}`;
              break;
            case 'bug':
              categoryName = 'Bugs';
              ticketName = `bug-${interaction.user.username}`;
              break;
            case 'denuncia':
              categoryName = 'Denúncias';
              ticketName = `denuncia-${interaction.user.username}`;
              break;
          }

          // Verificar se o usuário já tem um ticket aberto
          const existingTicket = interaction.guild.channels.cache.find(
            channel => channel.name === ticketName && channel.type === ChannelType.GuildText
          );
          
          if (existingTicket) {
            return interaction.reply({
              content: `Você já possui um ticket aberto: <#${existingTicket.id}>`,
              flags: 64
            });
          }

          // Criar novo ticket
          try {
            // Buscar a categoria configurada ou criar uma se não existir
            let ticketCategory = interaction.guild.channels.cache.find(
              channel => channel.name === categoryName && channel.type === ChannelType.GuildCategory
            ) || interaction.guild.channels.cache.get(client.config.TICKET_CATEGORY_ID);
            
            if (!ticketCategory) {
              // Criar categoria se não existir
              ticketCategory = await interaction.guild.channels.create({
                name: "Tickets",
                type: ChannelType.GuildCategory
              });
              // Atualizar configuração
              client.tempConfig = client.tempConfig || JSON.parse(JSON.stringify(client.config));
              client.tempConfig.TICKET_CATEGORY_ID = ticketCategory.id;
              // Salvar configuração
              const configPath = path.join(__dirname, '..', 'config', 'config.json');
              fs.writeFileSync(configPath, JSON.stringify(client.tempConfig, null, 2));
              client.config = client.tempConfig;
              console.log(`Categoria de tickets criada automaticamente: ${ticketCategory.name} (${ticketCategory.id})`);
            }

            const ticketChannel = await interaction.guild.channels.create({
              name: ticketName,
              type: ChannelType.GuildText,
              parent: ticketCategory.id,
              permissionOverwrites: [
                {
                  id: interaction.guild.id,
                  deny: [PermissionFlagsBits.ViewChannel]
                },
                {
                  id: interaction.user.id,
                  allow: [PermissionFlagsBits.ViewChannel, PermissionFlagsBits.SendMessages, PermissionFlagsBits.ReadMessageHistory]
                },
                {
                  id: client.config.ROLES?.ADMIN,
                  allow: [PermissionFlagsBits.ViewChannel, PermissionFlagsBits.SendMessages, PermissionFlagsBits.ReadMessageHistory]
                },
                {
                  id: client.config.ROLES?.STAFF,
                  allow: [PermissionFlagsBits.ViewChannel, PermissionFlagsBits.SendMessages, PermissionFlagsBits.ReadMessageHistory]
                }
              ]
            });
            
            const embed = new EmbedBuilder()
              .setColor(0x0099FF)
              .setTitle(`Ticket de ${categoryName}`)
              .setDescription(`Olá <@${interaction.user.id}>, bem-vindo ao seu ticket de ${categoryName.toLowerCase()}.`)
              .addFields(
                { name: 'Usuário', value: `<@${interaction.user.id}>`, inline: true },
                { name: 'ID do Usuário', value: interaction.user.id, inline: true },
                { name: 'Criado em', value: `<t:${Math.floor(Date.now() / 1000)}:F>`, inline: true }
              )
              .setFooter({ text: 'Para fechar este ticket, clique no botão abaixo.' });
            
            const row = new ActionRowBuilder()
              .addComponents(
                new ButtonBuilder()
                  .setCustomId('close_ticket')
                  .setLabel('Fechar Ticket')
                  .setEmoji('🔒')
                  .setStyle(ButtonStyle.Danger)
              );
            
            await ticketChannel.send({ embeds: [embed], components: [row] });
            
            // Mencionar o usuário e a equipe de staff, se configurada
            let mentionContent = `<@${interaction.user.id}>`;
            if (client.config.ROLES?.STAFF) {
              mentionContent += ` <@&${client.config.ROLES.STAFF}>`;
            }
            
            await ticketChannel.send({ content: mentionContent });
            await interaction.reply({
              content: `Seu ticket foi criado: <#${ticketChannel.id}>`,
              flags: 64
            });
            
            await logger.logCommand(
              interaction,
              "Ticket criado",
              `Tipo: ${categoryName}\nCanal: <#${ticketChannel.id}>\nUsuário: <@${interaction.user.id}>`
            );
          } catch (error) {
            console.error('Erro ao criar ticket:', error);
            await logger.logError("Sistema de Tickets", error);
            await interaction.reply({
              content: 'Ocorreu um erro ao criar seu ticket. Por favor, tente novamente mais tarde.',
              flags: 64
            });
          }
          return;
        }

        // Fechar ticket
        if (interaction.customId === 'close_ticket') {
          const channel = interaction.channel;
          // Confirmar fechamento
          const embed = new EmbedBuilder()
            .setColor(0xFF0000)
            .setTitle('Fechar Ticket')
            .setDescription('Tem certeza que deseja fechar este ticket?');
          
          const row = new ActionRowBuilder()
            .addComponents(
              new ButtonBuilder()
                .setCustomId('confirm_close')
                .setLabel('Confirmar')
                .setStyle(ButtonStyle.Danger),
              new ButtonBuilder()
                .setCustomId('cancel_close')
                .setLabel('Cancelar')
                .setStyle(ButtonStyle.Secondary)
            );
          
          await interaction.reply({ embeds: [embed], components: [row] });
          return;
        }

        // Confirmar fechamento de ticket
        if (interaction.customId === 'confirm_close') {
          const channel = interaction.channel;
          try {
            // Criar diretório para logs se não existir
            const logsDir = path.join(__dirname, '..', 'logs', 'tickets');
            if (!fs.existsSync(logsDir)) {
              fs.mkdirSync(logsDir, { recursive: true });
            }

            // Obter mensagens do canal
            let allMessages = [];
            let lastId;
            
            while (true) {
              const options = { limit: 100 };
              if (lastId) {
                options.before = lastId;
              }
              
              const messages = await channel.messages.fetch(options);
              if (messages.size === 0) break;
              
              allMessages = [...allMessages, ...messages.values()];
              lastId = messages.last().id;
              
              if (messages.size < 100) break;
            }

            // Ordenar mensagens por data
            allMessages.sort((a, b) => a.createdTimestamp - b.createdTimestamp);
            
            // Criar arquivo de log
            let log = `Ticket: ${channel.name}\n`;
            log += `Criado em: ${new Date(channel.createdTimestamp).toLocaleString()}\n`;
            log += `Fechado em: ${new Date().toLocaleString()}\n\n`;
            log += `==== HISTÓRICO DE MENSAGENS ====\n\n`;
            
            allMessages.forEach(msg => {
              const time = new Date(msg.createdTimestamp).toLocaleString();
              log += `[${time}] ${msg.author.tag}: ${msg.content}\n`;
              
              // Adicionar anexos
              if (msg.attachments.size > 0) {
                msg.attachments.forEach(attachment => {
                  log += `[ANEXO] ${attachment.url}\n`;
                });
              }
              
              // Adicionar embeds
              if (msg.embeds.length > 0) {
                log += `[EMBED] ${msg.embeds.length} embeds\n`;
              }
              
              log += '\n';
            });
            
            // Salvar log
            const logFileName = `${channel.name}-${Date.now()}.txt`;
            const logFilePath = path.join(logsDir, logFileName);
            fs.writeFileSync(logFilePath, log);
            
            // Enviar log para canal de logs
            if (client.config.TICKET_LOGS_CHANNEL_ID) {
              const logsChannel = await interaction.guild.channels.fetch(client.config.TICKET_LOGS_CHANNEL_ID);
              if (logsChannel) {
                const attachment = new AttachmentBuilder(logFilePath, { name: logFileName });
                const logEmbed = new EmbedBuilder()
                  .setColor(0x0099FF)
                  .setTitle(`Ticket Fechado: ${channel.name}`)
                  .setDescription(`Ticket fechado por <@${interaction.user.id}>`)
                  .addFields(
                    { name: 'Canal', value: channel.name, inline: true },
                    { name: 'Categoria', value: channel.parent?.name || 'N/A', inline: true },
                    { name: 'Fechado em', value: `<t:${Math.floor(Date.now() / 1000)}:F>`, inline: true }
                  )
                  .setTimestamp();
                
                await logsChannel.send({ embeds: [logEmbed], files: [attachment] });
              }
            }

            // Tentar enviar log para o usuário
            try {
              // Encontrar o ID do usuário a partir do nome do canal
              const userName = channel.name.split('-')[1];
              const user = interaction.guild.members.cache.find(member =>
                member.user.username.toLowerCase() === userName.toLowerCase()
              );
              
              if (user) {
                const attachment = new AttachmentBuilder(logFilePath, { name: logFileName });
                const dmEmbed = new EmbedBuilder()
                  .setColor(0x0099FF)
                  .setTitle(`Seu Ticket Foi Fechado`)
                  .setDescription(`Seu ticket em ${interaction.guild.name} foi fechado.`)
                  .addFields(
                    { name: 'Ticket', value: channel.name, inline: true },
                    { name: 'Fechado por', value: `<@${interaction.user.id}>`, inline: true },
                    { name: 'Fechado em', value: `<t:${Math.floor(Date.now() / 1000)}:F>`, inline: true }
                  )
                  .setFooter({ text: 'Anexado a esta mensagem está o histórico completo do ticket.' })
                  .setTimestamp();
                
                await user.send({ embeds: [dmEmbed], files: [attachment] });
                
                await logger.logCommand(
                  interaction,
                  "Ticket fechado",
                  `Canal: ${channel.name}\nFechado por: <@${interaction.user.id}>\nLog enviado para: <@${user.id}>`
                );
              } else {
                await logger.logCommand(
                  interaction,
                  "Ticket fechado",
                  `Canal: ${channel.name}\nFechado por: <@${interaction.user.id}>\nNão foi possível identificar o usuário para enviar o log.`
                );
              }
            } catch (dmError) {
              console.error('Erro ao enviar DM:', dmError);
              await logger.logCommand(
                interaction,
                "Ticket fechado",
                `Canal: ${channel.name}\nFechado por: <@${interaction.user.id}>\nNão foi possível enviar o log para o usuário (DM fechada ou erro).`
              );
            }

            // Deletar canal após 5 segundos
            await interaction.reply({ content: 'Este ticket será fechado em 5 segundos...' });
            setTimeout(() => {
              channel.delete().catch(console.error);
            }, 5000);
          } catch (error) {
            console.error('Erro ao fechar ticket:', error);
            await logger.logError("Sistema de Tickets (Fechamento)", error);
            await interaction.reply({
              content: 'Ocorreu um erro ao fechar o ticket. Por favor, tente novamente.',
              flags: 64
            });
          }
          return;
        }

        // Cancelar fechamento de ticket
        if (interaction.customId === 'cancel_close') {
          await interaction.update({ content: 'Fechamento de ticket cancelado.', embeds: [], components: [] });
          return;
        }

        // Botões de redes sociais
        if (interaction.customId === 'social_cfx') {
          await interaction.reply({ content: `Link do CFX: ${client.config.SOCIAL.CFX}`, flags: 64 });
          return;
        }

        if (interaction.customId === 'social_instagram') {
          await interaction.reply({ content: `Instagram: ${client.config.SOCIAL.INSTAGRAM}`, flags: 64 });
          return;
        }

        if (interaction.customId === 'social_tiktok') {
          await interaction.reply({ content: `TikTok: ${client.config.SOCIAL.TIKTOK}`, flags: 64 });
          return;
        }

        if (interaction.customId === 'social_discord') {
          await interaction.reply({ content: `Discord: ${client.config.SOCIAL.DISCORD}`, flags: 64 });
          return;
        }
      }
    } catch (error) {
      console.error('Erro ao processar interação:', error);
      try {
        if (!interaction.replied && !interaction.deferred) {
          await interaction.reply({
            content: '❌ Ocorreu um erro ao processar sua interação.',
            flags: 64
          });
        } else {
          await interaction.followUp({
            content: '❌ Ocorreu um erro ao processar sua interação.',
            flags: 64
          });
        }
      } catch (followUpError) {
        console.error('Erro ao enviar mensagem de erro:', followUpError);
      }
    }
  },
};
