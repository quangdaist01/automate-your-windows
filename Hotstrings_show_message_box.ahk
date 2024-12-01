list_of_common_strings := "
(
------------ Common|
Nguyễn Quang Đại|
quangdaist01@gmail.com|
)"

Gui, Font, s15
Gui, +Resize -MaximizeBox
;Gui, Add, Text,, Please select a Program to run:
Gui, Add, ListBox, w600 r27 vchoice, %list_of_common_strings%

Gui, Add, Button, Default, OK
GuiControl, Choose, choice, 1
;Gosub, F3

#k::
Gui, Show, xCenter y0
return

ButtonOK:
Gui, Submit
Gui, Hide
Sleep, 500
;SetKeyDelay, 5
;choice := StrReplace(choice, "`n")
;Send, {Text}%choice%
SendInput, %choice%
return

; ------------ Hotstrings ------------
:?*::tks::Thanks bạn nha
:?*::ahk::autohotkey
:?*:-'::------------
:?*:rel'::What is the relationships of _ and _?
:?*::=>::➡️️
