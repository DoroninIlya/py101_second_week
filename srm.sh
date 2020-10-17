#!/bin/bash

file_name="$1"

if [ -z "$file_name" ]
then
	echo 'Укажите, пожалуйста, файл, который вы хотите удалить'
	exit -1
else
	echo $file_name
fi

if [ -e ~/RECYCLE ]
then
	echo 'Директория RECYCLE существует'
else
	echo 'Директория RECYCLE не существует - создаем ее'
	mkdir ~/RECYCLE
fi