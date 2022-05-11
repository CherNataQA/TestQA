﻿#language: ru


Функционал: Создание документа Заказ


Как Пользователь я хочу
создать документ Заказ и проверить его заполнение 
чтобы проверить его заполнение 

Контекст: 
Дано Я открыл новый сеанс TestClient или подключил уже существующий
// комментарий
Сценарий: Создание документа Заказ
* Открытие Формы создания документов
	И я закрыл все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно "Заказ (создание)"
* Заполнение шапки документа
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Магазин "Обувь"'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Малый'
	И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
* Заполнение таблицы товары
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю точное значение 'Сапоги'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '2'
	И в таблице "Товары" я завершаю редактирование строки
* Проверка заполнения документа

	Тогда таблица "Товары" содержит строки:
		| 'Товар'  | 'Цена'     | 'Количество' | 'Сумма'    |
		| 'Сапоги' | '3 500,00' | '2'          | '7 000,00' |

    И я жду, что в таблице текущее поле будет заполнено в течение 1 секунд.	

* Проверка расчета суммы строки
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '3 000,00'
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '1'
	И в таблице "Товары" я завершаю редактирование строки
	Тогда таблица "Товары" стала равной:
		| 'Товар'  | 'Цена'     | 'Количество' | 'Сумма'    |
		| 'Сапоги' | '3 000,00' | '1'          | '3 000,00' |		
			
* Запись документа
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	И я запоминаю значение поля с именем "Номер" как "$Номер$"	
* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна "Заказ (создание)" в течение 20 секунд
* Проверка создания документа
	И таблица "Список" содержит строки:
		| 'Номер'  | 
		| '$Номер$' |

Сценарий: Проверка наличия в справочнике Товары номенклатуры Торт
* Проверка на наличие записи таблицы
	И В командном интерфейсе я выбираю 'Закупки' 'Товары'
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	Тогда таблица "Список" содержит строки:
		| 'Наименование' |
		| 'Торт '        |
	
		
	
				
//	Когда открылось окно 'Заказ (создание)'
//	И Я закрываю окно 'Заказ (создание)'
//	Тогда открылось окно 'Заказы товаров'
//	И я нажимаю на кнопку с именем 'ФормаСоздать'
//	Тогда открылось окно 'Заказ (создание)'
//	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
//	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Магазин "Обувь"'
//	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Малый'
//	И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
//	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
//	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю точное значение 'Сапоги'
//	И я перехожу к следующему реквизиту
//	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
//	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '2'
//	И в таблице "Товары" я завершаю редактирование строки
//	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
//	И я жду закрытия окна 'Заказ (создание) *' в течение 20 секунд
		
	
	
	
		


