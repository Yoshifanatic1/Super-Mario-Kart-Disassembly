
!RAM_SMK_Race_CurrentRacetrack = $000124

!RAM_SMK_Global_RacetrackType = $000126

!RAM_SMK_Race_NumberOfRacersWhoFinished = $00012E

!RAM_SMK_Global_RaceCup = $000150

!RAM_SMK_Global_CurrentRound = $000152

!RAM_SMK_Global_ScreenDisplayRegister = $000161

!RAM_SMK_Global_OAMBuffer1 = $000200
!RAM_SMK_Global_OAMBuffer2 = $000420

; $000B00 = 256 byte table controlling the behavior of each 8x8 mode 7 tile.
; $000C00 = 256 byte table, layer 2 status bar tilemap

; $000E32 = Demo mode flag?

; $001018 = Player 1 X pos low
; $001016 = Player 1 X pos high

; $00101C = Player 1 Y pos low
; $00101D = Player 1 Y pos high

; $0010C1 = Player 1 Current lap

; $0010EA = Player 1 movement speed pos low
; $0010EB = Player 1 movement speed pos high

struct SMK_Global_OAMBuffer1 !RAM_SMK_Global_OAMBuffer1
	.XDisp: skip $01
	.YDisp: skip $01
	.Tile: skip $01
	.Prop: skip $01
endstruct align $04

struct SMK_Global_UpperOAMBuffer1 !RAM_SMK_Global_OAMBuffer1+$0200
	.Slot: skip $01
endstruct align $01

struct SMK_Global_OAMBuffer2 !RAM_SMK_Global_OAMBuffer2
	.XDisp: skip $01
	.YDisp: skip $01
	.Tile: skip $01
	.Prop: skip $01
endstruct align $04

struct SMK_Global_UpperOAMBuffer2 !RAM_SMK_Global_OAMBuffer2+$0200
	.Slot: skip $01
endstruct align $01
