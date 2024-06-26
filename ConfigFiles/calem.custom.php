<?php 
/**
* DB configuration
*/
$_CALEM_dist['calem_db_name'] = 'calemeam';
$_CALEM_dist['calem_db_host'] = 'localhost';
$_CALEM_dist['calem_db_user'] = 'calemeam';
$_CALEM_dist['calem_db_password'] = 'calemeam';

//Application host for db use
$_CALEM_dist['calem_application_host'] = 'localhost';

//Admin user name and password to create Calem DB
$_CALEM_dist['db_admin_user'] = 'root';
$_CALEM_dist['db_admin_password'] = '';

/**
* URI configuration
*/
$_CALEM_dist['calem_root_uri']='/CalemEAM';
$_CALEM_dist['calem_request_uri']='/CalemEAM/index.php';
$_CALEM_dist['calem_soap_uri']='/CalemEAM/CalemSoapService.php';
$_CALEM_dist['jsminClass']=array('path'=>'build', 'class'=>'CalemJsMinExe');
$_CALEM_dist['jsmin_exe']='build/jsmin/jsmin.exe';

/** Add Russian */ 
$_CALEM_dist['client_lang_list']['CalemMsg_ru.js']=array('AjxMsg'=>array('AjxMsg_ru'), 'I18nMsg'=>array('I18nMsg', 'I18nMsg_ru', 'I18nMsg_ru_RU'), 'CalemMsg'=>array('CalemMsg_ru', 'CalemMsgCustom_ru')); 
$_CALEM_dist['client_language']='ru';

?>
