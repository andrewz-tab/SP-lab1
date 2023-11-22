#!/bin/bash


echo "Программа для работы с архивами"
echo "Разработчик: Хузахметов Андрей Александрович"

while [ "1" == "1" ]
do
cond=0
codeExit=0

while [ "$cond" != "1" ];
do
echo "Выберете действие:" 1>&2
echo "1 - Разархивировать"
echo "2 - Заархивировать"
echo "3 - Завершить работу"
read action
	if [[ ("$action" == "1") || ("$action" == "2") ]];
	then
		cond=1
		codeExit=0
	elif [[ ("$action" == "3") ]];
	then
		cond=1
		exit $codeExit
	else
		echo "Такой команды нет, попробуйте еще раз" 1>&2
		codeExit=1
	fi
done
if [[ "$action" == "1" ]]; then 
 cond=0
 while [ "$cond" != "1" ];
 do
	read -p "Введите название архива ввиде \"*.tar\": " archive
	if [[ "$archive" != *.tar ]]; then
		echo "Неверное расширение" 1>&2
		codeExit=1
		cond=0
	elif test -e $archive ; then
		tar -xvf $archive
		cond=1
		codeExit=0
	else
		echo "Такого архива не существует, попробуйте еще раз" 1>&2
		codeExit=1
		cond=0
	fi
 done
else
 cond=0
 while [ "$cond" != "1" ];
 do
	read -p "Введите название каталога: " folder
	read -p "Введите название архива: " archive
	if test -d $folder; then
		tar -cvf $archive.tar $folder
		cond=1
		codeExit=0
	else
		echo "Такого каталога не существует, попробуйте еще раз" 1>&2
		codeExit=1
		cond=0
	fi
 done
fi

done
