CustomColor := "000000"  ; Can be any RGB color (it will be made transparent below).
Gui +LastFound +AlwaysOnTop -Caption +ToolWindow  ; +ToolWindow avoids a taskbar button and an alt-tab menu item.
Gui, Color, %CustomColor%
Gui, Font, s50 bold  ; Set a large font size (32-point).
Gui, Add, Text, vMyText cRed, Type numbers ; XX & YY serve to auto-size the window.
; Make all pixels of this color transparent and make the text itself translucent (150):
WinSet, TransColor, %CustomColor% 120
return

; (Edge)
; [ / ] (below the 'minus' and 'equal' keys)
; Why should I use 2 or 3 keys to do such common feature?
!'::
    Suspend Permit
    Gui, Show, x650 y420 NoActivate  ; NoActivate avoids deactivating the currently active window.
    Suspend Off
    Return


:*?:a::
send, 1
Return

:*?:s::
send, 2
Return

:*?:d::
send, 3
Return

:*?:f::
send, 4
Return

:*?:g::
send, 5
Return

:*?:h::
send, 6
Return

:*?:j::
send, 7
Return

:*?:k::
send, 8
Return

:*?:l::
send, 9
Return

`;::
send, 0
Return

:*?:i::
Escape::
Gui hide
Suspend On
Return