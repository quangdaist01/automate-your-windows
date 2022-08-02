#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn All, StdOut  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#If WinActive("ahk_exe msedge.exe") or WinActive("ahk_exe foxitreader.exe")
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
Send, ^+{Tab}
return

; switch tabs
:?*:]::
SwitchToTyping("english")
Send, ^{Tab}
return

