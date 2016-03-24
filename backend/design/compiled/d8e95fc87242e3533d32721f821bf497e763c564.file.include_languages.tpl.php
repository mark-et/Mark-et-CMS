<?php /* Smarty version Smarty-3.1.18, created on 2016-03-24 20:16:45
         compiled from "backend\design\html\include_languages.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1868456f44b2d68aa90-50552101%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'd8e95fc87242e3533d32721f821bf497e763c564' => 
    array (
      0 => 'backend\\design\\html\\include_languages.tpl',
      1 => 1458822194,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1868456f44b2d68aa90-50552101',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'product' => 0,
    'category' => 0,
    'brand' => 0,
    'feature' => 0,
    'post' => 0,
    'page' => 0,
    'payment_method' => 0,
    'delivery' => 0,
    'languages' => 0,
    'lang' => 0,
    'id' => 0,
    'lang_id' => 0,
    'langs' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.18',
  'unifunc' => 'content_56f44b2d7c1b70_51847171',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56f44b2d7c1b70_51847171')) {function content_56f44b2d7c1b70_51847171($_smarty_tpl) {?>
<style type="text/css">
<!--
.languages {
    width:100%;
    display:table;
    margin-bottom:20px;
}
.languages a{
    border:1px solid #ABADB3;
    padding:3px 5px;
    margin-right:5px;
    background: #FFFFFF;
    text-decoration:none;
    color:#787878;
    line-height:normal;
}
.languages a.active, .languages a:hover{
    color:#18A5FF;
    border:1px solid #18A5FF;
}
.add_lang{
    display:none;
}

-->
</style>

<?php if ($_smarty_tpl->tpl_vars['product']->value->id) {?><?php $_smarty_tpl->tpl_vars['id'] = new Smarty_variable($_smarty_tpl->tpl_vars['product']->value->id, null, 0);?><?php }?>
<?php if ($_smarty_tpl->tpl_vars['category']->value->id) {?><?php $_smarty_tpl->tpl_vars['id'] = new Smarty_variable($_smarty_tpl->tpl_vars['category']->value->id, null, 0);?><?php }?>
<?php if ($_smarty_tpl->tpl_vars['brand']->value->id) {?><?php $_smarty_tpl->tpl_vars['id'] = new Smarty_variable($_smarty_tpl->tpl_vars['brand']->value->id, null, 0);?><?php }?>
<?php if ($_smarty_tpl->tpl_vars['feature']->value->id) {?><?php $_smarty_tpl->tpl_vars['id'] = new Smarty_variable($_smarty_tpl->tpl_vars['feature']->value->id, null, 0);?><?php }?>
<?php if ($_smarty_tpl->tpl_vars['post']->value->id) {?><?php $_smarty_tpl->tpl_vars['id'] = new Smarty_variable($_smarty_tpl->tpl_vars['post']->value->id, null, 0);?><?php }?>
<?php if ($_smarty_tpl->tpl_vars['page']->value->id) {?><?php $_smarty_tpl->tpl_vars['id'] = new Smarty_variable($_smarty_tpl->tpl_vars['page']->value->id, null, 0);?><?php }?>
<?php if ($_smarty_tpl->tpl_vars['payment_method']->value->id) {?><?php $_smarty_tpl->tpl_vars['id'] = new Smarty_variable($_smarty_tpl->tpl_vars['payment_method']->value->id, null, 0);?><?php }?>
<?php if ($_smarty_tpl->tpl_vars['delivery']->value->id) {?><?php $_smarty_tpl->tpl_vars['id'] = new Smarty_variable($_smarty_tpl->tpl_vars['delivery']->value->id, null, 0);?><?php }?>

<?php if ($_smarty_tpl->tpl_vars['languages']->value) {?>
<div class='languages'>
<?php  $_smarty_tpl->tpl_vars['lang'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['lang']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['languages']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['lang']->key => $_smarty_tpl->tpl_vars['lang']->value) {
$_smarty_tpl->tpl_vars['lang']->_loop = true;
?>
<a href="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0][0]->url_modifier(array('lang_id'=>$_smarty_tpl->tpl_vars['lang']->value->id,'id'=>$_smarty_tpl->tpl_vars['id']->value),$_smarty_tpl);?>
" data-label='<?php echo $_smarty_tpl->tpl_vars['lang']->value->label;?>
' <?php if ($_smarty_tpl->tpl_vars['lang']->value->id==$_smarty_tpl->tpl_vars['lang_id']->value) {?>class='active'<?php }?>><?php echo $_smarty_tpl->tpl_vars['lang']->value->name;?>
<?php if ($_smarty_tpl->tpl_vars['langs']->value[$_smarty_tpl->tpl_vars['lang']->value->id]) {?>&crarr;<?php }?></a>
<?php } ?>
</div>

<?php }?><?php }} ?>
