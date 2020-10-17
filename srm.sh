#!/bin/bash

if [ -e ~/RECYCLE ]
then
	echo 'Директория RECYCLE существует'
else
	echo 'Директория RECYCLE не существует - создаем ее'
	mkdir ~/RECYCLE
fi