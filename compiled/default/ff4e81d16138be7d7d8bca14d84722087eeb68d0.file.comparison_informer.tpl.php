<?php /* Smarty version Smarty-3.1.18, created on 2016-03-24 19:56:53
         compiled from "Z:\home\loc\Okay\design\default\html\comparison_informer.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2475456f44685dd59f1-51997863%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'ff4e81d16138be7d7d8bca14d84722087eeb68d0' => 
    array (
      0 => 'Z:\\home\\loc\\Okay\\design\\default\\html\\comparison_informer.tpl',
      1 => 1458822194,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2475456f44685dd59f1-51997863',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'comparison' => 0,
    'lang_link' => 0,
    'translate_id' => 0,
    'lang' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.18',
  'unifunc' => 'content_56f44685e287f8_61892280',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56f44685e287f8_61892280')) {function content_56f44685e287f8_61892280($_smarty_tpl) {?>
<?php if (count($_smarty_tpl->tpl_vars['comparison']->value->products)>0) {?>
	<a class="nav-link link-black i-comparison" href="<?php echo $_smarty_tpl->tpl_vars['lang_link']->value;?>
comparison">
		<span data-language="<?php echo $_smarty_tpl->tpl_vars['translate_id']->value['index_comparison'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value->index_comparison;?>
 (<?php echo count($_smarty_tpl->tpl_vars['comparison']->value->products);?>
)</span>
	</a>
<?php } else { ?>
	<span class="nav-link i-comparison">
		<span data-language="<?php echo $_smarty_tpl->tpl_vars['translate_id']->value['index_comparison'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value->index_comparison;?>
</span>
	</span>
<?php }?><?php }} ?>
