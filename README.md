# ✨cyrillic_CalemEAM ✨

This file describes the installation and Russification of Computerized Maintenance Management System (CMMS) / Enterprise Asset Management (EAM) Calem (c) Community Edition R2.1e https://www.calemeam.com/community

## Install WAMPP with this features
- WAMPP must be not great 5 (5.6.40 for example)
PHP must be no higher than version 5 (in version 5 the interpreter issues a warning for the Calem PHP code, in version 8 this is already an error)
- After installing WAMPP, it’s a good idea to create a link to the installed PHP interpreter in a folder whose path is known in the environment as the place to search for applications.
```sh
ln -s /opt/lampp/bin/php-5.6.40 /usr/bin/php
```
## Auto-Start XAMPP
> The following recommendations for autostarting WAMPP at boot are taken from: http://facweb.iitkgp.ac.in/dashboard/docs/auto-start-xampp.html#debian_like_distributions_debian_ubuntu

By default, you have to start XAMPP or its components manually every time you reboot your system. However, you can also configure XAMPP components to start automatically on system boot. Follow the steps below for your platform:
- Copy the /opt/lampp/lampp script to the /etc/init.d directory in Debian-like distributions (Debian, Ubuntu, …​).
```sh
sudo cp /opt/lampp/lampp /etc/init.d
```
- Add or modify the following lines at the beginning of the /etc/init.d/lampp script.
```sh
### BEGIN INIT INFO
# Provides:          xampp
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start XAMPP at boot time
# Description:       Enable services provided by XAMPP.
### END INIT INFO
```
- Add the script to the default runlevels and enable it.
```sh
sudo update-rc.d -f lampp defaults
sudo update-rc.d -f lampp enable
```
## Unpack CalemEAM, set permissions and edit config files
 CalemEAM is a self-contained application that is nested inside the LAMP stack at /opt/lampp/htdocs.  The CalemEAM package that was downloaded earlier needs to be extracted to this directory and then the proper permissions set for Linux.  The following steps will move CalemEAM into place and set the configuration requirements.
- Navigate to /opt/lampp/htdocs and extract the CalemEAM gzip file:
```sh
cd /opt/lampp/htdocs
tar xzvf CalemEAM_R2.1e.tar.gz
```
- Now the proper permissions have to be set on the directory in order for things to operate the way we expect.  We also need to copy the CalemEAM Apache httpd configuration file into the proper location.  But first, you need to determine what user and group you want to use to run Apache.  The default is user daemon and group daemon.  For the purposes of this guide, I am taking the defaults and just using those.  If you want to change the user and groups within Apache you can do so. 
Perform the following to set the permissions and copy the httpd file from within the /opt/lampp/htdocs directory.
```sh
cd /opt/lampp/htdocs
chown -R daemon:daemon CalemEAM/
chmod 755 CalemEAM
```
> Set file permissions:

```sh
sudo find /opt/lampp/htdocs/CalemEAM -type f -exec chmod 644 {} \;
```
> Set directory permissions:

```sh
sudo find /opt/lampp/htdocs/CalemEAM -type d -exec chmod 755 {} \;
```
- Now edit the WAMPP httpd configuration file into place:
```sh
nano /opt/lampp/etc/httpd.conf
```
> Append the following to the end of the file:

```sh
# CalemEAM
Include "/opt/lampp/htdocs/CalemEAM/etc/httpd-calemeam.conf"
```
- And now configure the php.ini file for error reporting
This is a very important step and if it is skipped can cause all kinds of errors when you try to log on to the new system.  Perform the following to edit the php.ini file:
```sh
nano /opt/lampp/etc/php.ini
```
> Locate and edit the following line from this:

```sh
error_reporting=E_ALL & ~E_DEPRECATED & ~E_STRICT
```
> Replace it to this:

```sh
error_reporting=E_ALL & ~E_NOTICE & ~E_DEPRECATED & ~E_STRICT
```
You can launch CalemEAM with a link provided at the end of the installation program to log in. A test admin user is installed by default. The user name/password are: `admin/admin_password`.

## Локализация CalemEAM

Итак, локализация CalemEAM на примере настройки русского языка.
Создаем файлы:
```sh
AjxMsg_ru.properties
CalemMsg_ru.properties
I18nMsg_ru.properties
I18nMsg_ru_RU.properties
```
и кладем их в каталог CalemEAM\client\lang. Причем создать эти файлы лучше всего путём копирования из исходных файлов, например:
```sh
AjxMsg.properties
CalemMsg.properties
I18nMsg_en.properties
I18nMsg_en_UK.properties
```
В этих файлах собственно и находятся текстовые поля, которые необходимо перевести на требуемый язык.
Изменяем настройки кастомизации в файле CalemEAM\server\conf\calem.custom.php, а именно добавляем в конец следующий код:
```sh
/** Add Russian */ 
$_CALEM_dist['client_lang_list']['CalemMsg_ru.js']=array('AjxMsg'=>array('AjxMsg_ru'), 'I18nMsg'=>array('I18nMsg', 'I18nMsg_ru', 'I18nMsg_ru_RU'), 'CalemMsg'=>array('CalemMsg_ru', 'CalemMsgCustom_ru')); 
$_CALEM_dist['client_language']='ru';
```
Из CalemEAM\bin запускаем скрипт:
```sh
./deploy.sh build
```
> или «deploy.bat build» для Windows. (В этот момент WAMPP должен быть запущен).

В результате этой операции в CalemEAM\client\launchpad\resource должны сгенерироваться следующие файлы:
```sh
CalemMsg_ru.js
CalemMsg_ru.js.min
CalemMsg_ru.js.gz
CalemMsg_ru.phpo
```
Изменяем строку под номером 51 в CalemEAM\client\launchpad\CalemIncludeJsPkg.php, а именно:
```sh
$lang=isset($_REQUEST['lang'])?$_REQUEST['lang']:_CALEM_conf['client_language'];
```
заменяем на
```sh
$lang=isset($_REQUEST['lang'])?$_REQUEST['lang']:null;
(если искомая строка уже не имеет необходимого вида)
```
Для того чтобы при выборе языка при входе в программу появился пункт Russian изменяем файл CalemEAM\server\conf\calem.php. 
Находим объявление массива client_lang_list (строка 196) и добавляем в него следующее:
```sh
'CalemMsg_ru.js'=>array('AjxMsg'=>array('AjxMsg_ru'), 'I18nMsg'=>array('I18nMsg_ru','I18nMsg_ru_RU'), 'CalemMsg'=>array('CalemMsg_ru','CalemMsgCustom_ru'))
```
Далее в массив client_lang_select (строка 243) добавляем код:
```sh
'Russian'=>array('id'=>'ru').
```
На этом настройки закончены. Теперь поддержка русского включена. 

**В следующей таблице приведены возможные проблемы и их решение.**
| Проблема | Решение | Комментарий |
| ------ | ------ | ------ |
| После выполнения скрипта deploy.sh заявленные файлы не генерируются. | Установить в файле deploy.sh переменную CALEM_BUILD равной 1. | надо запускать - **./deploy.sh build** |
| При входе в программу появляется ошибка pattern is undefined. | В скрипте CalemEAM\client\launchpad\resource\Ajax.js найти функцию AjxDateFormat (строка 1233): function AjxDateFormat(pattern) и перед циклом for (строка 1244) добавить код: pattern=I18nMsg.formatDateShort; | паттерн там выбираться должен - походу это ни на что не влияет |

**✨© Елена в  ✨**



И да - вот такие сообщения при запуске деплоя под линухом:
```sh
root@CMMS:/opt/lampp/htdocs/CalemEAM/bin# ./deploy.sh build
June 24, 2024, 9:35:42 am - Start ZipJs -
sh: 1: /opt/lampp/htdocs/CalemEAM/build/jsmin/jsmin.exe: Exec format error
WARNING: script minification failed. The jsmin executable is missing or not functional for your platform. CalemEAM is configured to work without it for now. file=/opt/lampp/htdocs/CalemEAM/client/launchpad/resource/Ajax.js
sh: 1: /opt/lampp/htdocs/CalemEAM/build/jsmin/jsmin.exe: Exec format error
WARNING: script minification failed. The jsmin executable is missing or not functional for your platform. CalemEAM is configured to work without it for now. file=/opt/lampp/htdocs/CalemEAM/client/launchpad/resource/Calem.js
ReportConversion: 0.48777484893799
June 24, 2024, 9:35:44 am - Completed ZipJs. Time: 1.8513751029968
```
Но на содержание результирующих файлов это не влияет (для сравнения пришлось русифицировать калема под виндозией - там ехешник работает без нареканий)