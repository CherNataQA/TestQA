﻿#language: ru

@tree

Функционал: Проверка прикрепления картинки в справочник Товары

Как Тестировщик  я хочу
проверить загрузку картинки в элемент справочника 
чтобы видеть товар 

Контекст:
Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: _0801 подготовительный (загрузка картинок)
когда Загрузка элемента справочника Товар

Сценарий: _0802 загрузка картинки в элемент справочника
Дано Я открываю навигационную ссылку "e1cib/list/Справочник.Товары"
Когда открылось окно 'Товары'
И я нажимаю на кнопку с именем 'ФормаСписок'
И в таблице "Список" я перехожу к строке
        | 'Наименование' |
        | 'Элемент тестирования' |
И в таблице "Список" я выбираю текущую строку
И я выбираю файл "$КаталогПроекта$\Exchange\Финальное ДЗ\Files\itempicture2.png"
Когда открылось окно 'Элемент тестирования (Товар)'
И я нажимаю кнопку выбора у поля с именем "ФайлКартинки"
Если в таблице "Список" есть строка Тогда
	| 'Наименование'              |
	| 'Картинка для тестирования' |
	И в таблице "Список" я перехожу к строке
	| 'Наименование' |
	| 'Картинка для тестирования' |
	И в таблице "Список" я выбираю текущую строку
Иначе 
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Файл (создание)'
	И в поле с именем 'Наименование' я ввожу текст 'Картинка для тестирования'
	И я нажимаю на кнопку с именем 'ВыбратьФайлСДискаИЗаписать'
	Тогда открылось окно 'Картинка для тестирования (Файл)'
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я жду закрытия окна 'Картинка для тестирования (Файл)' в течение 20 секунд
	Тогда открылось окно 'Файлы'

Тогда открылось окно 'Элемент тестирования (Товар) *'
И я запоминаю значение поля с именем 'Картинка' как 'Картинка'
И я нажимаю на кнопку с именем 'ФормаЗаписать'
И у элемента с именем 'Картинка' я жду значения '$Картинка$' в течение 60 секунд
И я закрываю все окна клиентского приложения


