#language: ru

@tree

Функционал: Возвраты в отчете Продажи

Как Тестировщик я хочу
проверить корректную работу отчета при возврате покупателя
чтобы исключить не допустить недостоверной информации  

Контекст: 
 Дано Я открыл новый сеанс TestClient или подключил уже существующий
 
Сценарий: _0801 подготовительный сценарий
//когда экспорт основных данных
когда экспорт документов продажи
И я выполняю код встроенного языка на сервере
	|'Документы.SalesInvoice.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
	|'Документы.SalesInvoice.НайтиПоНомеру(2).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
	|'Документы.SalesReturn.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Отменапроведения);'|
Сценарий: Тестирование отчета Продажи
* Только документы продажи
	И В командном интерфейсе я выбираю 'Отчеты' 'D2001 Продажи'
	И я нажимаю на кнопку с именем 'FormGenerate'
	И я жду когда в табличном документе "Result" заполнится ячейка "R5C1" в течение 20 секунд
	И Табличный документ "Result" равен макету "Продажи" по шаблону

* Проведение документа возврат
И я выполняю код встроенного языка на сервере
	|'Документы.SalesReturn.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|

* С учетом документа возврат
Дано Я открываю навигационную ссылку "e1cib/app/Report.D2001_Sales"
И я нажимаю на кнопку с именем 'FormGenerate'
И я жду, что в табличном документе "Result" ячейка "R17C2" станет равна "3,000" в течение 20 секунд
И я жду, что в табличном документе "Result" ячейка "R17C3" станет равна "1 430,00" в течение 1 секунд
И я жду, что в табличном документе "Result" ячейка "R17C4" станет равна "1 191,67" в течение 1 секунд

И я закрываю все окна клиентского приложения
