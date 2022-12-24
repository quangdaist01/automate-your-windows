CoordMode, Mouse, Screen

CustomColor := "000000"  ; Can be any RGB color (it will be made transparent below).
Gui +LastFound +AlwaysOnTop -Caption +ToolWindow  ; +ToolWindow avoids a taskbar button and an alt-tab menu item.
Gui, Color, %CustomColor%
Gui, Font, s50 bold  ; Set a large font size (32-point).
Gui, Add, Text, vMyText cRed, Scroll mode ; XX & YY serve to auto-size the window.
; Make all pixels of this color transparent and make the text itself translucent (150):
WinSet, TransColor, %CustomColor% 120

Suspend On

return

;; Scroll on vertical sections of the screen
;;; Win + ;
;;;; Avoid using the mouse, especially when scrolling facebook chat list and messages
#;::
    Suspend Permit

    Gui, Show, x700 y420 NoActivate  ; NoActivate avoids deactivating the currently active window.

    ; Move the mouse to the center of the screen
    x := A_ScreenWidth / 2
    y := A_ScreenHeight / 2
    Click, %x% %y% 0

    Suspend Off
    Return


; Move the mouse to the left of the screen
:*?:h::
x := A_ScreenWidth / 5
y := A_ScreenHeight / 2
Click, %x% %y% 0
Return

; Move the mouse to the right of the screen
:*?:l::
x := A_ScreenWidth / 2 + A_ScreenWidth / 3
y := A_ScreenHeight / 2
Click, %x% %y% 0
Return

; Move the mouse to the center of the screen
:*?:k::
:*?:j::
x := A_ScreenWidth / 2
y := A_ScreenHeight / 2
Click, %x% %y% 0
Return

; Scroll up
:*?:u::
Send, {WheelUp 2}
return

; Scroll up
:*?:d::
Send, {WheelDown 2}
return

Space::
Click
return


:*?:i::
Escape::
Gui hide
Suspend On
Return