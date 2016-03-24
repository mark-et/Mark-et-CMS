<?php /* Smarty version Smarty-3.1.18, created on 2016-03-24 20:16:50
         compiled from "Z:\home\loc\Okay\design\default\html\breadcrumb.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1578256f44b321cee12-63668666%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'e8401e219e01c10e5a13f3e53d9f56289ae3c4c7' => 
    array (
      0 => 'Z:\\home\\loc\\Okay\\design\\default\\html\\breadcrumb.tpl',
      1 => 1458822194,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1578256f44b321cee12-63668666',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'lang_link' => 0,
    'translate_id' => 0,
    'lang' => 0,
    'category' => 0,
    'keyword' => 0,
    'cat' => 0,
    'brand' => 0,
    'page' => 0,
    'product' => 0,
    'order' => 0,
    'post' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.18',
  'unifunc' => 'content_56f44b3281b1a4_03448143',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56f44b3281b1a4_03448143')) {function content_56f44b3281b1a4_03448143($_smarty_tpl) {?>
<ol class="breadcrumb">
	
    <li itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb">
	    <a itemprop="url" href="<?php if (!empty($_smarty_tpl->tpl_vars['lang_link']->value)) {?><?php echo $_smarty_tpl->tpl_vars['lang_link']->value;?>
<?php } else { ?>/<?php }?>" data-language="<?php echo $_smarty_tpl->tpl_vars['translate_id']->value['breadcrumb_home'];?>
">
		    <span itemprop="title"><?php echo $_smarty_tpl->tpl_vars['lang']->value->breadcrumb_home;?>
</span>
	    </a>
    </li>

    
    <?php if ($_GET['module']=="ProductsView") {?>
        <?php if ($_smarty_tpl->tpl_vars['category']->value&&!$_smarty_tpl->tpl_vars['keyword']->value) {?>
            <?php  $_smarty_tpl->tpl_vars['cat'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['cat']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['category']->value->path; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['cat']->total= $_smarty_tpl->_count($_from);
 $_smarty_tpl->tpl_vars['cat']->iteration=0;
foreach ($_from as $_smarty_tpl->tpl_vars['cat']->key => $_smarty_tpl->tpl_vars['cat']->value) {
$_smarty_tpl->tpl_vars['cat']->_loop = true;
 $_smarty_tpl->tpl_vars['cat']->iteration++;
 $_smarty_tpl->tpl_vars['cat']->last = $_smarty_tpl->tpl_vars['cat']->iteration === $_smarty_tpl->tpl_vars['cat']->total;
?>
	            <?php if (!$_smarty_tpl->tpl_vars['cat']->last) {?>
		            <li itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb">
			            <a itemprop="url" href="<?php echo $_smarty_tpl->tpl_vars['lang_link']->value;?>
catalog/<?php echo $_smarty_tpl->tpl_vars['cat']->value->url;?>
">
				            <span itemprop="title"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['cat']->value->name, ENT_QUOTES, 'UTF-8', true);?>
</span>
			            </a>
		            </li>
	            <?php } else { ?>
		            <li><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['cat']->value->name, ENT_QUOTES, 'UTF-8', true);?>
</li>
	            <?php }?>
            <?php } ?>
        <?php } elseif ($_smarty_tpl->tpl_vars['brand']->value) {?>
	        <li itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb">
		        <a itemprop="url" href="<?php echo $_smarty_tpl->tpl_vars['lang_link']->value;?>
brands" data-language="<?php echo $_smarty_tpl->tpl_vars['translate_id']->value['breadcrumb_brands'];?>
">
			        <span itemprop="title"><?php echo $_smarty_tpl->tpl_vars['lang']->value->breadcrumb_brands;?>
</span>
		        </a>
	        </li>
            <li><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['brand']->value->name, ENT_QUOTES, 'UTF-8', true);?>
</li>
        <?php } elseif ($_smarty_tpl->tpl_vars['keyword']->value) {?>
            <li data-language="<?php echo $_smarty_tpl->tpl_vars['translate_id']->value['breadcrumb_search'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value->breadcrumb_search;?>
</li>
        <?php } else { ?>
            <li><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['page']->value->name, ENT_QUOTES, 'UTF-8', true);?>
</li>
        <?php }?>

    
    <?php } elseif ($_GET['module']=="BrandsView") {?>
	    <li><?php echo $_smarty_tpl->tpl_vars['page']->value->name;?>
</li>

    
    <?php } elseif ($_GET['module']=="ProductView") {?>
        <?php  $_smarty_tpl->tpl_vars['cat'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['cat']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['category']->value->path; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['cat']->total= $_smarty_tpl->_count($_from);
 $_smarty_tpl->tpl_vars['cat']->iteration=0;
foreach ($_from as $_smarty_tpl->tpl_vars['cat']->key => $_smarty_tpl->tpl_vars['cat']->value) {
$_smarty_tpl->tpl_vars['cat']->_loop = true;
 $_smarty_tpl->tpl_vars['cat']->iteration++;
 $_smarty_tpl->tpl_vars['cat']->last = $_smarty_tpl->tpl_vars['cat']->iteration === $_smarty_tpl->tpl_vars['cat']->total;
?>
	        <li itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb">
		        <a itemprop="url" href="<?php echo $_smarty_tpl->tpl_vars['lang_link']->value;?>
catalog/<?php echo $_smarty_tpl->tpl_vars['cat']->value->url;?>
">
			        <span itemprop="title"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['cat']->value->name, ENT_QUOTES, 'UTF-8', true);?>
</span>
		        </a>
	        </li>
        <?php } ?>
	    <li><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['product']->value->name, ENT_QUOTES, 'UTF-8', true);?>
</li>

    
    <?php } elseif ($_GET['module']=="FeedbackView"||$_GET['module']=="PageView") {?>
        <li><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['page']->value->name, ENT_QUOTES, 'UTF-8', true);?>
</li>

    
    <?php } elseif ($_GET['module']=="CartView") {?>
        <li data-language="<?php echo $_smarty_tpl->tpl_vars['translate_id']->value['breadcrumb_cart'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value->breadcrumb_cart;?>
</li>

    
    <?php } elseif ($_GET['module']=="OrderView") {?>
	    <li data-language="<?php echo $_smarty_tpl->tpl_vars['translate_id']->value['breadcrumb_order'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value->breadcrumb_order;?>
 <?php echo $_smarty_tpl->tpl_vars['order']->value->id;?>
</li>

    
    <?php } elseif ($_GET['module']=="LoginView"&&$_GET['action']=="password_remind") {?>
        <li data-language="<?php echo $_smarty_tpl->tpl_vars['translate_id']->value['breadcrumbs_password_remind'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value->breadcrumbs_password_remind;?>
</li>

    
    <?php } elseif ($_GET['module']=="LoginView") {?>
        <li data-language="<?php echo $_smarty_tpl->tpl_vars['translate_id']->value['breadcrumbs_enter'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value->breadcrumbs_enter;?>
</li>

    
    <?php } elseif ($_GET['module']=="RegisterView") {?>
        <li data-language="<?php echo $_smarty_tpl->tpl_vars['translate_id']->value['breadcrumbs_registration'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value->breadcrumbs_registration;?>
</li>

    
    <?php } elseif ($_GET['module']=="UserView") {?>
	    <li data-language="<?php echo $_smarty_tpl->tpl_vars['translate_id']->value['breadcrumbs_user'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value->breadcrumbs_user;?>
</li>

    
    <?php } elseif ($_GET['module']=="BlogView") {?>
        <?php if ($_GET['url']) {?>
	        <li itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb">
		        <a itemprop="url" href="<?php echo $_smarty_tpl->tpl_vars['lang_link']->value;?>
blog" data-language="<?php echo $_smarty_tpl->tpl_vars['translate_id']->value['breadcrumbs_blog'];?>
">
			        <span itemprop="title"><?php echo $_smarty_tpl->tpl_vars['lang']->value->breadcrumbs_blog;?>
</span>
		        </a>
	        </li>
	        <li>
		        <?php echo $_smarty_tpl->tpl_vars['post']->value->name;?>

	        </li>
        <?php } else { ?>
	        <li data-language="<?php echo $_smarty_tpl->tpl_vars['translate_id']->value['breadcrumbs_blog'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value->breadcrumbs_blog;?>
</li>
        <?php }?>
    <?php } elseif ($_GET['module']=='ComparisonView') {?>
		<li data-language="<?php echo $_smarty_tpl->tpl_vars['translate_id']->value['breadcrumb_comparison'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value->breadcrumb_comparison;?>
</li>
    <?php } elseif ($_GET['module']=='WishlistView') {?>
	    <li data-language="<?php echo $_smarty_tpl->tpl_vars['translate_id']->value['breadcrumb_wishlist'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value->breadcrumb_wishlist;?>
</li>
    <?php }?>
</ol><?php }} ?>
