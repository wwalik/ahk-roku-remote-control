#Requires AutoHotkey v2.0

TV_IP := '192.168.1.137' ; You should change this to whatever your Roku TV's ip is.
TV_ECP_PORT := '8060' ; You probably won't need to change this. As far as I can tell, every Roku TV uses 8060 for the ECP.


; This function is responsible for sending the command to the Roku TV
SendKeypress(socket, command) {
    FullCommand := Format('curl -d "" "http://{1}/keypress/{2}"', socket, command)
    RunWait(FullCommand, , "Hide")
}

TV_SOCKET := TV_IP . TV_ECP_PORT
;@region General
;  _____                           _ 
; |  __ \                         | |
; | |  \/ ___ _ __   ___ _ __ __ _| |
; | | __ / _ \ '_ \ / _ \ '__/ _` | |
; | |_\ \  __/ | | |  __/ | | (_| | |
;  \____/\___|_| |_|\___|_|  \__,_|_|

; Power
^+NumpadSub::
{
	SendKeypress(TV_SOCKET, 'Power')
}

; Home
^+NumpadEnter::
{
	SendKeypress(TV_SOCKET, 'Home')
}

; Back
^+NumpadAdd::
{
	SendKeypress(TV_SOCKET, 'Back')
}

; Select
^+NumpadClear::
^+Numpad5::
{
	SendKeypress(TV_SOCKET, 'Select')
}
;@endregion

;@region Direction keys
;  ____  _             _   _            _               
; |    \|_|___ ___ ___| |_|_|___ ___   | |_ ___ _ _ ___ 
; |  |  | |  _| -_|  _|  _| | . |   |  | '_| -_| | |_ -|
; |____/|_|_| |___|___|_| |_|___|_|_|  |_,_|___|_  |___|
;                                              |___|    

^+NumpadUp::
^+Numpad8::
{
	SendKeypress(TV_SOCKET, 'Up')
}

^+NumpadDown::
^+Numpad2::
{
	SendKeypress(TV_SOCKET, 'Down')
}

^+NumpadLeft::
^+Numpad4::
{
	SendKeypress(TV_SOCKET, 'Left')
}

^+NumpadRight::
^+Numpad6::
{
	SendKeypress(TV_SOCKET, 'Right')
}
;@endregion

;@region Text Input
;  _____         _     _____                  _   
; |_   _|       | |   |_   _|                | |  
;   | | _____  _| |_    | | _ __  _ __  _   _| |_ 
;   | |/ _ \ \/ / __|   | || '_ \| '_ \| | | | __|
;   | |  __/>  <| |_   _| || | | | |_) | |_| | |_ 
;   \_/\___/_/\_\\__|  \___/_| |_| .__/ \__,_|\__|
;                                | |              
;                                |_|              

^+NumpadDot::
^+NumpadDel::
{
	user_input := InputBox("Text to be sent to tv:", "Roku Remote", "W250 H100")
	
	Loop Parse, user_input.Value
	{
		SendKeypress(TV_SOCKET, 'LIT_' . A_LoopField)
	}
}

;@endregion

;@region Credit
;  _____              _ _ _   
; /  __ \            | (_) |  
; | /  \/_ __ ___  __| |_| |_ 
; | |   | '__/ _ \/ _` | | __|
; | \__/\ | |  __/ (_| | | |_ 
;  \____/_|  \___|\__,_|_|\__|

; Ascii art generated with https://patorjk.com/software/taag/ using the DOOM font.
;@endregion
