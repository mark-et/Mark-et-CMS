<?php /* Smarty version Smarty-3.1.18, created on 2016-03-24 19:56:52
         compiled from "Z:\home\loc\Okay\design\default\html\tiny_products.tpl" */ ?>
<?php /*%%SmartyHeaderCode:727156f44684ea74c4-61257929%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '7c478e8015bb29913cf5f79ede0f06cb4901801b' => 
    array (
      0 => 'Z:\\home\\loc\\Okay\\design\\default\\html\\tiny_products.tpl',
      1 => 1458841248,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '727156f44684ea74c4-61257929',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'product' => 0,
    'lang_link' => 0,
    'settings' => 0,
    'currency' => 0,
    'v' => 0,
    'translate_id' => 0,
    'lang' => 0,
    'comparison' => 0,
    'wished_products' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.18',
  'unifunc' => 'content_56f446853f7330_00091231',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56f446853f7330_00091231')) {function content_56f446853f7330_00091231($_smarty_tpl) {?>
<div class="fn-product card <?php if ($_GET['module']=="ComparisonView") {?>fn-resize m-b-0 border-b-1-primary<?php }?>">
	<div class="card-block fn-transfer">
		
		<a class="<?php if ($_GET['module']=="ComparisonView") {?>fn-zoom okaycms <?php }?>card-image m-b-1" href="<?php if ($_GET['module']=="ComparisonView") {?><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['resize'][0][0]->resize_modifier($_smarty_tpl->tpl_vars['product']->value->image->filename,800,600,'w');?>
<?php } else { ?><?php echo $_smarty_tpl->tpl_vars['lang_link']->value;?>
products/<?php echo $_smarty_tpl->tpl_vars['product']->value->url;?>
<?php }?>">
            <?php if ($_smarty_tpl->tpl_vars['product']->value->image->filename) {?>
                <img class="fn-img" src="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['resize'][0][0]->resize_modifier($_smarty_tpl->tpl_vars['product']->value->image->filename,219,172);?>
" alt="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['product']->value->name, ENT_QUOTES, 'UTF-8', true);?>
" title="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['product']->value->name, ENT_QUOTES, 'UTF-8', true);?>
"/>
                <?php if ($_smarty_tpl->tpl_vars['product']->value->special) {?>
                    <img class="card-spec" src='files/special/<?php echo $_smarty_tpl->tpl_vars['product']->value->special;?>
' alt='<?php echo $_smarty_tpl->tpl_vars['product']->value->sp_img;?>
'/>
                <?php }?>
            <?php } else { ?>
                <img class="fn-img" src="design/<?php echo $_smarty_tpl->tpl_vars['settings']->value->theme;?>
/images/no_image.png" alt="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['product']->value->name, ENT_QUOTES, 'UTF-8', true);?>
"/>
                <?php if ($_smarty_tpl->tpl_vars['product']->value->special) {?>
                    <img class="card-spec" src='files/special/<?php echo $_smarty_tpl->tpl_vars['product']->value->special;?>
' alt='<?php echo $_smarty_tpl->tpl_vars['product']->value->sp_img;?>
'/>
                <?php }?>
            <?php }?>
		</a>

		
		<div class="card-title m-b-1">
			<a data-product="<?php echo $_smarty_tpl->tpl_vars['product']->value->id;?>
" href="<?php echo $_smarty_tpl->tpl_vars['lang_link']->value;?>
products/<?php echo $_smarty_tpl->tpl_vars['product']->value->url;?>
"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['product']->value->name, ENT_QUOTES, 'UTF-8', true);?>
</a>
		</div>

		<div class="row card-price-block">
			
			<div class="col-xs-6 text-line-through text-red<?php if (!$_smarty_tpl->tpl_vars['product']->value->variant->compare_price) {?> hidden-xs-up<?php }?>">
				<span class="fn-old_price"><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['convert'][0][0]->convert($_smarty_tpl->tpl_vars['product']->value->variant->compare_price);?>
</span> <?php echo htmlspecialchars($_smarty_tpl->tpl_vars['currency']->value->sign, ENT_QUOTES, 'UTF-8', true);?>

			</div>

			
			<div class="<?php if (!$_smarty_tpl->tpl_vars['product']->value->variant->compare_price) {?>col-xs-12<?php } else { ?>col-xs-6<?php }?> h5 font-weight-bold m-b-0">
				<span class="fn-price"><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['convert'][0][0]->convert($_smarty_tpl->tpl_vars['product']->value->variant->price);?>
</span> <?php echo htmlspecialchars($_smarty_tpl->tpl_vars['currency']->value->sign, ENT_QUOTES, 'UTF-8', true);?>

			</div>
		</div>
		<form class="fn-variants okaycms" action="/<?php echo $_smarty_tpl->tpl_vars['lang_link']->value;?>
cart">
			
			<select name="variant" class="fn-variant okaycms form-control c-select<?php if (count($_smarty_tpl->tpl_vars['product']->value->variants)<2) {?> hidden-xs-up<?php }?>">
	            <?php  $_smarty_tpl->tpl_vars['v'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['v']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['product']->value->variants; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['v']->index=-1;
foreach ($_from as $_smarty_tpl->tpl_vars['v']->key => $_smarty_tpl->tpl_vars['v']->value) {
$_smarty_tpl->tpl_vars['v']->_loop = true;
 $_smarty_tpl->tpl_vars['v']->index++;
 $_smarty_tpl->tpl_vars['v']->first = $_smarty_tpl->tpl_vars['v']->index === 0;
?>
	                <option value="<?php echo $_smarty_tpl->tpl_vars['v']->value->id;?>
" data-price="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['convert'][0][0]->convert($_smarty_tpl->tpl_vars['v']->value->price);?>
" data-stock="<?php echo $_smarty_tpl->tpl_vars['v']->value->stock;?>
"<?php if ($_smarty_tpl->tpl_vars['v']->value->compare_price>0) {?> data-cprice="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['convert'][0][0]->convert($_smarty_tpl->tpl_vars['v']->value->compare_price);?>
"<?php }?><?php if ($_smarty_tpl->tpl_vars['v']->value->sku) {?> data-sku="<?php echo $_smarty_tpl->tpl_vars['v']->value->sku;?>
"<?php }?><?php if ($_smarty_tpl->tpl_vars['v']->first) {?> selected<?php }?>><?php if ($_smarty_tpl->tpl_vars['v']->value->name) {?><?php echo $_smarty_tpl->tpl_vars['v']->value->name;?>
<?php } else { ?><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['product']->value->name, ENT_QUOTES, 'UTF-8', true);?>
<?php }?></option>
	            <?php } ?>
	        </select>

            
            <?php if ($_GET['module']!="ComparisonView"&&$_GET['module']!="WishlistView") {?>
                <?php if (!$_smarty_tpl->tpl_vars['settings']->value->is_preorder) {?>
                    
                    <div class="fn-not_preorder m-b-1 <?php if ($_smarty_tpl->tpl_vars['product']->value->variant->stock>0) {?>hidden-xs-up<?php }?>">
                        <button class="btn btn-danger-outline btn-block disabled" type="button" data-language="<?php echo $_smarty_tpl->tpl_vars['translate_id']->value['tiny_products_out_of_stock'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value->tiny_products_out_of_stock;?>
</button>
                    </div>
                <?php } else { ?>
                    
                    <div class="fn-is_preorder m-b-1 <?php if ($_smarty_tpl->tpl_vars['product']->value->variant->stock>0) {?>hidden-xs-up<?php }?>">
                        <button class="btn btn-warning-outline btn-block i-preorder" type="submit" data-language="<?php echo $_smarty_tpl->tpl_vars['translate_id']->value['tiny_products_pre_order'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value->tiny_products_pre_order;?>
</button>
                    </div>
                <?php }?>
            <?php }?>


            <?php if ($_GET['module']!="ProductsView"&&$_GET['module']!="MainView"&&$_GET['module']!="ProductView") {?>
            <a class="btn-comparison-remove <?php if ($_GET['module']=="ComparisonView") {?>fn-comparison<?php } else { ?>fn-wishlist<?php }?> okaycms hidden-md-down selected" href="#" data-id="<?php echo $_smarty_tpl->tpl_vars['product']->value->id;?>
" title="<?php if ($_GET['module']=="ComparisonView") {?><?php echo $_smarty_tpl->tpl_vars['lang']->value->tiny_products_remove_comparison;?>
<?php } else { ?><?php echo $_smarty_tpl->tpl_vars['lang']->value->tiny_products_remove_favorite;?>
<?php }?>">&times;</a>
            <?php }?>
            <div class="input-group">
                <?php if ($_GET['module']!="ComparisonView") {?>
                    
                    <div class="input-group-btn text-xs-right">
                        <?php if (!in_array($_smarty_tpl->tpl_vars['product']->value->id,$_smarty_tpl->tpl_vars['comparison']->value->ids)) {?>
                            <a class="btn-comparison fn-comparison okaycms hidden-md-down" href="#" data-id="<?php echo $_smarty_tpl->tpl_vars['product']->value->id;?>
" title="<?php echo $_smarty_tpl->tpl_vars['lang']->value->tiny_products_add_comparison;?>
" data-result-text="<?php echo $_smarty_tpl->tpl_vars['lang']->value->tiny_products_remove_comparison;?>
" data-language="<?php echo $_smarty_tpl->tpl_vars['translate_id']->value['tiny_products_add_comparison'];?>
"></a>
                        <?php } else { ?>
                            <a class="btn-comparison fn-comparison okaycms hidden-md-down selected" href="#" data-id="<?php echo $_smarty_tpl->tpl_vars['product']->value->id;?>
" title="<?php echo $_smarty_tpl->tpl_vars['lang']->value->tiny_products_remove_comparison;?>
" data-result-text="<?php echo $_smarty_tpl->tpl_vars['lang']->value->tiny_products_add_comparison;?>
" data-language="<?php echo $_smarty_tpl->tpl_vars['translate_id']->value['tiny_products_remove_comparison'];?>
"></a>
                        <?php }?>
                    </div>
                <?php }?>

                <?php if ($_GET['module']!="WishlistView") {?>
                    
                    <div class="input-group-btn text-xs-left">
                        <?php if (in_array($_smarty_tpl->tpl_vars['product']->value->id,$_smarty_tpl->tpl_vars['wished_products']->value)) {?>
                            <a href="#" data-id="<?php echo $_smarty_tpl->tpl_vars['product']->value->id;?>
" class="btn-favorites fn-wishlist okaycms selected" title="<?php echo $_smarty_tpl->tpl_vars['lang']->value->tiny_products_remove_favorite;?>
" data-result-text="<?php echo $_smarty_tpl->tpl_vars['lang']->value->tiny_products_add_favorite;?>
" data-language="<?php echo $_smarty_tpl->tpl_vars['translate_id']->value['tiny_products_remove_favorite'];?>
"></a>
                        <?php } else { ?>
                            <a href="#" data-id="<?php echo $_smarty_tpl->tpl_vars['product']->value->id;?>
" class="btn-favorites fn-wishlist okaycms" title="<?php echo $_smarty_tpl->tpl_vars['lang']->value->tiny_products_add_favorite;?>
" data-result-text="<?php echo $_smarty_tpl->tpl_vars['lang']->value->tiny_products_remove_favorite;?>
" data-language="<?php echo $_smarty_tpl->tpl_vars['translate_id']->value['tiny_products_add_favorite'];?>
"></a>
                        <?php }?>
                    </div>
                <?php }?>

                
                <?php if ($_GET['module']=="ComparisonView"||$_GET['module']=="WishlistView") {?>
                <?php if (!$_smarty_tpl->tpl_vars['settings']->value->is_preorder) {?>
                    
                    <div class="fn-not_preorder <?php if ($_smarty_tpl->tpl_vars['product']->value->variant->stock>0) {?>hidden-xs-up<?php }?>">
                        <button class="btn btn-danger-outline btn-block disabled" type="button" data-language="<?php echo $_smarty_tpl->tpl_vars['translate_id']->value['tiny_products_out_of_stock'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value->tiny_products_out_of_stock;?>
</button>
                    </div>
                <?php } else { ?>
                    
                    <div class="fn-is_preorder <?php if ($_smarty_tpl->tpl_vars['product']->value->variant->stock>0) {?>hidden-xs-up<?php }?>">
                        <button class="btn btn-warning-outline btn-block i-preorder" type="submit" data-language="<?php echo $_smarty_tpl->tpl_vars['translate_id']->value['tiny_products_pre_order'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value->tiny_products_pre_order;?>
</button>
                    </div>
                <?php }?>
                <?php }?>
                
				<button class="fn-is_stock btn btn-warning btn-block i-add-cart<?php if ($_smarty_tpl->tpl_vars['product']->value->variant->stock<1) {?> hidden-xs-up<?php }?>" data-language="<?php echo $_smarty_tpl->tpl_vars['translate_id']->value['tiny_products_add_cart'];?>
" type="submit"><?php echo $_smarty_tpl->tpl_vars['lang']->value->tiny_products_add_cart;?>
</button>
            </div>
		</form>
    </div>
</div><?php }} ?>
