'---------------------------------------------------------
'Validate Windows Scripting Host
'---------------------------------------------------------

Option Explicit
On Error Resume Next

Dim dVersion
Dim oShell
Dim oNetwork
Dim oFSO
Dim oEnv
Dim ValidatePrereq

WScript.Echo "Validate Windows Script Host"
WScript.Echo ""

' Check the WSH version.  It needs to be at least 5.6.
dVersion = Eval(WScript.Version)
WScript.Echo "Version: " & dVersion

If Err then
'	ValidatePrereq = 5000   ' Report a specific return code
    WScript.Echo "The following Error Occurred:: " & err.Description
	WScript.Quit Err.number
ElseIf dVersion < 5.6 then
	'ValidatePrereq = 5001   ' Report a specific return code
	Wscript.Echo "Incorrect WScript Version"
	WScript.Quit 1
End if


' Create general-purpose WSH objects.  These should always succeed; if not, 
' WSH is seriously broken.
Set oShell = CreateObject("WScript.Shell")
If Err then
	WScript.Echo "Create WScript.Shell object failed"
	WScript.Quit 1
End if
WScript.Echo "Create WScript.Shell object OK"

Set oNetwork = CreateObject("WScript.Network")
If Err then
	WScript.Echo "Create WScript.Network object failed"
	WScript.Quit 1
End if
WScript.Echo "Create WScript.Network object OK"

Set oFSO = CreateObject("Scripting.FileSystemObject")
If Err then
	WScript.Echo "Create WScript.FileSystemObject object failed"
	WScript.Quit 1
End if
WScript.Echo "Create WScript.FileSystemObject object OK"

Set oEnv = oShell.Environment("PROCESS")
If Err then
	WScript.Echo "Create Shell Process Environment failed"
	WScript.Quit 1
End if
WScript.Echo "Create Shell Process Environment OK"

WScript.Echo ""
WScript.Quit 0