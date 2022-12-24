#Include switch_unikey_modes.ahk
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn All, StdOut  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#If WinActive("ahk_exe Notion.exe")

;; (Notion) Send whitecheck symbol in notion
;;; c + '
:?*:c'::
SendInput, :white check
Sleep, 100
Send, {Enter}
return

;; (Notion) Send alert symbol in notion
;;; a + '
:?*:a'::
SendInput, :alert
Sleep, 100
Send, {Enter}
return

;; (Notion) Create a callout block
;;; a + '
:?*:>>::
SendInput, /callout
Sleep, 100
Send, {Enter}
return

:?*:m'::
SwitchToTyping("english")
Send, [MOOC]{Space}
return

;; (Notion) Go to the previous page that was opened.
;;; [
:?*:[::
Send, ^[
return

;; (Notion) Go one tier up in the page hierarchy.
;;; ]
:?*:]::
Send, ^+u
return

;; (Notion) Hold shift key
;;; AppsKey
;;;; I put the mouse on the LEFT and the LEFT shift is mapped to another function so it's hard to scroll horizontally
AppsKey::
Loop
{
    If !GetKeyState("AppsKey","P")
        {
            Send, {Shift up}
            Break
        }
    else
        Send, {Shift down}
}
return

^!+m::
WinGetPos,,, Width, Height, ahk_exe Notion.exe
WinMove, ahk_exe Notion.exe,, -10, -75, 1940, 1130
return


^PgUp::
Send, ^+{Tab}
return

^PgDn::
Send, ^{Tab}
return

