
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	// СтандартныеПодсистемы.ПодключаемыеКоманды
	ПодключаемыеКоманды.ПриСозданииНаСервере(ЭтотОбъект);
	// Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
	//++
	//Добавляем реквизит КонтактноеЛицо
	ЭлементКонтактноеЛицо = Элементы.Вставить("ЭлементКонтактноеЛицо", Тип("ПолеФормы"), Элементы.ГруппаШапкаПраво, );
	ЭлементКонтактноеЛицо.ПутьКДанным = "Объект.EDT_КонтактноеЛицо";
	ЭлементКонтактноеЛицо.Вид = ВидПоляФормы.ПолеВвода;
	
	//Добавляем реквизит СогласованнаяСкидка
	ЭлементСогласованнаяСкидка = Элементы.Вставить("ЭлементСогласованнаяСкидка", Тип("ПолеФормы"), Элементы.ГруппаШапкаЛево, );
	ЭлементСогласованнаяСкидка.ПутьКДанным = "Объект.EDT_СогласованнаяCкидка";
	ЭлементСогласованнаяСкидка.Вид = ВидПоляФормы.ПолеВвода;
	ЭлементСогласованнаяСкидка.УстановитьДействие("ПриИзменении", "ЭлементСогласованнаяCкидкаПриИзменении");
	
	//Добавляем кнопку ПересчитатьСумму (для пересчета всей таблицы)
	КомандаПредупредить = Команды.Добавить("ПоказатьПредупреждение");
	КомандаПредупредить.Заголовок = "Пересчитать сумму";
	КомандаПредупредить.Действие = "EDT_ПересчитатьСуммуТаблицы";
	
	КнопкаФормы = Элементы.Добавить("КнопкаПоказатьПредупреждение", Тип("КнопкаФормы"), Элементы.ГруппаШапкаЛево);
	КнопкаФормы.ИмяКоманды = "ПоказатьПредупреждение";
	КнопкаФормы.Вид = ВидКнопкиФормы.ОбычнаяКнопка;
	//--
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиент.НачатьОбновлениеКоманд(ЭтотОбъект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗаписи(ПараметрыЗаписи)
    ПодключаемыеКомандыКлиент.ПослеЗаписи(ЭтотОбъект, Объект, ПараметрыЗаписи);
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыТовары

&НаКлиенте
Процедура ТоварыКоличествоПриИзменении(Элемент)
	
	//ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	//
	//РассчитатьСуммуСтроки(ТекущиеДанные);
	
	//++
	//Расчет суммы строки с учетом СогласованнойСкидки если меняется количество
	ИзмененнаяСтрока = Элементы.Товары.ТекущиеДанные;
	РассчитатьСуммуСтроки(ИзмененнаяСтрока);
	//--
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыЦенаПриИзменении(Элемент)
	
	//ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	//
	//РассчитатьСуммуСтроки(ТекущиеДанные);
	
	//++
	//Расчет суммы строки с учетом СогласованнойСкидки если меняется цена
	ИзмененнаяСтрока = Элементы.Товары.ТекущиеДанные;
	РассчитатьСуммуСтроки(ИзмененнаяСтрока);
	//--
		
КонецПроцедуры

&НаКлиенте
Процедура ТоварыПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

&НаКлиенте
Процедура ТоварыСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыУслуги

&НаКлиенте
Процедура УслугиКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура РассчитатьСуммуСтроки(ТекущиеДанные)
	
	//КоэффициентСкидки = 1 - ТекущиеДанные.Скидка / 100;
	//ТекущиеДанные.Сумма = ТекущиеДанные.Цена * ТекущиеДанные.Количество * КоэффициентСкидки;
	
	//++
	//Расчет суммы строки с учетом СогласованнойСкидки
	ТекущиеДанные.Сумма = (1 - Объект.КЛ_СогласованнаяCкидка / 100) * ТекущиеДанные.Цена * ТекущиеДанные.Количество;	
	РассчитатьСуммуДокумента();
	//--
	
КонецПроцедуры

//++
//Действие для кнопки ПересчитатьСумму 
&НаКлиенте
Процедура EDT_ПересчитатьСуммуТаблицы(Команда)
	
	Для Каждого Строка Из Объект.Товары Цикл
		Строка.Сумма = (1 - Объект.EDT_СогласованнаяCкидка / 100) * Строка.Количество * Строка.Цена;
	КонецЦикла;
	
	Для Каждого Строка Из Объект.Услуги Цикл
		Строка.Сумма = (1 - Объект.EDT_СогласованнаяCкидка / 100) * Строка.Количество * Строка.Цена;
	КонецЦикла;
	
	РассчитатьСуммуДокумента();
	
КонецПроцедуры

//Предупреждение при вводе скидки Да/Нет
&НаКлиенте
Асинх Процедура ЭлементСогласованнаяCкидкаПриИзменении(Элемент)
	
	Режим = РежимДиалогаВопрос.ДаНет;
	Ответ = Ждать ВопросАсинх("Изменен процент скидки. Пересчитать таблицу товаров и услуг?", Режим);
	
	Если Ответ = КодВозвратаДиалога.Да Тогда
		EDT_ПересчитатьСуммуТаблицы(Элементы);
	КонецЕсли;
	
КонецПроцедуры
//--

&НаКлиенте
Процедура РассчитатьСуммуДокумента()
	
	Объект.СуммаДокумента = Объект.Товары.Итог("Сумма") + Объект.Услуги.Итог("Сумма");
	
КонецПроцедуры

#Область ПодключаемыеКоманды

// СтандартныеПодсистемы.ПодключаемыеКоманды
&НаКлиенте
Процедура Подключаемый_ВыполнитьКоманду(Команда)
    ПодключаемыеКомандыКлиент.НачатьВыполнениеКоманды(ЭтотОбъект, Команда, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ПродолжитьВыполнениеКомандыНаСервере(ПараметрыВыполнения, ДополнительныеПараметры) Экспорт
    ВыполнитьКомандуНаСервере(ПараметрыВыполнения);
КонецПроцедуры

&НаСервере
Процедура ВыполнитьКомандуНаСервере(ПараметрыВыполнения)
    ПодключаемыеКоманды.ВыполнитьКоманду(ЭтотОбъект, ПараметрыВыполнения, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ОбновитьКоманды()
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
КонецПроцедуры
// Конец СтандартныеПодсистемы.ПодключаемыеКоманды

#КонецОбласти

#КонецОбласти
