#!/bin/bash

VERSION='graphicstext-1.3.1'
PROJECT='graphicstext'

SOURCE_DIR='/home/eck/eclipse-workspace'
EXPORT_DIR="/home/eck/Desktop/$VERSION-source"
XALAN_DIR="/home/eck/xalan-j_2_7_1"

if [ -x "$EXPORT_DIR" ] ; then
   rm -r $EXPORT_DIR/*
else
   mkdir $EXPORT_DIR
fi

cp -r $SOURCE_DIR/$PROJECT $EXPORT_DIR

cd $EXPORT_DIR

perl -i -p -e 's/\t/    /g' `find . -name "*.java"`
perl -i -p -e 's/<!DOCTYPE.*graphicstext.dtd" *>//' `find . -name "*.xml" -and ! -name "graphicstext*"`
rm -r `find . -name "CVS"`

rm $PROJECT/export-source.sh
rm -r $PROJECT/bin
rm $PROJECT/export-source-mac.sh
mv $PROJECT/publish.sh .
mv $PROJECT/BUILD* .
chmod +x BUILD*.sh
chmod +x publish.sh
#cp $PROJECT/README.txt .
ln -s $XALAN_DIR xalan
cd ..


