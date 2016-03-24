<?php /* Smarty version Smarty-3.1.18, created on 2016-03-24 20:25:19
         compiled from "backend\design\html\tinymce_init.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2306556f44d2f91b482-87589358%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'e6eb433462910bdee11c1e50fdc6f3b5879bda11' => 
    array (
      0 => 'backend\\design\\html\\tinymce_init.tpl',
      1 => 1458822194,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2306556f44d2f91b482-87589358',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'config' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.18',
  'unifunc' => 'content_56f44d2f9922e1_72313835',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56f44d2f9922e1_72313835')) {function content_56f44d2f9922e1_72313835($_smarty_tpl) {?><?php if ($_smarty_tpl->tpl_vars['config']->value->subfolder!='/') {?>
    <script type="text/javascript" src="/<?php echo $_smarty_tpl->tpl_vars['config']->value->subfolder;?>
backend/design/js/tinymce_jq/tinymce.min.js"></script>
<?php } else { ?>
    <script type="text/javascript" src="/backend/design/js/tinymce_jq/tinymce.min.js"></script>
<?php }?>

<script>
    $(function(){
        tinyMCE.init({
            selector: "textarea.editor_large, textarea.editor_small",
            plugins: [
                "advlist autolink lists link image preview anchor responsivefilemanager",
                "code fullscreen save textcolor colorpicker charmap nonbreaking",
                "insertdatetime media table contextmenu paste imagetools"
            ],
            toolbar_items_size : 'small',
            menubar:'file edit insert view format table tools',
            toolbar1: "fontselect formatselect fontsizeselect | bold italic underline | alignleft aligncenter alignright | bullist numlist | forecolor backcolor | table | link unlink anchor media image | fullscreen code",
            statusbar: true,
            font_formats: "Andale Mono=andale mono,times;"+
            "Arial=arial,helvetica,sans-serif;"+
            "Arial Black=arial black,avant garde;"+
            "Book Antiqua=book antiqua,palatino;"+
            "Comic Sans MS=comic sans ms,sans-serif;"+
            "Courier New=courier new,courier;"+
            "Georgia=georgia,palatino;"+
            "Helvetica=helvetica;"+
            "Impact=impact,chicago;"+
            "Symbol=symbol;"+
            "Tahoma=tahoma,arial,helvetica,sans-serif;"+
            "Terminal=terminal,monaco;"+
            "Times New Roman=times new roman,times;"+
            "Trebuchet MS=trebuchet ms,geneva;"+
            "Verdana=verdana,geneva;"+
            "Webdings=webdings;"+
            "Wingdings=wingdings,zapf dingbats",


            image_advtab: true,
            <?php if ($_smarty_tpl->tpl_vars['config']->value->subfolder!='/') {?>
            external_filemanager_path:"/<?php echo $_smarty_tpl->tpl_vars['config']->value->subfolder;?>
backend/design/js/filemanager/",
            filemanager_title:"Файловый менеджер" ,
            external_plugins: { "filemanager" : "/<?php echo $_smarty_tpl->tpl_vars['config']->value->subfolder;?>
backend/design/js/filemanager/plugin.min.js"},
            <?php } else { ?>
            external_filemanager_path:"/backend/design/js/filemanager/",
            filemanager_title:"Файловый менеджер" ,
            external_plugins: { "filemanager" : "/backend/design/js/filemanager/plugin.min.js"},
            <?php }?>


            save_enablewhendirty: true,
            save_title: "save",
            theme_advanced_buttons3_add : "save",
            save_onsavecallback: function() {
                $("[type='submit']").trigger("click");
                },

            language : "ru",
            /* Замена тега P на BR при разбивке на абзацы
             force_br_newlines : true,
             force_p_newlines : false,
             forced_root_block : '',
             */
            setup : function(ed) {
                ed.on('keyup change', (function() {
                    set_meta();
                }));
            }

            });
    });

</script><?php }} ?>
