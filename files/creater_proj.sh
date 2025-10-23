#!/bin/bash

set -e

# Проверка количества аргументов
if [ $# -ne 1 ]; then
    echo "Ошибка: Скрипт должен получать ровно один аргумент - имя каталога"
    echo "Использование: $0 <имя_каталога>"
    exit 1
fi

directory_name="$1"

# Создание основного каталога
echo "Создаю каталог: $directory_name"
mkdir "$directory_name"

# Проверка, что каталог создан успешно
if [ ! -d "$directory_name" ]; then
    echo "Ошибка: Не удалось создать каталог $directory_name"
    exit 1
fi

echo "Каталог $directory_name успешно создан"

# Создать структуру каталогов

echo "Создаю подкаталоги в $directory_name..."

mkdir -p "$directory_name/docs"
if [ -d "$directory_name/docs" ]; then
    echo "Каталог $directory_name/docs успешно создан"
else
    echo "Невозможно создать каталог $directory_name/docs"
fi

mkdir -p "$directory_name/scripts"
if [ -d "$directory_name/scripts" ]; then
    echo "Каталог $directory_name/scripts успешно создан"
else
    echo "Невозможно создать каталог $directory_name/scripts"
fi

mkdir -p "$directory_name/src/include"
if [ -d "$directory_name/src/include" ]; then
    echo "Каталог $directory_name/src/include успешно создан"
else
    echo "Невозможно создать каталог $directory_name/src/include"
fi

mkdir -p "$directory_name/tests"
if [ -d "$directory_name/tests" ]; then
    echo "Каталог $directory_name/tests успешно создан"
else
    echo "Невозможно создать каталог $directory_name/tests"
fi

mkdir -p "$directory_name/third_party/doctest"
if [ -d "$directory_name/third_party/doctest" ]; then
    echo "Каталог $directory_name/third_party/doctest успешно создан"
else
    echo "Невозможно создать каталог $directory_name/third_party/doctest"
fi

# Скачать файлы
#wget -P ./third_party/doctest/ https://github.com/doctest/doctest/blob/master/doctest/doctest.h

echo "Структура созданного каталога:"
tree "$directory_name" 2>/dev/null || ls -la "$directory_name"

echo "Операция завершена успешно!"
