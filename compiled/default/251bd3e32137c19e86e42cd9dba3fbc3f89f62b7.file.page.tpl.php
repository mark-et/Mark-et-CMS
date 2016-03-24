<?php /* Smarty version Smarty-3.1.18, created on 2016-03-24 20:16:50
         compiled from "Z:\home\loc\Okay\design\default\html\page.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2329756f44b320df4c9-96710746%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '251bd3e32137c19e86e42cd9dba3fbc3f89f62b7' => 
    array (
      0 => 'Z:\\home\\loc\\Okay\\design\\default\\html\\page.tpl',
      1 => 1458822194,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2329756f44b320df4c9-96710746',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'page' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.18',
  'unifunc' => 'content_56f44b321bd938_45639813',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56f44b321bd938_45639813')) {function content_56f44b321bd938_45639813($_smarty_tpl) {?>

<?php $_smarty_tpl->tpl_vars['canonical'] = new Smarty_variable("/".((string)$_smarty_tpl->tpl_vars['page']->value->url), null, 1);
if ($_smarty_tpl->parent != null) $_smarty_tpl->parent->tpl_vars['canonical'] = clone $_smarty_tpl->tpl_vars['canonical'];?>
<div class="container">
	
	<?php echo $_smarty_tpl->getSubTemplate ('breadcrumb.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>


	
	<h1 class="m-b-1"><span data-page="<?php echo $_smarty_tpl->tpl_vars['page']->value->id;?>
"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['page']->value->header, ENT_QUOTES, 'UTF-8', true);?>
</span></h1>

	
	<?php echo $_smarty_tpl->tpl_vars['page']->value->body;?>

</div><?php }} ?>
