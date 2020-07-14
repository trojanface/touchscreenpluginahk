#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; A utility to generate .ini files for the touch screen plugin to read from.

; Select the cinema you're setting up for touch screen scaling.
InputBox, cinname, Seat Mapper, Please enter auditorium name (e.g. Cinema 1)

;Creates a resizable box for you to size over the seats you wish to include in touch screen scaling.
Gui, New, , Front of Cinema
Gui, add, button, w300 h100 vpic gclick, OK
Gui +Resize
Gui, Show

return

;When this button is clicked it will save the window coordinates and then create the next window for cinema seating selection
click:
WinGetPos, pox, poy,cliw, clih, Front of Cinema, 
;msgbox, x%cliw% y%clih% 
Gui, New, , Middle of Cinema
Gui, add, button, w300 h100 vpic gclick2, OK
Gui +Resize
Gui, Show

return

;When this button is clicked it will save the window coordinates and then create the next window for cinema seating selection
click2:
WinGetPos, pox2, poy2,cliw2, clih2, Middle of Cinema, 
;msgbox, x%cliw2% y%clih2% 
Gui, New, , Back of Cinema
Gui, add, button, w300 h100 vpic gclick3, OK
Gui +Resize
Gui, Show

return

;When this button is clicked it will save the window coordinates and then create the next window for cinema seating selection
click3:
WinGetPos, pox3, poy3,cliw3, clih3, Back of Cinema, 
;msgbox, x%cliw3% y%clih3% 
Gui, New, , Front of Cinema Cashier
Gui, add, button, w300 h100 vpic gclick4, OK
Gui +Resize
Gui, Show

return

;When this button is clicked it will save the window coordinates and then create the next window for cinema seating selection on the cashier side
click4:
WinGetPos, pox4, poy4,cliw4, clih4, Front of Cinema Cashier, 
;msgbox, x%cliw4% y%clih4% 
Gui, New, , Middle of Cinema Cashier
Gui, add, button, w300 h100 vpic gclick5, OK
Gui +Resize
Gui, Show

return

;When this button is clicked it will save the window coordinates and then create the next window for cinema seating selection on the cashier side
click5:
WinGetPos, pox5, poy5,cliw5, clih5, Middle of Cinema Cashier, 
;msgbox, x%cliw5% y%clih5% 
Gui, New, , Back of Cinema Cashier
Gui, add, button, w300 h100 vpic gclick6, OK
Gui +Resize
Gui, Show

return

;When this button is clicked it will save the window coordinates and then create the next window for cinema seating selection on the cashier side
click6:
WinGetPos, pox6, poy6,cliw6, clih6, Back of Cinema Cashier, 
msgbox,  %cinname% `n FC w%cliw% h%clih% x%pox% y%poy% `n MC w%cliw2% h%clih2% x%pox2% y%poy2%`n BC w%cliw3% h%clih3% x%pox3% y%poy3%`n `n FCC w%cliw4% h%clih4% x%pox4% y%poy4%`n MCC w%cliw5% h%clih5% x%pox5% y%poy5%`n BCC w%cliw6% h%clih6% x%pox6% y%poy6%


;Before exiting this will save the variables to an ini file. this ini file will then be read by the actual touchscreen program and will load it
;as its variables so there will be no manual entry! It will save the ini file seperately depending upon which cinema you have told it you're editing

IniWrite, %cliw%, %cinname%, Customer Front, Width
IniWrite, %clih%, %cinname%, Customer Front, Height
IniWrite, %pox%, %cinname%, Customer Front, Xpos
IniWrite, %poy%, %cinname%, Customer Front, Ypos

IniWrite, %cliw2%, %cinname%, Customer Middle, Width
IniWrite, %clih2%, %cinname%, Customer Middle, Height
IniWrite, %pox2%, %cinname%, Customer Middle, Xpos
IniWrite, %poy2%, %cinname%, Customer Middle, Ypos

IniWrite, %cliw3%, %cinname%, Customer Back, Width
IniWrite, %clih3%, %cinname%, Customer Back, Height
IniWrite, %pox3%, %cinname%, Customer Back, Xpos
IniWrite, %poy3%, %cinname%, Customer Back, Ypos


IniWrite, %cliw4%, %cinname%, Cashier Front, Width
IniWrite, %clih4%, %cinname%, Cashier Front, Height
IniWrite, %pox4%, %cinname%, Cashier Front, Xpos
IniWrite, %poy4%, %cinname%, Cashier Front, Ypos

IniWrite, %cliw5%, %cinname%, Cashier Middle, Width
IniWrite, %clih5%, %cinname%, Cashier Middle, Height
IniWrite, %pox5%, %cinname%, Cashier Middle, Xpos
IniWrite, %poy5%, %cinname%, Cashier Middle, Ypos

IniWrite, %cliw6%, %cinname%, Cashier Back, Width
IniWrite, %clih6%, %cinname%, Cashier Back, Height
IniWrite, %pox6%, %cinname%, Cashier Back, Xpos
IniWrite, %poy6%, %cinname%, Cashier Back, Ypos


ExitApp



