; Variables
Increments 			:= 10 ; < lower for a more granular change, higher for larger jump in brightness
CurrentBrightness 	:= GetCurrentBrightNess()

; Change brightness
RCtrl & Left::
ChangeBrightness( CurrentBrightness -= Increments ) ; decrease brightness
return

RCtrl & Right::
ChangeBrightness( CurrentBrightness += Increments ) ; increase brightness
return

; Change volumn
RCtrl & Down::
Send {Volume_Down 5} ;Alt/Left Arrow to reduce volume
return

RCtrl & Up::
Send {Volume_Up 5} ;Alt/Right Arrow to increase volume
return

ChangeBrightness( ByRef brightness := 50, timeout = 1 )
{
	if ( brightness >= 0 && brightness <= 100 )
	{
		For property in ComObjGet( "winmgmts:\\.\root\WMI" ).ExecQuery( "SELECT * FROM WmiMonitorBrightnessMethods" )
			property.WmiSetBrightness( timeout, brightness )
	}
 	else if ( brightness > 100 )
 	{
 		brightness := 100
 	}
 	else if ( brightness < 0 )
 	{
 		brightness := 0
 	}
}

GetCurrentBrightNess()
{
	For property in ComObjGet( "winmgmts:\\.\root\WMI" ).ExecQuery( "SELECT * FROM WmiMonitorBrightness" )
		currentBrightness := property.CurrentBrightness

	return currentBrightness
}