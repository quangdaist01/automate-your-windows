#If MouseIsOver("ahk_class Shell_TrayWnd")
;; Scroll on the taskbar to adjust volume
;;; None
WheelUp::
Send {Volume_Up}
Send {Volume_Up}
Send {Volume_Up}
Send {Volume_Up}
Send {Volume_Up}
return

WheelDown::
Send {Volume_Down}
Send {Volume_Down}
Send {Volume_Down}
Send {Volume_Down}
Send {Volume_Down}
return

MouseIsOver(WinTitle) {
    MouseGetPos,,, Win
    return WinExist(WinTitle . " ahk_id " . Win)
}