#!/bin/bash

seven_days_in_seconds=604800

function get_current_timestamp {
	date +"%s"
}

current_timestamp=$(get_current_timestamp)

function get_newest_file_name {
	ls ~/RECYCLE/ -tr | head -1
}

newest_file_name=$(get_newest_file_name)
echo $newest_file_name

function get_file_created_time {
	stat -c %y ~/RECYCLE/${newest_file_name}
}

file_created_date=$(get_file_created_time)

function convert_date_to_timestamp {
	date -d $1 +"%s"
}

file_created_timestamp=$(convert_date_to_timestamp ${file_created_date})

function get_difference {
	expr $1 - $2
}

#todo: заменить условие на цикл
if (( $(get_difference $current_timestamp $file_created_timestamp) >= $seven_days_in_seconds ))
then	
	echo 'Удаляем файл из корзины, так как он был перемещен в корзину более недели назад'
	rm ~/RECYCLE/${newest_file_name}
else
	echo 'В корзине не осталось устаревших файлов'
fi

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