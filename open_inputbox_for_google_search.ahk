toEncode :=	[" ","%", """", "#", "&"
 , "/", ":", ";", "<"
 , "=", ">", "?", "@"
 , "[", "\", "]", "^"
 , "``", "{", "|", "}", "~"]

e :=	["+","%25", "%22", "%23", "%26"
 , "%2F", "%3A", "%3B", "%3C"
 , "%3D", "%3E", "%3F", "%40"
 , "%5B", "%5C", "%5D", "%5E"
 , "%60", "%7B", "%7C", "%7D", "%7E"]


#s::
InputBox, Search, Google Search,,,250, 100
if !ErrorLevel
{
    For i, u in toEncode		; check/replace loop for unsafe chars
	StringReplace, Search, Search, %	u, %	e[i], All
    Run, http://www.google.com/search?q=%Search% ;else use Google search
    }
return
