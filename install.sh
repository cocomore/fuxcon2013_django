#!/bin/bash

cat <<EOS
Welcome to the installation of the Django version of the project site for the FUxCon 2013 workshop.

This software and documentation is released under the GNU General Public License 
(version 3). Please review the license in LICENSE.txt.

This script will download and setup some dependencies and the database. 
It assumes that you have created a MySQL database "fuxcon2013_django" 
and a database user "fuxcon" with password "fuxcon" for it. 

If you still need to do this, please press ^C now 
and restart the installation once you are ready.

EOS

read -p "Ready to proceed? [y]/n " reply
if [ "x$reply" != "x" -a "x$reply" != "xy" ]
then
  echo "Please type \"y\" or simply press ENTER to proceed with the installation"
  exit
fi

echo "Creating a virtual Python environment ..."
virtualenv env
source env/bin/activate 

echo "Loading Django and extensions ..."
pip install mysql-python 
pip install markdown
pip install django 
pip install south
pip install django-imagekit
pip install pillow
pip install django-taggit
pip install django-debug_toolbar
pip install django-autofixture

echo "Loading database ..."
mysql -ufuxcon -pfuxcon fuxcon2013_django < fuxcon2013_django.sql

echo "Setting permissions (requires root access) ..."
sys=`uname -s`
if [ $sys = Darvin ]
then
  sudo chmod +a "www allow delete,write,append,file_inherit,directory_inherit" media
  sudo chmod +a "`whoami` allow delete,write,append,file_inherit,directory_inherit" media
else
  sudo setfacl -R -m u:www-data:rwX -m u:`whoami`:rwX media
  sudo setfacl -dR -m u:www-data:rwx -m u:`whoami`:rwx media
fi
echo "Done."
