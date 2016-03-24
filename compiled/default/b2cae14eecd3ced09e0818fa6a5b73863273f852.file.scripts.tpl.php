<?php /* Smarty version Smarty-3.1.18, created on 2016-03-24 19:56:53
         compiled from "Z:\home\loc\Okay\design\default\html\scripts.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1298956f44685d4bb29-09393467%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'b2cae14eecd3ced09e0818fa6a5b73863273f852' => 
    array (
      0 => 'Z:\\home\\loc\\Okay\\design\\default\\html\\scripts.tpl',
      1 => 1458822194,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1298956f44685d4bb29-09393467',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'settings' => 0,
    'error' => 0,
    'call_sent' => 0,
    'subscribe_success' => 0,
    'subscribe_error' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.18',
  'unifunc' => 'content_56f44685dcc842_81344137',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56f44685dcc842_81344137')) {function content_56f44685dcc842_81344137($_smarty_tpl) {?><script>
	/* Глобальный обьект */
	/* все глобальные переменные добавляем в оъект и работаем с ним!!! */
	var okay = {};
	
	okay.is_preorder = <?php echo $_smarty_tpl->tpl_vars['settings']->value->is_preorder;?>
;
	
	<?php if ($_GET['module']=='BlogView'&&$_smarty_tpl->tpl_vars['error']->value) {?>
		
		$( window ).load( function() {
			location.href = location.href + '#fn-blog_comment';
			$( '#fn-blog_comment' ).trigger( 'submit' );
		} );
	<?php }?>
	
	<?php if ($_smarty_tpl->tpl_vars['call_sent']->value) {?>
		$( function() {
			$.fancybox( {
				href: '#fn-callback-sent',
				padding: 0,
				minHeight: 0
			} );
		} );
	<?php }?>
	
	<?php if ($_GET['module']=='ProductView'&&$_smarty_tpl->tpl_vars['error']->value) {?>
		$( window ).load( function() {
			$( 'a[href="#comments"]' ).tab( 'show' );
			location.href = location.href + '#comments';
		} );
	
	<?php } elseif ($_GET['module']=='ProductView') {?>
		$( window ).load( function() {
			if( location.hash.search('comment') !=-1 ) {
				$( 'a[href="#comments"]' ).tab( 'show' );
			}
		} );
	<?php }?>
	<?php if ($_smarty_tpl->tpl_vars['subscribe_success']->value) {?>
		$( function() {
			$.fancybox( {
				href: '#fn-subscribe-sent',
				padding: 0,
				minHeight: 0,
                closeBtn: false
			} );
		} );
	<?php } elseif ($_smarty_tpl->tpl_vars['subscribe_error']->value) {?>
		$( window ).load( function() {
			location.href = location.href + '#subscribe_error';
		} );
	<?php }?>
</script><?php }} ?>
