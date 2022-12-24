CustomColor := "000000"  ; Can be any RGB color (it will be made transparent below).
Gui +LastFound +AlwaysOnTop -Caption +ToolWindow  ; +ToolWindow avoids a taskbar button and an alt-tab menu item.
Gui, Color, %CustomColor%
Gui, Font, s35 bold  ; Set a large font size (32-point).
Gui, Add, Text, vMyText cRed, CapsLock is on ; XX & YY serve to auto-size the window.
; Make all pixels of this color transparent and make the text itself translucent (150):
WinSet, TransColor, %CustomColor% 150
return


;; Show CapsLock state on the screen
;;; CapsLock
;;;; I want to know when CapsLock is on so I can turn it off before navigating (I use Vim a lot)
CapsLock::
SetCapsLockState % !GetKeyState("CapsLock", "T") ; requires [v1.1.30+]
isCapsLockOn := GetKeyState("CapsLock", "T") ; requires [v1.1.30+]
if isCapsLockOn
{
    Gui, Show, xCenter yCenter NoActivate  ; NoActivate avoids deactivating the currently active window.
}
else
    Gui, Hide

