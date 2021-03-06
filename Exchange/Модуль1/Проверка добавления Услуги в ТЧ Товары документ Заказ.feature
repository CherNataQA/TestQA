#language: ru


Функционал: Практическое задание 1

Как Пользователь Администратор я хочу
выполнить расчет суммы документа Заказ 
чтобы проверить правильность расчета

Контекст: 
Дано Я открыл новый сеанс TestClient или подключил уже существующий

//добавили комментарий
Сценарий: Добавление Услуги в табличную часть документа Заказ
* Открытие документа Заказ
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ * от *'
* Добавление второй строки табличной части
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000038' | 'Ремонт'       |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ * от * *'
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И я жду, что в таблице текущее поле будет не заполнено в течение 2 секунд.
* Запись документа
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	И я закрываю текущее окно


