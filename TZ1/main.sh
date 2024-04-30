#!/bin/bash

# Считывание названия входной директории
read -p "Введите путь к входной директории: " input_dir

# Проверка наличия входной директории
if [ ! -d "$input_dir" ]; then
    echo "Ошибка: входная директория $input_dir не существует."
    exit 1
fi

# Считывание названия выходной директории
read -p "Введите путь к выходной директории: " output_dir

# Проверка наличия выходной директории
if [ ! -d "$output_dir" ]; then
    echo "Ошибка: выходная директория $output_dir не существует."
    exit 1
fi

#Выводим список файлов, находящихся непосредственно во входной директории
echo "Файлы непосредственно в $input_dir:"
find "$input_dir" -maxdepth 1 -type f -exec basename {} \;

# Выводим список директорий, находящихся непосредственно во входной директории
echo "Директории непосредственно в $input_dir:"
find "$input_dir" -maxdepth 1 -type d ! -path "$input_dir" -exec basename {} \;

# Выводим список всех файлов во входной директории и её поддиректориях
echo "Все файлы в $input_dir:"
files=$(find "$input_dir" -type f)
echo "$files"

# Перебираем каждый файл
echo "$files" | while IFS='' read file; do
    # Получаем имя файла без пути
    filename=$(basename "$file")
    # Проверяем, существует ли уже такой файл в выходной директории
    if [ -e "$output_dir/$filename" ]; then
        # Если файл с таким именем уже существует, добавляем к имени уникальный суффикс
        counter=1
        while [ -e "$output_dir/${filename%.*}($counter).${filename##*.}" ]; do
            counter=$((counter + 1))
        done
        # Копируем файл с новым именем
        cp "$file" "$output_dir/${filename%.*}($counter).${filename##*.}"
    else
        # Копируем файл без изменений, если такого файла еще нет в выходной директории
        cp "$file" "$output_dir/$filename"
    fi
done

echo "Файлы успешно скопированы из $input_dir в $output_dir."

