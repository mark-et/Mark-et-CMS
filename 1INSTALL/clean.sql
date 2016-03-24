-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Мар 24 2016 г., 20:47
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `database`
--

-- --------------------------------------------------------

--
-- Структура таблицы `s_banners`
--

CREATE TABLE IF NOT EXISTS `s_banners` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `position` int(4) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `show_all_pages` tinyint(1) NOT NULL DEFAULT '0',
  `categories` varchar(200) NOT NULL DEFAULT '0',
  `pages` varchar(200) NOT NULL DEFAULT '0',
  `brands` varchar(200) NOT NULL DEFAULT '0',
  `products` varchar(200) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `position` (`position`),
  KEY `visible` (`visible`),
  KEY `show_all_pages` (`show_all_pages`),
  KEY `category` (`categories`),
  KEY `pages` (`pages`),
  KEY `brands` (`brands`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `s_banners_images`
--

CREATE TABLE IF NOT EXISTS `s_banners_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alt` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `position` int(11) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `position` (`position`),
  KEY `visible` (`visible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `s_blog`
--

CREATE TABLE IF NOT EXISTS `s_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `url` varchar(255) NOT NULL,
  `meta_title` varchar(500) NOT NULL,
  `meta_keywords` varchar(500) NOT NULL,
  `meta_description` varchar(500) NOT NULL,
  `annotation` text NOT NULL,
  `text` longtext NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `image` varchar(255) NOT NULL DEFAULT '',
  `last_modify` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `enabled` (`visible`),
  KEY `url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `s_brands`
--

CREATE TABLE IF NOT EXISTS `s_brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `meta_title` varchar(500) NOT NULL,
  `meta_keywords` varchar(500) NOT NULL,
  `meta_description` varchar(500) NOT NULL,
  `annotation` text NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `last_modify` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `s_callbacks`
--

CREATE TABLE IF NOT EXISTS `s_callbacks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `processed` tinyint(1) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `s_categories`
--

CREATE TABLE IF NOT EXISTS `s_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `name_h1` varchar(255) NOT NULL DEFAULT '',
  `yandex_name` varchar(255) NOT NULL DEFAULT '',
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `annotation` text NOT NULL,
  `description` text NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `position` int(11) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `external_id` varchar(36) NOT NULL,
  `level_depth` tinyint(1) NOT NULL DEFAULT '1',
  `auto_meta_title` varchar(255) NOT NULL,
  `auto_meta_keywords` varchar(255) NOT NULL,
  `auto_meta_desc` varchar(255) NOT NULL,
  `auto_body` text NOT NULL,
  `last_modify` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `url` (`url`),
  KEY `parent_id` (`parent_id`),
  KEY `position` (`position`),
  KEY `visible` (`visible`),
  KEY `external_id` (`external_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `s_categories_features`
--

CREATE TABLE IF NOT EXISTS `s_categories_features` (
  `category_id` int(11) NOT NULL,
  `feature_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`feature_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `s_comments`
--

CREATE TABLE IF NOT EXISTS `s_comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` varchar(20) NOT NULL,
  `object_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `type` enum('product','blog') NOT NULL,
  `approved` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product_id` (`object_id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `s_coupons`
--

CREATE TABLE IF NOT EXISTS `s_coupons` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(256) NOT NULL,
  `expire` timestamp NULL DEFAULT NULL,
  `type` enum('absolute','percentage') NOT NULL DEFAULT 'absolute',
  `value` decimal(10,2) NOT NULL DEFAULT '0.00',
  `min_order_price` decimal(10,2) DEFAULT NULL,
  `single` int(1) NOT NULL DEFAULT '0',
  `usages` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `s_currencies`
--

CREATE TABLE IF NOT EXISTS `s_currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '0',
  `sign` varchar(20) NOT NULL,
  `code` char(3) NOT NULL DEFAULT '',
  `rate_from` decimal(10,2) NOT NULL DEFAULT '1.00',
  `rate_to` decimal(10,2) NOT NULL DEFAULT '1.00',
  `cents` int(1) NOT NULL DEFAULT '2',
  `position` int(11) NOT NULL,
  `enabled` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `position` (`position`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `s_currencies`
--

INSERT INTO `s_currencies` (`id`, `name`, `sign`, `code`, `rate_from`, `rate_to`, `cents`, `position`, `enabled`) VALUES
(1, 'Рубли', 'руб.', 'RUB', '1.00', '1.00', 2, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `s_delivery`
--

CREATE TABLE IF NOT EXISTS `s_delivery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `free_from` decimal(10,2) NOT NULL DEFAULT '0.00',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL,
  `separate_payment` int(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `position` (`position`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `s_delivery_payment`
--

CREATE TABLE IF NOT EXISTS `s_delivery_payment` (
  `delivery_id` int(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  PRIMARY KEY (`delivery_id`,`payment_method_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Связка способом оплаты и способов доставки';

-- --------------------------------------------------------

--
-- Структура таблицы `s_features`
--

CREATE TABLE IF NOT EXISTS `s_features` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `in_filter` tinyint(1) DEFAULT NULL,
  `yandex` int(1) NOT NULL DEFAULT '1',
  `auto_name_id` varchar(64) NOT NULL DEFAULT '',
  `auto_value_id` varchar(64) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `position` (`position`),
  KEY `in_filter` (`in_filter`),
  KEY `yandex` (`yandex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `s_feedbacks`
--

CREATE TABLE IF NOT EXISTS `s_feedbacks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `ip` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `s_groups`
--

CREATE TABLE IF NOT EXISTS `s_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `discount` decimal(5,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `s_images`
--

CREATE TABLE IF NOT EXISTS `s_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `filename` (`filename`),
  KEY `product_id` (`product_id`),
  KEY `position` (`position`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `s_labels`
--

CREATE TABLE IF NOT EXISTS `s_labels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `color` varchar(6) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `s_labels`
--

INSERT INTO `s_labels` (`id`, `name`, `color`, `position`) VALUES
(1, 'перезвонить', 'ff00ff', 4),
(2, 'ожидается товар', '00d5fa', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `s_languages`
--

CREATE TABLE IF NOT EXISTS `s_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `label` varchar(10) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `s_languages`
--

INSERT INTO `s_languages` (`id`, `name`, `label`, `is_default`, `enabled`, `position`) VALUES
(1, 'Русский', 'ru', 0, 1, 1),
(2, 'Английский', 'en', 0, 1, 2),
(3, 'Украинский', 'uk', 0, 0, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `s_lang_banners_images`
--

CREATE TABLE IF NOT EXISTS `s_lang_banners_images` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) NOT NULL,
  `banner_image_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alt` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`lang_id`,`banner_image_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `s_lang_blog`
--

CREATE TABLE IF NOT EXISTS `s_lang_blog` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `annotation` text NOT NULL,
  `text` text NOT NULL,
  UNIQUE KEY `lang_id` (`lang_id`,`blog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `s_lang_brands`
--

CREATE TABLE IF NOT EXISTS `s_lang_brands` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `annotation` text NOT NULL,
  `description` text NOT NULL,
  UNIQUE KEY `lang_id` (`lang_id`,`brand_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `s_lang_categories`
--

CREATE TABLE IF NOT EXISTS `s_lang_categories` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_h1` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `annotation` text NOT NULL,
  `description` text NOT NULL,
  `auto_meta_title` varchar(255) NOT NULL,
  `auto_meta_keywords` varchar(255) NOT NULL,
  `auto_meta_desc` varchar(255) NOT NULL,
  `auto_body` text NOT NULL,
  UNIQUE KEY `lang_id` (`lang_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `s_lang_currencies`
--

CREATE TABLE IF NOT EXISTS `s_lang_currencies` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sign` varchar(20) NOT NULL,
  UNIQUE KEY `lang_id` (`lang_id`,`currency_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `s_lang_currencies`
--

INSERT INTO `s_lang_currencies` (`lang_id`, `lang_label`, `currency_id`, `name`, `sign`) VALUES
(1, 'ru', 2, 'рубли', 'руб'),
(1, 'ru', 1, 'Рубли', 'руб.'),
(1, 'ru', 3, 'вебмани wmz', 'wmz'),
(2, 'en', 2, 'rubles', 'rub'),
(2, 'en', 1, 'Рубли', 'руб.'),
(2, 'en', 3, 'вебмани wmz en', 'wmz'),
(3, 'uk', 2, 'рубли uk', 'руб'),
(3, 'uk', 1, 'Рубли', 'руб.'),
(3, 'uk', 3, 'вебмани wmz uk', 'wmz');

-- --------------------------------------------------------

--
-- Структура таблицы `s_lang_delivery`
--

CREATE TABLE IF NOT EXISTS `s_lang_delivery` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) NOT NULL,
  `delivery_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  UNIQUE KEY `lang_id` (`lang_id`,`delivery_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `s_lang_features`
--

CREATE TABLE IF NOT EXISTS `s_lang_features` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) NOT NULL,
  `feature_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  UNIQUE KEY `lang_id` (`lang_id`,`feature_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `s_lang_pages`
--

CREATE TABLE IF NOT EXISTS `s_lang_pages` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) NOT NULL,
  `page_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `meta_title` varchar(500) NOT NULL,
  `meta_description` varchar(500) NOT NULL,
  `meta_keywords` varchar(500) NOT NULL,
  `body` longtext NOT NULL,
  `header` varchar(1024) NOT NULL,
  UNIQUE KEY `lang_id` (`lang_id`,`page_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `s_lang_pages`
--

INSERT INTO `s_lang_pages` (`lang_id`, `lang_label`, `page_id`, `name`, `meta_title`, `meta_description`, `meta_keywords`, `body`, `header`) VALUES
(1, 'ru', 3, 'Доставка', 'Доставка', 'Доставка', 'Доставка', '<h2>Курьерская доставка по&nbsp;Москве</h2><p>Курьерская доставка осуществляется на следующий день после оформления заказа<span style="margin-right: -0.2em;">,</span><span style="margin-left: 0.2em;"> </span>если товар есть в&nbsp;наличии. Курьерская доставка осуществляется в&nbsp;пределах Томска и&nbsp;Северска ежедневно с&nbsp;10.00 до&nbsp;21.00. Заказ на&nbsp;сумму свыше 300 рублей доставляется бесплатно. <br /><br />Стоимость бесплатной доставки раcсчитывается от&nbsp;суммы заказа с&nbsp;учтенной скидкой. В&nbsp;случае если сумма заказа после применения скидки менее 300р<span style="margin-right: -0.2em;">,</span><span style="margin-left: 0.2em;"> </span>осуществляется платная доставка. <br /><br />При сумме заказа менее 300 рублей стоимость доставки составляет от 50 рублей.</p><h2>Самовывоз</h2><p>Удобный<span style="margin-right: -0.2em;">,</span><span style="margin-left: 0.2em;"> </span>бесплатный и быстрый способ получения заказа.<br />Адрес офиса: Москва<span style="margin-right: -0.2em;">,</span><span style="margin-left: 0.2em;"> </span>ул. Арбат<span style="margin-right: -0.2em;">,</span><span style="margin-left: 0.2em;"> </span>1/3<span style="margin-right: -0.2em;">,</span><span style="margin-left: 0.2em;"> </span>офис 419.</p><h2>Доставка с&nbsp;помощью предприятия<span style="margin-right: 0.44em;"> </span><span style="margin-left: -0.44em;">&laquo;</span>Автотрейдинг&raquo;</h2><p>Удобный и быстрый способ доставки в крупные города России. Посылка доставляется в офис<span style="margin-right: 0.44em;"> </span><span style="margin-left: -0.44em;">&laquo;</span>Автотрейдинг&raquo; в&nbsp;Вашем городе. Для получения необходимо предъявить паспорт и&nbsp;номер грузовой декларации<span style="margin-right: 0.3em;"> </span><span style="margin-left: -0.3em;">(</span>сообщит наш менеджер после отправки). Посылку желательно получить в&nbsp;течение 24 часов с&nbsp;момента прихода груза<span style="margin-right: -0.2em;">,</span><span style="margin-left: 0.2em;"> </span>иначе компания<span style="margin-right: 0.44em;"> </span><span style="margin-left: -0.44em;">&laquo;</span>Автотрейдинг&raquo; может взыскать с Вас дополнительную оплату за хранение. Срок доставки и стоимость Вы можете рассчитать на сайте компании.</p><h2>Наложенным платежом</h2><p>При доставке заказа наложенным платежом с помощью<span style="margin-right: 0.44em;"> </span><span style="margin-left: -0.44em;">&laquo;</span>Почты России&raquo;, вы&nbsp;сможете оплатить заказ непосредственно в&nbsp;момент получения товаров.</p>', 'Способы доставки'),
(1, 'ru', 2, 'Оплата', 'Оплата', 'Оплата', 'Оплата', '<h2><span>Наличными курьеру</span></h2><p>Вы можете оплатить заказ курьеру в рублях непосредственно в момент доставки. Курьерская доставка осуществляется по Москве на следующий день после принятия заказа.</p><h2>Яндекс.Деньги</h2><p><span>Яндекс</span><span>.</span><span>Деньги</span><span>&nbsp;&mdash; доступный и безопасный способ платить за товары и услуги через интернет</span>.</p><h2>Банковская карта</h2><p><span>Оплата банковской картой Visa или MasterCard через систему Яндекс.Деньги.</span></p><h2>Через терминал</h2><p><span>Оплатите наличными через многочисленные терминалы в любом городе России. Можно заплатить и с банковской карты через многие банкоматы. Для этого найдите в меню терминала или банкомата логотип Яндекса и укажите код платежа.</span></p><h2>Со счета мобильного телефона</h2><p><span>Оплата со&nbsp;счета мобильного телефона&nbsp;через систему Яндекс.Деньги.</span></p><h2>Webmoney</h2><p>После оформления заказа вы сможете перейти на сайт webmoney для оплаты заказа, где сможете оплатить заказ в автоматическом режиме, а так же проверить наш сертификат продавца.</p><h2>Квитанция</h2><p><span>Вы можете распечатать квитанцию и оплатить её в любом отделении банка.</span></p><h2>Робокасса</h2><p><span>ROBOKASSA &ndash; сервис для организации приема платежей на сайте, интернет магазине и социальных сетях. Прием платежей осуществляется при минимальных комиссиях.</span></p><h2>PayPal</h2><p><span>Совершайте покупки безопасно, без раскрытия информации о своей кредитной карте. PayPal защитит вас, если возникнут проблемы с покупкой.</span></p><h2>Оплата через Интеркассу</h2><p><span>Это удобный в использовании сервис, подключение к которому позволит Интернет-магазинам, веб-сайтам и прочим торговым площадкам принимать все возможные формы оплаты в максимально короткие сроки.</span></p><h2>Оплата картой через Liqpay.com</h2><p><span>Благодаря своей открытости и универсальности LiqPAY стремительно интегрируется со многими платежными системами и платформами и становится стандартом платежных операций.</span></p><h2>Оплата через Pay2Pay</h2><p><span>Универсальный платежный сервис Pay2Pay призван облегчить и максимально упростить процесс приема электронных платежей на Вашем сайте. Мы открыты для всего нового и сверхсовременного.</span></p><h2>Оплатить через QIWI</h2><p><span>QIWI &mdash; удобный сервис для оплаты повседневных услуг.</span></p><h2><span style="font-size: 20px;">Наличными в офисе Автолюкса</span></h2><p>При доставке заказа системой Автолюкс, вы сможете оплатить заказ в их офисе непосредственно в момент получения товаров.</p>', 'Способы оплаты'),
(1, 'ru', 1, 'Главная', 'Хиты продаж', 'Этот магазин является демонстрацией скрипта интернет-магазина  Okay . Все материалы на этом сайте присутствуют исключительно в демострационных целях.', 'Хиты продаж', '<p>Этот магазин является демонстрацией скрипта интернет-магазина <a href="http://okay-cms.com">Okay</a>. Все материалы на этом сайте присутствуют исключительно в демострационных целях.</p>', 'О магазине'),
(1, 'ru', 4, 'Блог', 'Блог', '', 'Блог', '', 'Блог'),
(1, 'ru', 5, '', 'Страница не найдена', 'Страница не найдена', 'Страница не найдена', '<p>Страница не найдена</p>', 'Страница не найдена'),
(1, 'ru', 6, 'Контакты', 'Контакты', 'Контакты', 'Контакты', '<p>Москва, ул. Космонавта Волкова 14.</p>\r\n\r\n<p><a href="https://maps.yandex.ua/213/moscow/?um=vCDuUwJDQl85sAd1Lkm9gIjgoKMho6oE&amp;ll=37.645371%2C55.735740&amp;spn=0.010085%2C0.003845&amp;z=13&amp;l=map&amp;ncrnd=909&amp;text=%D0%9C%D0%BE%D1%81%D0%BA%D0%B2%D0%B0%2C%20%D1%83%D0%BB.%20%D0%90%D1%80%D0%B1%D0%B0%D1%82%D0%B5%D1%86%D0%BA%D0%B0%D1%8F%2C%20%20%D0%B4%D0%BE%D0%BC%202c3.&amp;sll=37.632916%2C55.729438&amp;sspn=0.163422%2C0.049113&amp;ol=geo&amp;ouri=ymapsbm1%3A%2F%2Fgeo%3Fll%3D37.661%252C55.727%26spn%3D0.001%252C0.001%26text%3D%25D0%25A0%25D0%25BE%25D1%2581%25D1%2581%25D0%25B8%25D1%258F%252C%2520%25D0%259C%25D0%25BE%25D1%2581%25D0%25BA%25D0%25B2%25D0%25B0%252C%2520%25D0%2590%25D1%2580%25D0%25B1%25D0%25B0%25D1%2582%25D0%25B5%25D1%2586%25D0%25BA%25D0%25B0%25D1%258F%2520%25D1%2583%25D0%25BB%25D0%25B8%25D1%2586%25D0%25B0%252C%25202%25D1%25813">Посмотреть на&nbsp;Яндекс.Картах</a></p>\r\n\r\n<p>Телефон 777-15-51</p>\r\n', 'Контакты'),
(1, 'ru', 7, 'Все товары', 'Все товары', '', 'Все товары', '', 'Все товары'),
(2, 'en', 3, 'Delivery', 'Delivery', 'Delivery', 'Delivery', '<h2>Shipping within Moscow</h2><p><span class="translation-chunk" data-align="0:34">Courier delivery is made</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="35:52">the next day</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="53:76">after ordering</span><span class="translation-chunk">, </span><span class="translation-chunk" data-align="78:103">if the item is in stock</span><span class="translation-chunk">. </span><span class="translation-chunk" data-align="105:139">Courier delivery is made</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="140:157">within the Tomsk</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="158:168">and Seversk</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="169:180">daily from</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="181:189">10.00 to</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="190:195">21.00</span><span class="translation-chunk">. </span><span class="translation-chunk" data-align="197:211">For orders</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="212:221">more than 300</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="222:251">rubles delivered free of charge</span><span class="translation-chunk">.</span><br /><br /><span class="translation-chunk" data-align="0:9">Cost</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="10:44">free delivery is calculated</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="45:47">from</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="48:60">the total order</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="61:62">with</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="72:79">the discount</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="63:71">taken into account</span><span class="translation-chunk">. </span><span class="translation-chunk" data-align="81:107">If the order amount</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="108:131">after applying the discount</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="132:137">less than</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="138:142">300 r</span><span class="translation-chunk">, </span><span class="translation-chunk" data-align="144:158">is</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="159:175">a paid service</span><span class="translation-chunk">.</span></p><p><span class="translation-chunk" data-align="0:11">For orders</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="12:21">less than 300</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="22:28">rubles</span><span class="translation-chunk">, </span><span class="translation-chunk" data-align="30:59">the <span>delivery </span>cost is</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="60:69">50 rubles</span><span class="translation-chunk">.</span></p><h2>Store pickup</h2><p><span class="translation-chunk" data-align="0:7">Convenient</span><span class="translation-chunk"></span><span class="translation-chunk" data-align="7:19">, free</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="20:21">and</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="22:54">fast way of receiving your order.</span><span class="translation-chunk"> </span></p><p><span class="translation-chunk"></span><span class="translation-chunk" data-align="55:67">Office address:</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="68:75">Moscow,</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="80:85">Arbat</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="76:79">str.</span><span class="translation-chunk"></span><span class="translation-chunk" data-align="85:90">, 1/3</span><span class="translation-chunk"></span><span class="translation-chunk" data-align="90:96">, office</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="97:100">419</span><span class="translation-chunk">.</span></p><h2><span class="translation-chunk" data-align="19:32">"</span><span class="translation-chunk"></span><span class="translation-chunk" data-align="32:45">Autotrading" delivery</span></h2><p><span class="translation-chunk" data-align="0:24">A convenient and fast way</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="25:33">of delivery</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="34:43">in large</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="44:57">cities of Russia</span><span class="translation-chunk">. </span><span class="translation-chunk" data-align="59:79">Parcel is delivered</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="80:86">to the office</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="87:101">"autotrading"</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="102:117">in Your city.</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="118:131">To receive</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="132:161">you must present your passport</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="162:163">and</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="164:189">number of the cargo declaration</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="190:198">(</span><span class="translation-chunk" data-align="199:211">our manager will inform You</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="212:226">after sending</span><span class="translation-chunk">). </span><span class="translation-chunk" data-align="229:236">The parcel</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="237:256">it is advisable to get</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="257:258">in</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="259:269">within 24</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="270:285">hours after</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="286:299">arrival of the goods</span><span class="translation-chunk"></span><span class="translation-chunk" data-align="299:315">, or the company</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="316:330">"Autotrading"</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="331:351">may charge You an</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="352:373">additional fee</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="374:386">for storage.</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="387:400">The delivery time</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="401:402">and</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="403:412">the cost</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="413:433">You can calculate</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="434:451">on the company''s website</span><span class="translation-chunk">.</span></p><h2>C.O.D (Cash On Delivery)</h2><p><span class="translation-chunk" data-align="0:19">On delivery order</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="20:39">cash on delivery</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="40:49">through</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="50:63">"mail of Russia</span><span class="translation-chunk">", </span><span class="translation-chunk" data-align="66:76">you will be able</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="77:91">to pay for the order</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="92:116">at the time</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="117:134">goods are received</span><span class="translation-chunk">.</span></p>', 'Delivery'),
(2, 'en', 2, 'Payment', 'Payment', 'Payment', 'Payment', '<h2>Cash</h2><p><span class="translation-chunk" data-align="0:2">You</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="3:24">can pay</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="25:32">the courier</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="42:57">directly</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="33:41">in rubles</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="58:75">at the time of delivery</span><span class="translation-chunk">. </span><span class="translation-chunk" data-align="77:111">The Express delivery</span><span class="translation-chunk">&nbsp;within</span><span class="translation-chunk" data-align="112:121">&nbsp;Moscow</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="122:139">next day</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="140:145">after</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="146:161">order acceptance</span><span class="translation-chunk">.</span></p><h2>Yandex.Money</h2><p><span class="translation-chunk" data-align="0:7">Yandex.</span><span class="translation-chunk"></span><span class="translation-chunk" data-align="7:15">Money &mdash;</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="16:45">affordable and secure way</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="46:63">to pay for goods</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="64:88">and services via the Internet.</span></p><h2>Bank&nbsp;<span>account</span></h2><p><span class="translation-chunk" data-align="0:24">Pay with your credit card</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="25:44">Visa or MasterCard</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="45:65">via Yandex</span><span class="translation-chunk">.</span><span class="translation-chunk" data-align="66:72">Money</span><span class="translation-chunk">.</span></p><h2><span>Terminal</span></h2><p><span class="translation-chunk" data-align="0:8">Pay</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="9:18">by cash</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="19:51">through numerous of terminals in</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="52:71">any city of Russia</span><span class="translation-chunk">. </span><span class="translation-chunk" data-align="73:90">You can pay</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="91:115">with a credit card through</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="116:122">many</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="123:132">ATMs</span><span class="translation-chunk">. </span><span class="translation-chunk" data-align="134:151">To do this, find&nbsp;<span>Yandex logo in the menu of</span></span><span class="translation-chunk" data-align="159:168">&nbsp;terminal</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="169:172">or</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="173:198">ATM, </span><span class="translation-chunk" data-align="199:208">and enter&nbsp;</span><span class="translation-chunk" data-align="209:220">the payment code</span><span class="translation-chunk">.</span></p><h2><span>Phone bill</span></h2><p><span class="translation-chunk" data-align="0:6">Payment</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="7:9">with</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="10:35">mobile phone account</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="36:56">via Yandex</span><span class="translation-chunk">.</span><span class="translation-chunk" data-align="57:63">Money</span><span class="translation-chunk">.</span></p><h2>Webmoney</h2><p><span class="translation-chunk" data-align="0:23">After ordering,</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="24:42">you can go</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="43:50">to the </span><span class="translation-chunk" data-align="51:59">webmoney&nbsp;<span class="translation-chunk" data-align="43:50">website</span></span><span class="translation-chunk">&nbsp;</span><span class="translation-chunk" data-align="60:77">for payment</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="77:105">where you can pay for your order</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="106:129">in automatic mode</span><span class="translation-chunk"></span><span class="translation-chunk" data-align="129:139">, as well as</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="140:164">to verify our <span>seller''s&nbsp;</span>certificate</span><span class="translation-chunk" data-align="165:173">&nbsp;</span><span class="translation-chunk">.</span></p><h2><span>Receipt</span></h2><p>You can print a receipt and pay it at any Bank.</p><h2>Robokassa</h2><p><span>ROBOKASSA &ndash;&nbsp;<span class="translation-chunk" data-align="0:22">the service for</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="23:38">accepting payments</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="39:47">on the website</span><span class="translation-chunk">, </span><span class="translation-chunk" data-align="49:68">online store and</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="69:86">social networks.</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="87:116">Payments are accepted</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="117:143">with minimal commissions.</span></span></p><p><span><span class="translation-chunk" data-align="117:143"></span></span><span style="font-size: 20px;">PayPal</span></p><p><span class="translation-chunk" data-align="0:18">Make purchases</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="19:28">safely</span><span class="translation-chunk">, </span><span class="translation-chunk" data-align="30:54">without disclosing information</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="55:78">about your credit card</span><span class="translation-chunk">. </span><span class="translation-chunk" data-align="80:86">PayPal</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="87:94">will protect</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="95:104">you if</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="105:123">problems occur</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="124:135">with purchase.</span></p><h2><span>Payment via Interkassa</span></h2><p><span class="translation-chunk" data-align="0:3">This</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="4:27">easy to use</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="28:34">service</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="34:58">that you connect t,</span><span class="translation-chunk">&nbsp;</span><span class="translation-chunk" data-align="59:77">will allow online</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="77:87">shopping</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="88:98">websites</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="99:126">and other trading platforms</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="127:150">to take all possible</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="151:163">forms of payment</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="164:165">in</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="166:193">maximum short terms.</span></p><h2><span class="translation-chunk" data-align="0:13">Card payment</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="14:19">via&nbsp;</span>Liqpay.com</h2><p><span class="translation-chunk" data-align="0:15">Due to its</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="16:26">openness</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="27:44">and universality</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="45:51">LiqPAY</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="52:64">rapidly</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="65:78">integrates</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="79:89">with many</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="90:126">payment systems and platforms and</span><span class="translation-chunk" data-align="127:148">&nbsp;becomes the standard</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="149:168">payment transactions.</span></p><h2><span>Payment via</span><span style="font-size: 20px;">&nbsp;Pay2Pay</span></h2><p><span class="translation-chunk" data-align="0:23">Universal payment</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="24:30">service</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="31:38">Pay2Pay</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="39:56">is intended to facilitate</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="57:80">and simplify</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="81:88">the process</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="89:119">of electronic payment acceptance on</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="120:131">Your website</span><span class="translation-chunk">. </span><span class="translation-chunk" data-align="133:143">We are open</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="144:160">to everything new</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="161:162">and</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="163:180">modern</span><span class="translation-chunk">.</span></p><h2><span>Payment via</span><span style="font-size: 20px;">&nbsp;QIWI</span></h2><p><span>QIWI &mdash;&nbsp;<span class="translation-chunk" data-align="0:14">convenient service</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="15:25">to pay for</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="26:44">everyday services</span><span class="translation-chunk">.</span></span></p><h2><span style="font-size: 20px;">Cash at autolux office</span></h2><p><span class="translation-chunk" data-align="0:19">Upon delivery of</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="20:28">the system</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="29:37">Autolux</span><span class="translation-chunk">, </span><span class="translation-chunk" data-align="39:49">you will be able</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="50:64">to pay for the order</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="65:75">in their office</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="76:91">immediately</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="92:110">upon receipt</span><span class="translation-chunk"> </span><span class="translation-chunk" data-align="111:118">of goods</span><span class="translation-chunk">.</span></p>', 'Payment'),
(2, 'en', 1, 'Home', 'Bestsellers', 'This store is a demonstration of the script online store Okay . All materials on this site are present only in demostratsionnyh purposes.', 'Bestsellers', '<p>This store is a demonstration of the script online store Okay . All materials on this site are present only in demostratsionnyh purposes.</p>', 'About us'),
(2, 'en', 4, 'Blog', 'Blog', '', 'Blog', '', 'Blog'),
(2, 'en', 5, 'Page not found', 'Page not found', 'Page not found', 'Page not found', '<p>Page not found</p>', 'Page not found'),
(2, 'en', 6, 'Contacts', 'Contacts', 'Contacts', 'Contacts', '<p>Moscow, Kosmonavt Volkov street, house 14.</p>\r\n\r\n<p><a href="https://maps.yandex.ua/213/moscow/?um=vCDuUwJDQl85sAd1Lkm9gIjgoKMho6oE&amp;ll=37.645371%2C55.735740&amp;spn=0.010085%2C0.003845&amp;z=13&amp;l=map&amp;ncrnd=909&amp;text=%D0%9C%D0%BE%D1%81%D0%BA%D0%B2%D0%B0%2C%20%D1%83%D0%BB.%20%D0%90%D1%80%D0%B1%D0%B0%D1%82%D0%B5%D1%86%D0%BA%D0%B0%D1%8F%2C%20%20%D0%B4%D0%BE%D0%BC%202c3.&amp;sll=37.632916%2C55.729438&amp;sspn=0.163422%2C0.049113&amp;ol=geo&amp;ouri=ymapsbm1%3A%2F%2Fgeo%3Fll%3D37.661%252C55.727%26spn%3D0.001%252C0.001%26text%3D%25D0%25A0%25D0%25BE%25D1%2581%25D1%2581%25D0%25B8%25D1%258F%252C%2520%25D0%259C%25D0%25BE%25D1%2581%25D0%25BA%25D0%25B2%25D0%25B0%252C%2520%25D0%2590%25D1%2580%25D0%25B1%25D0%25B0%25D1%2582%25D0%25B5%25D1%2586%25D0%25BA%25D0%25B0%25D1%258F%2520%25D1%2583%25D0%25BB%25D0%25B8%25D1%2586%25D0%25B0%252C%25202%25D1%25813">View on Yandex.Maps</a></p>\r\n\r\n<p>Phone 777-15-51</p>\r\n', 'Contacts'),
(2, 'en', 7, 'All goods', 'All goods', '', 'All goods', '', 'All goods'),
(3, 'uk', 3, 'Доставка', 'Доставка', 'Доставка', 'Доставка', '<h2>Курьерская доставка по&nbsp;Москве</h2><p>Курьерская доставка осуществляется на следующий день после оформления заказа<span style="margin-right: -0.2em;">,</span><span style="margin-left: 0.2em;"> </span>если товар есть в&nbsp;наличии. Курьерская доставка осуществляется в&nbsp;пределах Томска и&nbsp;Северска ежедневно с&nbsp;10.00 до&nbsp;21.00. Заказ на&nbsp;сумму свыше 300 рублей доставляется бесплатно. <br /><br />Стоимость бесплатной доставки раcсчитывается от&nbsp;суммы заказа с&nbsp;учтенной скидкой. В&nbsp;случае если сумма заказа после применения скидки менее 300р<span style="margin-right: -0.2em;">,</span><span style="margin-left: 0.2em;"> </span>осуществляется платная доставка. <br /><br />При сумме заказа менее 300 рублей стоимость доставки составляет от 50 рублей.</p><h2>Самовывоз</h2><p>Удобный<span style="margin-right: -0.2em;">,</span><span style="margin-left: 0.2em;"> </span>бесплатный и быстрый способ получения заказа.<br />Адрес офиса: Москва<span style="margin-right: -0.2em;">,</span><span style="margin-left: 0.2em;"> </span>ул. Арбат<span style="margin-right: -0.2em;">,</span><span style="margin-left: 0.2em;"> </span>1/3<span style="margin-right: -0.2em;">,</span><span style="margin-left: 0.2em;"> </span>офис 419.</p><h2>Доставка с&nbsp;помощью предприятия<span style="margin-right: 0.44em;"> </span><span style="margin-left: -0.44em;">&laquo;</span>Автотрейдинг&raquo;</h2><p>Удобный и быстрый способ доставки в крупные города России. Посылка доставляется в офис<span style="margin-right: 0.44em;"> </span><span style="margin-left: -0.44em;">&laquo;</span>Автотрейдинг&raquo; в&nbsp;Вашем городе. Для получения необходимо предъявить паспорт и&nbsp;номер грузовой декларации<span style="margin-right: 0.3em;"> </span><span style="margin-left: -0.3em;">(</span>сообщит наш менеджер после отправки). Посылку желательно получить в&nbsp;течение 24 часов с&nbsp;момента прихода груза<span style="margin-right: -0.2em;">,</span><span style="margin-left: 0.2em;"> </span>иначе компания<span style="margin-right: 0.44em;"> </span><span style="margin-left: -0.44em;">&laquo;</span>Автотрейдинг&raquo; может взыскать с Вас дополнительную оплату за хранение. Срок доставки и стоимость Вы можете рассчитать на сайте компании.</p><h2>Наложенным платежом</h2><p>При доставке заказа наложенным платежом с помощью<span style="margin-right: 0.44em;"> </span><span style="margin-left: -0.44em;">&laquo;</span>Почты России&raquo;, вы&nbsp;сможете оплатить заказ непосредственно в&nbsp;момент получения товаров.</p>', 'Способы доставки'),
(3, 'uk', 2, 'Оплата', 'Оплата', 'Оплата', 'Оплата', '<h2><span>Наличными курьеру</span></h2><p>Вы можете оплатить заказ курьеру в гривнах непосредственно в момент доставки. Курьерская доставка осуществляется по Москве на следующий день после принятия заказа.</p><h2>Яндекс.Деньги</h2><p><span>Яндекс</span><span>.</span><span>Деньги</span><span>&nbsp;&mdash; доступный и безопасный способ платить за товары и услуги через интернет</span>.</p><h2>Банковская карта</h2><p><span>Оплата банковской картой Visa или MasterCard через систему Яндекс.Деньги.</span></p><h2>Через терминал</h2><p><span>Оплатита наличными через многочисленные терминалы в любом городе России. Можно заплатить и с банковской карты через многие банкоматы. Для этого найдите в меню терминала или банкомата логотип Яндекса и укажите код платежа.</span></p><h2>Со счета мобильного телефона</h2><p><span>Оплата со&nbsp;счета мобильного телефона&nbsp;через систему Яндекс.Деньги.</span></p><h2>Webmoney</h2><p>После оформления заказа вы сможете перейти на сайт webmoney для оплаты заказа, где сможете оплатить заказ в автоматическом режиме, а так же проверить наш сертификат продавца.</p><h2>Квитанция</h2><p><span>Вы можете распечатать квитанцию и оплатить её в любом отделении банка.</span></p><h2>Робокасса</h2><p><span>ROBOKASSA &ndash; сервис для организации приема платежей на сайте, интернет магазине и социальных сетях. Прием платежей осуществляется при минимальных комиссиях.</span></p><h2>PayPal</h2><p><span>Совершайте покупки безопасно, без раскрытия информации о своей кредитной карте. PayPal защитит вас, если возникнут проблемы с покупкой.</span></p><h2>Оплата через Интеркассу</h2><p><span>Это удобный в использовании сервис, подключение к которому позволит Интернет-магазинам, веб-сайтам и прочим торговым площадкам принимать все возможные формы оплаты в максимально короткие сроки.</span></p><h2>Оплата картой через Liqpay.com</h2><p><span>Благодаря своей открытости и универсальности LiqPAY стремительно интегрируется со многими платежными системами и платформами и становится стандартом платежных операций.</span></p><h2>Оплата через Pay2Pay</h2><p><span>Универсальный платежный сервис Pay2Pay призван облегчить и максимально упростить процесс приема электронных платежей на Вашем сайте. Мы открыты для всего нового и сверхсовременного.</span></p><h2>Оплатить через QIWI</h2><p><span>QIWI &mdash; удобный сервис для оплаты повседневных услуг.</span></p><h2><span style="font-size: 20px;">Наличными в офисе Автолюкса</span></h2><p>При доставке заказа системой Автолюкс, вы сможете оплатить заказ в их офисе непосредственно в момент получения товаров.</p>', 'Способы оплаты'),
(3, 'uk', 1, 'Главная', 'Хиты продаж', 'Этот магазин является демонстрацией скрипта интернет-магазина  Okay . Все материалы на этом сайте присутствуют исключительно в демострационных целях.', 'Хиты продаж', '<p>Этот магазин является демонстрацией скрипта интернет-магазина <a href="http://okay-cms.com">Okay</a>. Все материалы на этом сайте присутствуют исключительно в демострационных целях.</p>', 'О магазине uk'),
(3, 'uk', 4, 'Блог', 'Блог', '', 'Блог', '', 'Блог'),
(3, 'uk', 5, '', 'Страница не найдена', 'Страница не найдена', 'Страница не найдена', '<p>Страница не найдена</p>', 'Страница не найдена'),
(3, 'uk', 6, 'Контакты', 'Контакты', 'Контакты', 'Контакты', '<p>Москва, ул. Космонавта Волкова 14.</p>\r\n\r\n<p><a href="https://maps.yandex.ua/213/moscow/?um=vCDuUwJDQl85sAd1Lkm9gIjgoKMho6oE&amp;ll=37.645371%2C55.735740&amp;spn=0.010085%2C0.003845&amp;z=13&amp;l=map&amp;ncrnd=909&amp;text=%D0%9C%D0%BE%D1%81%D0%BA%D0%B2%D0%B0%2C%20%D1%83%D0%BB.%20%D0%90%D1%80%D0%B1%D0%B0%D1%82%D0%B5%D1%86%D0%BA%D0%B0%D1%8F%2C%20%20%D0%B4%D0%BE%D0%BC%202c3.&amp;sll=37.632916%2C55.729438&amp;sspn=0.163422%2C0.049113&amp;ol=geo&amp;ouri=ymapsbm1%3A%2F%2Fgeo%3Fll%3D37.661%252C55.727%26spn%3D0.001%252C0.001%26text%3D%25D0%25A0%25D0%25BE%25D1%2581%25D1%2581%25D0%25B8%25D1%258F%252C%2520%25D0%259C%25D0%25BE%25D1%2581%25D0%25BA%25D0%25B2%25D0%25B0%252C%2520%25D0%2590%25D1%2580%25D0%25B1%25D0%25B0%25D1%2582%25D0%25B5%25D1%2586%25D0%25BA%25D0%25B0%25D1%258F%2520%25D1%2583%25D0%25BB%25D0%25B8%25D1%2586%25D0%25B0%252C%25202%25D1%25813">Посмотреть на&nbsp;Яндекс.Картах</a></p>\r\n\r\n<p>Телефон 777-15-51</p>\r\n', 'Контакты'),
(3, 'uk', 7, 'Все товары', 'Все товары', '', 'Все товары', '', 'Все товары'),
(1, '', 8, 'Бренды', 'Бренды', '', 'Бренды', '', 'Бренды'),
(2, '', 8, 'Brands', 'Brands', '', 'Brands', '', 'Brands'),
(3, '', 8, 'Бренды', 'Бренды', '', 'Бренды', '', 'Бренды');

-- --------------------------------------------------------

--
-- Структура таблицы `s_lang_payment_methods`
--

CREATE TABLE IF NOT EXISTS `s_lang_payment_methods` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  UNIQUE KEY `lang_id` (`lang_id`,`payment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `s_lang_products`
--

CREATE TABLE IF NOT EXISTS `s_lang_products` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `annotation` text NOT NULL,
  `body` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `special` varchar(255) DEFAULT NULL,
  UNIQUE KEY `lang_id` (`lang_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `s_lang_variants`
--

CREATE TABLE IF NOT EXISTS `s_lang_variants` (
  `lang_id` int(11) NOT NULL,
  `lang_label` varchar(4) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  UNIQUE KEY `lang_id` (`lang_id`,`variant_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `s_managers`
--

CREATE TABLE IF NOT EXISTS `s_managers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `permissions` varchar(1024) DEFAULT NULL,
  `cnt_try` tinyint(4) NOT NULL DEFAULT '0',
  `last_try` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `login` (`login`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `s_managers`
--

INSERT INTO `s_managers` (`id`, `login`, `password`, `permissions`, `cnt_try`, `last_try`) VALUES
(1, 'adm', '$apr1$zidxosq2$4.ycsVajUtX4S1rszdt7M1', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `s_menu`
--

CREATE TABLE IF NOT EXISTS `s_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `s_menu`
--

INSERT INTO `s_menu` (`id`, `name`, `position`) VALUES
(1, 'Основное меню', 1),
(2, 'Другие страницы', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `s_options`
--

CREATE TABLE IF NOT EXISTS `s_options` (
  `product_id` int(11) NOT NULL,
  `feature_id` int(11) NOT NULL,
  `lang_id` int(11) NOT NULL DEFAULT '0',
  `value` varchar(1024) NOT NULL,
  `translit` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`lang_id`,`product_id`,`feature_id`),
  KEY `value` (`value`(333)),
  KEY `product_id` (`product_id`),
  KEY `feature_id` (`feature_id`),
  KEY `lang_id` (`lang_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `s_orders`
--

CREATE TABLE IF NOT EXISTS `s_orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `delivery_id` int(11) DEFAULT NULL,
  `delivery_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payment_method_id` int(11) DEFAULT NULL,
  `paid` int(1) NOT NULL DEFAULT '0',
  `payment_date` datetime NOT NULL,
  `closed` tinyint(1) NOT NULL,
  `date` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL,
  `comment` varchar(1024) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) DEFAULT NULL,
  `payment_details` text NOT NULL,
  `ip` varchar(15) NOT NULL,
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `note` varchar(1024) NOT NULL,
  `discount` decimal(5,2) NOT NULL DEFAULT '0.00',
  `coupon_discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `coupon_code` varchar(255) NOT NULL,
  `separate_delivery` int(1) NOT NULL DEFAULT '0',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lang_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `login` (`user_id`),
  KEY `written_off` (`closed`),
  KEY `date` (`date`),
  KEY `status` (`status`),
  KEY `code` (`url`),
  KEY `payment_status` (`paid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `s_orders_labels`
--

CREATE TABLE IF NOT EXISTS `s_orders_labels` (
  `order_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`,`label_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `s_pages`
--

CREATE TABLE IF NOT EXISTS `s_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `meta_title` varchar(500) NOT NULL,
  `meta_description` varchar(500) NOT NULL,
  `meta_keywords` varchar(500) NOT NULL,
  `body` longtext NOT NULL,
  `menu_id` int(11) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `header` varchar(1024) NOT NULL,
  `last_modify` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `order_num` (`position`),
  KEY `url` (`url`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `s_pages`
--

INSERT INTO `s_pages` (`id`, `url`, `name`, `meta_title`, `meta_description`, `meta_keywords`, `body`, `menu_id`, `position`, `visible`, `header`, `last_modify`) VALUES
(3, 'dostavka', 'Доставка', 'Доставка', 'Доставка', 'Доставка', '<h2>Курьерская доставка по&nbsp;Москве</h2><p>Курьерская доставка осуществляется на следующий день после оформления заказа<span style="margin-right: -0.2em;">,</span><span style="margin-left: 0.2em;"> </span>если товар есть в&nbsp;наличии. Курьерская доставка осуществляется в&nbsp;пределах Томска и&nbsp;Северска ежедневно с&nbsp;10.00 до&nbsp;21.00. Заказ на&nbsp;сумму свыше 300 рублей доставляется бесплатно. <br /><br />Стоимость бесплатной доставки раcсчитывается от&nbsp;суммы заказа с&nbsp;учтенной скидкой. В&nbsp;случае если сумма заказа после применения скидки менее 300р<span style="margin-right: -0.2em;">,</span><span style="margin-left: 0.2em;"> </span>осуществляется платная доставка. <br /><br />При сумме заказа менее 300 рублей стоимость доставки составляет от 50 рублей.</p><h2>Самовывоз</h2><p>Удобный<span style="margin-right: -0.2em;">,</span><span style="margin-left: 0.2em;"> </span>бесплатный и быстрый способ получения заказа.<br />Адрес офиса: Москва<span style="margin-right: -0.2em;">,</span><span style="margin-left: 0.2em;"> </span>ул. Арбат<span style="margin-right: -0.2em;">,</span><span style="margin-left: 0.2em;"> </span>1/3<span style="margin-right: -0.2em;">,</span><span style="margin-left: 0.2em;"> </span>офис 419.</p><h2>Доставка с&nbsp;помощью предприятия<span style="margin-right: 0.44em;"> </span><span style="margin-left: -0.44em;">&laquo;</span>Автотрейдинг&raquo;</h2><p>Удобный и быстрый способ доставки в крупные города России. Посылка доставляется в офис<span style="margin-right: 0.44em;"> </span><span style="margin-left: -0.44em;">&laquo;</span>Автотрейдинг&raquo; в&nbsp;Вашем городе. Для получения необходимо предъявить паспорт и&nbsp;номер грузовой декларации<span style="margin-right: 0.3em;"> </span><span style="margin-left: -0.3em;">(</span>сообщит наш менеджер после отправки). Посылку желательно получить в&nbsp;течение 24 часов с&nbsp;момента прихода груза<span style="margin-right: -0.2em;">,</span><span style="margin-left: 0.2em;"> </span>иначе компания<span style="margin-right: 0.44em;"> </span><span style="margin-left: -0.44em;">&laquo;</span>Автотрейдинг&raquo; может взыскать с Вас дополнительную оплату за хранение. Срок доставки и стоимость Вы можете рассчитать на сайте компании.</p><h2>Наложенным платежом</h2><p>При доставке заказа наложенным платежом с помощью<span style="margin-right: 0.44em;"> </span><span style="margin-left: -0.44em;">&laquo;</span>Почты России&raquo;, вы&nbsp;сможете оплатить заказ непосредственно в&nbsp;момент получения товаров.</p>', 1, 3, 1, 'Способы доставки', '2016-03-24 13:26:25'),
(2, 'oplata', 'Оплата', 'Оплата', 'Оплата', 'Оплата', '<h2><span>Наличными курьеру</span></h2><p>Вы можете оплатить заказ курьеру в рублях непосредственно в момент доставки. Курьерская доставка осуществляется по Москве на следующий день после принятия заказа.</p><h2>Яндекс.Деньги</h2><p><span>Яндекс</span><span>.</span><span>Деньги</span><span>&nbsp;&mdash; доступный и безопасный способ платить за товары и услуги через интернет</span>.</p><h2>Банковская карта</h2><p><span>Оплата банковской картой Visa или MasterCard через систему Яндекс.Деньги.</span></p><h2>Через терминал</h2><p><span>Оплатите наличными через многочисленные терминалы в любом городе России. Можно заплатить и с банковской карты через многие банкоматы. Для этого найдите в меню терминала или банкомата логотип Яндекса и укажите код платежа.</span></p><h2>Со счета мобильного телефона</h2><p><span>Оплата со&nbsp;счета мобильного телефона&nbsp;через систему Яндекс.Деньги.</span></p><h2>Webmoney</h2><p>После оформления заказа вы сможете перейти на сайт webmoney для оплаты заказа, где сможете оплатить заказ в автоматическом режиме, а так же проверить наш сертификат продавца.</p><h2>Квитанция</h2><p><span>Вы можете распечатать квитанцию и оплатить её в любом отделении банка.</span></p><h2>Робокасса</h2><p><span>ROBOKASSA &ndash; сервис для организации приема платежей на сайте, интернет магазине и социальных сетях. Прием платежей осуществляется при минимальных комиссиях.</span></p><h2>PayPal</h2><p><span>Совершайте покупки безопасно, без раскрытия информации о своей кредитной карте. PayPal защитит вас, если возникнут проблемы с покупкой.</span></p><h2>Оплата через Интеркассу</h2><p><span>Это удобный в использовании сервис, подключение к которому позволит Интернет-магазинам, веб-сайтам и прочим торговым площадкам принимать все возможные формы оплаты в максимально короткие сроки.</span></p><h2>Оплата картой через Liqpay.com</h2><p><span>Благодаря своей открытости и универсальности LiqPAY стремительно интегрируется со многими платежными системами и платформами и становится стандартом платежных операций.</span></p><h2>Оплата через Pay2Pay</h2><p><span>Универсальный платежный сервис Pay2Pay призван облегчить и максимально упростить процесс приема электронных платежей на Вашем сайте. Мы открыты для всего нового и сверхсовременного.</span></p><h2>Оплатить через QIWI</h2><p><span>QIWI &mdash; удобный сервис для оплаты повседневных услуг.</span></p><h2><span style="font-size: 20px;">Наличными в офисе Автолюкса</span></h2><p>При доставке заказа системой Автолюкс, вы сможете оплатить заказ в их офисе непосредственно в момент получения товаров.</p>', 1, 4, 1, 'Способы оплаты', '2016-03-24 13:26:25'),
(1, '', 'Главная', 'Хиты продаж', 'Этот магазин является демонстрацией скрипта интернет-магазина  Okay . Все материалы на этом сайте присутствуют исключительно в демострационных целях.', 'Хиты продаж', '<p>Этот магазин является демонстрацией скрипта интернет-магазина <a href="http://okay-cms.com">Okay</a>. Все материалы на этом сайте присутствуют исключительно в демострационных целях.</p>', 1, 1, 1, 'О магазине', '2016-03-24 13:26:25'),
(4, 'blog', 'Блог', 'Блог', '', 'Блог', '', 1, 2, 1, 'Блог', '2016-03-24 13:26:25'),
(5, '404', '', 'Страница не найдена', 'Страница не найдена', 'Страница не найдена', '<p>Страница не найдена</p>', 2, 5, 1, 'Страница не найдена', '2015-11-16 04:29:43'),
(6, 'contact', 'Контакты', 'Контакты', 'Контакты', 'Контакты', '<p>Москва, ул. Космонавта Волкова 14.</p>\r\n\r\n<p><a href="https://maps.yandex.ua/213/moscow/?um=vCDuUwJDQl85sAd1Lkm9gIjgoKMho6oE&amp;ll=37.645371%2C55.735740&amp;spn=0.010085%2C0.003845&amp;z=13&amp;l=map&amp;ncrnd=909&amp;text=%D0%9C%D0%BE%D1%81%D0%BA%D0%B2%D0%B0%2C%20%D1%83%D0%BB.%20%D0%90%D1%80%D0%B1%D0%B0%D1%82%D0%B5%D1%86%D0%BA%D0%B0%D1%8F%2C%20%20%D0%B4%D0%BE%D0%BC%202c3.&amp;sll=37.632916%2C55.729438&amp;sspn=0.163422%2C0.049113&amp;ol=geo&amp;ouri=ymapsbm1%3A%2F%2Fgeo%3Fll%3D37.661%252C55.727%26spn%3D0.001%252C0.001%26text%3D%25D0%25A0%25D0%25BE%25D1%2581%25D1%2581%25D0%25B8%25D1%258F%252C%2520%25D0%259C%25D0%25BE%25D1%2581%25D0%25BA%25D0%25B2%25D0%25B0%252C%2520%25D0%2590%25D1%2580%25D0%25B1%25D0%25B0%25D1%2582%25D0%25B5%25D1%2586%25D0%25BA%25D0%25B0%25D1%258F%2520%25D1%2583%25D0%25BB%25D0%25B8%25D1%2586%25D0%25B0%252C%25202%25D1%25813">Посмотреть на&nbsp;Яндекс.Картах</a></p>\r\n\r\n<p>Телефон 777-15-51</p>\r\n', 1, 8, 1, 'Контакты', '2016-03-24 13:26:25'),
(7, 'all-products', 'Все товары', 'Все товары', '', 'Все товары', '', 2, 7, 1, 'Все товары', '2015-11-18 05:32:22'),
(8, 'brands', 'Бренды', 'Бренды', '', 'Бренды', '', 1, 6, 1, 'Бренды', '2016-03-24 13:26:25');

-- --------------------------------------------------------

--
-- Структура таблицы `s_payment_methods`
--

CREATE TABLE IF NOT EXISTS `s_payment_methods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `currency_id` float NOT NULL,
  `settings` text NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `position` (`position`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `s_products`
--

CREATE TABLE IF NOT EXISTS `s_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL DEFAULT '',
  `brand_id` int(11) DEFAULT NULL,
  `name` varchar(500) NOT NULL,
  `annotation` text NOT NULL,
  `body` longtext NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `position` int(11) NOT NULL DEFAULT '0',
  `meta_title` varchar(500) NOT NULL,
  `meta_keywords` varchar(500) NOT NULL,
  `meta_description` varchar(500) NOT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `featured` tinyint(1) DEFAULT NULL,
  `external_id` varchar(36) NOT NULL,
  `rating` float(3,1) DEFAULT '0.0',
  `votes` int(11) DEFAULT '0',
  `special` varchar(255) DEFAULT NULL,
  `last_modify` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `url` (`url`),
  KEY `brand_id` (`brand_id`),
  KEY `visible` (`visible`),
  KEY `position` (`position`),
  KEY `external_id` (`external_id`),
  KEY `hit` (`featured`),
  KEY `name` (`name`(333))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `s_products_categories`
--

CREATE TABLE IF NOT EXISTS `s_products_categories` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `position` (`position`),
  KEY `product_id` (`product_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `s_purchases`
--

CREATE TABLE IF NOT EXISTS `s_purchases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) DEFAULT '0',
  `variant_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) NOT NULL DEFAULT '',
  `variant_name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `amount` int(11) NOT NULL DEFAULT '0',
  `sku` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  KEY `variant_id` (`variant_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `s_related_products`
--

CREATE TABLE IF NOT EXISTS `s_related_products` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`),
  KEY `position` (`position`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `s_settings`
--

CREATE TABLE IF NOT EXISTS `s_settings` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=143 ;

--
-- Дамп данных таблицы `s_settings`
--

INSERT INTO `s_settings` (`setting_id`, `name`, `value`) VALUES
(8, 'site_name', 'Новый интернет-магазин'),
(9, 'company_name', 'ООО "Интернет-магазин"'),
(50, 'units', 'шт'),
(53, 'date_format', 'd.m.Y'),
(54, 'order_email', 'info@example.com'),
(55, 'comment_email', 'info@example.com'),
(56, 'notify_from_email', 'info@example.com'),
(57, 'decimals_point', ','),
(58, 'thousands_separator', ' '),
(30, 'theme', 'default'),
(33, 'products_num', '24'),
(111, 'last_1c_orders_export_date', '2011-07-30 21:31:56'),
(113, 'max_order_amount', '10'),
(114, 'watermark_offset_x', '50'),
(115, 'watermark_offset_y', '50'),
(116, 'watermark_transparency', '50'),
(117, 'images_sharpen', '15'),
(119, 'admin_email', 'info@example.com'),
(120, 'comparison_count', '5'),
(121, 'is_preorder', '0'),
(125, 'yandex_export_not_in_stock', ''),
(126, 'yandex_available_for_retail_store', ''),
(127, 'yandex_available_for_reservation', ''),
(128, 'yandex_short_description', ''),
(129, 'yandex_has_manufacturer_warranty', ''),
(130, 'yandex_has_seller_warranty', ''),
(131, 'yandex_sales_notes', ''),
(132, 'posts_num', '10'),
(133, 'image_sizes', '200x200|60x60|50x50|219x172|162x77|183x183|35x35|400x300|100x100|1000x1000|800x600|300x300|87x72|330x300|77x77|165x90'),
(134, 'captcha_product', '1'),
(135, 'captcha_post', '1'),
(136, 'captcha_cart', '1'),
(137, 'captcha_register', '1'),
(138, 'captcha_feedback', '1'),
(139, 'site_work', 'on'),
(140, 'site_annotation', ''),
(142, 'topvisor_key', 'bded4fc3f61f7801cefe');

-- --------------------------------------------------------

--
-- Структура таблицы `s_spec_img`
--

CREATE TABLE IF NOT EXISTS `s_spec_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `position` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `s_spec_img`
--

INSERT INTO `s_spec_img` (`id`, `name`, `filename`, `position`) VALUES
(1, 'Новинка', 'new.gif', 1),
(2, 'Хит', 'bestseller.png', 2),
(3, 'Гарантия', 'guaranty.png', 3),
(4, 'Акция', 'campaign.png', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `s_subscribe_mailing`
--

CREATE TABLE IF NOT EXISTS `s_subscribe_mailing` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `s_translations`
--

CREATE TABLE IF NOT EXISTS `s_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template` varchar(255) NOT NULL DEFAULT '',
  `in_config` tinyint(1) NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL,
  `lang_ru` varchar(255) NOT NULL DEFAULT '',
  `lang_en` varchar(255) NOT NULL DEFAULT '',
  `lang_uk` varchar(255) NOT NULL DEFAULT '',
  `lang_ch` varchar(255) NOT NULL DEFAULT '',
  `lang_by` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=274 ;

--
-- Дамп данных таблицы `s_translations`
--

INSERT INTO `s_translations` (`id`, `template`, `in_config`, `label`, `lang_ru`, `lang_en`, `lang_uk`, `lang_ch`, `lang_by`) VALUES
(133, '', 0, 'products_by_default', 'умолчанию', 'default', 'умолчанию', '', ''),
(132, '', 0, 'products_sort_by', 'Сортировать по', 'Sort by', 'Сортировать по', '', ''),
(246, '', 0, 'product_payment_2', 'Безналичный перевод', 'Сashless', 'Безналичный перевод', '', ''),
(252, '', 0, 'breadcrumb_comparison', 'Сравнение', 'Comparison', 'Сравнение', '', ''),
(128, '', 0, 'tiny_products_out_of_stock', 'Нет на складе', 'Out of stock', 'Відсутній на складі', '', ''),
(257, '', 0, 'comparison_unique', 'Только отличия', 'Only differences', 'Только отличия', '', ''),
(127, '', 0, 'tiny_products_remove_comparison', 'Из сравнения', 'From comparison', 'З порівняння', '', ''),
(126, '', 0, 'tiny_products_add_comparison', 'В сравнение', 'In comparison', 'До порівняння', '', ''),
(124, '', 0, 'tiny_products_add_favorite', 'В избранное', 'To favorites', 'До обраного', '', ''),
(125, '', 0, 'tiny_products_remove_favorite', 'Из избранного', 'From favorites', 'З обраного', '', ''),
(123, '', 0, 'tiny_products_pre_order', 'Предзаказ', 'Pre-order', 'Передзамовлення', '', ''),
(121, '', 0, 'form_enter_comment', 'Введите комментарий', 'Enter a comment', 'Введите комментарий', '', ''),
(120, '', 0, 'post_write_comment', 'Написать комментарий', 'Write a comment', 'Написать комментарий', '', ''),
(119, '', 0, 'post_no_comments', 'Пока нет комментариев', 'No comments', 'Пока нет комментариев', '', ''),
(33, '', 0, 'form_enter_captcha', 'Введите капчу', 'Enter captcha', 'Введите капчу', '', ''),
(118, '', 0, 'post_comment_status', 'ожидает модерации', 'awaiting moderation', 'ожидает модерации', '', ''),
(116, '', 0, 'breadcrumbs_password_remind', 'Восстановление пароля', 'Password reset', 'Восстановление пароля', '', ''),
(117, '', 0, 'post_comments', 'Комментарии', 'Comments', 'Комментарии', '', ''),
(114, '', 0, 'breadcrumb_home', 'Главная', 'Home', 'Главная', '', ''),
(115, '', 0, 'breadcrumb_search', 'Поиск', 'Search', 'Поиск', '', ''),
(113, '', 0, 'password_remind_remember', 'Вспомнить', 'Remember', 'Вспомнить', '', ''),
(112, '', 0, 'password_remind_enter_your_email', 'Введите e-mail, который вы указывали при регистрации', 'Enter Your e-mail, You signed in', 'Введите e-mail, который вы указывали при регистрации', '', ''),
(111, '', 0, 'password_remind_user_not_found', 'Пользователь не найден', 'User not found', 'Пользователь не найден', '', ''),
(110, '', 0, 'password_remind_header', 'Восстановление пароля', 'Password reminder', 'Восстановление пароля', '', ''),
(108, '', 0, 'password_remind_on', 'На', 'On', 'На', '', ''),
(109, '', 0, 'password_remind_letter_sent', 'отправлено письмо для восстановления пароля', 'a letter was sent to reset password.', 'отправлено письмо для восстановления пароля', '', ''),
(165, '', 0, 'password_remind_title', 'Восстановление пароля', 'Password remind', 'Восстановление пароля', '', ''),
(214, '', 0, 'cart_head_amoun', 'Кол-во', 'Amoun', 'Кол-во', '', ''),
(213, '', 0, 'cart_head_price', 'Цена', 'Price', 'Цена', '', ''),
(215, '', 0, 'cart_head_total', 'Сумма', 'Total', 'Сумма', '', ''),
(180, '', 0, 'wishlist_header', 'Избранное', 'Favorites', 'Избранное', '', ''),
(181, '', 0, 'wishlist_empty', 'В избранном пусто', 'Favoured empty', 'В избранном пусто', '', ''),
(182, '', 0, 'callback_header', 'Заказ обратного звонка', 'Order call back', 'Заказ обратного звонка', '', ''),
(99, '', 0, 'form_email', 'E-mail', 'E-mail', 'E-mail', '', ''),
(183, '', 0, 'form_enter_phone', 'Введите номер телефона', 'Enter your phone number', 'Введите номер телефона', '', ''),
(98, '', 0, 'form_name', 'Имя', 'Name', 'Имя', '', ''),
(258, '', 0, 'product_write_comment', 'Написать комментарий', 'Write a comment', 'Написать комментарий', '', ''),
(247, '', 0, 'product_payment_3', 'Приват 24\r\n', 'Privat 24', 'Приват 24\r\n', '', ''),
(248, '', 0, 'product_payment_4', 'WebMoney', 'WebMoney', 'WebMoney', '', ''),
(92, '', 0, 'status_made', 'выполнен', 'made', 'выполнен', '', ''),
(93, '', 0, 'status_paid', 'оплачен', 'paid', 'оплачен', '', ''),
(91, '', 0, 'status_processing', 'в обработке', 'processing', 'в обработке', '', ''),
(88, '', 0, 'login_sign_in', 'Войти', 'Sign in', 'Войти', '', ''),
(239, '', 0, 'order_payment', 'Способ оплаты', 'Payment method', 'Способ оплаты', '', ''),
(87, '', 0, 'form_enter_password', 'Введите пароль', 'Enter password', 'Введите пароль', '', ''),
(84, '', 0, 'login_pass_not_active', 'Ваш аккаунт еще не активирован', 'Your account is not activated yet', 'Ваш аккаунт еще не активирован', '', ''),
(85, '', 0, 'form_password', 'Пароль', 'Password', 'Пароль', '', ''),
(86, '', 0, 'login_remind', 'напомнить', 'remind', 'напомнить', '', ''),
(212, '', 0, 'cart_head_name', 'Наименование', 'Nomination', 'Наименование', '', ''),
(83, '', 0, 'login_error_pass', 'Неверный логин или пароль', 'Login or password incorrect ', 'Неверный логин или пароль', '', ''),
(211, '', 0, 'cart_head_img', 'Фото', 'Photo', 'Фото', '', ''),
(193, '', 0, 'product_add_comparison', 'В сравнение', 'In comparison', 'До порівняння', '', ''),
(195, '', 0, 'product_remove_favorite', 'Из избранного', 'From favorites', 'З обраного', '', ''),
(194, '', 0, 'product_remove_comparison', 'Из сравнения', 'From comparison', 'З порівняння', '', ''),
(196, '', 0, 'product_add_favorite', 'В избранное', 'To favorites', 'До обраного', '', ''),
(197, '', 0, 'product_delivery', 'Способы доставки', 'Delivery methods', 'Способы доставки', '', ''),
(198, '', 0, 'product_payment', 'Способы оплаты', 'Payment methods', 'Способы оплаты', '', ''),
(199, '', 0, 'product_share', 'Рассказать друзьям', 'Tell friends', 'Рассказать друзьям', '', ''),
(200, '', 0, 'product_features', 'Характеристики', 'Features', 'Характеристики', '', ''),
(201, '', 0, 'product_description', 'Описание', 'Description', 'Описание', '', ''),
(202, '', 0, 'product_comments', 'Комментарии', 'Comments', 'Комментарии', '', ''),
(203, '', 0, 'product_no_comments', 'Пока нет комментариев', 'No comments', 'Пока нет комментариев', '', ''),
(205, '', 0, 'product_recommended_products', 'Рекомендуемые товары', 'Recommended products', 'Рекомендуемые товары', '', ''),
(206, '', 0, 'cart_title', 'Корзина', 'Cart', 'Корзина', '', ''),
(207, '', 0, 'cart_header', 'Корзина', 'Cart', 'Корзина', '', ''),
(71, '', 0, 'index_login', 'Вход', 'Sign in', 'Вхiд', '', ''),
(208, '', 0, 'cart_coupon_error', 'Купон не действителен', 'Coupon not valid', 'Купон не действителен', '', ''),
(70, '', 0, 'login_registration', 'Регистрация', 'Registration', 'Регистрация', '', ''),
(72, '', 0, 'index_search', 'Поиск товаров', 'Search products', 'Пошук товарів', '', ''),
(67, '', 0, 'form_send', 'Отправить', 'Send', 'Отправить', '', ''),
(69, '', 0, 'user_logout', 'Выйти', 'Logout', 'Выйти', '', ''),
(68, '', 0, 'index_back_call', 'Обратный звонок', 'Back call', 'Зворотний дзвінок', '', ''),
(65, '', 0, 'form_error_captcha', 'Неверно введена капча', 'Captcha entered incorrect', 'Неверно введена капча', '', ''),
(66, '', 0, 'form_enter_message', 'Введите сообщение', 'Enter message', 'Введите сообщение', '', ''),
(63, '', 0, 'feedback_feedback', 'Обратная связь', 'Feedback', 'Обратная связь', '', ''),
(64, '', 0, 'feedback_message_sent', 'ваше сообщение отправлено', 'your message was sent', 'ваше сообщение отправлено', '', ''),
(61, '', 0, 'main_brands', 'Бренды', 'Brands', 'Бренды', '', ''),
(251, '', 0, 'comparison_header', 'Сравнение', 'Comparison', 'Сравнение', '', ''),
(254, '', 0, 'cart_free', 'бесплатно', 'is free', 'бесплатно', '', ''),
(62, '', 0, 'features_price', 'Цена', 'Price', 'Цена', '', ''),
(57, '', 0, 'tiny_products_add_cart', 'Купить', 'Buy', 'Придбати', '', ''),
(245, '', 0, 'product_payment_1', 'Наличными при получении', 'Cash on delivery', 'Наличными при получении', '', ''),
(244, '', 0, 'product_delivery_4', 'Самовывоз', '\r\nPickup', 'Самовывоз', '', ''),
(241, '', 0, 'product_delivery_1', 'Новая Почта', 'New Mail', 'Новая Почта', '', ''),
(242, '', 0, 'product_delivery_2', 'Другие транспортные службы', 'Other transport services', 'Другие транспортные службы', '', ''),
(51, '', 0, 'features_all', 'Все', 'All', 'Все', '', ''),
(249, '', 0, 'cart_coupon_min', 'Действует для заказов от', 'Valid for orders from', 'Действует для заказов от', '', ''),
(49, '', 0, 'index_comparison', 'Сравнение', 'Comparison', 'Порівняння', '', ''),
(225, '', 0, 'breadcrumb_order', 'Заказ №', 'Order №', 'Заказ №', '', ''),
(250, '', 0, 'comparison_title', 'Сравнение', 'Comparison', 'Сравнение', '', ''),
(224, '', 0, 'order_header', 'Заказ №', 'Order №', 'Заказ №', '', ''),
(226, '', 0, 'cart_coupon', 'Купон', 'Coupon', 'Купон', '', ''),
(45, '', 0, 'pagination_prev', 'назад', 'back', 'назад', '', ''),
(227, '', 0, 'order_delivery', 'Стоимость доставки', 'Cost of delivery', 'Стоимость доставки', '', ''),
(229, '', 0, 'order_time', 'в', 'in', 'в', '', ''),
(228, '', 0, 'order_date', 'Дата заказа', 'Order date', 'Дата заказа', '', ''),
(231, '', 0, 'order_email', 'Эл. почта', 'E-mail', 'Эл. почта', '', ''),
(230, '', 0, 'order_name', 'Имя', 'Name', 'Имя', '', ''),
(233, '', 0, 'order_address', 'Адрес', 'Address', 'Адрес', '', ''),
(232, '', 0, 'order_phone', 'Телефон', 'Phone', 'Телефон', '', ''),
(234, '', 0, 'order_comment', 'Комментарий', 'Comment', 'Комментарий', '', ''),
(235, '', 0, 'order_details', 'Детали заказа', 'Order details', 'Детали заказа', '', ''),
(236, '', 0, 'order_status', 'Статус заказа', 'Order status', 'Статус заказа', '', ''),
(238, '', 0, 'order_payment_details', 'Детали оплаты', 'Payment details', 'Детали оплаты', '', ''),
(237, '', 0, 'status_accepted', 'принят', 'accepted', 'принят', '', ''),
(216, '', 0, 'form_address', 'Адрес', 'Address', 'Адрес', '', ''),
(217, '', 0, 'cart_form_header', 'Контактные данные', 'Contact details', 'Контактные данные', '', ''),
(219, '', 0, 'cart_checkout', 'Оформить заказ', 'Checkout', 'Оформить заказ', '', ''),
(218, '', 0, 'cart_order_comment', 'Комментарии к заказу', 'Comments to order', 'Комментарии к заказу', '', ''),
(220, '', 0, 'cart_delivery', 'Способы доставки', 'Delivery methods', 'Способы доставки', '', ''),
(221, '', 0, 'cart_payment', 'Способы оплаты', 'Payment methods', 'Способы оплаты', '', ''),
(256, '', 0, 'comparison_all', 'Все', 'All', 'Все', '', ''),
(222, '', 0, 'cart_empty', 'Корзина пуста', 'Cart is empty', 'Корзина пуста', '', ''),
(28, '', 0, 'form_enter_email', 'Введите email', 'Enter email', 'Введите email', '', ''),
(26, '', 0, 'count_products_of_goods', 'товара', 'item', 'товара', '', ''),
(25, '', 0, 'count_products_goods', 'товаров', 'items', 'товаров', '', ''),
(188, '', 0, 'product_rating', 'Рейтинг', 'Rating', 'Рейтинг', '', ''),
(24, '', 0, 'count_products_item', 'товар', 'item', 'товар', '', ''),
(189, '', 0, 'product_sku', 'Артикул', 'Sku', 'Артикул', '', ''),
(240, '', 0, 'order_change_payment', 'Выбрать другой способ оплаты', 'Choose another payment method', 'Выбрать другой способ оплаты', '', ''),
(22, '', 0, 'breadcrumb_cart', 'Корзина', 'Cart', 'Корзина', '', ''),
(223, '', 0, 'order_title', 'Заказ №', 'Order №', 'Заказ №', '', ''),
(14, '', 0, 'wishlist_info_wishlist', 'Избранное', 'Wishlist', '', '', ''),
(15, '', 0, 'comparison_compare', 'Сравнить товары', 'Compare products', '', '', ''),
(184, '', 0, 'form_phone', 'Номер телефона', 'Phone number', 'Номер телефона', '', ''),
(17, '', 0, 'form_enter_name', 'Введите имя', 'Enter Your name', 'Введите имя', '', ''),
(185, '', 0, 'callback_order', 'Заказать', 'To order', 'Заказать', '', ''),
(186, '', 0, 'callback_sent_header', 'Ваша заявка принята', 'Your application is accepted', 'Ваша заявка принята', '', ''),
(259, '', 0, 'breadcrumb_wishlist', 'Избранное', 'Favorites', 'Избранное', '', ''),
(13, '', 0, 'email_order_order', 'Заказ', 'Order', 'Order', '', ''),
(187, '', 0, 'callback_sent_text', 'Мы свяжемся с вами в ближайшее время', 'We will contact you shortly', 'Мы свяжемся с вами в ближайшее время', '', ''),
(9, '', 0, 'main_action_goods', 'Акционные товары', 'Action goods', 'Акційні товари', '', ''),
(8, '', 0, 'main_new_products', 'Новинки', 'New products', 'Новинки', '', ''),
(7, '', 0, 'main_recommended_products', 'Хиты продаж', 'Bestsellers', 'Хіти продажу', '', ''),
(253, '', 0, 'comparison_empty', 'Папка сравнения пуста', 'Folder comparison is empty', 'Папка сравнения пуста', '', ''),
(209, '', 0, 'cart_total_price', 'Итого', 'In total', 'Итого', '', ''),
(2, '', 0, 'features_manufacturer', 'Производитель', 'Manufacturer', 'Все бренды', '', ''),
(210, '', 0, 'cart_discount', 'Скидка', 'Discount', 'Скидка', '', ''),
(243, '', 0, 'product_delivery_3', 'Курьером по Киеву', '\r\nCourier in Kiev', 'Курьером по Киеву', '', ''),
(134, '', 0, 'products_by_price', 'цене', 'price', 'цене', '', ''),
(135, '', 0, 'products_by_name', 'названию', 'name', 'названию', '', ''),
(136, '', 0, 'products_not_found', 'Товары не найдены', 'Items not found', 'Товары не найдены', '', ''),
(137, '', 0, 'register_user_registered', 'Пользователь с таким email уже зарегистрирован', 'User with this email already registered', 'Пользователь с таким email уже зарегистрирован', '', ''),
(138, '', 0, 'register_create_account', 'Зарегистрироваться', 'Create Account', 'Зарегистрироваться', '', ''),
(255, '', 0, 'cart_remove', 'Удалить из корзины', 'Remove from cart', 'Удалить из корзины', '', ''),
(140, '', 0, 'user_change_password', 'Изменить пароль', 'Change password', 'Изменить пароль', '', ''),
(141, '', 0, 'form_save', 'Сохранить', 'Save', 'Сохранить', '', ''),
(143, '', 0, 'user_order_number', 'Заказ №', 'Order №', 'Заказ №', '', ''),
(144, '', 0, 'status_pending', 'ждет обработки', 'is pending', 'ждет обработки', '', ''),
(178, '', 0, 'pagination_next', 'вперёд', 'next', 'вперёд', '', ''),
(179, '', 0, 'pagination_all', 'все', 'all', 'все', '', ''),
(146, '', 0, 'index_favorites', 'Избранное', 'Favorites', 'Вибране', '', ''),
(190, '', 0, 'product_out_of_stock', 'Нет на складе', 'Out of stock', 'Відсутній на складі', '', ''),
(191, '', 0, 'product_pre_order', 'Предзаказ', 'Pre-order', 'Передзамовлення', '', ''),
(192, '', 0, 'product_add_cart', 'Купить', 'Buy', 'Придбати', '', ''),
(150, '', 0, 'breadcrumbs_blog', 'Блог', 'Blog', 'Блог', '', ''),
(151, '', 0, 'main_news', 'Новости', 'News', 'Новини', '', ''),
(152, '', 0, 'main_all_news', 'Все новости', 'All news', 'Всі новини', '', ''),
(153, '', 0, 'index_about_store', 'О магазине', 'About store', '', '', ''),
(154, '', 0, 'index_catalog', 'Каталог', 'Catalog', '', '', ''),
(155, '', 0, 'index_contacts', 'Контакты', 'Contacts', '', '', ''),
(156, '', 0, 'index_contacts_body', '8 800 000-00-00,<br/>\r\n\r\nПн–Сб 10:00–22:00,<br/>\r\nВс 09:00–17:00<br/>\r\ninfo@example.com<br/>\r\nИнтернет магазин<br/>\r\nул. Космонавта Волкова 14', '', '', '', ''),
(157, '', 0, 'index_copyright', 'Интернет-магазин на OkayCMS', 'Online Store with OkayCMS', '', '', ''),
(268, '', 0, 'cart_deliveries_to_pay', ', к оплате', ', к оплате', ', к оплате', '', ''),
(158, '', 0, 'index_in_networks', 'Мы в соцсетях', 'We are in social networks', '', '', ''),
(159, '', 0, 'features_categories', 'Категории', 'Categories', '', '', ''),
(160, '', 0, 'breadcrumb_brands', 'Бренды', 'Brands', 'Бренды', '', ''),
(161, '', 0, 'products_search', 'Поиск', 'Search', 'Поиск', '', ''),
(162, '', 0, 'login_title', 'Вход', 'Enter', 'Вход', '', ''),
(163, '', 0, 'login_enter', 'Вход', 'Enter', 'Вход', '', ''),
(164, '', 0, 'breadcrumbs_enter', 'Вход', 'Enter', 'Вход', '', ''),
(166, '', 0, 'register_title', 'Регистрация', 'Registration', 'Регистрация', '', ''),
(167, '', 0, 'register_header', 'Регистрация', 'Registration', 'Регистрация', '', ''),
(168, '', 0, 'breadcrumbs_registration', 'Регистрация', 'Registration', 'Регистрация', '', ''),
(169, '', 0, 'breadcrumbs_user', 'Личный кабинет', 'Personal area', 'Личный кабинет', '', ''),
(170, '', 0, 'user_title', 'Личный кабинет', 'Personal area', 'Личный кабинет', '', ''),
(171, '', 0, 'user_header', 'Личный кабинет', 'Personal area', 'Личный кабинет', '', ''),
(172, '', 0, 'user_order_date', 'Дата заказа', 'Date of order', 'Дата заказа', '', ''),
(173, '', 0, 'user_number_of_order', 'Номер заказа', 'Number of order', 'Номер заказа', '', ''),
(174, '', 0, 'user_order_status', 'Статус заказа', 'Status of order', 'Статус заказа', '', ''),
(175, '', 0, 'index_cart', 'Корзина', 'Cart', 'Корзина', '', ''),
(176, '', 0, 'index_empty_cart', 'Корзина пуста', 'Cart is empty', 'Корзина пуста', '', ''),
(177, '', 0, 'wishlist_title', 'Избранные товары', 'Favorites', 'Избранные товары', '', ''),
(260, '', 0, 'form_enter_address', 'Введите адрес', 'Enter your address', 'Введите адрес', '', ''),
(261, '', 0, 'form_generate_receipt', 'Сформировать квитанцию', 'To generate a receipt', 'Сформировать квитанцию', '', ''),
(262, '', 0, 'form_to_pay', 'К оплате', 'To pay', 'К оплате', '', ''),
(263, '', 0, 'index_subscribe', 'Подписаться на рассылку', 'Subscribe to newsletter', 'Подписаться на рассылку', '', ''),
(264, '', 0, 'index_to_subscribe', 'Подписаться', 'To subscribe', 'Подписаться', '', ''),
(265, '', 0, 'index_subscribe_already', 'Вы уже подписаны', 'You are already subscribed', 'Вы уже подписаны', '', ''),
(266, '', 0, 'index_subscribe_sent', 'Вы были успешно подписаны', 'You have successfully signed', 'Вы были успешно подписаны', '', ''),
(267, '', 0, 'features_browsed', 'Вы просматривали', 'You viewed', '', '', ''),
(269, '', 0, 'cart_purchases_remove', 'Удалить', 'Remove', 'Удалить', '', ''),
(270, '', 0, 'cart_purchases_coupon_apply', 'Применить', 'Apply', 'Применить', '', ''),
(271, '', 0, 'yandex_map_lang', 'ru_RU', 'en_US', 'uk_UA', '', ''),
(272, '', 0, 'index_phone_1', '0 800 321-54-76', '0 800 321-54-76', '0 800 321-54-76', '', ''),
(273, '', 0, 'index_phone_2', '0 800 321-54-76', '0 800 321-54-76', '0 800 321-54-76', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `s_users`
--

CREATE TABLE IF NOT EXISTS `s_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `last_ip` varchar(15) DEFAULT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `s_variants`
--

CREATE TABLE IF NOT EXISTS `s_variants` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(14,2) NOT NULL DEFAULT '0.00',
  `compare_price` decimal(14,2) DEFAULT NULL,
  `stock` mediumint(9) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `external_id` varchar(36) NOT NULL,
  `currency_id` int(11) NOT NULL DEFAULT '0',
  `yandex` int(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `sku` (`sku`),
  KEY `price` (`price`),
  KEY `stock` (`stock`),
  KEY `position` (`position`),
  KEY `external_id` (`external_id`),
  KEY `yandex` (`yandex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
