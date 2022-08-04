; move active window 100 pixels right
^+l::
wingetpos x, y,,, A   ; get coordinates of the active window
x += 100			  ; add 100 to the x coordinate
winmove, A,,%x%, %y%  ; make the active window use the new coordinates
return				  ; finish

; move active window 100 pixels left
^+h::
wingetpos x, y,,, A
x -= 100
winmove, A,,%x%, %y%
return

; move active window 100 pixels up
^+k::
wingetpos x, y,,, A
y -= 100
winmove, A,,%x%, %y%
return

; move active window 100 pixels down
^+j::
wingetpos x, y,,, A
y += 100
winmove, A,,%x%, %y%
return