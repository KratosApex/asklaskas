/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: accounts
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `whitelist` tinyint(1) NOT NULL DEFAULT 0,
  `chars` int(10) NOT NULL DEFAULT 1,
  `gems` int(20) NOT NULL DEFAULT 0,
  `rolepass` int(20) NOT NULL DEFAULT 0,
  `premium` int(20) NOT NULL DEFAULT 0,
  `discord` varchar(50) NOT NULL DEFAULT '0',
  `license` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `license` (`license`),
  KEY `id` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: alien_box
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `alien_box` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Passport` int(11) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `sobrenome` varchar(50) DEFAULT NULL,
  `reward` varchar(50) DEFAULT NULL,
  `raridade` varchar(50) DEFAULT NULL,
  `hora` varchar(50) DEFAULT curtime(),
  `data` varchar(50) DEFAULT curdate(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_swedish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: alien_mansions
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `alien_mansions` (
  `mansion` varchar(50) NOT NULL,
  `owner` text NOT NULL,
  `residents` text NOT NULL,
  `time` text NOT NULL,
  `Garage` longtext NOT NULL DEFAULT '{}',
  PRIMARY KEY (`mansion`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: banneds
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `banneds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) NOT NULL,
  `time` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: carmileages
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `carmileages` (
  `plate` text DEFAULT NULL,
  `mileage` text DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: casados
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `casados` (
  `id` int(11) DEFAULT NULL,
  `membro1` varchar(50) DEFAULT NULL,
  `membro2` varchar(50) DEFAULT NULL,
  `casados` varchar(50) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: characters
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `name` varchar(50) DEFAULT 'Individuo',
  `name2` varchar(50) DEFAULT 'Indigente',
  `sex` varchar(1) NOT NULL DEFAULT 'M',
  `bank` int(20) NOT NULL DEFAULT 0,
  `blood` int(1) NOT NULL DEFAULT 1,
  `fines` int(20) NOT NULL DEFAULT 0,
  `prison` int(11) NOT NULL DEFAULT 0,
  `tracking` int(30) NOT NULL DEFAULT 0,
  `spending` int(20) NOT NULL DEFAULT 0,
  `cardlimit` int(20) NOT NULL DEFAULT 0,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `created` int(20) NOT NULL DEFAULT 0,
  `paypal` int(11) DEFAULT 0,
  `card` varchar(50) DEFAULT NULL,
  `relacionamento` varchar(50) DEFAULT NULL,
  `coins` int(11) NOT NULL DEFAULT 0,
  `tempoTotal` int(11) NOT NULL DEFAULT 0,
  `initial` tinyint(1) NOT NULL DEFAULT 0,
  `relationship` varchar(50) NOT NULL DEFAULT 'Solteiro',
  `age` int(11) NOT NULL DEFAULT 20,
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `id` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: chests
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `chests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `weight` int(10) NOT NULL DEFAULT 0,
  `perm` varchar(50) NOT NULL,
  `logs` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 58 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: cupons
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `cupons` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) NOT NULL,
  `valor_desconto` decimal(10, 2) NOT NULL,
  `uso_maximo` int(11) DEFAULT 1,
  `usos` int(11) DEFAULT 0,
  `ativo` tinyint(1) DEFAULT 1,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: dependents
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `dependents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Dependent` int(10) NOT NULL DEFAULT 0,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: dpkeybinds
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `dpkeybinds` (
  `id` varchar(50) DEFAULT NULL,
  `keybind1` varchar(50) DEFAULT 'num4',
  `emote1` varchar(255) DEFAULT '',
  `keybind2` varchar(50) DEFAULT 'num5',
  `emote2` varchar(255) DEFAULT '',
  `keybind3` varchar(50) DEFAULT 'num6',
  `emote3` varchar(255) DEFAULT '',
  `keybind4` varchar(50) DEFAULT 'num7',
  `emote4` varchar(255) DEFAULT '',
  `keybind5` varchar(50) DEFAULT 'num8',
  `emote5` varchar(255) DEFAULT '',
  `keybind6` varchar(50) DEFAULT 'num9',
  `emote6` varchar(255) DEFAULT ''
) ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_swedish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: entitydata
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `entitydata` (
  `dkey` varchar(100) NOT NULL,
  `dvalue` longtext DEFAULT NULL,
  PRIMARY KEY (`dkey`),
  KEY `dkey` (`dkey`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: fidentity
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `fidentity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `name2` varchar(50) NOT NULL DEFAULT '',
  `port` int(1) NOT NULL DEFAULT 1,
  `blood` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: fines
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `fines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Passport` int(11) DEFAULT NULL,
  `Name` varchar(50) NOT NULL,
  `Date` varchar(50) NOT NULL,
  `Hour` varchar(50) NOT NULL,
  `Value` int(11) NOT NULL,
  `Message` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: investments
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `investments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Liquid` int(20) NOT NULL DEFAULT 0,
  `Monthly` int(20) NOT NULL DEFAULT 0,
  `Deposit` int(20) NOT NULL DEFAULT 0,
  `Last` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: invoices
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Received` int(10) NOT NULL DEFAULT 0,
  `Type` varchar(50) NOT NULL,
  `Reason` longtext NOT NULL,
  `Holder` varchar(50) NOT NULL,
  `Value` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: logs
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `logs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL,
  `descricao` text DEFAULT NULL,
  `user_discord_id` varchar(50) DEFAULT NULL,
  `data_log` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 8 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: org_transactions
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `org_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Value` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: organizations
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `organizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `bank` int(20) NOT NULL DEFAULT 0,
  `premium` int(20) NOT NULL DEFAULT 0,
  `buff` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 31 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: pedidos
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `pedidos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_id` bigint(20) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `valor` decimal(10, 2) NOT NULL,
  `status` enum(
  'pendente',
  'confirmado',
  'reembolsado',
  'cancelado'
  ) NOT NULL DEFAULT 'pendente',
  `user_discord_id` varchar(50) NOT NULL,
  `data_pedido` timestamp NOT NULL DEFAULT current_timestamp(),
  `cupom_usado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: playerdata
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `playerdata` (
  `Passport` int(11) NOT NULL,
  `dkey` varchar(100) NOT NULL,
  `dvalue` longtext DEFAULT NULL,
  `Acampamento` int(11) DEFAULT NULL,
  PRIMARY KEY (`Passport`, `dkey`),
  KEY `Passport` (`Passport`),
  KEY `dkey` (`dkey`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: port
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `port` (
  `portId` int(11) NOT NULL AUTO_INCREMENT,
  `identity` longtext DEFAULT NULL,
  `user_id` text DEFAULT NULL,
  `portType` longtext DEFAULT NULL,
  `serial` longtext DEFAULT NULL,
  `nidentity` longtext DEFAULT NULL,
  `exam` longtext DEFAULT NULL,
  `date` text DEFAULT NULL,
  PRIMARY KEY (`portId`),
  KEY `portId` (`portId`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_swedish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: prison
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `prison` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `police` varchar(255) DEFAULT '0',
  `nuser_id` int(11) NOT NULL DEFAULT 0,
  `services` int(11) NOT NULL DEFAULT 0,
  `fines` int(20) NOT NULL DEFAULT 0,
  `text` longtext DEFAULT NULL,
  `date` text DEFAULT NULL,
  `cops` longtext NOT NULL DEFAULT '0',
  `association` longtext NOT NULL DEFAULT '0',
  `residual` text DEFAULT NULL,
  `url` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_swedish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: propertys
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `propertys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL DEFAULT 'Homes0001',
  `Interior` varchar(20) NOT NULL DEFAULT 'Middle',
  `Keys` int(3) NOT NULL DEFAULT 3,
  `Tax` int(20) NOT NULL DEFAULT 0,
  `Passport` int(6) NOT NULL DEFAULT 0,
  `Serial` varchar(10) NOT NULL,
  `Vault` int(6) NOT NULL DEFAULT 1,
  `Fridge` int(6) NOT NULL DEFAULT 1,
  `Garage` longtext NOT NULL DEFAULT '{}',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `Passport` (`Passport`),
  KEY `Name` (`Name`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: races
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `races` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Race` int(3) NOT NULL DEFAULT 0,
  `Passport` int(5) NOT NULL DEFAULT 0,
  `Name` varchar(100) NOT NULL DEFAULT 'Individuo Indigente',
  `Vehicle` varchar(50) NOT NULL DEFAULT 'Sultan RS',
  `Points` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `Race` (`Race`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: reports
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `victim_id` text DEFAULT NULL,
  `police_name` text DEFAULT NULL,
  `solved` text DEFAULT NULL,
  `victim_name` text DEFAULT NULL,
  `created_at` text DEFAULT NULL,
  `victim_report` text DEFAULT NULL,
  `updated_at` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `portId` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 19 DEFAULT CHARSET = latin1 COLLATE = latin1_swedish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: skins
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `skins` (
  `component` varchar(50) NOT NULL DEFAULT '',
  `stock` int(11) DEFAULT 0,
  PRIMARY KEY (`component`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: skins_users
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `skins_users` (
  `Passport` int(11) NOT NULL DEFAULT 0,
  `skins` text DEFAULT '[]',
  `equipadas` text DEFAULT '[]',
  PRIMARY KEY (`Passport`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: smarthpone_bank
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `smarthpone_bank` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `amount` varchar(50) NOT NULL,
  `idtrans` int(11) NOT NULL,
  `title` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: smartphone_bank_invoices
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `smartphone_bank_invoices` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `payee_id` int(11) NOT NULL,
  `payer_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL DEFAULT '',
  `value` int(11) NOT NULL,
  `paid` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: smartphone_blocks
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `smartphone_blocks` (
  `user_id` int(11) NOT NULL,
  `phone` varchar(32) NOT NULL,
  PRIMARY KEY (`user_id`, `phone`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: smartphone_calls
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `smartphone_calls` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `initiator` varchar(50) NOT NULL,
  `target` varchar(50) NOT NULL,
  `duration` int(11) NOT NULL DEFAULT 0,
  `status` varchar(255) NOT NULL,
  `video` tinyint(4) NOT NULL DEFAULT 0,
  `anonymous` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `initiator_index` (`initiator`),
  KEY `target_index` (`target`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: smartphone_casino
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `smartphone_casino` (
  `user_id` int(11) NOT NULL,
  `balance` bigint(20) NOT NULL DEFAULT 0,
  `double` bigint(20) NOT NULL DEFAULT 0,
  `crash` bigint(20) NOT NULL DEFAULT 0,
  `mine` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: smartphone_contacts
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `smartphone_contacts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `owner_index` (`owner`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: smartphone_gallery
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `smartphone_gallery` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `folder` varchar(255) NOT NULL DEFAULT '/',
  `url` varchar(255) NOT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: smartphone_instagram
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `smartphone_instagram` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `bio` varchar(255) NOT NULL,
  `avatarURL` varchar(255) DEFAULT NULL,
  `verified` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: smartphone_instagram_followers
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `smartphone_instagram_followers` (
  `follower_id` bigint(20) NOT NULL,
  `profile_id` bigint(20) NOT NULL,
  PRIMARY KEY (`follower_id`, `profile_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: smartphone_instagram_likes
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `smartphone_instagram_likes` (
  `post_id` bigint(20) NOT NULL,
  `profile_id` bigint(20) NOT NULL,
  PRIMARY KEY (`post_id`, `profile_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: smartphone_instagram_notifications
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `smartphone_instagram_notifications` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `content` varchar(512) NOT NULL,
  `saw` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_id_index` (`profile_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: smartphone_instagram_posts
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `smartphone_instagram_posts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `profile_id` bigint(20) NOT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_at` bigint(20) NOT NULL,
  `comments` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_id_index` (`profile_id`),
  KEY `post_id_index` (`post_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: smartphone_olx
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `smartphone_olx` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `images` varchar(1024) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: smartphone_paypal_transactions
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `smartphone_paypal_transactions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `target` bigint(20) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'payment',
  `description` varchar(255) DEFAULT NULL,
  `value` bigint(20) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`),
  KEY `target_index` (`target`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: smartphone_tinder
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `smartphone_tinder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `bio` varchar(1024) NOT NULL,
  `age` tinyint(4) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `show_gender` tinyint(4) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `show_tags` tinyint(4) NOT NULL,
  `target` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`),
  KEY `gender_index` (`gender`),
  KEY `target_index` (`target`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: smartphone_tinder_messages
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `smartphone_tinder_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sender` int(11) NOT NULL,
  `target` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `liked` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sender_index` (`sender`),
  KEY `target_index` (`target`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: smartphone_tinder_rating
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `smartphone_tinder_rating` (
  `profile_id` int(11) NOT NULL,
  `rated_id` int(11) NOT NULL,
  `rating` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`profile_id`, `rated_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: smartphone_tor_messages
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `smartphone_tor_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `channel` varchar(24) NOT NULL DEFAULT 'geral',
  `sender` varchar(50) NOT NULL,
  `image` varchar(512) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `channel_index` (`channel`),
  KEY `sender_index` (`sender`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: smartphone_tor_payments
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `smartphone_tor_payments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sender` bigint(20) NOT NULL,
  `target` bigint(20) NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sender_index` (`sender`),
  KEY `target_index` (`target`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: smartphone_twitter_followers
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `smartphone_twitter_followers` (
  `follower_id` bigint(20) NOT NULL,
  `profile_id` bigint(20) NOT NULL,
  KEY `profile_id_index` (`profile_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: smartphone_twitter_likes
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `smartphone_twitter_likes` (
  `tweet_id` bigint(20) NOT NULL,
  `profile_id` bigint(20) NOT NULL,
  KEY `tweet_id_index` (`tweet_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: smartphone_twitter_profiles
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `smartphone_twitter_profiles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `avatarURL` varchar(255) NOT NULL,
  `bannerURL` varchar(255) NOT NULL,
  `bio` varchar(255) DEFAULT NULL,
  `verified` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: smartphone_twitter_tweets
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `smartphone_twitter_tweets` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `tweet_id` bigint(20) DEFAULT NULL,
  `content` varchar(280) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_id_index` (`profile_id`),
  KEY `tweet_id_index` (`tweet_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: smartphone_weazel
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `smartphone_weazel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `author` varchar(255) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(4096) NOT NULL,
  `imageURL` varchar(255) DEFAULT NULL,
  `videoURL` varchar(255) DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: smartphone_whatsapp
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `smartphone_whatsapp` (
  `owner` varchar(32) NOT NULL,
  `avatarURL` varchar(255) DEFAULT NULL,
  `read_receipts` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`owner`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: smartphone_whatsapp_channels
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `smartphone_whatsapp_channels` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sender` varchar(50) NOT NULL,
  `target` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sender_index` (`sender`),
  KEY `target_index` (`target`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: smartphone_whatsapp_groups
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `smartphone_whatsapp_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `avatarURL` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `members` varchar(2048) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: smartphone_whatsapp_messages
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `smartphone_whatsapp_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `channel_id` bigint(20) unsigned NOT NULL,
  `sender` varchar(50) NOT NULL,
  `image` varchar(512) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `deleted_by` varchar(255) DEFAULT NULL,
  `readed` tinyint(4) NOT NULL DEFAULT 0,
  `saw_at` bigint(20) NOT NULL DEFAULT 0,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sender_index` (`sender`),
  KEY `channel_id_index` (`channel_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: staff_warnings
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `staff_warnings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `staff_user_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `banned` tinyint(1) DEFAULT NULL,
  `banned_time` float DEFAULT NULL,
  `banned_real_time` float DEFAULT NULL,
  `created` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: taxs
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `taxs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Name` varchar(50) NOT NULL,
  `Date` varchar(50) NOT NULL,
  `Hour` varchar(50) NOT NULL,
  `Value` int(11) NOT NULL,
  `Message` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: transactions
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Type` varchar(50) NOT NULL,
  `Date` varchar(50) NOT NULL,
  `Value` int(11) NOT NULL,
  `Balance` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 13 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: user_invites
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `user_invites` (
  `user_id` varchar(20) NOT NULL,
  `regular` int(11) DEFAULT 0,
  `left_users` int(11) DEFAULT 0,
  `fake` int(11) DEFAULT 0,
  `bonus` int(11) DEFAULT 0,
  PRIMARY KEY (`user_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: user_ranking
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `user_ranking` (
  `user_id` varchar(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `points` int(11) DEFAULT 0,
  `level` int(11) DEFAULT 1,
  `last_message` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`user_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vehicles
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Passport` int(11) NOT NULL,
  `vehicle` varchar(100) NOT NULL,
  `tax` int(20) NOT NULL DEFAULT 0,
  `plate` varchar(10) DEFAULT NULL,
  `rental` int(20) NOT NULL DEFAULT 0,
  `arrest` int(20) NOT NULL DEFAULT 0,
  `engine` int(4) NOT NULL DEFAULT 1000,
  `body` int(4) NOT NULL DEFAULT 1000,
  `health` int(4) NOT NULL DEFAULT 1000,
  `fuel` int(3) NOT NULL DEFAULT 100,
  `nitro` int(5) NOT NULL DEFAULT 0,
  `work` varchar(5) NOT NULL DEFAULT 'false',
  `doors` longtext NOT NULL,
  `windows` longtext NOT NULL,
  `tyres` longtext NOT NULL,
  `garagemid` varchar(50) NOT NULL DEFAULT '151',
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `vehicle` (`vehicle`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: warehouse
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `warehouse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `weight` int(10) NOT NULL DEFAULT 200,
  `password` varchar(50) NOT NULL,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `tax` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: warrants
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `warrants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` text DEFAULT NULL,
  `identity` text DEFAULT NULL,
  `status` text DEFAULT NULL,
  `nidentity` text DEFAULT NULL,
  `timeStamp` text DEFAULT NULL,
  `reason` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `portId` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_swedish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: zo_attachs
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `zo_attachs` (
  `user_id` int(11) NOT NULL,
  `attachs` text DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: accounts
# ------------------------------------------------------------

INSERT INTO
  `accounts` (
    `id`,
    `whitelist`,
    `chars`,
    `gems`,
    `rolepass`,
    `premium`,
    `discord`,
    `license`
  )
VALUES
  (
    1,
    1,
    1,
    950,
    0,
    0,
    '247030092692324352',
    'd05a5bb0ef761c0b43439039d623e3c59a781cce'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: alien_box
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: alien_mansions
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: banneds
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: carmileages
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: casados
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: characters
# ------------------------------------------------------------

INSERT INTO
  `characters` (
    `id`,
    `license`,
    `phone`,
    `name`,
    `name2`,
    `sex`,
    `bank`,
    `blood`,
    `fines`,
    `prison`,
    `tracking`,
    `spending`,
    `cardlimit`,
    `deleted`,
    `created`,
    `paypal`,
    `card`,
    `relacionamento`,
    `coins`,
    `tempoTotal`,
    `initial`,
    `relationship`,
    `age`
  )
VALUES
  (
    1,
    'd05a5bb0ef761c0b43439039d623e3c59a781cce',
    '112-203',
    'Kratos',
    'Admin',
    'M',
    2255000,
    3,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    3,
    445,
    1,
    'Solteiro',
    28
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: chests
# ------------------------------------------------------------

INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (1, 'Police', 500, 'Police', 1);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (2, 'Paramedic', 500, 'Paramedic', 1);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (3, 'BurgerShot', 250, 'BurgerShot', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (4, 'PizzaThis', 250, 'PizzaThis', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (5, 'UwuCoffee', 250, 'UwuCoffee', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (6, 'BeanMachine', 250, 'BeanMachine', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (7, 'Triade', 250, 'Triade', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (8, 'Colombia', 250, 'Colombia', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (10, 'Italia', 250, 'Italia', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (11, 'Jamaica', 250, 'Jamaica', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (12, 'Canada', 250, 'Canada', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (13, 'Mechanic', 500, 'Mechanic', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (14, 'Grota', 250, 'Grota', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (15, 'Turquia', 250, 'Turquia', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (16, 'Egito', 250, 'Egito', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (17, 'Franca', 250, 'Franca', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (18, 'Cartel', 250, 'Cartel', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (19, 'Vanilla', 250, 'Vanilla', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (20, 'Bahamas', 250, 'Bahamas', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (21, 'Laranjas', 250, 'Laranjas', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (22, 'Yakuza', 250, 'Yakuza', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (23, 'Hells', 250, 'Hells', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (24, 'Drifking', 250, 'Drifking', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (25, 'Prf', 500, 'Prf', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (26, 'Baep', 500, 'Baep', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (27, 'Exercito', 500, 'Exercito', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (28, 'Rota', 500, 'Rota', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (29, 'Civil', 500, 'Civil', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (30, 'Admin', 1500, 'Admin', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (31, 'Mansao01', 500, 'Mansao01', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (32, 'Mansao02', 500, 'Mansao02', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (33, 'Mansao03', 500, 'Mansao03', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (34, 'Mansao04', 500, 'Mansao04', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (35, 'Mansao05', 500, 'Mansao05', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (36, 'Mansao06', 500, 'Mansao06', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (37, 'Mansao07', 500, 'Mansao07', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (38, 'Mansao08', 500, 'Mansao08', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (39, 'Mansao09', 500, 'Mansao09', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (40, 'Mansao10', 500, 'Mansao10', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (41, 'Mansao11', 500, 'Mansao11', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (42, 'Mansao12', 500, 'Mansao12', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (43, 'Mansao13', 500, 'Mansao13', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (44, 'Mansao14', 500, 'Mansao14', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (45, 'Mansao15', 500, 'Mansao15', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (46, 'Mansao16', 500, 'Mansao16', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (47, 'Mansao17', 500, 'Mansao17', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (48, 'Mansao18', 500, 'Mansao18', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (49, 'Mansao19', 500, 'Mansao19', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (50, 'Mansao20', 500, 'Mansao20', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (51, 'Mansao21', 500, 'Mansao21', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (52, 'Mansao22', 500, 'Mansao22', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (53, 'Mansao23', 500, 'Mansao23', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (54, 'Mansao24', 500, 'Mansao24', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (55, 'Mansao25', 500, 'Mansao25', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (56, 'Mansao26', 500, 'Mansao26', 0);
INSERT INTO
  `chests` (`id`, `name`, `weight`, `perm`, `logs`)
VALUES
  (57, 'Mansao27', 500, 'Mansao27', 0);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: cupons
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: dependents
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: dpkeybinds
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: entitydata
# ------------------------------------------------------------

INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Admin', '{\"1\":1}');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Admin-Off', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Baep', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Baep-Off', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Bahamas', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:BeanMachine', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Bombeiro', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Bombeiro-Off', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:BurgerShot', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Canada', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Cartel', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Civil', '{\"1\":1}');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Civil-Off', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Colombia', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Dono', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Driftking', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Egito', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Emergency', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Exercito', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Exercito-Off', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Franca', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Grota', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Hells', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Italia', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Jamaica', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Laranjas', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Law', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Law-Off', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Mansao01', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Mansao02', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Mansao03', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Mansao04', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Mansao05', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Mansao06', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Mansao07', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Mansao08', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Mansao09', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Mansao10', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Mansao11', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Mansao12', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Mansao13', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Mansao14', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Mansao15', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Mansao16', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Mansao17', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Mansao18', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Mansao19', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Mansao20', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Mansao21', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Mansao22', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Mansao23', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Mansao24', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Mansao25', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Mansao26', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Mansao27', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Mechanic', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Mechanic-Off', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Nitro', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Paramedic', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Paramedic-Off', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:PizzaThis', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Police', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Police-Off', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Premium', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Prf', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Prf-Off', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Rota', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Rota-Off', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Som', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:staff', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Triade', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Turquia', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:UwuCoffee', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Vanilla', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Permissions:Yakuza', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Plants', '[]');
INSERT INTO
  `entitydata` (`dkey`, `dvalue`)
VALUES
  ('Wardrobe:1', '[]');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: fidentity
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: fines
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: investments
# ------------------------------------------------------------

INSERT INTO
  `investments` (
    `id`,
    `Passport`,
    `Liquid`,
    `Monthly`,
    `Deposit`,
    `Last`
  )
VALUES
  (1, 1, 250, 1000, 10000, 1745519009);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: invoices
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: logs
# ------------------------------------------------------------

INSERT INTO
  `logs` (
    `id`,
    `tipo`,
    `descricao`,
    `user_discord_id`,
    `data_log`
  )
VALUES
  (
    1,
    'canal_configurado',
    'Canal de doações definido em #?・tema-brasil',
    '247030092692324352',
    '2025-04-24 15:14:42'
  );
INSERT INTO
  `logs` (
    `id`,
    `tipo`,
    `descricao`,
    `user_discord_id`,
    `data_log`
  )
VALUES
  (
    2,
    'ticket_criado',
    'Ticket criado por kleitao em doacao-kleitao',
    '247030092692324352',
    '2025-04-24 15:14:57'
  );
INSERT INTO
  `logs` (
    `id`,
    `tipo`,
    `descricao`,
    `user_discord_id`,
    `data_log`
  )
VALUES
  (
    3,
    'ticket_cancelado',
    'Ticket cancelado por kleitao',
    '247030092692324352',
    '2025-04-24 15:20:34'
  );
INSERT INTO
  `logs` (
    `id`,
    `tipo`,
    `descricao`,
    `user_discord_id`,
    `data_log`
  )
VALUES
  (
    4,
    'ticket_criado',
    'Ticket criado por kleitao em doacao-kleitao',
    '247030092692324352',
    '2025-04-24 15:20:47'
  );
INSERT INTO
  `logs` (
    `id`,
    `tipo`,
    `descricao`,
    `user_discord_id`,
    `data_log`
  )
VALUES
  (
    5,
    'canal_configurado',
    'Canal de doações definido em #?・tema-brasil',
    '247030092692324352',
    '2025-04-24 15:32:39'
  );
INSERT INTO
  `logs` (
    `id`,
    `tipo`,
    `descricao`,
    `user_discord_id`,
    `data_log`
  )
VALUES
  (
    6,
    'ticket_criado',
    'Ticket criado por kleitao em doacao-kleitao',
    '247030092692324352',
    '2025-04-24 15:32:43'
  );
INSERT INTO
  `logs` (
    `id`,
    `tipo`,
    `descricao`,
    `user_discord_id`,
    `data_log`
  )
VALUES
  (
    7,
    'ticket_criado',
    'Ticket criado por kleitao em doacao-kleitao',
    '247030092692324352',
    '2025-04-24 15:34:12'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: org_transactions
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: organizations
# ------------------------------------------------------------

INSERT INTO
  `organizations` (`id`, `name`, `bank`, `premium`, `buff`)
VALUES
  (1, 'Police', 0, 0, 0);
INSERT INTO
  `organizations` (`id`, `name`, `bank`, `premium`, `buff`)
VALUES
  (2, 'Paramedic', 0, 0, 0);
INSERT INTO
  `organizations` (`id`, `name`, `bank`, `premium`, `buff`)
VALUES
  (3, 'BurgerShot', 0, 0, 0);
INSERT INTO
  `organizations` (`id`, `name`, `bank`, `premium`, `buff`)
VALUES
  (4, 'PizzaThis', 0, 0, 0);
INSERT INTO
  `organizations` (`id`, `name`, `bank`, `premium`, `buff`)
VALUES
  (5, 'UwuCoffee', 0, 0, 0);
INSERT INTO
  `organizations` (`id`, `name`, `bank`, `premium`, `buff`)
VALUES
  (6, 'BeanMachine', 0, 0, 0);
INSERT INTO
  `organizations` (`id`, `name`, `bank`, `premium`, `buff`)
VALUES
  (7, 'Triade', 0, 0, 0);
INSERT INTO
  `organizations` (`id`, `name`, `bank`, `premium`, `buff`)
VALUES
  (8, 'Colombia', 0, 0, 0);
INSERT INTO
  `organizations` (`id`, `name`, `bank`, `premium`, `buff`)
VALUES
  (9, 'Italia', 0, 0, 0);
INSERT INTO
  `organizations` (`id`, `name`, `bank`, `premium`, `buff`)
VALUES
  (10, 'Aztecas', 0, 0, 0);
INSERT INTO
  `organizations` (`id`, `name`, `bank`, `premium`, `buff`)
VALUES
  (11, 'Jamaica', 0, 0, 0);
INSERT INTO
  `organizations` (`id`, `name`, `bank`, `premium`, `buff`)
VALUES
  (12, 'Canada', 0, 0, 0);
INSERT INTO
  `organizations` (`id`, `name`, `bank`, `premium`, `buff`)
VALUES
  (13, 'Mechanic', 0, 0, 0);
INSERT INTO
  `organizations` (`id`, `name`, `bank`, `premium`, `buff`)
VALUES
  (14, 'Grota', 0, 0, 0);
INSERT INTO
  `organizations` (`id`, `name`, `bank`, `premium`, `buff`)
VALUES
  (15, 'Turquia', 0, 0, 0);
INSERT INTO
  `organizations` (`id`, `name`, `bank`, `premium`, `buff`)
VALUES
  (16, 'Egito', 0, 0, 0);
INSERT INTO
  `organizations` (`id`, `name`, `bank`, `premium`, `buff`)
VALUES
  (17, 'Franca', 0, 0, 0);
INSERT INTO
  `organizations` (`id`, `name`, `bank`, `premium`, `buff`)
VALUES
  (18, 'Cartel', 0, 0, 0);
INSERT INTO
  `organizations` (`id`, `name`, `bank`, `premium`, `buff`)
VALUES
  (19, 'Vanilla', 0, 0, 0);
INSERT INTO
  `organizations` (`id`, `name`, `bank`, `premium`, `buff`)
VALUES
  (20, 'Bahamas', 0, 0, 0);
INSERT INTO
  `organizations` (`id`, `name`, `bank`, `premium`, `buff`)
VALUES
  (21, 'Laranjas', 0, 0, 0);
INSERT INTO
  `organizations` (`id`, `name`, `bank`, `premium`, `buff`)
VALUES
  (22, 'Yakuza', 0, 0, 0);
INSERT INTO
  `organizations` (`id`, `name`, `bank`, `premium`, `buff`)
VALUES
  (23, 'Hells', 0, 0, 0);
INSERT INTO
  `organizations` (`id`, `name`, `bank`, `premium`, `buff`)
VALUES
  (24, 'Drifking', 0, 0, 0);
INSERT INTO
  `organizations` (`id`, `name`, `bank`, `premium`, `buff`)
VALUES
  (25, 'Prf', 0, 0, 0);
INSERT INTO
  `organizations` (`id`, `name`, `bank`, `premium`, `buff`)
VALUES
  (26, 'Baep', 0, 0, 0);
INSERT INTO
  `organizations` (`id`, `name`, `bank`, `premium`, `buff`)
VALUES
  (27, 'Exercito', 0, 0, 0);
INSERT INTO
  `organizations` (`id`, `name`, `bank`, `premium`, `buff`)
VALUES
  (28, 'Rota', 0, 0, 0);
INSERT INTO
  `organizations` (`id`, `name`, `bank`, `premium`, `buff`)
VALUES
  (29, 'Civil', 0, 0, 0);
INSERT INTO
  `organizations` (`id`, `name`, `bank`, `premium`, `buff`)
VALUES
  (30, 'Admin', 0, 0, 0);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: pedidos
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: playerdata
# ------------------------------------------------------------

INSERT INTO
  `playerdata` (`Passport`, `dkey`, `dvalue`, `Acampamento`)
VALUES
  (1, 'Ammos', '[]', NULL);
INSERT INTO
  `playerdata` (`Passport`, `dkey`, `dvalue`, `Acampamento`)
VALUES
  (1, 'Attachs', '[]', NULL);
INSERT INTO
  `playerdata` (`Passport`, `dkey`, `dvalue`, `Acampamento`)
VALUES
  (
    1,
    'Clothings',
    '{\"shoes\":{\"texture\":0,\"item\":1},\"glass\":{\"texture\":0,\"item\":-1},\"arms\":{\"texture\":0,\"item\":15},\"decals\":{\"texture\":0,\"item\":0},\"ear\":{\"texture\":0,\"item\":-1},\"bracelet\":{\"texture\":0,\"item\":-1},\"vest\":{\"texture\":0,\"item\":0},\"pants\":{\"texture\":0,\"item\":3},\"backpack\":{\"texture\":0,\"item\":0},\"hat\":{\"texture\":0,\"item\":-1},\"mask\":{\"texture\":0,\"item\":0},\"tshirt\":{\"texture\":0,\"item\":15},\"accessory\":{\"texture\":0,\"item\":-1},\"watch\":{\"texture\":0,\"item\":-1},\"torso\":{\"texture\":0,\"item\":1}}',
    NULL
  );
INSERT INTO
  `playerdata` (`Passport`, `dkey`, `dvalue`, `Acampamento`)
VALUES
  (
    1,
    'Datatable',
    '{\"Thirst\":64,\"Hunger\":82,\"Armour\":0,\"Inventory\":{\"7\":{\"item\":\"tacos-1745081221\",\"amount\":3},\"5\":{\"item\":\"cellphone-1745081221\",\"amount\":1},\"6\":{\"item\":\"identity-1\",\"amount\":1},\"3\":{\"item\":\"dollars\",\"amount\":11420},\"4\":{\"item\":\"skateboard\",\"amount\":1},\"1\":{\"item\":\"water\",\"amount\":2},\"2\":{\"item\":\"radio-1745084965\",\"amount\":1}},\"Pos\":{\"x\":302.64,\"y\":-1481.05,\"z\":38.69},\"Stress\":0,\"Health\":188,\"Skin\":\"mp_m_freemode_01\",\"Weight\":30}',
    NULL
  );
INSERT INTO
  `playerdata` (`Passport`, `dkey`, `dvalue`, `Acampamento`)
VALUES
  (
    1,
    'Experience',
    '{\"Delivery\":0,\"Trucker\":0,\"Dismantle\":0,\"Tows\":0,\"Farmer\":0,\"Fishing\":0,\"Transporter\":0,\"Lumberman\":0,\"Hunter\":0,\"Driver\":53}',
    NULL
  );
INSERT INTO
  `playerdata` (`Passport`, `dkey`, `dvalue`, `Acampamento`)
VALUES
  (
    1,
    'nation_char',
    '{\"lipstick\":-1,\"shapeFirst\":21,\"addBodyBlemishes-color\":0,\"lipstick-color\":0,\"facialHair-color\":0,\"makeup-color\":-1,\"skinSecond\":0,\"cheeksBoneHigh\":0.0,\"freckles-color\":0,\"eyebrows-opacity\":1.0,\"shapeMix\":0.80000001192092,\"overlay\":0,\"hair-color\":0,\"freckles\":-1,\"eyesOpenning\":0.0,\"eyebrows-color\":0,\"cheeksBoneWidth\":0.0,\"shapeSecond\":0,\"bodyBlemishes\":-1,\"bodyBlemishes-color\":0,\"eyes\":0,\"eyeBrownForward\":0.0,\"chinHole\":0.0,\"lipsThickness\":0.0,\"chestHair\":-1,\"noseBoneTwist\":0.0,\"chinBoneLength\":0.0,\"hair\":0,\"complexion\":-1,\"skinFirst\":21,\"complexion-opacity\":1.0,\"complexion-color\":0,\"blemishes-color\":0,\"facialHair-opacity\":1.0,\"eyebrows\":-1,\"freckles-opacity\":1.0,\"thirdMix\":0.0,\"blush-color\":0,\"facialHair\":-1,\"gender\":\"male\",\"neckThickness\":0.0,\"ageing-color\":0,\"ageing-opacity\":1.0,\"shapeThird\":0,\"blemishes\":-1,\"eyeBrownHigh\":0.0,\"noseBoneHigh\":0.0,\"chestHair-color\":0,\"blush-opacity\":1.0,\"noseWidth\":0.0,\"makeup\":-1,\"blush\":-1,\"blemishes-opacity\":1.0,\"nosePeakLength\":0.0,\"nosePeakLowering\":0.0,\"chinBoneLowering\":0.0,\"skinThird\":0,\"cheeksWidth\":0.0,\"sunDamage-color\":0,\"nosePeakHeight\":0.0,\"skinMix\":0.80000001192092,\"addBodyBlemishes-opacity\":1.0,\"sunDamage\":-1,\"addBodyBlemishes\":-1,\"chestHair-opacity\":1.0,\"sunDamage-opacity\":1.0,\"jawBoneBackLength\":0.0,\"chinBoneWidth\":0.0,\"lipstick-opacity\":1.0,\"makeup-opacity\":1.0,\"jawBoneWidth\":0.0,\"ageing\":-1,\"hair-highlightcolor\":0,\"bodyBlemishes-opacity\":1.0}',
    NULL
  );
INSERT INTO
  `playerdata` (`Passport`, `dkey`, `dvalue`, `Acampamento`)
VALUES
  (
    1,
    'Rolepass',
    '{\"Free\":0,\"Premium\":0,\"Points\":53,\"Finish\":1746068400.0,\"RolepassBuy\":false}',
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: port
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: prison
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: propertys
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: races
# ------------------------------------------------------------

INSERT INTO
  `races` (`id`, `Race`, `Passport`, `Name`, `Vehicle`, `Points`)
VALUES
  (1, 23, 1, 'Kratos Admin', 'T20', 366308);
INSERT INTO
  `races` (`id`, `Race`, `Passport`, `Name`, `Vehicle`, `Points`)
VALUES
  (2, 19, 1, 'Kratos Admin', 'T20', 481059);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: reports
# ------------------------------------------------------------

INSERT INTO
  `reports` (
    `id`,
    `victim_id`,
    `police_name`,
    `solved`,
    `victim_name`,
    `created_at`,
    `victim_report`,
    `updated_at`
  )
VALUES
  (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO
  `reports` (
    `id`,
    `victim_id`,
    `police_name`,
    `solved`,
    `victim_name`,
    `created_at`,
    `victim_report`,
    `updated_at`
  )
VALUES
  (2, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO
  `reports` (
    `id`,
    `victim_id`,
    `police_name`,
    `solved`,
    `victim_name`,
    `created_at`,
    `victim_report`,
    `updated_at`
  )
VALUES
  (3, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO
  `reports` (
    `id`,
    `victim_id`,
    `police_name`,
    `solved`,
    `victim_name`,
    `created_at`,
    `victim_report`,
    `updated_at`
  )
VALUES
  (4, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO
  `reports` (
    `id`,
    `victim_id`,
    `police_name`,
    `solved`,
    `victim_name`,
    `created_at`,
    `victim_report`,
    `updated_at`
  )
VALUES
  (5, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO
  `reports` (
    `id`,
    `victim_id`,
    `police_name`,
    `solved`,
    `victim_name`,
    `created_at`,
    `victim_report`,
    `updated_at`
  )
VALUES
  (6, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO
  `reports` (
    `id`,
    `victim_id`,
    `police_name`,
    `solved`,
    `victim_name`,
    `created_at`,
    `victim_report`,
    `updated_at`
  )
VALUES
  (7, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO
  `reports` (
    `id`,
    `victim_id`,
    `police_name`,
    `solved`,
    `victim_name`,
    `created_at`,
    `victim_report`,
    `updated_at`
  )
VALUES
  (8, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO
  `reports` (
    `id`,
    `victim_id`,
    `police_name`,
    `solved`,
    `victim_name`,
    `created_at`,
    `victim_report`,
    `updated_at`
  )
VALUES
  (9, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO
  `reports` (
    `id`,
    `victim_id`,
    `police_name`,
    `solved`,
    `victim_name`,
    `created_at`,
    `victim_report`,
    `updated_at`
  )
VALUES
  (10, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO
  `reports` (
    `id`,
    `victim_id`,
    `police_name`,
    `solved`,
    `victim_name`,
    `created_at`,
    `victim_report`,
    `updated_at`
  )
VALUES
  (11, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO
  `reports` (
    `id`,
    `victim_id`,
    `police_name`,
    `solved`,
    `victim_name`,
    `created_at`,
    `victim_report`,
    `updated_at`
  )
VALUES
  (12, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO
  `reports` (
    `id`,
    `victim_id`,
    `police_name`,
    `solved`,
    `victim_name`,
    `created_at`,
    `victim_report`,
    `updated_at`
  )
VALUES
  (13, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO
  `reports` (
    `id`,
    `victim_id`,
    `police_name`,
    `solved`,
    `victim_name`,
    `created_at`,
    `victim_report`,
    `updated_at`
  )
VALUES
  (14, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO
  `reports` (
    `id`,
    `victim_id`,
    `police_name`,
    `solved`,
    `victim_name`,
    `created_at`,
    `victim_report`,
    `updated_at`
  )
VALUES
  (15, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO
  `reports` (
    `id`,
    `victim_id`,
    `police_name`,
    `solved`,
    `victim_name`,
    `created_at`,
    `victim_report`,
    `updated_at`
  )
VALUES
  (16, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO
  `reports` (
    `id`,
    `victim_id`,
    `police_name`,
    `solved`,
    `victim_name`,
    `created_at`,
    `victim_report`,
    `updated_at`
  )
VALUES
  (17, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO
  `reports` (
    `id`,
    `victim_id`,
    `police_name`,
    `solved`,
    `victim_name`,
    `created_at`,
    `victim_report`,
    `updated_at`
  )
VALUES
  (18, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: skins
# ------------------------------------------------------------

INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_AK47_AA_SKIN', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_AK47_AB_SKIN', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_AK47_AC_SKIN', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_AK47_AE_SKIN', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_AK47_AG_SKIN', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_AK47_AH_SKIN', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_AK47_AI_SKIN', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_AK47_AK_SKIN', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_AK47_AL_SKIN', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_AK47_AM_SKIN', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_AK47_AN_SKIN', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_AK47_AQ_SKIN', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_AK47_MARK_SKIN', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_AK47_PARTEN_SKIN', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_AK47_SKIN', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_AK47_TOE_SKIN', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_AK47_WHITEB_SKIN', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_AK47_WHITE_SKIN', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_AK47_WH_SKIN', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_AK47_YE_SKIN', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_FIVESEVEN_AA', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_FIVESEVEN_AI', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_FIVESEVEN_AJ', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_FIVESEVEN_AM', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_FIVESEVEN_AO', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_FIVESEVEN_AP', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_FIVESEVEN_AR', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_FIVESEVEN_AT', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_FIVESEVEN_BARBIE', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_FIVESEVEN_NV', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_G3_ANCI', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_G3_BB', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_G3_BRIN', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_G3_CA', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_G3_MK2_GP', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_G3_MK2_ONI', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_G3_MK2_RGX', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_G3_MK2_SAQ', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_G3_MK2_SING', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_G3_PB', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_G3_RAE', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_G3_SUB', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_GLOCK_BT', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_GLOCK_BW', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_GLOCK_CH', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_GLOCK_CI', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_GLOCK_REDSAMURAI', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_GLOCK_SEATERROR', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_GLOCK_SNACKCLUB', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_M4_AD_SKIN', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_M4_AL_SKIN', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_M4_AM_SKIN', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_M4_AR_SKIN', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_M4_AS_SKIN', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_M4_COLT_SKIN', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_M4_DK_SKIN', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_M4_DRAGON_SKIN', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_M4_GR_SKIN', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_M4_HUNTER_SKIN', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_M4_MK2_AJ_SKIN', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_M4_MK2_BL_SKIN', 20);
INSERT INTO
  `skins` (`component`, `stock`)
VALUES
  ('COMPONENT_M4_W_SKIN', 20);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: skins_users
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: smarthpone_bank
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: smartphone_bank_invoices
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: smartphone_blocks
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: smartphone_calls
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: smartphone_casino
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: smartphone_contacts
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: smartphone_gallery
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: smartphone_instagram
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: smartphone_instagram_followers
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: smartphone_instagram_likes
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: smartphone_instagram_notifications
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: smartphone_instagram_posts
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: smartphone_olx
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: smartphone_paypal_transactions
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: smartphone_tinder
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: smartphone_tinder_messages
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: smartphone_tinder_rating
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: smartphone_tor_messages
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: smartphone_tor_payments
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: smartphone_twitter_followers
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: smartphone_twitter_likes
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: smartphone_twitter_profiles
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: smartphone_twitter_tweets
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: smartphone_weazel
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: smartphone_whatsapp
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: smartphone_whatsapp_channels
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: smartphone_whatsapp_groups
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: smartphone_whatsapp_messages
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: staff_warnings
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: taxs
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: transactions
# ------------------------------------------------------------

INSERT INTO
  `transactions` (`id`, `Passport`, `Type`, `Date`, `Value`, `Balance`)
VALUES
  (1, 1, 'entry', '19/04/2025', 20000, 0);
INSERT INTO
  `transactions` (`id`, `Passport`, `Type`, `Date`, `Value`, `Balance`)
VALUES
  (2, 1, 'entry', '19/04/2025', 20000, 20000);
INSERT INTO
  `transactions` (`id`, `Passport`, `Type`, `Date`, `Value`, `Balance`)
VALUES
  (3, 1, 'entry', '19/04/2025', 20000, 40000);
INSERT INTO
  `transactions` (`id`, `Passport`, `Type`, `Date`, `Value`, `Balance`)
VALUES
  (4, 1, 'entry', '19/04/2025', 20000, 60000);
INSERT INTO
  `transactions` (`id`, `Passport`, `Type`, `Date`, `Value`, `Balance`)
VALUES
  (5, 1, 'entry', '21/04/2025', 20000, 80000);
INSERT INTO
  `transactions` (`id`, `Passport`, `Type`, `Date`, `Value`, `Balance`)
VALUES
  (6, 1, 'entry', '21/04/2025', 20000, 100000);
INSERT INTO
  `transactions` (`id`, `Passport`, `Type`, `Date`, `Value`, `Balance`)
VALUES
  (7, 1, 'entry', '21/04/2025', 20000, 120000);
INSERT INTO
  `transactions` (`id`, `Passport`, `Type`, `Date`, `Value`, `Balance`)
VALUES
  (8, 1, 'exit', '22/04/2025', 10000, 140000);
INSERT INTO
  `transactions` (`id`, `Passport`, `Type`, `Date`, `Value`, `Balance`)
VALUES
  (9, 1, 'entry', '23/04/2025', 20000, 130000);
INSERT INTO
  `transactions` (`id`, `Passport`, `Type`, `Date`, `Value`, `Balance`)
VALUES
  (10, 1, 'entry', '23/04/2025', 20000, 150000);
INSERT INTO
  `transactions` (`id`, `Passport`, `Type`, `Date`, `Value`, `Balance`)
VALUES
  (11, 1, 'entry', '23/04/2025', 20000, 170000);
INSERT INTO
  `transactions` (`id`, `Passport`, `Type`, `Date`, `Value`, `Balance`)
VALUES
  (12, 1, 'entry', '24/04/2025', 20000, 190000);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: user_invites
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: user_ranking
# ------------------------------------------------------------

INSERT INTO
  `user_ranking` (
    `user_id`,
    `username`,
    `points`,
    `level`,
    `last_message`
  )
VALUES
  (
    '247030092692324352',
    'kleitao',
    20,
    1,
    '2025-04-25 18:08:25'
  );
INSERT INTO
  `user_ranking` (
    `user_id`,
    `username`,
    `points`,
    `level`,
    `last_message`
  )
VALUES
  (
    '827262310912622597',
    'misterk5562',
    50,
    1,
    '2025-04-25 18:23:55'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: vehicles
# ------------------------------------------------------------

INSERT INTO
  `vehicles` (
    `id`,
    `Passport`,
    `vehicle`,
    `tax`,
    `plate`,
    `rental`,
    `arrest`,
    `engine`,
    `body`,
    `health`,
    `fuel`,
    `nitro`,
    `work`,
    `doors`,
    `windows`,
    `tyres`,
    `garagemid`
  )
VALUES
  (
    1,
    1,
    'saveirog6',
    1745686083,
    '01OCM467',
    1747673283,
    0,
    1000,
    1000,
    1000,
    100,
    0,
    'false',
    '',
    '',
    '',
    '151'
  );
INSERT INTO
  `vehicles` (
    `id`,
    `Passport`,
    `vehicle`,
    `tax`,
    `plate`,
    `rental`,
    `arrest`,
    `engine`,
    `body`,
    `health`,
    `fuel`,
    `nitro`,
    `work`,
    `doors`,
    `windows`,
    `tyres`,
    `garagemid`
  )
VALUES
  (
    2,
    1,
    't20',
    1745864494,
    '49JWL599',
    0,
    0,
    927,
    919,
    919,
    96,
    2000,
    'false',
    '{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false}',
    '{\"1\":1,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":1}',
    '{\"1\":false,\"2\":true,\"3\":true,\"4\":false,\"5\":false,\"6\":false,\"7\":false,\"0\":false}',
    '174'
  );
INSERT INTO
  `vehicles` (
    `id`,
    `Passport`,
    `vehicle`,
    `tax`,
    `plate`,
    `rental`,
    `arrest`,
    `engine`,
    `body`,
    `health`,
    `fuel`,
    `nitro`,
    `work`,
    `doors`,
    `windows`,
    `tyres`,
    `garagemid`
  )
VALUES
  (
    3,
    1,
    'bus',
    1746037827,
    '37GKL167',
    0,
    0,
    960,
    956,
    956,
    39,
    0,
    'true',
    '{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false}',
    '{\"1\":false,\"2\":1,\"3\":1,\"4\":false,\"5\":false,\"0\":1}',
    '{\"1\":false,\"2\":true,\"3\":true,\"4\":false,\"5\":false,\"6\":false,\"7\":false,\"0\":false}',
    '142'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: warehouse
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: warrants
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: zo_attachs
# ------------------------------------------------------------

INSERT INTO
  `zo_attachs` (`user_id`, `attachs`)
VALUES
  (1, '[]');

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
