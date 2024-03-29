﻿ДОСТУПНЫЕ КОМАНДЫ:

— ALT+D, ALT+SHIFT+D — Нарисовать дугу окружности по трём точкам.
Дуга будет нарисована от 1-й указанной точки до 2-й.
Направление рисования зависит от клавиши SHIFT: отпущена — по часовой, нажата — против часовой.
3-ю точку можно указывать в любом месте окружности, однако чем равномернее и дальше друг от друга разнесены все три точки, тем точнее получится результат.
Количество вершин определяется автоматически, но можно задать число вершин вручную, если удерживать SHIFT в момент выбора 3-й точки.

— ALT+R, ALT+SHIFT+R — Нарисовать окружность по трём точкам.
Функционал аналогичен рисованию дуг, но рисуется полная окружность в заданном направлении, начиная с 1-й точки.

— ALT+E — Разметка подъездов (подходит для типовых многоэтажек с несложной геометрией)
Скрипт при помощи линейки ставит отметки напротив тех мест, где должны быть подъезды.
Задаются две точки (торцы здания) и количество подъездов.
Целиться нужно не в углы здания, а немного сместившись внутрь или вовне, иначе линейка закроет ребро контура.

— ALT+SHIFT+E — Функция работает аналогично предыдущей, но мышь нужно наводить не края здания а на крайние подъезды

— CTRL+ЛКМ — Удалить вершину (имитация двойного нажатия ЛКМ)

— ALT+ЛКМ — Скруглить угол контура

— ALT+C — найти центр отрезка

— ALT+SHIFT+C — найти центр окружности по 3-м точкам

— ALT+Q или WIN+Q — включить/выключить все слои

— ALT+A или WIN+A — переключить подложку (спутник/схема)

— ALT+Z или WIN+Z — переключить режим линейки

— ALT+N — ВКЛ/ВЫКЛ отключение режима прилипания при рисовании дуг и окружностей

— ПРОБЕЛ (при удерживаемой ЛКМ) — стронуть объект с места

— Клавиши WASD или стрелки (при удерживаемой ЛКМ) — сдвинуть объект на 1 пиксель

— CTRL+~ (CTRL+Ё) — вкл/выкл альтернативного ввода символов «0» и «/»


— ALT + стрелки ВВЕРХ/ВНИЗ — следующая/предыдущая правка в списке правок

— ALT + NUM 0 — открыть консоль модерации

— ALT + NUM * — отложить правку

— ALT + NUM / или ALT+M — написать письмо автору правки

— ALT + ВПРАВО — принять правку

— ALT + ВЛЕВО — перейти в историю объекта



ИСТОРИЯ ВЕРСИЙ:
* исправлено / изменено
+ добавлено

15.07.2023

  * Учтён изменившийся заголовок окна («Народная карта — редактор Яндекс Карт» вместо «Народная карта — редактор Яндекс.Карт»), из-за чего старый скрипт перестал работать.

16.04.2019

  * Скрипт адаптирован под изменившийся интерфейс Народной карты

08.12.2018

  * Скрипт адаптирован под изменившийся интерфейс Народной карты

26.07.2018

  * Скрипт адаптирован под изменившийся интерфейс Народной карты

  * Мелкие улучшения-исправления

13.02.2018

  + Добавлено сочетание клавиш Ctrl+~, включающее альтернативный режим набора символов «0» и «/», добавлен параметр AlterZeroSlash в файле настроек

  * В 3 раза (со 150 мс до 50 мс) уменьшена задержка при рисовании дуг и окружностей, добавлен параметр DrawDelay в файле настроек

  * Указатель мыши теперь возвращается в исходное положение после использования сочетаний клавиш ALT со стрелками и других хоткеев для модераторов

  * Внесено ещё несколько небольших изменений

12.09.2017

  + Добавлено сочетание клавиш Alt+Q для скрытия/показа всех слоёв

  * Исправлено несколько незначительных багов

10.07.2017

  + Добавлена возможность точного позиционирования объектов при помощи клавиатуры

  + Добавлена возможность переключаться на следующую/предыдущую правку в списке при помощи клавиатуры

  + Добавлены хоткеи для модераторов: открыть консоль модерации, принять/отложить правку, перейти в историю объекта, написать письмо автору

  * Улучшена работа функции скругления углов с клавишей ALT

11.03.2017

  + Поиск центра окружности по ALT+SHIFT+C.

  * В разметке подъездов добавлен второй режим (по крайним подъездам), добавлено ограничение на max/min число подъездов, исправлены мелкие недочёты.

29.01.2017

  + Добавлена функция разметки подъездов

24.11.2016

  * Учтён изменившийся заголовок окна («Народная карта — редактор Яндекс.Карт» вместо «Народная карта — Яндекс.Карты»), из-за чего старая версия скрипта перестала работать.

  * Исправлена ошибка, из-за которой не работало или раньше времени прерывалось рисование дуг и окружностей, если окно браузера находилось не в левом верхнем углу экрана.
  
  * Немного скорректирована функция скругления углов, вызываемая сочетанием ALT+ЛКМ.

22.09.2016

  + Можно поменять исходные значения некоторых параметров в конфигурационном файле «NMaps Tweaks.ini».

  + Изменяемое направление рисования дуг и окружностей: ALT+R,D — по часовой, с клавишей SHIFT — против часовой

  + Отмена отключения режима прилипания при рисовании дуг и окружностей сочетанием клавиш ALT+N

  + Переключение подложки (спутник/схема) сочетанием клавиш ALT+A или WIN+A

  + Переключение режима линейки сочетанием клавиш ALT+Z или WIN+Z

  + Функция поиска центра отрезка

  * Переписана функция быстрого скругления углов (старую версию можно включить в конфигурационном файле).

  * Теперь скрипт нормально запускается при любой раскладке клавиатуры.

  * Устранён баг, из-за которого в некоторых системах вместо дуг и окружностей получался беспорядочный набор точек.

30.04.2016

  + Возможность рисования дуг окружностей.

  + Автоматическое прерывание процесса рисования, если мышь приближается к краю окна. Границы области, доступной для рисования, регулируются параметрами: TopPanelHeight, BottomPanelHeight, LeftPanelWidth, RightPanelWidth.

  + Автоматическое определение количества узлов при рисовании дуг и окружностей.

  + Больше не нужно каждый раз отключать режим залипания, чтобы узлы окружности не прилипали к соседним объектам. Скрипт во время рисования имитирует нажатую клавишу SHIFT. Можно отключить, установив параметр NoSnapping := 0

  * Рисование окружностей, так же, как дуг, начинается с 1-й указанной точки и выполняется против часовой стрелки.

  * Всплывающие окна позиционируются относительно окна браузера, а не 1-го монитора; Подсказки «наведите мышь на N-ю точку...» сдвинуты в левый верхний угол.

  * Заблокировано возможное случайное перемещение мыши пользователем во время выполнения команд.

23.04.2016

  + Возможность скругления углов в один клик.

  * Учтён изменившийся заголовок окна («Народная карта — Яндекс.Карты» вместо «Народная карта Яндекса»), из-за чего старый скрипт перестал работать.

  * Удаление вершин в один клик происходит при удержании клавиши CTRL вместо ALT.

26.10.2015

  + Возможность прервать процесс рисования окружности нажатием клавиши ПРОБЕЛ.

  * При рисовании окружности по трём точкам: на этапе указания точек вместо вывода диалоговых окон с кнопкой «ОК» скрипт ожидает нажатия клавиши ПРОБЕЛ.

