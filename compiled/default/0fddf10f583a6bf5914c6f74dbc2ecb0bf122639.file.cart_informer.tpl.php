<?php /* Smarty version Smarty-3.1.18, created on 2016-03-24 19:56:53
         compiled from "Z:\home\loc\Okay\design\default\html\cart_informer.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2137656f44685e85093-62780758%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '0fddf10f583a6bf5914c6f74dbc2ecb0bf122639' => 
    array (
      0 => 'Z:\\home\\loc\\Okay\\design\\default\\html\\cart_informer.tpl',
      1 => 1458822194,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2137656f44685e85093-62780758',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'cart' => 0,
    'lang_link' => 0,
    'translate_id' => 0,
    'lang' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.18',
  'unifunc' => 'content_56f44685efd143_51278858',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56f44685efd143_51278858')) {function content_56f44685efd143_51278858($_smarty_tpl) {?>
<?php if ($_smarty_tpl->tpl_vars['cart']->value->total_products>0) {?>
	<a href="<?php echo $_smarty_tpl->tpl_vars['lang_link']->value;?>
cart" class="i-cart btn-block link-black pull-xs-right pull-lg-none">
		<span class="h5 font-weight-bold btn-block" data-language="<?php echo $_smarty_tpl->tpl_vars['translate_id']->value['index_cart'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value->index_cart;?>
</span>
		<span class="btn-block"><?php echo $_smarty_tpl->tpl_vars['cart']->value->total_products;?>
 <?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['plural'][0][0]->plural_modifier($_smarty_tpl->tpl_vars['cart']->value->total_products,$_smarty_tpl->tpl_vars['lang']->value->count_products_item,$_smarty_tpl->tpl_vars['lang']->value->count_products_goods,$_smarty_tpl->tpl_vars['lang']->value->count_products_of_goods);?>
</span>
	</a>
<?php } else { ?>
	<div class="i-cart pull-xs-right pull-lg-none">
		<span class="h5 font-weight-bold btn-block" data-language="<?php echo $_smarty_tpl->tpl_vars['translate_id']->value['index_cart'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value->index_cart;?>
</span>
		<span class="btn-block" data-language="<?php echo $_smarty_tpl->tpl_vars['translate_id']->value['index_empty_cart'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value->index_empty_cart;?>
</span>
	</div>
<?php }?><?php }} ?>
