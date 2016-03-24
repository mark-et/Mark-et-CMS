<?php /* Smarty version Smarty-3.1.18, created on 2016-03-24 19:56:52
         compiled from "Z:\home\loc\Okay\design\default\html\main.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2666256f44684b34cf6-42760823%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '6d8ba3825116a77b5785535f608306f423a7760d' => 
    array (
      0 => 'Z:\\home\\loc\\Okay\\design\\default\\html\\main.tpl',
      1 => 1458822194,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2666256f44684b34cf6-42760823',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'featured_products' => 0,
    'translate_id' => 0,
    'lang' => 0,
    'new_products' => 0,
    'discounted_products' => 0,
    'page' => 0,
    'last_posts' => 0,
    'lang_link' => 0,
    'post' => 0,
    'config' => 0,
    'all_brands' => 0,
    'b' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.18',
  'unifunc' => 'content_56f44684e62f37_62298038',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56f44684e62f37_62298038')) {function content_56f44684e62f37_62298038($_smarty_tpl) {?>

<?php $_smarty_tpl->tpl_vars['canonical'] = new Smarty_variable('', null, 1);
if ($_smarty_tpl->parent != null) $_smarty_tpl->parent->tpl_vars['canonical'] = clone $_smarty_tpl->tpl_vars['canonical'];?>


<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['get_featured_products'][0][0]->get_featured_products_plugin(array('var'=>'featured_products','limit'=>4),$_smarty_tpl);?>

<?php if ($_smarty_tpl->tpl_vars['featured_products']->value) {?>
	<div class="border-b-1-info p-y-1">
		<div class="container">
			
			<div class="h1 m-b-1">
				<span data-language="<?php echo $_smarty_tpl->tpl_vars['translate_id']->value['main_recommended_products'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value->main_recommended_products;?>
</span>
			</div>
			<div class="row">
				<?php  $_smarty_tpl->tpl_vars['product'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['product']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['featured_products']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['product']->iteration=0;
foreach ($_from as $_smarty_tpl->tpl_vars['product']->key => $_smarty_tpl->tpl_vars['product']->value) {
$_smarty_tpl->tpl_vars['product']->_loop = true;
 $_smarty_tpl->tpl_vars['product']->iteration++;
?>
					<div class="col-md-4 col-xl-3">
						<?php echo $_smarty_tpl->getSubTemplate ("tiny_products.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

					</div>
					<?php if ($_smarty_tpl->tpl_vars['product']->iteration%3==0) {?><div class="col-xs-12 hidden-sm-down hidden-md-up"></div><?php }?>
				<?php } ?>
			</div>
		</div>
	</div>
<?php }?>


<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['get_new_products'][0][0]->get_new_products_plugin(array('var'=>'new_products','limit'=>4),$_smarty_tpl);?>

<?php if ($_smarty_tpl->tpl_vars['new_products']->value) {?>
	<div class="border-b-1-info p-y-1">
		<div class="container">
			
			<div class="h1 m-b-1">
				<span data-language="<?php echo $_smarty_tpl->tpl_vars['translate_id']->value['main_new_products'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value->main_new_products;?>
</span>
			</div>

			<div class="row">
				<?php  $_smarty_tpl->tpl_vars['product'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['product']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['new_products']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['product']->iteration=0;
foreach ($_from as $_smarty_tpl->tpl_vars['product']->key => $_smarty_tpl->tpl_vars['product']->value) {
$_smarty_tpl->tpl_vars['product']->_loop = true;
 $_smarty_tpl->tpl_vars['product']->iteration++;
?>
					<div class="col-md-4 col-xl-3">
						<?php echo $_smarty_tpl->getSubTemplate ("tiny_products.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

					</div>
					<?php if ($_smarty_tpl->tpl_vars['product']->iteration%3==0) {?><div class="col-xs-12 hidden-sm-down hidden-xl-up"></div><?php }?>
				<?php } ?>
			</div>
		</div>
	</div>
<?php }?>


<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['get_discounted_products'][0][0]->get_discounted_products_plugin(array('var'=>'discounted_products','limit'=>4),$_smarty_tpl);?>

<?php if ($_smarty_tpl->tpl_vars['discounted_products']->value) {?>
	<div class="border-b-1-info p-y-1">
		<div class="container">
			
			<div class="h1 m-b-1">
				<span data-language="<?php echo $_smarty_tpl->tpl_vars['translate_id']->value['main_action_goods'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value->main_action_goods;?>
</span>
			</div>
			<div class="row">
				<?php  $_smarty_tpl->tpl_vars['product'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['product']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['discounted_products']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['product']->iteration=0;
foreach ($_from as $_smarty_tpl->tpl_vars['product']->key => $_smarty_tpl->tpl_vars['product']->value) {
$_smarty_tpl->tpl_vars['product']->_loop = true;
 $_smarty_tpl->tpl_vars['product']->iteration++;
?>
					<div class="col-md-4 col-xl-3">
						<?php echo $_smarty_tpl->getSubTemplate ("tiny_products.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

					</div>
					<?php if ($_smarty_tpl->tpl_vars['product']->iteration%3==0) {?><div class="col-xs-12 hidden-sm-down hidden-md-up"></div><?php }?>
				<?php } ?>
			</div>
		</div>
	</div>
<?php }?>

<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['get_posts'][0][0]->get_posts_plugin(array('var'=>'last_posts','limit'=>3),$_smarty_tpl);?>

<?php if ($_smarty_tpl->tpl_vars['page']->value->body||$_smarty_tpl->tpl_vars['last_posts']->value) {?>
	<div class="bg-info border-b-1-info">
		<div class="container">
			<div class="row">
				
				<?php if ($_smarty_tpl->tpl_vars['page']->value->body) {?>
					<div class="p-y-1 m-y-m1 m-y-0_md-down<?php if ($_smarty_tpl->tpl_vars['last_posts']->value) {?> col-lg-6<?php } else { ?> col-lg-12<?php }?>">
						
						<h1 class="h4 font-weight-bold"><?php echo $_smarty_tpl->tpl_vars['page']->value->header;?>
</h1>

						
						<?php echo $_smarty_tpl->tpl_vars['page']->value->body;?>

					</div>
				<?php }?>

				
				<?php if ($_smarty_tpl->tpl_vars['last_posts']->value) {?>
					<div class="p-y-1 m-y-m1 m-y-0_md-down bg-white-md_down border-l-1-white-lg_up<?php if ($_smarty_tpl->tpl_vars['page']->value->body) {?> col-lg-6<?php } else { ?> col-lg-12<?php }?>">
						<div class="h4 m-b-1 text-xs-center text-lg-left clearfix">
							
							<span data-language="<?php echo $_smarty_tpl->tpl_vars['translate_id']->value['main_news'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value->main_news;?>
</span>

							
							<a class="h6 link-blue link-inverse pull-xs-right m-t-4px m-b-0 hidden-md-down" href="<?php echo $_smarty_tpl->tpl_vars['lang_link']->value;?>
blog" data-language="<?php echo $_smarty_tpl->tpl_vars['translate_id']->value['main_all_news'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value->main_all_news;?>
</a>
						</div>
						<div class="row">
							<?php  $_smarty_tpl->tpl_vars['post'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['post']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['last_posts']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['post']->key => $_smarty_tpl->tpl_vars['post']->value) {
$_smarty_tpl->tpl_vars['post']->_loop = true;
?>
                                <div class="col-md-12 p-y-1">
                                    <div class="col-xs-12 col-md-3 hidden-md-down">
                                        <a class="blog-img" href="<?php echo $_smarty_tpl->tpl_vars['lang_link']->value;?>
blog/<?php echo $_smarty_tpl->tpl_vars['post']->value->url;?>
">
                                            
                                            <div class="blog-data"><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['date'][0][0]->date_modifier($_smarty_tpl->tpl_vars['post']->value->date);?>
</div>

                                            
                                            <?php if ($_smarty_tpl->tpl_vars['post']->value->image) {?>
                                                <img class="hidden-md-down" src="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['resize'][0][0]->resize_modifier($_smarty_tpl->tpl_vars['post']->value->image,77,77,false,$_smarty_tpl->tpl_vars['config']->value->resized_blog_dir);?>
" alt="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['post']->value->name, ENT_QUOTES, 'UTF-8', true);?>
" title="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['post']->value->name, ENT_QUOTES, 'UTF-8', true);?>
"/>
                                            <?php }?>
                                        </a>
                                    </div>
                                    <div class="col-xs-12 col-md-8 m-b-1-md_down">
                                        
                                        <div class="h5 font-weight-bold">
                                            <a class="link-black" href="<?php echo $_smarty_tpl->tpl_vars['lang_link']->value;?>
blog/<?php echo $_smarty_tpl->tpl_vars['post']->value->url;?>
" data-post="<?php echo $_smarty_tpl->tpl_vars['post']->value->id;?>
"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['post']->value->name, ENT_QUOTES, 'UTF-8', true);?>
</a>
                                        </div>

                                        
                                        <?php if ($_smarty_tpl->tpl_vars['post']->value->annotation) {?>
                                            <div class="blog-annotation">
                                                <?php echo $_smarty_tpl->tpl_vars['post']->value->annotation;?>

                                            </div>
                                        <?php }?>
                                    </div>
                                </div>
							<?php } ?>
						</div>
						
						<div class="clearfix hidden-lg-up">
							<a class="h6 link-blue link-inverse pull-xs-right m-t-4px m-b-0" href="<?php echo $_smarty_tpl->tpl_vars['lang_link']->value;?>
blog"><?php echo $_smarty_tpl->tpl_vars['lang']->value->main_all_news;?>
</a>
						</div>
					</div>
				<?php }?>
			</div>
		</div>
	</div>
<?php }?>

<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['get_brands'][0][0]->get_brands_plugin(array('var'=>'all_brands'),$_smarty_tpl);?>

<?php if ($_smarty_tpl->tpl_vars['all_brands']->value) {?>
	<div class="container p-y-1">
		
		<div class="h4 m-b-1">
			<span data-language="<?php echo $_smarty_tpl->tpl_vars['translate_id']->value['main_brands'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value->main_brands;?>
</span>
		</div>

		<div class="fn-slick-carousel okaycms slick-carousel">
			<?php  $_smarty_tpl->tpl_vars['b'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['b']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['all_brands']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['b']->key => $_smarty_tpl->tpl_vars['b']->value) {
$_smarty_tpl->tpl_vars['b']->_loop = true;
?>
				
				<?php if ($_smarty_tpl->tpl_vars['b']->value->image) {?>
					
					<a href="<?php echo $_smarty_tpl->tpl_vars['lang_link']->value;?>
brands/<?php echo $_smarty_tpl->tpl_vars['b']->value->url;?>
" data-brand="<?php echo $_smarty_tpl->tpl_vars['b']->value->id;?>
">
						<img src="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['resize'][0][0]->resize_modifier($_smarty_tpl->tpl_vars['b']->value->image,183,183,false,$_smarty_tpl->tpl_vars['config']->value->resized_brands_dir);?>
" alt="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['b']->value->name, ENT_QUOTES, 'UTF-8', true);?>
" title="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['b']->value->name, ENT_QUOTES, 'UTF-8', true);?>
">
					</a>
				<?php } else { ?>
					
					<a href="<?php echo $_smarty_tpl->tpl_vars['lang_link']->value;?>
brands/<?php echo $_smarty_tpl->tpl_vars['b']->value->url;?>
" data-brand="<?php echo $_smarty_tpl->tpl_vars['b']->value->id;?>
"><?php echo $_smarty_tpl->tpl_vars['b']->value->name;?>
</a>
				<?php }?>
			<?php } ?>
		</div>
	</div>
<?php }?><?php }} ?>
