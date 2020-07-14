#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;THIS IS THE MOST RECENT VERSION OF THE TOUCH SCREEN PLUGIN AS OF 15/11/19

;Sets the mode in which AHK should interpret mouse coordinates and pixel coordinates.
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
cinnum := 0

;If venue master Info Box opens this will close it
Loop {
if WinExist("Information")
{
WinActivate, Information
Send, {Enter}
}



;if touch screen annotations aren't currently being shown then do the following
if (showMap = false)
{

;This displays the touchscreen legend on the customer screen 
Gui, Legend: -Caption 
Gui, Legend: Color, EEAA99
Gui Legend: +LastFound +AlwaysOnTop +ToolWindow
Gui, Legend: Add, Picture, X0 Y0 h-1 +BackgroundTrans, touch.png
WinSet, TransColor, EEAA99
WinSet, ExStyle, +0x00000020
Gui, Legend: Show, X2161 Y0 NoActivate

;This displays the global touchscreen elements on the customer screen 
Gui, Downstairs: -Caption 
Gui, Downstairs: Color, EEAA99
Gui Downstairs: +LastFound +AlwaysOnTop +ToolWindow
Gui, Downstairs: Add, Picture, X0 Y0 h-1 +BackgroundTrans, DownstairsLabel.png
WinSet, TransColor, EEAA99
WinSet, ExStyle, +0x00000020


Gui, Upstairs: -Caption 
Gui, Upstairs: Color, EEAA99
Gui Upstairs: +LastFound +AlwaysOnTop +ToolWindow
Gui, Upstairs: Add, Picture, X0 Y0 h-1 +BackgroundTrans, UpstairsLabel.png
WinSet, TransColor, EEAA99
WinSet, ExStyle, +0x00000020


Gui, Balcony: -Caption 
Gui, Balcony: Color, EEAA99
Gui Balcony: +LastFound +AlwaysOnTop +ToolWindow
Gui, Balcony: Add, Picture, X0 Y0 h-1 +BackgroundTrans, UpstairsBorder.png
WinSet, TransColor, EEAA99
WinSet, ExStyle, +0x00000020

Gui, Balcony2: -Caption 
Gui, Balcony2: Color, EEAA99
Gui Balcony2: +LastFound +AlwaysOnTop +ToolWindow
Gui, Balcony2: Add, Picture, X0 Y0 h-1 +BackgroundTrans, UpstairsBorder.png
WinSet, TransColor, EEAA99
WinSet, ExStyle, +0x00000020

Gui, Stairs: -Caption 
Gui, Stairs: Color, EEAA99
Gui Stairs: +LastFound +AlwaysOnTop +ToolWindow
Gui, Stairs: Add, Picture, X0 Y0 h-1 +BackgroundTrans, Stairs.png
WinSet, TransColor, EEAA99
WinSet, ExStyle, +0x00000020

;Determine which cinema we're in and show cinema exclusive gui elements.
if cinnum = 1
{
Gui, Upstairs: Show, X1678 Y695 NoActivate
Gui, Downstairs: Show, X1657 Y503 NoActivate
Gui, Balcony: Show, X1280 Y553 W480 H22 NoActivate
Gui, Balcony2: Show, X1833 Y553 W329 H22 NoActivate
Gui, Stairs: Show, X1766 Y533 NoActivate
showMap := true
}
if cinnum = 2
{
Gui, Upstairs: Show, X1678 Y695 NoActivate
Gui, Downstairs: Show, X1657 Y503 NoActivate
Gui, Balcony: Show, X1320 Y553 W290 H22 NoActivate
Gui, Balcony2: Show, X1684 Y553 W439 H22 NoActivate
Gui, Stairs: Show, X1616 Y533 NoActivate
showMap := true
}
if cinnum = 3
{
Gui, Upstairs: Show, X1678 Y695 NoActivate
Gui, Downstairs: Show, X1657 Y503 NoActivate
Gui, Balcony: Show, X1352 Y553 W404 H22 NoActivate
Gui, Balcony2: Show, X1829 Y553 W256 H22 NoActivate
Gui, Stairs: Show, X1761 Y533 NoActivate
showMap := true
}
if cinnum = 4
{
Gui, Upstairs: Show, X1678 Y695 NoActivate
Gui, Downstairs: Show, X1657 Y455 NoActivate
Gui, Balcony: Show, X1490 Y500 W560 H22 NoActivate
Gui, Stairs: Show, X1420 Y470 NoActivate
showMap := true
}
if cinnum = 5
{
Gui, Upstairs: Show, X1678 Y695 NoActivate
Gui, Downstairs: Show, X1657 Y455 NoActivate
Gui, Balcony: Show, X1427 Y500 W738 H22 NoActivate
Gui, Stairs: Show, X1329 Y470 NoActivate
showMap := true
}
if cinnum = 6 
{
Gui, Upstairs: Show, X1678 Y695 NoActivate
Gui, Downstairs: Show, X1657 Y455 NoActivate
Gui, Balcony: Show, X1291 Y500 W738 H22 NoActivate
Gui, Stairs: Show, X2058 Y470 NoActivate
showMap := true
}
if cinnum = 7 
{
Gui, Upstairs: Show, X1678 Y695 NoActivate
Gui, Downstairs: Show, X1657 Y455 NoActivate
Gui, Balcony: Show, X1422 Y500 W502 H22 NoActivate
Gui, Stairs: Show, X1933 Y470 NoActivate
showMap := true
}

WinActivate, ahk_class TMainForm
}


;check that the autoselect button is blue meaning its deselected and will need to be pressed by this script
PixelGetColor,Colvar2,109, 715
;Msgbox,%Colvar2%
if Colvar2 =0xE9AE97
{
;check that there are arrow keys in the top right corner to ensure we're on seatmap screen
PixelGetColor,Colvar3,958,48
;If they deselect the auto seat option this will reselect it
if Colvar3 =0xA4FFFF
{
MouseMove,109, 715
MouseClick, L
}
}
} else {
;if they're no longer in seat selection then close the gui
showMap := false
Gui, Legend: Destroy
Gui, Downstairs: Destroy
Gui, Upstairs: Destroy
Gui, Balcony: Destroy
Gui, Balcony2: Destroy
Gui, Stairs: Destroy
}



;gets the ui element from which to read what cinema is selected
if cincon =
{
ControlGet, cincon , HWND, , Select Session, ahk_exe UniversalCashier.exe
} else {
ControlGetText, cintex, , ahk_id %cincon%
if ErrorLevel
cincon =
}
}
;upon touch of screen it checks if we're in the seating map
~LButton::
;check that we're in seating plan by ensuring there is a white blank space where the cinema screen graphic is
PixelGetColor,Colvar,637,47
if Colvar =0xFFFFFF
{

Needle1 := "Cinema One"
Needle2 := "Cinema Two"
Needle3 := "Cinema Three"
Needle4 := "Cinema Four"
Needle5 := "Cinema Five"
Needle6 := "Cinema Six"
Needle7 := "Cinema Seven"
IfInString, cintex, %Needle1%
{
cinnum := 1
cintex = Cinema 1
} 
IfInString, cintex, %Needle2%
{
cinnum := 2
cintex = Cinema 2
} 
IfInString, cintex, %Needle3%
{
cinnum := 3
cintex = Cinema 3
}
IfInString, cintex, %Needle4%
{
cinnum := 4
cintex = Cinema 4
} 
IfInString, cintex, %Needle5%
{
cinnum := 5
cintex = Cinema 5
} 
IfInString, cintex, %Needle6%
{
cinnum := 6
cintex = Cinema 6
} 
IfInString, cintex, %Needle7%
{
cinnum := 7
cintex = Cinema 7
}

;PixelGetColor,Colvar2,230,448
;if Colvar2 !=0xA4FFFF
;{

;read the saved ini file corresponding to the currently selected cinema and attach values to variables.
;C2 Front cust
IniRead, xV2, %cintex%, Customer Front, Xpos 
IniRead, yV2, %cintex%, Customer Front, Ypos 
IniRead, wV2, %cintex%, Customer Front, Width
IniRead, hV2, %cintex%, Customer Front, Height
;C2 Front cash
IniRead, xV3, %cintex%, Cashier Front, Xpos 
IniRead, yV3, %cintex%, Cashier Front, Ypos 
IniRead, wV3, %cintex%, Cashier Front, Width
IniRead, hV3, %cintex%, Cashier Front, Height

;C2 Middle cust
IniRead, xV4, %cintex%, Customer Middle, Xpos 
IniRead, yV4, %cintex%, Customer Middle, Ypos 
IniRead, wV4, %cintex%, Customer Middle, Width
IniRead, hV4, %cintex%, Customer Middle, Height
;C2 Middle cash
IniRead, xV5, %cintex%, Cashier Middle, Xpos 
IniRead, yV5, %cintex%, Cashier Middle, Ypos 
IniRead, wV5, %cintex%, Cashier Middle, Width
IniRead, hV5, %cintex%, Cashier Middle, Height

;C2 Back cust
IniRead, xV6, %cintex%, Customer Back, Xpos 
IniRead, yV6, %cintex%, Customer Back, Ypos 
IniRead, wV6, %cintex%, Customer Back, Width
IniRead, hV6, %cintex%, Customer Back, Height
;C2 Back cash
IniRead, xV7, %cintex%, Cashier Back, Xpos 
IniRead, yV7, %cintex%, Cashier Back, Ypos 
IniRead, wV7, %cintex%, Cashier Back, Width
IniRead, hV7, %cintex%, Cashier Back, Height




;if a cinema is currently selected
if cinnum != 0
{

MouseGetPos, xey, yey
;check if mouse coordinates are within bounds of selection zones determined in ini files.
if xey >= %xV2%
{
	if (xey <= (xV2+wV2))
	{
		if yey > %yV2%
		{
			if (yey <= (yV6+hV6))
			{
				if (yey <= (yV2+hV2))
				{
					if yey >= %yV2%
					{
;if the mouse click is in one of the customer side scaling zones then move the mouse to the same location scaled to the screen side of the cashier
						MouseMove,(xey-xV2)*(wV3/wV2)+xV3,(yey-yV2)*(hV3/hV2)+yV3
					}
				} else {
					if (yey <= (yV4+hV4))
					{
;if the mouse click is in one of the customer side scaling zones then move the mouse to the same location scaled to the screen side of the cashier
						MouseMove,(xey-xV2)*(wV5/wV4)+xV3,(yey-yV4)*(hV5/hV4)+yV5
					} else {
						if (yey <= (yV6+yV7))
						{
;if the mouse click is in one of the customer side scaling zones then move the mouse to the same location scaled to the screen side of the cashier
							MouseMove,(xey-xV2)*(wV7/wV6)+xV3,(yey-yV6)*(hV7/hV6)+yV7
						}
					}
				}
;After the mouse has been moved to the correct location wait momentarily then click the mouse to select the seat.
						Sleep 100
						MouseGetPos, xey2, yey2
						MouseClick, L

			}
		}
	}
}
}
}
;}
