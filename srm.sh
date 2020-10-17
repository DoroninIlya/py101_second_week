#!/bin/bash

file_name="$1"

if [ -z "$file_name" ]
then
	echo 'Укажите, пожалуйста, файл, который вы хотите удалить'
	exit -1
fi

mv $file_name ~/RECYCLE/$file_name

gzip ~/RECYCLE/$file_name

packed_file_name="${file_name}.gz"

if [ -e ~/RECYCLE/$packed_file_name ]
then
	echo 'Файл удален в корзину'
fi