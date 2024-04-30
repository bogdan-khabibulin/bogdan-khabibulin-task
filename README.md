## Техническое задание №1 (ТЗ1)

**Пишем скрипт на bash**

### Легенда задания 

Вам нужно написать скрипт на bash, который на вход принимает два параметра - две директории (`входная директория` и `выходная директория`).
Во `входной директории` могут находиться как файлы, так и вложенные директории (внутри которых тоже могут быть как файлы, так и папки) - уровень вложенности может быть любой.
Задача скрипта - "обойти" `входную директорию` и скопировать все файлы из нее (и из всех сложенных директорий) в `выходную директорию` - но уже без иерархии, а просто все файлы - внутри `выходной директории`.

Пример:

`Входная директория` = `/home/input_dir`; `Выходная директория` = `/home/output_dir`.

`/home/output_dir` изначально пустая.

Структура `/home/input_dir`: 
- input_dir
	- a.txt
	- dir2
		- b.txt
	 - dir3
   		- c.txt

Тогда после работы вашего скрипта структура `/home/output_dir` должна быть следующая: 
- output_dir
	- a.txt
 	- b.txt
  	- c.txt

**Обратите внимание**: в разных поддиректориях `входной директории` могут быть файлы с одинаковым названием. В момент копирования в `выходную аудиторию` необходимо такие ситуации каким-либо образом разрешить без потери файлов и содержания файлов (как именно - на ваше усмотрение).

- ### Как запускать скрипт:
- в консоле bash перейти в директорию со скриптом
- запустить скрипт командами ./main.sh или sh main.sh или bash main.sh
- в диалоговом окне указать относительный путь до директорий
- наслаждаться работой скрипта :)
  
