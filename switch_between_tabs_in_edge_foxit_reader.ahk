#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn All, StdOut  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#If WinActive("ahk_exe msedge.exe") or WinActive("ahk_exe foxitreader.exe")
;; (Edge) Switch tabs in Edge
;;; [ / ] (below the 'minus' and 'equal' keys)
;;;; Why should I use 2 or 3 keys to use such common feature?
^PgUp::
Send, ^+{Tab}
return

^PgDn::
Send, ^{Tab}
return

^l::
Send, ^l
SwitchToTyping("english")
return

; switch tabs
:?*:[::
SwitchToTyping("english")
WinGetTitle, Title, A
Text := "Colaboratory"
If InStr(Title, Text)
{
    Send, [
    return
}

Send, ^+{Tab}
return

; switch tabs
:?*:]::
SwitchToTyping("english")
WinGetTitle, Title, A
Text := "Colaboratory"
If InStr(Title, Text)
{
    Send, ]
    return
}

Send, ^{Tab}
return