#!/bin/bash

set -e

# Создать структуру каталогов
mkdir -p my_project/{docs,scripts,src/include,tests,third_party/doctest}

# Скачать файлы
wget -P ./third_party/doctest/ https://github.com/doctest/doctest/blob/master/doctest/doctest.h
