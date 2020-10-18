#!/bin/bash

IFS='
'

#блок 1 - удаляем из корзины файлы, которые были перемещены туда более чем 7 дней назад
seven_days_in_seconds=6048

function get_current_timestamp {
	date +"%s"
}

function get_newest_file_name {
	ls ~/RECYCLE/ -tr | head -1
}

function get_file_created_time {
	stat -c %y ~/RECYCLE/$1
}

function convert_date_to_timestamp {
	date -d $1 +"%s"
}

function get_difference {
	expr $1 - $2
}

#в цикле проверяем, что папка не пустая
while [[ $(ls ~/RECYCLE/ -A) ]]
do
	current_timestamp=$(get_current_timestamp)
	
	oldest_file_name=$(get_newest_file_name)

	file_created_date=$(get_file_created_time $oldest_file_name)

	file_created_timestamp=$(convert_date_to_timestamp ${file_created_date})

	if (( $(get_difference $current_timestamp $file_created_timestamp) > $seven_days_in_seconds ))
	then	
		rm ~/RECYCLE/${oldest_file_name}
	else
		break
	fi 
done

#блок 2 - проверяем, что для команды введен аргумент с именем файлы
file_name="$1"

if [ -z "$file_name" ]
then
	echo 'Укажите, пожалуйста, файл, который вы хотите удалить'
	exit -1
fi

#блок 3 - перемещаем файл в корзину и упаковываем его в архив
mv $file_name ~/RECYCLE/$file_name

gzip ~/RECYCLE/$file_name

echo 'Файл удален'