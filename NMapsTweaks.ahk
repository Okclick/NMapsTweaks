FileInstall, NMapsTweaks.ahk, NMapsTweaks.ahk
FileInstall, NMapsTweaks.ini, NMapsTweaks.ini
FileInstall, ReadMe.txt     , ReadMe.txt, 1



FileInstall, NMaps_Base_A.png            , NMaps_Base_A.png
FileInstall, NMaps_Base_B.png            , NMaps_Base_B.png

FileInstall, NMaps_GoToHistory_Btn.png   , NMaps_GoToHistory_Btn.png
FileInstall, NMaps_GoToHistory_81_FF.png , NMaps_GoToHistory_81_FF.png
FileInstall, NMaps_GoToHistory_81_IE.png , NMaps_GoToHistory_81_IE.png
FileInstall, NMaps_GoToHistory_81_YA.png , NMaps_GoToHistory_81_YA.png
FileInstall, NMaps_GoToHistory_81_FF2.png, NMaps_GoToHistory_81_FF2.png
FileInstall, NMaps_GoToHistory_81_IE2.png, NMaps_GoToHistory_81_IE2.png
FileInstall, NMaps_GoToHistory_81_YA2.png, NMaps_GoToHistory_81_YA2.png

FileInstall, NMaps_ListLine_Bottom1.png  , NMaps_ListLine_Bottom1.png
FileInstall, NMaps_ListLine_Bottom2.png  , NMaps_ListLine_Bottom2.png
FileInstall, NMaps_ListLine_Top1.png     , NMaps_ListLine_Top1.png
FileInstall, NMaps_ListLine_Top2.png     , NMaps_ListLine_Top2.png
FileInstall, NMaps_ListLine_Top3.png     , NMaps_ListLine_Top3.png

FileInstall, NMaps_ModerBtn.png          , NMaps_ModerBtn.png
FileInstall, NMaps_Ruler_A.png           , NMaps_Ruler_A.png
FileInstall, NMaps_Ruler_B.png           , NMaps_Ruler_B.png
FileInstall, NMaps_ZoomIn_Btn.png        , NMaps_ZoomIn_Btn.png
FileInstall, NMaps_ZoomOut_Btn.png       , NMaps_ZoomOut_Btn.png

FileInstall, NMaps_RoundCorner.png       , NMaps_RoundCorner.png
FileInstall, NMaps_RoundCorner_81_YA.png , NMaps_RoundCorner_81_YA.png
FileInstall, NMaps_RoundCorner_81_IE.png , NMaps_RoundCorner_81_IE.png
FileInstall, NMaps_RoundCorner_81_FF.png , NMaps_RoundCorner_81_FF.png

FileInstall, NMaps_SendLetter_81_FF.png  , NMaps_SendLetter_81_FF.png
FileInstall, NMaps_SendLetter_81_IE.png  , NMaps_SendLetter_81_IE.png
FileInstall, NMaps_SendLetter_81_YA.png  , NMaps_SendLetter_81_YA.png
FileInstall, NMaps_SendLetter_Moder.png  , NMaps_SendLetter_Moder.png



IniRead, TopPanelHeight   , NMapsTweaks.ini, Borders, TopPanelHeight   , 175
IniRead, BottomPanelHeight, NMapsTweaks.ini, Borders, BottomPanelHeight, 60
IniRead, LeftPanelWidth   , NMapsTweaks.ini, Borders, LeftPanelWidth   , 65
IniRead, RightPanelWidth  , NMapsTweaks.ini, Borders, RightPanelWidth  , 425

IniRead, NoSnapping    , NMapsTweaks.ini, Other, NoSnapping    , 1
IniRead, CtrlShiftS    , NMapsTweaks.ini, Other, CtrlShiftS    , 1
IniRead, CtrlEnter     , NMapsTweaks.ini, Other, CtrlEnter     , 0
IniRead, OldRoundCorner, NMapsTweaks.ini, Other, OldRoundCorner, 0
IniRead, AlterZeroSlash, NMapsTweaks.ini, Other, AlterZeroSlash, 0
IniRead, DrawDelay     , NMapsTweaks.ini, Other, DrawDelay     , 50



#IfWinActive Народная карта — редактор Яндекс.Карт




GetSegmentLength(x1, y1, x2, y2)
{
  return Sqrt((0. + x1 - x2)**2 + (0. + y1 - y2)**2)
}





GetRadius(a, b, c)
{
  p := (0. + a+b+c)/2
  s := Sqrt(p*(p-a)*(p-b)*(p-c))
  rs := (1.0*a*b*c)/(4.0*s)
  return rs
}





GetCenter(x1, y1, x2, y2, x3, y3, ByRef x0, ByRef y0)
{
  x1 := 0. + x1
  x2 := 0. + x2
  x3 := 0. + x3
  y1 := 0. + y1
  y2 := 0. + y2
  y3 := 0. + y3

  A1 := x2 - x1
  B1 := y2 - y1
  C1 := (x2-x1)*(x2+x1)/2 + (y2-y1)*(y2+y1)/2
  A2 := x3 - x1
  B2 := y3 - y1
  C2 := (x3-x1)*(x3+x1)/2 + (y3-y1)*(y3+y1)/2
  x0 := (C1*B2 - C2*B1)/(A1*B2 - A2*B1)
  y0 := (A1*C2 - A2*C1)/(A1*B2 - A2*B1)
}



GetCenterT(x1, y1, x2, y2, x3, y3, ByRef x0, ByRef y0)
{
  x1 := 0. + x1
  x2 := 0. + x2
  x3 := 0. + x3
  y1 := 0. + y1
  y2 := 0. + y2
  y3 := 0. + y3

  x0 := (x1 + x2 + x3) / 3.0
  y0 := (y1 + y2 + y3) / 3.0
}






; Стронуть с места узел, удерживаемый левой кнопкой мыши

~LButton & sc039:: ; LMouse + Space

if (dontshake = 1)
{
  return
}

MouseGetPos, x0, y0
MouseMove x0 - 10, y0 - 10, 0
MouseMove x0, y0, 0
exit







; Сдвинуть мышь на 1 точку при удерживаемой левой кнопке мыши

~LButton & sc148:: ; LMouse + Up
~LButton & sc048:: ; LMouse + Num8
~LButton & sc011:: ; LMouse + W
MouseMove 0, -1, 0, R
exit

~LButton & sc150:: ; LMouse + Down
~LButton & sc050:: ; LMouse + Num2
~LButton & sc01F:: ; LMouse + S
;~LButton & sc02D:: ; LMouse + X
MouseMove 0, +1, 0, R
exit

~LButton & sc14B:: ; LMouse + Left
~LButton & sc04B:: ; LMouse + Num4
~LButton & sc01E:: ; LMouse + A
MouseMove -1, 0, 0, R
exit

~LButton & sc14D:: ; LMouse + Right
~LButton & sc04D:: ; LMouse + Num6
~LButton & sc020:: ; LMouse + D
MouseMove +1, 0, 0, R
exit







; Предыдущая строка в списке правок
!sc148:: ; Alt+Up
#sc148:: ; Win+Up
!sc048:: ; Alt+Num8
#sc048:: ; Win+Num8

WinGetPos, winX, winY, winW, winH
MouseGetPos, x0, y0

x1 := 0
y1 := 0

ImageSearch x1, y1, winW - RightPanelWidth - 10, TopPanelHeight, winW - RightPanelWidth + 40, WinH, *15 NMaps_ListLine_Top1.png

if (ErrorLevel = 1)
{
  MouseGetPos, x1, y1
  x1 := 0.0 + winW - RightPanelWidth + 10
  y1 := 0.0 + TopPanelHeight + 250
  MouseMove %x1%, %y1% , 0
  Send {WheelUp}
  Send {WheelUp}
  
  ImageSearch x1, y1, winW - RightPanelWidth - 3, TopPanelHeight, winW - RightPanelWidth + 40, WinH, *5 NMaps_ListLine_Top2.png
  if ErrorLevel = 1
  {
    MouseMove x0, y0, 0
    exit
  }
}

y1 := y1 - 3

MouseClick, Left, %x1%, %y1%, 1, 0

if (0.0 + y1 < 0.0 + TopPanelHeight + (WinH - TopPanelHeight) / 4.0) 
{
  y1 := 0.0 + TopPanelHeight + 250
  Send {WheelUp}
}

MouseMove x0, y0, 0

exit







; Следующая строка в списке правок
!sc150:: ; Alt+Down
#sc150:: ; Win+Down
!sc050:: ; Alt+Num2
#sc050:: ; Win+Num2

WinGetPos, winX, winY, winW, winH
MouseGetPos, x0, y0

x1 := 0
y1 := 0

ImageSearch x1, y1, winW - RightPanelWidth - 10, TopPanelHeight, winW - RightPanelWidth + 40, WinH, *15 NMaps_ListLine_Bottom1.png

if ErrorLevel = 1
{
  ImageSearch x1, y1, winW - RightPanelWidth - 10, TopPanelHeight, winW - RightPanelWidth + 40, WinH, *15 NMaps_ListLine_Bottom2.png
}

if ErrorLevel = 1
{
  x1 := 0.0 + winW - RightPanelWidth + 50
  y1 := 0.0 + TopPanelHeight + 250
  mousemove %x1%, %y1% , 0
  Send {WheelDown}
  Send {WheelDown}
  MouseMove x0, y0, 0
  exit
}

y1 := y1 + 6

MouseClick, Left, %x1%, %y1%, 1, 0

if (0.0 + y1 > 0.0 + WinH - (WinH - TopPanelHeight) / 4.0) 
{
  y2 := TopPanelHeight + 250
  mousemove %x1%, %y2% , 0
  Send {WheelDown}
  mousemove %x1%, %y1% , 0
}

MouseMove x0, y0, 0

exit








; Перейти в историю объекта
!sc14B:: ; Alt+Left
#sc14B:: ; Win+Left
!sc04B:: ; Alt+Num4
#sc04B:: ; Win+Num4

WinGetPos, winX, winY, winW, winH
MouseGetPos, x0, y0

x1 := 0
y1 := 0

ImageSearch x1, y1, winW - RightPanelWidth - 10, TopPanelHeight, winW - RightPanelWidth + 60, WinH, *50 NMaps_SendLetter_Moder.png

if ErrorLevel = 0
{
  x2 := x1
  y2 := y1 + 54
  MouseClick, Left, %x2%, %y2%, 1, 0
  MouseMove x0, y0, 0
  exit
}

ImageSearch x1, y1, winW - RightPanelWidth - 10, TopPanelHeight, winW - RightPanelWidth + 60, WinH, *20 NMaps_GoToHistory_Btn.png

if ErrorLevel = 1
{
  ImageSearch x1, y1, winW - RightPanelWidth - 10, TopPanelHeight, winW - RightPanelWidth + 140, WinH, *150 NMaps_GoToHistory_81_YA.png
}

if ErrorLevel = 1
{
  ImageSearch x1, y1, winW - RightPanelWidth - 10, TopPanelHeight, winW - RightPanelWidth + 140, WinH, *150 NMaps_GoToHistory_81_IE.png
}

if ErrorLevel = 1
{
  ImageSearch x1, y1, winW - RightPanelWidth - 10, TopPanelHeight, winW - RightPanelWidth + 140, WinH, *150 NMaps_GoToHistory_81_FF.png
}

if ErrorLevel = 1
{
  ImageSearch x1, y1, winW - RightPanelWidth - 10, TopPanelHeight, winW - RightPanelWidth + 140, WinH, *150 NMaps_GoToHistory_81_YA2.png
}

if ErrorLevel = 1
{
  ImageSearch x1, y1, winW - RightPanelWidth - 10, TopPanelHeight, winW - RightPanelWidth + 140, WinH, *150 NMaps_GoToHistory_81_IE2.png
}

if ErrorLevel = 1
{
  ImageSearch x1, y1, winW - RightPanelWidth - 10, TopPanelHeight, winW - RightPanelWidth + 140, WinH, *150 NMaps_GoToHistory_81_FF2.png
}

if ErrorLevel = 1
{
  exit
}

x2 := x1 + 7
y2 := y1 + 7

MouseClick, Left, %x2%, %y2%, 1, 0

MouseMove x0, y0, 0

exit








; Принять правку
Insert:: ; Insert
!sc14D:: ; Alt+Right
#sc14D:: ; Win+Right
!sc04D:: ; Alt+Num6
#sc04D:: ; Win+Num6
;!sc11C:: ; Alt+NumEnter
;#sc11C:: ; Win+NumEnter

WinGetPos, winX, winY, winW, winH
MouseGetPos, x0, y0

x1 := 0
y1 := 0

ImageSearch x1, y1, winW - RightPanelWidth - 10, TopPanelHeight, winW - RightPanelWidth + 60, WinH, *50 NMaps_SendLetter_Moder.png

if ErrorLevel = 1
{
  exit
}

x2 := x1 + 65
y2 := y1 + 10

MouseClick, Left, %x2%, %y2%, 1, 0

MouseMove x0, y0, 0

exit











; Отложить правку
!sc037:: ; Alt+NumMult
#sc037:: ; Win+NumMult

WinGetPos, winX, winY, winW, winH
MouseGetPos, x0, y0

x1 := 0
y1 := 0

ImageSearch x1, y1, winW - RightPanelWidth - 10, TopPanelHeight, winW - RightPanelWidth + 60, WinH, *50 NMaps_SendLetter_Moder.png

if ErrorLevel = 1
{
  exit
}

x2 := x1 + 150
y2 := y1 + 10

MouseClick, Left, %x2%, %y2%, 1, 0

MouseMove x0, y0, 0

exit










; Откатить правку
Home::

WinGetPos, winX, winY, winW, winH
MouseGetPos, x0, y0

x1 := 0
y1 := 0

ImageSearch x1, y1, winW - RightPanelWidth - 10, TopPanelHeight, winW - RightPanelWidth + 60, WinH, *50 NMaps_SendLetter_Moder.png

if ErrorLevel = 1
{
  exit
}

x2 := x1 + 235
y2 := y1 + 10

MouseClick, Left, %x2%, %y2%, 1, 0

MouseMove x2-40, y2+40, 0

exit











; Открыть консоль модерации
!sc052:: ; Alt+Num0
#sc052:: ; Alt+Num0

WinGetPos, winX, winY, winW, winH
MouseGetPos, x0, y0

x1 := 0
y1 := 0

ImageSearch x1, y1, winW - RightPanelWidth, 0, winW, TopPanelHeight, *50 NMaps_ModerBtn.png

if ErrorLevel = 1
{
  exit
}

x1 := x1 + 8
y1 := y1 + 8

MouseClick, Left, %x1%, %y1%, 1, 0

MouseMove x0, y0, 0

exit








; Написать письмо пользователю
!sc032:: ; Alt+M
#sc032:: ; Win+M
!sc135:: ; Alt+NumDiv
#sc135:: ; Win+NumDiv

WinGetPos, winX, winY, winW, winH
MouseGetPos, x0, y0

x1 := 0
y1 := 0

ImageSearch x1, y1, winW - RightPanelWidth - 10, TopPanelHeight, winW - RightPanelWidth + 60, WinH, *50 NMaps_SendLetter_Moder.png

if ErrorLevel = 1
{
  ImageSearch x1, y1, winW - RightPanelWidth - 10, TopPanelHeight, winW - RightPanelWidth + 250, WinH, *150 NMaps_SendLetter_81_YB.png
}

if ErrorLevel = 1
{
  ImageSearch x1, y1, winW - RightPanelWidth - 10, TopPanelHeight, winW - RightPanelWidth + 250, WinH, *150 NMaps_SendLetter_81_IE.png
}

if ErrorLevel = 1
{
  ImageSearch x1, y1, winW - RightPanelWidth - 10, TopPanelHeight, winW - RightPanelWidth + 250, WinH, *150 NMaps_SendLetter_81_FF.png
}

if ErrorLevel = 1
{
  exit
}

x1 := x1 + 10
y1 := y1 + 10

MouseClick, Left, %x1%, %y1%, 1, 0

MouseMove x0, y0, 0

exit







; Дополнительные сочетания клавиш

!sc010:: ; Alt+Q => Ctrl+Shift+H
#sc010:: ; Win+Q => Ctrl+Shift+H
send ^+{sc023}
exit




sc029:: ; «`» => «0»
if AlterZeroSlash = 1
{
  send {sc00B}
}
else
{
  send {sc029}
}
exit




+sc029:: ; «~» => «/»
if AlterZeroSlash = 1
{
  send {sc135}
}
else
{
  send +{sc029}
}
exit




!sc014:: ; ALT+T => «ё»
#sc014:: ; WIN+T => «ё»
!sc029:: ; ALT+` => «ё»
#sc029:: ; WIN+` => «ё»
if AlterZeroSlash = 1
{
  send {sc029}
}
else
{
  send !{sc014}
}
exit




!+sc014:: ; ALT+SHIFT+T => «Ё»
#+sc014:: ; WIN+SHIFT+T => «Ё»
!+sc029:: ; ALT+SHIFT+~ => «Ё»
#+sc029:: ; WIN+SHIFT+~ => «Ё»
if AlterZeroSlash = 1
{
  send +{sc029}
}
else
{
  send !+{sc014}
}
exit




^+sc01F:: ; Ctrl+Shift+S => Ctrl+Shift+A
if CtrlShiftS = 1
{
  send ^+{sc01E}
}
else
{
  send ^+{sc01F}
}
exit




^sc01C:: ; Ctrl+Enter => Ctrl+S
^sc11C:: ; Ctrl+NumEnter => Ctrl+S
if CtrlEnter = 1
{
  send ^{sc01F}
}
else
{
  send ^{sc01C}
}
exit




^+sc01C:: ; Ctrl+Shift+Enter => Ctrl+Shift+A
^+sc11C:: ; Ctrl+Shift+NumEnter => Ctrl+Shift+A
if CtrlEnter = 1
{
  send ^+{sc01E}
}
else
{
  send ^+{sc01C}
}
exit







;Отключать режим прилипания
!sc031:: ; Alt+N
if NoSnapping = 0
{
  NoSnapping := 1
  SplashTextOn 200, 20, Режим прилипания, Отключать
}
else
{
  NoSnapping := 0
  SplashTextOn 200, 20, Режим прилипания, Не отключать
}
sleep, 1500
SplashTextOff
return







;Переключить режим альтернативного набора символов «0» и «/» вместо «`» и «~»
^sc029:: ; Ctrl+~
if AlterZeroSlash = 0
{
  AlterZeroSlash := 1
  SplashTextOn 200, 20, Альтернативные «0» и «/», ВКЛ
}
else
{
  AlterZeroSlash := 0
  SplashTextOn 200, 20, Альтернативные «0» и «/», ВЫКЛ
}
sleep, 1500
SplashTextOff
return







;Двойной клик для удаления точки
LCtrl & LButton::
BlockInput, MouseMove
click 2
BlockInput, MouseMoveOff
return








;Скруглить угол
!LButton::
#LButton::
if OldRoundCorner = 1
{
  dy := 60
  GoTo RoundCorner
}

WinGetPos, winX, winY, winW, winH
BlockInput, MouseMove
MouseGetPos, x1, y1

x2 := 0
y2 := 0

click
sleep 75

ImageSearch x2, y2, x1 + 2, y1 + 40, x1 + 150, y1 + 100, *180 NMaps_RoundCorner.png

if ErrorLevel = 1
{
ImageSearch x2, y2, x1 + 2, y1 + 40, x1 + 150, y1 + 100, *180 NMaps_RoundCorner_81_YA.png
}

if ErrorLevel = 1
{
ImageSearch x2, y2, x1 + 2, y1 + 40, x1 + 150, y1 + 100, *180 NMaps_RoundCorner_81_FF.png
}

if ErrorLevel = 1
{
ImageSearch x2, y2, x1 + 2, y1 + 40, x1 + 150, y1 + 100, *180 NMaps_RoundCorner_81_IE.png
}


if ErrorLevel = 0
{
  x2 := x2 + 8
  y2 := y2 + 8
  MouseClick, Left, %x2%, %y2%, 1, 0
  MouseMove, x1, y1, 0
}
BlockInput, MouseMoveOff
exit





!+LButton::
dy := 80

RoundCorner:

if OldRoundCorner = 1
{
  BlockInput, MouseMove
  MouseGetPos, x1, y1
  x2 := x1 + 30
  y2 := y1 + dy
  click
  MouseClick, Left, %x2%, %y2%, 1, 0
  MouseMove, x1, y1, 0
  BlockInput, MouseMoveOff
}
exit








;Увеличить масштаб
!sc04E:: ; Alt+NumPlus
#sc04E:: ; Win+NumPlus
!sc151:: ; Alt+PgDn
#sc151:: ; Win+PgDn

WinGetPos, winX, winY, winW, winH

x2 := 0
y2 := 0

BlockInput, MouseMove
sleep 50
MouseGetPos, x1, y1

ImageSearch x2, y2, LeftPanelWidth - 60, winH - BottomPanelHeight - 200, LeftPanelWidth, winH - BottomPanelHeight + 60, *50 NMaps_ZoomIn_Btn.png

if ErrorLevel = 0
{
  x2 := x2 + 10
  y2 := y2 + 10
  MouseClick, Left, %x2%, %y2%, 1, 0
}

MouseMove, x1, y1, 0
BlockInput, MouseMoveOff
exit






;Уменьшить масштаб
!sc04A:: ; Alt+NumMinus
#sc04A:: ; Win+NumMinus
!sc149:: ; Alt+PgUp
#sc149:: ; Win+PgUp

WinGetPos, winX, winY, winW, winH

x2 := 0
y2 := 0

BlockInput, MouseMove
MouseGetPos, x1, y1

ImageSearch x2, y2, LeftPanelWidth - 60, winH - BottomPanelHeight - 200, LeftPanelWidth, winH - BottomPanelHeight + 60, *50 NMaps_ZoomOut_Btn.png

if ErrorLevel = 0
{
  x2 := x2 + 10
  y2 := y2 + 10
  MouseClick, Left, %x2%, %y2%, 1, 0
}

MouseMove, x1, y1, 0
BlockInput, MouseMoveOff
exit







;Сменить подложку
!sc01E:: ; Alt+A
#sc01E:: ; Win+A
WinGetPos, winX, winY, winW, winH

x2 := 0
y2 := 0

BlockInput, MouseMove
sleep 50
MouseGetPos, x1, y1

ImageSearch x2, y2, LeftPanelWidth - 60, winH - BottomPanelHeight - 100, LeftPanelWidth, winH - BottomPanelHeight + 60, *50 NMaps_Base_A.png

if ErrorLevel = 1
{
  ImageSearch x2, y2, LeftPanelWidth - 60, winH - BottomPanelHeight - 100, LeftPanelWidth, winH - BottomPanelHeight + 60, *50 NMaps_Base_B.png
}

if ErrorLevel = 0
{
  x2 := x2 + 10
  y2 := y2 + 10
  MouseClick, Left, %x2%, %y2%, 1, 0
}

MouseMove, x1, y1, 0
BlockInput, MouseMoveOff
exit







;Переключить линейку
!sc02C:: ; Alt+Z
#sc02C:: ; Win+Z
WinGetPos, winX, winY, winW, winH

x2 := 0
y2 := 0

BlockInput, MouseMove
MouseGetPos, x1, y1

ImageSearch x2, y2, LeftPanelWidth - 60, winH - BottomPanelHeight - 100, LeftPanelWidth, winH - BottomPanelHeight + 60, *50 NMaps_Ruler_A.png

if ErrorLevel = 1
{
  ImageSearch x2, y2, LeftPanelWidth - 60, winH - BottomPanelHeight - 100, LeftPanelWidth, winH - BottomPanelHeight + 60, *50 NMaps_Ruler_B.png
}

if ErrorLevel = 0
{
  x2 := x2 + 10
  y2 := y2 + 10
  MouseClick, Left, %x2%, %y2%, 1, 0
}

MouseMove, x1, y1, 0
BlockInput, MouseMoveOff
exit






;Найти центр отрезка
!sc02E::  ; Alt+C
WinGetPos, winX, winY, winW, winH

dontshake := 1

SplashTextOn 310, 40, Найти центр отрезка, Наведите мышь на 1-ю точку`nи нажмите пробел...
WinMove, Найти центр отрезка, , winX + LeftPanelWidth, winY + TopPanelHeight + 10
KeyWait, Space, D
MouseGetPos, x1, y1

sleep, 250
SplashTextOn 310, 40, Найти центр отрезка, Наведите мышь на 2-ю точку`nи нажмите пробел...
WinMove, Найти центр отрезка, , winX + LeftPanelWidth, winY + TopPanelHeight + 10
KeyWait, Space, D
MouseGetPos, x2, y2

SplashTextOff

x0 := 0.0 + x1 + (x2 - x1) / 2.0
y0 := 0.0 + y1 + (y2 - y1) / 2.0

mousemove, %x0%, %y0%

dontshake := 0

return






;Найти центр окружности
!+sc02E::  ; Alt+Shift+C
WinGetPos, winX, winY, winW, winH

dontshake := 1

SplashTextOn 310, 40, Найти центр окружности, Наведите мышь на 1-ю точку`nи нажмите пробел...
WinMove, Найти центр окружности, , winX + LeftPanelWidth, winY + TopPanelHeight + 10
KeyWait, Space, D
MouseGetPos, x1, y1

sleep, 250
SplashTextOn 310, 40, Найти центр окружности, Наведите мышь на 2-ю точку`nи нажмите пробел...
WinMove, Найти центр окружности, , winX + LeftPanelWidth, winY + TopPanelHeight + 10
KeyWait, Space, D
MouseGetPos, x2, y2

sleep, 250
SplashTextOn 310, 40, Найти центр окружности, Наведите мышь на 3-ю точку`nи нажмите пробел...
WinMove, Найти центр окружности, , winX + LeftPanelWidth, winY + TopPanelHeight + 10
KeyWait, Space, D
MouseGetPos, x3, y3

SplashTextOff

GetCenter(x1, y1, x2, y2, x3, y3, x0, y0)

if (x0 < LeftPanelWidth) || (x0 > winW - RightPanelWidth) || (y0 < TopPanelHeight) || (y0 > winH - BottomPanelHeight)
{
  return
}

mousemove, %x0%, %y0%

dontshake := 0

return







;Разметка подъездов
!+sc012::  ; Alt+Shift+E

WinGetPos, winX, winY, winW, winH

SplashTextOn 300, 40, Разметка подъездов, Наведите мышь на 1-й подъезд`nи нажмите пробел...
WinMove, Разметка подъездов, , winX + LeftPanelWidth, winY + TopPanelHeight + 10
KeyWait, Space, D
MouseGetPos, x1, y1

sleep, 250
SplashTextOn 300, 40, Разметка подъездов, Наведите мышь на последний подъезд`nи нажмите пробел...
WinMove, Разметка подъездов, , winX + LeftPanelWidth, winY + TopPanelHeight + 10
KeyWait, Space, D
MouseGetPos, x2, y2
SplashTextOff

DrawEntranceMode = 1
goto StartDrawEntrances


!sc012::  ; Alt+E

WinGetPos, winX, winY, winW, winH

SplashTextOn 300, 40, Разметка подъездов, Наведите мышь на 1-й край здания`nи нажмите пробел...
WinMove, Разметка подъездов, , winX + LeftPanelWidth, winY + TopPanelHeight + 10
KeyWait, Space, D
MouseGetPos, x1, y1

sleep, 250
SplashTextOn 300, 40, Разметка подъездов, Наведите мышь на 2-й край здания`nи нажмите пробел...
WinMove, Разметка подъездов, , winX + LeftPanelWidth, winY + TopPanelHeight + 10
KeyWait, Space, D
MouseGetPos, x2, y2
SplashTextOff

DrawEntranceMode = 0


StartDrawEntrances:

sleep, 100
InputBox, n, Разметка подъездов, Введите количество подъездов (max 100):, , 300, 125, winX + (winW - 380) / 2, winY + (winH - 125) / 2

if errorlevel > 0
{
  exit
}

sleep, 200

if (n < 1) || (n > 100) || (DrawEntranceMode == 1) && (n < 2)
{
  return
}

BlockInput, MouseMove
MouseGetPos, x3, y3

sleep, 50

xr := 0
yr := 0
ImageSearch xr, yr, LeftPanelWidth - 60, winH - BottomPanelHeight - 100, LeftPanelWidth, winH - BottomPanelHeight + 60, *50 NMaps_Ruler_A.png

if ErrorLevel = 0
{
  xr := xr + 10
  yr := yr + 10
  MouseClick, Left, %xr%, %yr%, 1, 0
}
else
{
  ImageSearch xr, yr, LeftPanelWidth - 60, winH - BottomPanelHeight - 100, LeftPanelWidth, winH - BottomPanelHeight + 60, *50 NMaps_Ruler_B.png
}

if ErrorLevel = 0
{
  xr := xr + 10
  yr := yr + 10
}

dx := (0.0 + x2 - x1) / (n - DrawEntranceMode)
dy := (0.0 + y2 - y1) / (n - DrawEntranceMode)

if DrawEntranceMode = 0
{
  MouseClick, Left, %x1%, %y1%, 1, 0
}

i := 1

while i <= n
{
  x0 := x1 + (i - 0.5 - 0.5 * DrawEntranceMode) * dx
  y0 := y1 + (i - 0.5 - 0.5 * DrawEntranceMode) * dy
  MouseClick, Left, %x0%, %y0%, 1, 0
  i := i + 1

  GetKeyState, KeyPressed, Space
  if KeyPressed = D
  {
    BlockInput, MouseMoveOff
    return
  }
}

if DrawEntranceMode = 0
{
  MouseClick, Left, %x2%, %y2%, 1, 0
}

sleep, 75

if xr > 0
{
  MouseClick, Left, %xr%, %yr%, 1, 0
}

mousemove, %x3%, %y3%
BlockInput, MouseMoveOff
return







;Рисование окружности или дуги окружности по трём точкам
!sc020::  ; Alt+D
DrawClockwise := 1
WholeRound := 0
GoTo StartDrawRound

!+sc020::  ; Alt+Shift+D
DrawClockwise := -1
WholeRound := 0
GoTo StartDrawRound

!sc013::  ; Alt+R
DrawClockwise := 1
WholeRound := -1
GoTo StartDrawRound

!+sc013::  ; Alt+Shift+R
DrawClockwise := -1
WholeRound := -1
GoTo StartDrawRound



StartDrawRound:

br := "`r`n"

if WholeRound
{
  whats := "окружности"
  ;DebugString := "Mode;round" br br
}
else
{
  whats := "дуги"
  ;DebugString := "Mode;segment" br br
}

;DebugString := DebugString "DrawClockwise;" DrawClockwise br br

WinGetPos, winX, winY, winW, winH

SplashTextOn 310, 40, Рисование %whats% по трём точкам, Наведите мышь на 1-ю точку`nи нажмите пробел...
WinMove, Рисование %whats% по трём точкам, , winX + LeftPanelWidth, winY + TopPanelHeight + 10
KeyWait, Space, D
MouseGetPos, x1, y1
sleep, 250

SplashTextOn 310, 40, Рисование %whats% по трём точкам, Наведите мышь на 2-ю точку`nи нажмите пробел...
WinMove, Рисование %whats% по трём точкам, , winX + LeftPanelWidth, winY + TopPanelHeight + 10
KeyWait, Space, D
MouseGetPos, x2, y2
sleep, 250

SplashTextOn 310, 60, Рисование %whats% по трём точкам, Наведите мышь на 3-ю точку`nи нажмите пробел...`n(Чтобы задать число узлов, держите SHIFT)
WinMove, Рисование %whats% по трём точкам, , winX + LeftPanelWidth, winY + TopPanelHeight + 10
KeyWait, Space, D
SplashTextOff
MouseGetPos, x3, y3

x0 := 0.0
y0 := 0.0
as := GetSegmentLength(x1, y1, x2, y2)
bs := GetSegmentLength(x1, y1, x3, y3)
cs := GetSegmentLength(x3, y3, x2, y2)
r  := GetRadius(as, bs, cs)

GetCenter(x1, y1, x2, y2, x3, y3, x0, y0)

;DebugString := DebugString "Points;X;Y" br
;DebugString := DebugString "Point_1;" x1 ";" y1 br
;DebugString := DebugString "Point_2;" x2 ";" y2 br
;DebugString := DebugString "Point_3;" x3 ";" y3 br
;DebugString := DebugString "Center;"  x0 ";" y0 br br
;DebugString := Debugstring "Radius;" r br


pi  := 3.1415926535898
dx1 := 0.0 + x1 - x0
dy1 := 0.0 + y1 - y0
dx2 := 0.0 + x2 - x0
dy2 := 0.0 + y2 - y0



;DebugString := DebugString br "Angles;Rad;Rad/pi" br

alfa := Atan((y0-y1) / ABS(x1-x0))

;DebugString := DebugString "alfa;" alfa ";" (alfa/pi) br

if dx1 < 0.0
{
  alfa := pi - alfa
}

if WholeRound
{
  gamma := 2.0 * pi
  ;DebugString := DebugString "gamma;" gamma ";" (gamma/pi) br
}
else
{
  beta := Atan((y0-y2) / ABS(x2-x0))

  ;DebugString := DebugString "beta;" beta ";" (beta/pi) br

  if dx2 < 0.0
  {
    beta := pi - beta
  }

  gamma := 2.0 * pi + beta - alfa

  ;DebugString := DebugString "gamma;" gamma ";" (gamma/pi) br

  while gamma > (2.0 * pi)
  {
    gamma := gamma - (2.0 * pi)
  }

  if DrawClockwise = 1
  {
    gamma := (2.0 * pi) - gamma
  }

  ;DebugString := DebugString "gamma*;" gamma ";" (gamma/pi) br
}



GetKeyState, AskForN, Shift

if AskForN = D
{
  n := 0
  n0 := Ceil(r ** 0.66 * gamma / 2.0 / pi)
  While n <= 1
  {
    InputBox, n, Рисование %whats% по трём точкам, Введите количество узлов: (предлагаемое значение: %n0%), , 380, 125, winX + (winW - 380) / 2, winY + (winH - 125) / 2

    if errorlevel > 0
    {
      exit
    }

    if not WholeRound
    {
      n := n - 1
    }

    ;DebugString := DebugString "gamma/N;" gamma/n ";" (gamma/pi/n) br br
    ;DebugString := DebugString "N (manual);" n br

    if errorlevel = 1
    {
      Goto StopScript
    }
  }
}
else
{
  n := Ceil(r ** 0.66 * gamma / 2.0 / pi)
  ;DebugString := DebugString "gamma/N;" gamma/n ";" (gamma/pi/n) br br
  ;DebugString := DebugString "N (auto);" n br
}


;DebugString := DebugString br "x;delta(x);delta(x)/pi;cos(delta);sin(delta);px;py" br

txt := "Чтобы прервать процесс,`nнажмите пробел."
SplashTextOn 290, 40, Рисование %whats% по трём точкам, %txt%
WinMove, Рисование %whats% по трём точкам, , winX + LeftPanelWidth, winY + TopPanelHeight + 10
BlockInput, MouseMove

dcw := DrawClockwise
x := 0.0
gamma := gamma / n

while x < n
{
  delta := alfa - (gamma * x * dcw)
  px := Ceil(x0 + (cos(delta) * r))
  py := Ceil(y0 - (sin(delta) * r))

  ;DebugString := DebugString ceil(x) ";" delta ";" delta/pi ";" cos(delta) ";" sin(delta) ";" px ";" py br

  x := x + 1.0

  if (px < LeftPanelWidth) || (px > winW - RightPanelWidth) || (py < TopPanelHeight) || (py > winH - BottomPanelHeight)
  {
    Goto StopScript
  }

  if NoSnapping = 0
  {
    click, %px%, %py%
  }
  else
  {
    Send +{click, %px%, %py%}
  }

  GetKeyState, KeyPressed, Space
  if KeyPressed = D
  {
    Goto StopScript
  }

  sleep, DrawDelay
}

if not WholeRound
{
  if NoSnapping = 0
  {
    click, %x2%, %y2%
  }
  else
  {
    Send +{click, %x2%, %y2%}
  }
}

;DebugString := DebugString br "Done."

StopScript:

BlockInput, MouseMoveOff
SplashTextOff
Exit








