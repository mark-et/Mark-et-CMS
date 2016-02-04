{* Страница товара *}
{* Канонический адрес страницы *}
{$canonical="/products/{$product->url}" scope=parent}
{* @END Канонический адрес страницы *}
<div class="border-b-1-info">
	<div class="container">
		{* Хлебные крошки *}
		{include file='breadcrumb.tpl'}
		{* @END Хлебные крошки *}
		{* Заголовок страницы *}
		<h1 class="m-b-1">
			<span data-product="{$product->id}">{$product->name|escape}</span>
		</h1>
		{* @END Заголовок страницы *}
		<div class="row fn-transfer">
			{if $product->image}
				<div class="col-lg-5">
					<a class="fn-zoom okaycms btn-block relative border-a-1-info text-xs-center" href="{$product->image->filename|resize:800:600:w}" rel="group">
						{* Промо изображение *}
						{if $product->special}
							<img class="card-spec" alt='{$product->sp_img}' title='{$product->sp_img}'  src='files/special/{$product->special}'/>
						{/if}
						{* @END Промо изображение *}
						{* Большое фото товара *}
						<img class="fn-img" src="{$product->image->filename|resize:300:300}" alt="{$product->product->name|escape}"/>
						{* @END Большое фото товара *}
					</a>
					{* Дополнительные фото продукта *}
					{if $product->images|count > 1}
						<div class="row m-y-2 fn-slick-images okaycms">
							{* cut удаляет первую фотографию, если нужно начать 2-й - пишем cut:2 и тд *}
							{foreach $product->images|cut as $i=>$image}
								<div class="col-xs-4 col-lg-3">
									<a class="fn-zoom okaycms btn-block border-a-1-info text-xs-center product-images" href="{$image->filename|resize:800:600:w}" rel="group">
										<img src="{$image->filename|resize:87:72}" alt="{$product->name|escape}"/>
									</a>
								</div>
							{/foreach}
						</div>
					{/if}
					{* @END Дополнительные фото продукта *}
				</div>
            {else}
                <div class="col-lg-5">
                    <a class="fn-zoom okaycms btn-block relative border-a-1-info text-xs-center" href="design/{$settings->theme}/images/no_image.png" rel="group">
                        {* Промо изображение *}
                        {if $product->special}
                            <img class="card-spec" alt='{$product->sp_img}' title='{$product->sp_img}'  src='files/special/{$product->special}'/>
                        {/if}
                        {* @END Промо изображение *}
                        {* Большое фото товара *}
                        <img class="fn-img" src="design/{$settings->theme}/images/no_image.png" height="300" alt="{$product->product->name|escape}"/>
                        {* @END Большое фото товара *}
                    </a>
                </div>
			{/if}
			<div class="col-lg-7 fn-product">
				<form class="fn-variants okaycms row" action="/{$lang_link}cart">
					<div class="col-lg-6">
						{* Цена *}
						<div class="h4 font-weight-bold">
							<span class="fn-price">{$product->variant->price|convert}</span> {$currency->sign|escape}
						</div>
						{* @END Цена *}
						{* Старая цена *}
						<div class="text-line-through text-red{if !$product->variant->compare_price} hidden-xs-up{/if}">
							<span class="fn-old_price">{$product->variant->compare_price|convert}</span> {$currency->sign|escape}
						</div>
						{* @END Старая цена *}
						{* Рейтинг товара *}
						<div id="product_{$product->id}" class="product_rating">
							<span data-language="{$translate_id['product_rating']}">{$lang->product_rating}</span>:
							<span class="rating_starOff">
								<span class="rating_starOn" style="width:{$product->rating*90/5|string_format:'%.0f'}px;"></span>
							</span>
						</div>
						{* @END Рейтинг товара *}
						{* Артикул товара *}
						<div{if !$product->variant->sku} class="hidden-xs-up"{/if}><span data-language="{$translate_id['product_sku']}">{$lang->product_sku}</span>: <span class="fn-sku">{$product->variant->sku}</span></div>
						{* @END Артикул товара *}
						{* Варианты товара *}
						<select name="variant" class="fn-variant okaycms form-control c-select m-t-1 m-b-1-md_down{if $product->variants|count < 2} hidden-xs-up{/if}">
							{foreach $product->variants as $v}
								<option value="{$v->id}" data-price="{$v->price|convert}" data-stock="{$v->stock}"{if $v->compare_price > 0} data-cprice="{$v->compare_price|convert}"{/if}{if $v->sku} data-sku="{$v->sku}"{/if}{if $v@first} selected{/if}>{if $v->name}{$v->name}{else}{$product->name|escape}{/if}</option>
							{/foreach}
						</select>
						{* @END Варианты товара *}
					</div>
					<div class="col-lg-6">
						{* Нет на складе *}
						<div class="fn-not_preorder form-group{if $product->variant->stock > 0 || $product->variant->stock == 0 && $settings->is_preorder} hidden-xs-up{/if}">
							<button class="btn btn-danger-outline btn-block disabled h5" type="button" data-language="{$translate_id['product_out_of_stock']}">{$lang->product_out_of_stock}</button>
						</div>
						{* @END Нет на складе *}
						{* Предзаказ *}
						<div class="fn-is_preorder form-group{if $product->variant->stock > 0 || $product->variant->stock == 0 && !$settings->is_preorder} hidden-xs-up{/if}">
							<button class="btn btn-warning-outline btn-block i-preorder" type="submit" data-language="{$translate_id['product_pre_order']}">{$lang->product_pre_order}</button>
						</div>
						{* @END Предзаказ *}
						<div class="fn-product-amount fn-is_stock okaycms text-xs-center text-md-left{if $product->variant->stock < 1} hidden-xs-up{/if}">
							{* Кол-во товаров *}
							<span class="minus">&minus;</span>
							<input class="form-control" type="text" name="amount" value="1" data-max="{$product->variant->stock}">
							<span class="plus">&plus;</span>
							{* @END Кол-во товаров *}
							{* Кнопка добавления в корзину *}
							<button class="btn btn-warning i-add-cart{if $product->variant->stock < 1} hidden-xs-up{/if}" type="submit" data-language="{$translate_id['product_add_cart']}">{$lang->product_add_cart}</button>
							{* @END Кнопка добавления в корзину *}
						</div>
						{* Сравнение *}
						<div class="form-group m-t-1 text-xs-center text-md-left hidden-md-down">
							{if !in_array($product->id,$comparison->ids)}
								<a class="i-comparison fn-comparison okaycms selected" href="#" data-id="{$product->id}" title="{$lang->product_add_comparison}" data-result-text="{$lang->product_remove_comparison}" data-language="{$translate_id['product_add_comparison']}"></a>
							{else}
								<a class="i-comparison fn-comparison okaycms" href="#" data-id="{$product->id}" title="{$lang->product_remove_comparison}" data-result-text="{$lang->product_add_comparison}" data-language="{$translate_id['product_remove_comparison']}"></a>
							{/if}
						</div>
						{* @END Сравнение *}
						{* Избранное *}
						<div class="form-group text-xs-center text-md-left m-t-1">
							{if $product->id|in_array:$wished_products}
								<a href="#" data-id="{$product->id}" class="i-favorites fn-wishlist okaycms selected" title="{$lang->product_remove_favorite}" data-result-text="{$lang->product_add_favorite}" data-language="{$translate_id['product_remove_favorite']}"></a>
							{else}
								<a href="#" data-id="{$product->id}" class="i-favorites fn-wishlist okaycms" title="{$lang->product_add_favorite}" data-result-text="{$lang->product_remove_favorite}" data-language="{$translate_id['product_add_favorite']}"></a>
							{/if}
						</div>
						{* @END Избранное *}
					</div>
				</form>
				<div class="row">
					{* Способ доставки *}
					<div class="col-lg-6">
						<div class="bg-info p-a-1 m-y-1">
							<div class="h5 i-delivery">
								<span data-language="{$translate_id['product_delivery']}">{$lang->product_delivery}</span>
							</div>
							<ul class="m-b-0">
								<li>
									<span data-language="{$translate_id['product_delivery_1']}">{$lang->product_delivery_1}</span>
								</li>
								<li>
									<span data-language="{$translate_id['product_delivery_2']}">{$lang->product_delivery_2}</span>
								</li>
								<li>
									<span data-language="{$translate_id['product_delivery_3']}">{$lang->product_delivery_3}</span>
								</li>
								<li>
									<span data-language="{$translate_id['product_delivery_4']}">{$lang->product_delivery_4}</span>
								</li>
							</ul>
						</div>
					</div>
					{* @END Способ доставки *}
					{* Способ оплаты *}
					<div class="col-lg-6">
						<div class="bg-pink p-a-1 m-y-1">
							<div class="h5 i-payment">
								<span data-language="{$translate_id['product_payment']}">{$lang->product_payment}</span>
							</div>
							<ul class="m-b-0">
								<li>
									<span data-language="{$translate_id['product_payment_1']}">{$lang->product_payment_1}</span>
								</li>
								<li>
									<span data-language="{$translate_id['product_payment_2']}">{$lang->product_payment_2}</span>
								</li>
								<li>
									<span data-language="{$translate_id['product_payment_3']}">{$lang->product_payment_3}</span>
								</li>
								<li>
									<span data-language="{$translate_id['product_payment_4']}">{$lang->product_payment_4}</span>
								</li>
							</ul>
						</div>
					</div>
					{* @END Способ оплаты *}
				</div>
				{* Поделиться в соц. сетях *}
				<div class="p-y-05 text-xs-center text-md-left">
					<span data-language="{$translate_id['product_share']}">{$lang->product_share}</span>:
				</div>
				<div class="ya-share2 m-b-2 text-xs-center text-md-left" data-services="vkontakte,facebook,twitter"></div>
				{* @END Поделиться в соц. сетях *}
			</div>
		</div>
		{* Навигация табов *}
		<ul class="nav nav-tabs hidden-md-down" role="tablist">
			{* Описание *}
			{if $product->body}
				<li class="nav-item">
					<a class="nav-link active" data-toggle="tab" href="#annotation" role="tab" data-language="{$translate_id['product_description']}">{$lang->product_description}</a>
				</li>
			{/if}
			{* @END Описание *}
			{* Характеристики *}
			{if $product->features}
				<li class="nav-item">
					<a class="nav-link {if !$product->body} active{/if}" data-toggle="tab" href="#features" role="tab" data-language="{$translate_id['product_features']}">{$lang->product_features}</a>
				</li>
			{/if}
			{* @END Характеристики *}
			{* Комментарии *}
			<li class="nav-item">
				<a class="nav-link{if !$product->features && !$product->body} active{/if}" data-toggle="tab" href="#comments" role="tab" data-language="{$translate_id['product_comments']}">{$lang->product_comments}</a>
			</li>
			{* @END Комментарии *}
		</ul>
		{* Навигация табов *}
		{* Контент табов *}
		<div class="tab-content p-y-2">
			{* Описание *}
			{if $product->body}
				<button class="btn btn-block btn-link border-a-1-info m-b-1 hidden-lg-up" type="button" data-toggle="collapse" data-target="#annotation" aria-expanded="false" aria-controls="annotation">{$lang->product_description}</button>
				<div class="tab-pane collapse active" id="annotation" role="tabpanel">
					{$product->body}
				</div>
			{/if}
			{* @END Описание *}
			{* Характеристики *}
			{if $product->features}
				<button class="btn btn-block btn-link border-a-1-info m-b-1 hidden-lg-up" type="button" data-toggle="collapse" data-target="#features" aria-expanded="false" aria-controls="features">{$lang->product_features}</button>
				<div class="tab-pane collapse {if !$product->body} active{/if}" id="features" role="tabpanel">
					<div class="row">
						<div class="col-lg-7">
							<table class="table table-striped">
								{foreach $product->features as $f}
									<tr>
										<td>{$f->name}</td>
										<td>{$f->value}</td>
									</tr>
								{/foreach}
							</table>
						</div>
					</div>
				</div>
			{/if}
			{* @END Характеристики *}
			{* Комментарии *}
			<button class="btn btn-block btn-link border-a-1-info hidden-lg-up" type="button" data-toggle="collapse" data-target="#comments" aria-expanded="false" aria-controls="comments">{$lang->product_comments}</button>
			<div class="tab-pane collapse{if !$product->features && !$product->body} active{/if}" id="comments" role="tabpanel">
				<div class="row">
					{* Список с комментариями *}
					<div class="col-lg-7">
						{if $comments}
							{foreach $comments as $comment}
								{* Якорь комментария *}
								{* после добавления комментария кидает автоматически по якорю *}
								<a name="comment_{$comment->id}"></a>
								{* @END Якорь комментария *}
								<div class="m-b-1">
									{* Имя комментария *}
									<div>
										<span class="h5">{$comment->name|escape}</span>
									</div>
									{* @END Имя комментария *}
									<div class="p-y-05">
										{* Дата комментария *}
										<span class="blog-data static">{$comment->date|date}, {$comment->date|time}</span>
										{* @END Дата комментария *}
										{* Статус комментария *}
										{if !$comment->approved}
											<span class="font-weight-bold text-muted" data-language="{$translate_id['post_comment_status']}">({$lang->post_comment_status})</span>
										{/if}
										{* @END Статус комментария *}
									</div>
									{* Тело комментария *}
									{$comment->text|escape|nl2br}
									{* @END Тело комментария *}
								</div>
							{/foreach}
						{else}
							<div class="text-muted m-b-1">
								<span data-language="{$translate_id['cart_header']}">{$lang->product_no_comments}</span>
							</div>
						{/if}
					</div>
					{* Список с комментариями *}
					<div class="col-lg-5 bg-info p-y-1">
						<!--Форма отправления комментария-->
						<form class="form comment_form" method="post">
							<div class="h3 text-xs-center">
								<span data-language="{$translate_id['product_write_comment']}">{$lang->product_write_comment}</span>
							</div>
							{* Вывод ошибок формы *}
							{if $error}
								<div class="p-x-1 p-y-05 m-b-1 bg-danger text-white">
									{if $error=='captcha'}
										<span data-language="{$translate_id['form_error_captcha']}">{$lang->form_error_captcha}</span>
									{elseif $error=='empty_name'}
										<span data-language="{$translate_id['form_enter_name']}">{$lang->form_enter_name}</span>
									{elseif $error=='empty_comment'}
										<span data-language="{$translate_id['form_enter_comment']}">{$lang->form_enter_comment}</span>
									{/if}
								</div>
							{/if}
							{* Вывод ошибок формы *}
							<div class="row">
								{* Имя комментария *}
								<div class="col-lg-5 form-group">
									<input class="form-control" type="text" name="name" value="{$comment_name|escape}" data-format=".+" data-notice="{$lang->form_enter_name}" data-language="{$translate_id['form_name']}" placeholder="{$lang->form_name}*"/>
								</div>
								{* @END Имя комментария *}
								{if $settings->captcha_product}
									<div class="col-xs-12 col-lg-7 form-inline m-b-1-md_down">
										{* Изображение капчи *}
										<div class="form-group">
											<img class="brad-3" src="captcha/image.php?{math equation='rand(10,10000)'}" alt='captcha'/>
										</div>
										{* @END Изображение капчи *}
										{* Поле ввода капчи *}
										<div class="form-group">
											<input class="form-control" type="text" name="captcha_code" value="" data-format="\d\d\d\d\d" data-notice="{$lang->form_enter_captcha}" data-language="{$translate_id['form_enter_captcha']}" placeholder="{$lang->form_enter_captcha}*"/>
										</div>
										{* @END Поле ввода капчи *}
									</div>
								{/if}
							</div>
							{* Текст комментария *}
							<div class="form-group">
								<textarea class="form-control" rows="3" name="text" data-format=".+" data-notice="{$lang->form_enter_comment}" data-language="{$translate_id['form_enter_comment']}" placeholder="{$lang->form_enter_comment}*">{$comment_text}</textarea>
							</div>
							{* @END Текст комментария *}
							{* Кнопка отправки формы *}
							<div class="text-xs-right">
								<input class="btn btn-warning" type="submit" name="comment" data-language="{$translate_id['form_send']}" value="{$lang->form_send}"/>
							</div>
							{* @END Кнопка отправки формы *}
						</form>
					</div>
				</div>
			</div>
			{* @END Комментарии *}
		</div>
		{* @END Контент табов *}
		{* Соседние товары *}
		{if $prev_product || $next_product}
			<nav>
				<ol class="pager">
					<li>
						{if $prev_product}
							<a href="products/{$prev_product->url}">← {$prev_product->name|escape}</a>
						{/if}
					</li>
					<li>
						{if $next_product}
							<a href="products/{$next_product->url}">{$next_product->name|escape} →</a>
						{/if}
					</li>
				</ol>
			</nav>
		{/if}
		{* @END Соседние товары *}
	</div>
</div>
{* Связанные товары *}
{if $related_products}
<div class="p-y-2">
	<div class="container">
		<div class="h1 m-b-1">
			<span data-language="{$translate_id['product_recommended_products']}">{$lang->product_recommended_products}</span>
		</div>
		<div class="row">
			{foreach $related_products as $product}
				<div class="col-md-4 col-lg-4 col-xl-3{if $product@iteration == 4} hidden-lg{/if}">
					{include "tiny_products.tpl"}
				</div>
			{/foreach}
		</div>
	</div>
</div>
{/if}
{* @END Связанные товары *}