<?php /* Smarty version Smarty-3.1.18, created on 2016-03-24 19:56:53
         compiled from "Z:\home\loc\Okay\design\default\html\wishlist_informer.tpl" */ ?>
<?php /*%%SmartyHeaderCode:614756f44685e30df3-24002728%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '40994ed78a5142c91d4643f090286dec48e5169f' => 
    array (
      0 => 'Z:\\home\\loc\\Okay\\design\\default\\html\\wishlist_informer.tpl',
      1 => 1458822194,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '614756f44685e30df3-24002728',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'wished_products' => 0,
    'lang_link' => 0,
    'translate_id' => 0,
    'lang' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.18',
  'unifunc' => 'content_56f44685e78ab4_50438959',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56f44685e78ab4_50438959')) {function content_56f44685e78ab4_50438959($_smarty_tpl) {?>
<?php if (count($_smarty_tpl->tpl_vars['wished_products']->value)>0) {?>
	<a class="nav-link link-black i-favorites" href="<?php echo $_smarty_tpl->tpl_vars['lang_link']->value;?>
wishlist">
		<span data-language="<?php echo $_smarty_tpl->tpl_vars['translate_id']->value['index_favorites'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value->index_favorites;?>
 (<?php echo count($_smarty_tpl->tpl_vars['wished_products']->value);?>
)</span>
	</a>
<?php } else { ?>
	<span class="nav-link i-favorites"><span data-language="<?php echo $_smarty_tpl->tpl_vars['translate_id']->value['index_favorites'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value->index_favorites;?>
</span></span>
<?php }?><?php }} ?>
