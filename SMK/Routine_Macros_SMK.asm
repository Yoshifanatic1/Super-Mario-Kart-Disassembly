
;#############################################################################################################
;#############################################################################################################

macro SMKBankC0Macros(StartBank, EndBank)
%BANK_START(<StartBank>)

SMK_GFX_Sprite_GhostValleySupports:
;$C00000
	incbin "Graphics/Compressed/GFX_Sprite_GhostValleySupports.lz5"

SMK_MusicData_GhostValley:
;$C00334
	incbin "SPC700/Music/Music_GhostValley.lz5"

SMK_GFX_Sprite_DonutPlainsMoles:
;$C005D6
	incbin "Graphics/Compressed/GFX_Sprite_DonutPlainsMoles.lz5"

SMK_GFX_Sprite_TerrainEffects:
;$C00903
	incbin "Graphics/Compressed/GFX_Sprite_TerrainEffects.lz5"

SMK_GFX_Sprite_CheckeredFlag:
;$C00BB7
	incbin "Graphics/Compressed/GFX_Sprite_CheckeredFlag.lz5"

SMK_GFX_Sprite_BattleModeBalloons:
;$C00E96
	incbin "Graphics/Compressed/GFX_Sprite_BattleModeBalloons.lz5"

SMK_GFX_Sprite_BowserCastleThwomps:
SMK_GFX_Sprite_RainbowRoadThwomps:
;$C01070
	incbin "Graphics/Compressed/GFX_Sprite_BowserCastleThwomps.lz5"

SMK_GFX_BG_RainbowRoad:
;$C01499
	incbin "Graphics/Compressed/GFX_BG_RainbowRoad.lz5"

SMK_GFX_Mode7_VanillaLakeTrack:
;$C014EE
	incbin "Graphics/Compressed/GFX_Mode7_VanillaLakeTrack.lz5"

DATA_C01F4C:
	db $12,$17,$17,$17,$18,$18,$1E,$1F,$12,$17,$17,$17,$17,$17,$13,$13
	db $17,$17,$17,$17,$17,$12,$12,$12,$46,$01,$21,$40,$12,$50,$06,$40
	db $08,$48,$05,$08,$0B,$48,$05,$40,$13,$50,$06,$40,$06,$50,$04,$40
	db $18,$50,$04,$10,$06,$50,$04,$10,$00,$00,$04,$40,$17,$48,$07,$40
	db $06,$50,$3D,$40,$09,$50,$17,$40,$05,$48,$2A,$40,$04,$50,$15,$52
	db $2C,$50,$06,$42,$16,$40,$08,$48,$12,$40,$0B,$00,$00,$04,$0E,$00
	db $13,$40,$0C,$00,$0A,$40,$09,$50,$12,$40,$07,$50,$06,$10,$05,$50
	db $07,$10,$28,$50,$08,$40,$04,$48,$0D,$40,$02,$48,$05,$40,$08,$48
	db $01,$40,$02,$48,$04,$40,$00,$44,$17,$40,$13,$48,$03,$08,$1E,$48
	db $19,$40,$16,$50,$0B,$40,$15,$50,$0A,$40,$0D,$50,$0E,$10,$0B,$50
	db $0C,$40,$06,$50,$08,$10,$26,$40,$0A,$50,$1A,$40,$21,$50,$2D,$40
	db $FF,$FF

	%FREE_BYTES(NULLROM, 2, $FF)

DATA_C02000:
	incbin "Graphics/GFX_Mario.bin"

;--------------------------------------------------------------------

%HiROMBankSplit()

;--------------------------------------------------------------------

CODE_808000:
	PHP
	REP.b #$38
	PHB
	PHK
	PLB
	PHA
	PHX
	PHY
CODE_808009:
	LDA.w !REGISTER_NMIEnable
	INC.b $34
	JSR.w CODE_80B181
	LDA.l $000036
	TAX
	JSR.w (DATA_8081BF,x)
	PLY
	PLX
	PLA
	PLB
	PLP
	RTL

;--------------------------------------------------------------------

CODE_80801F:
	PHP
	REP.b #$38
	PHB
	PHK
	PLB
	PHA
	PHX
	PHY
	SEP.b #$30
	LDX.b $D0
	LDA.w !REGISTER_IRQEnable
	JSR.w (DATA_808B12,x)
	REP.b #$30
	PLY
	PLX
	PLA
	PLB
	PLP
	RTL

;--------------------------------------------------------------------

CODE_80803A:
	PHK
	PLB
	STZ.w !REGISTER_IRQNMIAndJoypadEnableFlags
	STZ.w !REGISTER_DMAEnable
	STZ.w !REGISTER_HDMAEnable
	LDA.b #!ScreenDisplayRegister_SetForceBlank|!ScreenDisplayRegister_MaxBrightness0F
	STA.w !REGISTER_ScreenDisplayRegister
	STZ.w !REGISTER_JoypadSerialPort1
	STA.w !REGISTER_ProgrammableIOPortOutput
	JSL.l CODE_81E000
	REP.b #$30
CODE_808056:
	JSL.l CODE_81E067
	STZ.b $44
CODE_80805C:
	LDA.b $44
	BEQ.b CODE_80805C
	LDX.b $36
	JSR.w (DATA_808197,x)
	BRA.b CODE_808056

;--------------------------------------------------------------------

CODE_808067:
	LDA.w $0162
	BMI.b CODE_808097
	INC.b $38
	JSL.l CODE_84ECC0
	JSR.w CODE_80877B
	JSR.w CODE_808621
	JSL.l CODE_81856D
	JSR.w CODE_8080FC
	JSR.w CODE_808E91
	JSR.w CODE_80861A
	JSR.w CODE_808E60
	JSL.l CODE_818587
	JSR.w CODE_8080EC
	JSR.w CODE_80A120
	JSL.l CODE_84D56F
CODE_808096:
	RTS

CODE_808097:
	BIT.w #$4000
	BEQ.b CODE_8080AA
	JSR.w CODE_808621
	JSL.l CODE_81856D
	JSR.w CODE_80861A
	JSL.l CODE_818587
CODE_8080AA:
	JSR.w CODE_80B9D1
	JSL.l CODE_80B9DB
	JSL.l CODE_80B9DB
	JSL.l CODE_84ECC0
	RTS

;--------------------------------------------------------------------

CODE_8080BA:
	INC.b $38
	LDA.w #$0040
	STA.w $015E
	JSL.l CODE_858045
	JSR.w CODE_80853D
	RTS

;--------------------------------------------------------------------

CODE_8080CA:
	INC.b $38
	LDA.w #$0060
	STA.w $015E
	JSL.l CODE_8590B1
	RTS

;--------------------------------------------------------------------

CODE_8080D7:
	INC.b $38
	JSL.l CODE_8597AC
	RTS

;--------------------------------------------------------------------

CODE_8080DE:
	INC.b $38
	JSL.l CODE_85BB4F
	RTS

;--------------------------------------------------------------------

CODE_8080E5:
	INC.b $38
	JSL.l CODE_83FB14
	RTS

;--------------------------------------------------------------------

CODE_8080EC:
	LDA.w $10D4
	STA.w $010A
	JSR.w CODE_80BA50
	LDA.w $010A
	STA.w $10D4
	RTS

;--------------------------------------------------------------------

CODE_8080FC:
	LDA.w $11D4
	STA.w $010C
	JSR.w CODE_80BA50
	LDA.w $010C
	STA.w $11D4
	RTS

;--------------------------------------------------------------------

CODE_80810C:
	LDA.w $0162
	BMI.b CODE_808097
	INC.b $38
	JSL.l CODE_84ECC0
	JSR.w CODE_80877B
	JSR.w CODE_808621
	JSR.w CODE_80B928
	JSR.w CODE_8080FC
	JSR.w CODE_808E91
	JSR.w CODE_80861A
	JSR.w CODE_808E60
	JSR.w CODE_80B923
	JSR.w CODE_8080EC
	JSR.w CODE_80A120
	RTS

;--------------------------------------------------------------------

CODE_808136:
	INC.b $38
	DEC.w $0E8A
	JSL.l CODE_84ECC0
	JSR.w CODE_80877B
	JSR.w CODE_808621
	JSL.l CODE_81856D
	JSL.l CODE_83F37F
	JSR.w CODE_808E91
	JSR.w CODE_80861A
	JSR.w CODE_808E60
	JSL.l CODE_818587
	JSL.l CODE_83F360
	JSR.w CODE_809C3D
	JSL.l CODE_84D56F
	RTS

;--------------------------------------------------------------------

CODE_808166:
	INC.b $38
	JSL.l $088AED				; Glitch: This jumps into the middle of an instruction!
	RTS

;--------------------------------------------------------------------

CODE_80816D:
	INC.b $38
	JSL.l $088B91
	RTS

;--------------------------------------------------------------------

CODE_808174:
	INC.b $38
	JSL.l $088C1A
	RTS

;--------------------------------------------------------------------

CODE_80817B:
	INC.b $38
	JSL.l CODE_84ECC0
	JSR.w CODE_808621
	JSR.w CODE_80861A
	JSL.l CODE_84D56F
	JSL.l CODE_81C08F
	RTS

;--------------------------------------------------------------------

CODE_808190:
	INC.b $38
	JSL.l CODE_85983E
	RTS

;--------------------------------------------------------------------

DATA_808197:
	dw CODE_808096
	dw CODE_808067
	dw CODE_8080BA
	dw CODE_8080CA
	dw CODE_8080D7
	dw CODE_8080DE
	dw CODE_808136
	dw CODE_80810C
	dw CODE_808166
	dw CODE_80816D
	dw CODE_808174
	dw CODE_80817B
	dw CODE_808190
	dw CODE_808096
	dw CODE_8080E5

;--------------------------------------------------------------------

CODE_8081B5:
	JSR.w CODE_809632
CODE_8081B8:
	JSR.w CODE_80843C
	JSR.w CODE_809EB2
	RTS

;--------------------------------------------------------------------

DATA_8081BF:
	dw CODE_8081DD
	dw CODE_8081E9
	dw CODE_808237
	dw CODE_80824D
	dw CODE_808263
	dw CODE_808279
	dw CODE_80828F
	dw CODE_8082FA
	dw CODE_80833D
	dw CODE_808353
	dw CODE_808369
	dw CODE_80837F
	dw CODE_8083A7
	dw CODE_8081DD
	dw CODE_8082E4

;--------------------------------------------------------------------

CODE_8081DD:
	LDA.l $000044
	BNE.b CODE_8081E8
	DEC
	STA.l $000044
CODE_8081E8:
	RTS

;--------------------------------------------------------------------

CODE_8081E9:
	STZ.w $0E8C
	LDA.l $000044
	BNE.b CODE_80821C
	DEC
	STA.l $000044
	LDA.w $0162
	BPL.b CODE_8081FF
	JSR.w CODE_80B9CE
CODE_8081FF:
	LDA.w #$0100
	STA.w !REGISTER_HDMAEnable
	JSR.w CODE_808E01
	JSR.w CODE_80B92D
	JSR.w CODE_809EC8
	JSL.l CODE_81FA61
	JSR.w CODE_808ABB
	JSR.w CODE_80B9A3
	JSR.w CODE_8081B5
	RTS

CODE_80821C:
	LDA.w #$FFFF
	STA.w $017E
	LDA.b $3A
	BEQ.b CODE_808236
	JSR.w CODE_808E01
	JSR.w CODE_809EC8
	JSL.l CODE_81FA61
	JSR.w CODE_808ABB
	JSR.w CODE_80B9A3
CODE_808236:
	RTS

;--------------------------------------------------------------------

CODE_808237:
	LDA.l $000044
	BNE.b CODE_80824C
	DEC
	STA.l $000044
	JSR.w CODE_80946E
	JSL.l CODE_85809B
	JSR.w CODE_8081B5
CODE_80824C:
	RTS

;--------------------------------------------------------------------

CODE_80824D:
	LDA.l $000044
	BNE.b CODE_808262
	DEC
	STA.l $000044
	JSR.w CODE_80946E
	JSL.l CODE_8590D7
	JSR.w CODE_8081B5
CODE_808262:
	RTS

;--------------------------------------------------------------------

CODE_808263:
	LDA.l $000044
	BNE.b CODE_808278
	DEC
	STA.l $000044
	JSR.w CODE_80946E
	JSL.l CODE_8597C0
	JSR.w CODE_8081B5
CODE_808278:
	RTS

;--------------------------------------------------------------------

CODE_808279:
	LDA.l $000044
	BNE.b CODE_80828E
	DEC
	STA.l $000044
	JSR.w CODE_80946E
	JSL.l CODE_85BBAE
	JSR.w CODE_8081B5
CODE_80828E:
	RTS

;--------------------------------------------------------------------

CODE_80828F:
	STZ.w $0E8C
	LDA.l $000044
	BNE.b CODE_8082C7
	DEC
	STA.l $000044
	LDA.w #$0100
	STA.w !REGISTER_HDMAEnable
	LDA.w $0E56
	BNE.b CODE_8082C6
	LDA.w $1D0C
	BNE.b CODE_8082B3
	JSR.w CODE_808E01
	JSR.w CODE_80B92D
CODE_8082B3:
	STZ.b $4A
	JSL.l CODE_81C35B
	JSR.w CODE_808ABB
	JSL.l CODE_81FA61
	JSR.w CODE_80B9A3
	JSR.w CODE_8081B5
CODE_8082C6:
	RTS

CODE_8082C7:
	LDA.w $0E56
	BNE.b CODE_8082C6
	LDA.w #$FFFF
	STA.w $017E
	LDA.b $3A
	BEQ.b CODE_8082E3
	JSR.w CODE_808E01
	JSR.w CODE_808ABB
	JSL.l CODE_81FA61
	JSR.w CODE_80B9A3
CODE_8082E3:
	RTS

;--------------------------------------------------------------------

CODE_8082E4:
	LDA.l $000044
	BNE.b CODE_8082F9
	DEC
	STA.l $000044
	JSR.w CODE_80946E
	JSL.l CODE_83FB76
	JSR.w CODE_8081B5
CODE_8082F9:
	RTS

;--------------------------------------------------------------------

CODE_8082FA:
	LDA.l $000044
	BNE.b CODE_808321
	DEC
	STA.l $000044
	LDA.w $0162
	BPL.b CODE_80830D
	JSR.w CODE_80B9CE
CODE_80830D:
	JSR.w CODE_808E01
	JSR.w CODE_808ABB
	JSR.w CODE_80B92D
	JSR.w CODE_809EC8
	JSL.l CODE_81FA61
	JSR.w CODE_8081B5
	RTS

CODE_808321:
	LDA.w #$FFFF
	STA.w $017E
	LDA.b $3A
	BEQ.b CODE_80833B
	JSR.w CODE_808E01
	JSR.w CODE_808ABB
	JSR.w CODE_809EC8
	JSL.l CODE_81FA61
	JSR.w CODE_80B9A3
CODE_80833B:
	RTS

;--------------------------------------------------------------------

CODE_80833C:
	RTS

;--------------------------------------------------------------------

CODE_80833D:
	LDA.l $000044
	BNE.b CODE_808352
	DEC
	STA.l $000044
	JSR.w CODE_80946E
	JSL.l $088B55					; Glitch: This jumps into the middle of an instruction!
	JSR.w CODE_8081B5
CODE_808352:
	RTS

;--------------------------------------------------------------------

CODE_808353:
	LDA.l $000044
	BNE.b CODE_808368
	DEC
	STA.l $000044
	JSR.w CODE_80946E
	JSL.l $088BE4					; Glitch: This jumps into the middle of an instruction!
	JSR.w CODE_8081B5
CODE_808368:
	RTS

;--------------------------------------------------------------------

CODE_808369:
	LDA.l $000044
	BNE.b CODE_80837E
	DEC
	STA.l $000044
	JSR.w CODE_80946E
	JSL.l $088C54
	JSR.w CODE_8081B8
CODE_80837E:
	RTS

;--------------------------------------------------------------------

CODE_80837F:
	LDA.l $000044
	BNE.b CODE_80839C
	DEC
	STA.l $000044
	JSR.w CODE_808E01
	JSR.w CODE_808ABB
	JSL.l CODE_81FA61
	JSL.l CODE_81C343
	JSR.w CODE_8081B5
	RTS

CODE_80839C:
	JSR.w CODE_80961B
	JSR.w CODE_808ABB
	JSL.l CODE_81C343
	RTS

;--------------------------------------------------------------------

CODE_8083A7:
	LDA.l $000044
	BNE.b CODE_8083C0
	DEC
	STA.l $000044
	JSR.w CODE_808E01
	JSR.w CODE_80946E
	JSL.l CODE_85989F
	JSR.w CODE_8081B5
	RTS

CODE_8083C0:
	JSL.l CODE_85989F
	RTS

;--------------------------------------------------------------------

CODE_8083C5:
	JSR.w CODE_808413
	RTL

;--------------------------------------------------------------------

CODE_8083C9:
	REP.b #$30
	LDA.w $0E8A
	BNE.b CODE_808413
	LDA.w !RAM_SMK_Global_RacetrackType
	CMP.w #!Define_SMK_RacetrackType_KoopaBeach
	BNE.b CODE_8083E7
	LDA.w $017E
	BNE.b CODE_8083E7
	LDA.b $38
	AND.w #$0007
	CMP.w #$0007
	BEQ.b CODE_808413
CODE_8083E7:
	LDA.w #(!REGISTER_WriteToCGRAMPort&$0000FF<<8)+$02
	STA.w DMA[$00].Parameters
	LDA.w #$002C
	STA.w DMA[$00].SizeLo
	LDA.b $38
	ROR
	BCS.b CODE_808403
	LDA.w #$7F3B80
	STA.w DMA[$00].SourceLo
	LDA.w #$0080
	BRA.b CODE_80840C

CODE_808403:
	LDA.w #$7E3BC0
	STA.w DMA[$00].SourceLo
	LDA.w #$00A0
CODE_80840C:
	SEP.b #$20
	STA.w !REGISTER_CGRAMAddress
	BRA.b CODE_80842F

CODE_808413:
	REP.b #$30
	STZ.w $0E8A
	LDA.w #$0200
	STA.w DMA[$00].SizeLo
	LDA.w #$7E3A80
	STA.w DMA[$00].SourceLo
	LDA.w #(!REGISTER_WriteToCGRAMPort&$0000FF<<8)+$02
	STA.w DMA[$00].Parameters
	SEP.b #$20
	STZ.w !REGISTER_CGRAMAddress
CODE_80842F:
	LDA.b #$7E3A80>>16
	STA.w DMA[$00].SourceBank
	LDA.b #$01
	STA.w !REGISTER_DMAEnable
	REP.b #$20
	RTS

;--------------------------------------------------------------------

CODE_80843C:
	LDX.w #$0000
	JSR.w CODE_808445
	LDX.w #$0002
CODE_808445:
	LDA.w !REGISTER_Joypad1Lo,x
	STA.b $20,x
	PHA
	EOR.b $24,x
	AND.b $20,x
	STA.b $28,x
	LDY.w $0E32
	BEQ.b CODE_80846A
	LDY.w $0E50
	BNE.b CODE_80846A
	LDY.w $0032
	BNE.b CODE_80846A
	BIT.w #$9000
	BEQ.b CODE_80846A
	PLA
	JML.l CODE_8085FD

CODE_80846A:
	PLA
	STA.b $24,x
	RTS

;--------------------------------------------------------------------

; Note: Something related to the demo mode.

DATA_80846E:
	dw $5800,$5840,$5880,$58C0,$5C00,$5C40,$5C80,$5CC0

DATA_80847E:
	dw $0180,$0184,$0188,$018C,$01C0,$01C4,$01C8,$01CC

DATA_80848E:
	dw $0200,$0400,$0000,$0600,$0600,$0400,$0200,$0000

DATA_80849E:
	dw $0000,$0000,$0004,$0006,$0002

DATA_8084A8:
	dw !Define_SMK_RaceCup_FlowerCup
	dw !Define_SMK_RaceCup_MushroomCup
	dw !Define_SMK_RacetrackID_DonutPlains1
	dw !Define_SMK_RacetrackID_BattleCourse4
	dw $0003

DATA_8084B2:
	dw $0002,$0000,$0002,$0000,$0000

DATA_8084BC:
	dw $0006,$0000,$0008,$000A,$0002

DATA_8084C6:
	dw $0000,$000E,$0000,$000C,$0004

DATA_8084D0:
	dw CODE_80856F
	dw CODE_808580
	dw CODE_808580
	dw CODE_808591

CODE_8084D8:
	LDA.w #$0080
	STA.w $015E
	LDA.w $1012
	STA.w $0E40
	LDA.w $1112
	STA.w $0E42
	LDA.b $2E
	STA.w $0E3A
	LDA.b $2C
	STA.w $0E3C
	LDA.b $30
	STA.w $0E3E
	LDA.w !RAM_SMK_Global_RaceCup
	STA.w $0E44
	LDA.w #$04B0
	STA.w $0E38
	LDA.w #$FFFF
	STA.w $0E32
	LDY.w $0E34
	INY
	INY
	CPY.w #$0008
	BCC.b CODE_808518
	LDY.w #$0000
CODE_808518:
	STY.w $0E34
	LDA.w DATA_8084B2,y
	STA.b $2E
	STA.w $0174
	LDA.w #$0002
	STA.w $0030
	LDA.w DATA_8084BC,y
	STA.w $1012
	LDA.w DATA_8084C6,y
	STA.w $1112
	LDX.w DATA_80849E,y
	STX.b $2C
	JMP.w (DATA_8084D0,x)

CODE_80853D:
	LDA.w #$0060
	STA.w $015E
	LDA.b $32
	BNE.b CODE_80856E
	LDA.w $1040
	CMP.w #$0642
	BCS.b CODE_8084D8
	LDA.w $0E68
	BEQ.b CODE_80856E
	LDX.w #$0002
CODE_808557:
	LDA.b $20,x
	BIT.w #$2000
	BEQ.b CODE_80856A
	BMI.b CODE_80859C
	BIT.w #$1000
	BNE.b CODE_8085B9
	BIT.w #$0080
	BNE.b CODE_8085AB
CODE_80856A:
	DEX
	DEX
	BPL.b CODE_808557
CODE_80856E:
	RTS

CODE_80856F:
	STZ.w !RAM_SMK_Global_CurrentRound
	LDA.w DATA_8084A8,y
	STA.w !RAM_SMK_Global_RaceCup
	LDA.w #$000E
	STA.w $0158
	BRA.b CODE_80858C

CODE_808580:
	LDA.w DATA_8084A8,y
	STA.w !RAM_SMK_Race_CurrentRacetrack
	LDA.w #$000A
	STA.w $0158
CODE_80858C:
	LDA.w #$0002
	BRA.b CODE_8085D8

CODE_808591:
	LDA.w DATA_8084A8,y
	STA.w !RAM_SMK_Race_CurrentRacetrack
	LDA.w #$000E
	BRA.b CODE_8085D8

CODE_80859C:
	LDX.b $2C
	JMP.w (DATA_808612,x)

CODE_8085A1:
	LDA.w !RAM_SMK_Global_CurrentRound
	BEQ.b CODE_8085F3
	LDA.w #$0002
	BRA.b CODE_8085F3

CODE_8085AB:
	LDA.w $0E68
	BEQ.b CODE_80856E
	JSL.l CODE_81F4B2
	LDA.w #$000C
	BRA.b CODE_8085D8

CODE_8085B9:
	LDA.w #$0014
	BRA.b CODE_8085D8

CODE_8085BE:
	JSR.w CODE_80A007
	JSR.w CODE_809D10
	INC.w !RAM_SMK_Global_CurrentRound
	LDA.w #$0002
	STA.w $0158
	LDA.w #$000A
	BRA.b CODE_8085D8

CODE_8085D2:
	JSR.w CODE_80A007
CODE_8085D5:
	LDA.w #$0002
CODE_8085D8:
	STA.b $32
	LDA.w #$0060
	STA.w $015E
CODE_8085E0:
	LDA.w #$8F00
	STA.b $48
	RTS

CODE_8085E6:
	LDA.w #$001C
	BRA.b CODE_8085D8

CODE_8085EB:
	LDA.b $2E
	STA.w $0174
	LDA.w #$000A
CODE_8085F3:
	STA.w $0158
	BRA.b CODE_8085D5

CODE_8085F8:
	LDA.w #$000E
	BRA.b CODE_8085D8

CODE_8085FD:
	JSL.l CODE_81F4B2
	LDA.w #$0004
	BRA.b CODE_8085D8

CODE_808606:
	LDA.w #$0006
	STA.b $32
	BRA.b CODE_8085E0

CODE_80860D:
	LDA.w #$0016
	BRA.b CODE_8085D8

DATA_808612:
	dw CODE_8085A1
	dw CODE_8085EB
	dw CODE_8085EB
	dw CODE_8085F8

;--------------------------------------------------------------------

CODE_80861A:
	LDY.b $A8
	LDX.w #$0000
	BRA.b CODE_808629

CODE_808621:
	JSR.w CODE_8086DC
	LDY.b $AA
	LDX.w #$0002
CODE_808629:
	JSR.w CODE_8086A0
	JSR.w CODE_808632
	JMP.w CODE_80ACB6

CODE_808632:
	LDA.b $A4,x
	BEQ.b CODE_80865C
	CMP.w #$0006
	BEQ.b CODE_80869F
	CPX.w #$0002
	BEQ.b CODE_80864E
	LDA.b $96
	CLC
	ADC.w #$8000
	STA.b $94
	EOR.w #$FFFF
	INC
	BRA.b CODE_808675

CODE_80864E:
	LDA.b $94
	CLC
	ADC.w #$8000
	STA.b $96
	EOR.w #$FFFF
	INC
	BRA.b CODE_808675

CODE_80865C:
	LDA.b $AC,x
	BIT.w #$4000
	BEQ.b CODE_808673
	BIT.w #$2000
	BEQ.b CODE_80866B
	JSR.w CODE_80B789
CODE_80866B:
	LDA.w $00A4,y
	CLC
	ADC.b $DC,x
	STA.b $94,x
CODE_808673:
	LDA.b $94,x
CODE_808675:
	PHA
	XBA
	CMP.w #$8000
	ROL
	AND.w #$01FF
	STA.b $70,x
	PLA
	ROL
	ROL
	PHA
	ROL
	ROL
	AND.w #$0006
	TAY
	LDA.w DATA_8086CC,y
	SEC
	SBC.w DATA_8086D4,x
	STA.b $6A,x
	PLA
	XBA
	AND.w #$00FF
	STA.b $64,x
	LDA.w DATA_8086D8,x
	STA.b $76,x
CODE_80869F:
	RTS

CODE_8086A0:
	LDA.b $A4,x
	CMP.w #$0002
	BEQ.b CODE_8086AB
	LDA.b $AC,x
	BPL.b CODE_8086CB
CODE_8086AB:
	LDA.w $0016,y
	STA.b $00
	LDA.w $0018,y
	ROL.b $00
	ROL
	ROL.b $00
	ROL
	STA.b $88,x
	LDA.w $001A,y
	STA.b $00
	LDA.w $001C,y
	ROL.b $00
	ROL
	ROL.b $00
	ROL
	STA.b $8C,x
CODE_8086CB:
	RTS

DATA_8086CC:
	dw $0007,$0027

DATA_8086D0:
	dw $0047,$0067

DATA_8086D4:
	dw $0000,$0070

DATA_8086D8:
	dw $0087,$0017

;--------------------------------------------------------------------

CODE_8086DC:
	LDA.b $4E
	STA.b $50
	LDA.b $54
	STA.b $56
	LDA.b $5A
	STA.b $5C
	LDA.b $60
	STA.b $62
	LDA.b $72
	STA.b $74
	LDA.b $78
	STA.b $7A
	LDA.b $66
	STA.b $68
	LDA.b $6C
	STA.b $6E
	RTS

;--------------------------------------------------------------------

CODE_8086FD:
	LDX.b #$00
	LDA.b $A4
	CMP.b #$02
	BNE.b CODE_808715
	LDA.b #$B0
	BRA.b CODE_808718

CODE_808709:
	LDX.b #$04
	LDA.b $A6
	CMP.b #$02
	BNE.b CODE_808715
	LDA.b #$60
	BRA.b CODE_808718

CODE_808715:
	LDA.w DATA_808775,x
CODE_808718:
	STA.w !REGISTER_BG2VertScrollOffset
	STZ.w !REGISTER_BG2VertScrollOffset
	LDA.b $4C,x
	STA.w !REGISTER_BG1HorizScrollOffset
	LDA.b $4D,x
	STA.w !REGISTER_BG1HorizScrollOffset
	LDA.b $52,x
	STA.w !REGISTER_BG1VertScrollOffset
	LDA.b $53,x
	STA.w !REGISTER_BG1VertScrollOffset
	LDA.b $58,x
	STA.w !REGISTER_Mode7CenterX
	LDA.b $59,x
	STA.w !REGISTER_Mode7CenterX
	LDA.b $5E,x
	STA.w !REGISTER_Mode7CenterY
	LDA.b $5F,x
	STA.w !REGISTER_Mode7CenterY
	STZ.w !REGISTER_BG2HorizScrollOffset
	STZ.w !REGISTER_BG2HorizScrollOffset
	LDA.b $64,x
	STA.w !REGISTER_BG3HorizScrollOffset
	LDA.b $65,x
	STA.w !REGISTER_BG3HorizScrollOffset
	LDA.b $6A,x
	STA.w !REGISTER_BG3VertScrollOffset
	LDA.b $6B,x
	STA.w !REGISTER_BG3VertScrollOffset
	LDA.b $70,x
	STA.w !REGISTER_BG4HorizScrollOffset
	LDA.b $71,x
	STA.w !REGISTER_BG4HorizScrollOffset
	LDA.b $76,x
	STA.w !REGISTER_BG4VertScrollOffset
	LDA.b $77,x
	STA.w !REGISTER_BG4VertScrollOffset
	RTS

DATA_808775:
	db $C0,$00,$00,$00,$70,$00

;--------------------------------------------------------------------

CODE_80877B:
	LDX.w #$1000
CODE_80877E:
	LDA.w $0010,x
	BEQ.b CODE_808789
	JSR.w CODE_80879A
	JSR.w CODE_80890D
CODE_808789:
	TXA
	CLC
	ADC.w #$0100
	CMP.w #$1800
	BCS.b CODE_808796
	TAX
	BRA.b CODE_80877E

CODE_808796:
	JSR.w CODE_809D61
	RTS

CODE_80879A:
	JSR.w CODE_8087D9
	CLC
	LDA.b $21,x
	AND.w #$FF00
	ADC.b $16,x
	STA.b $16,x
	LDA.w #$FF00
	AND.b $22,x
	BPL.b CODE_8087B1
	ORA.w #$00FF
CODE_8087B1:
	XBA
	ADC.b $18,x
	CLC
	STA.b $18,x
	STA.b $0A
	LDA.b $1C,x
	STA.b $0E
	CLC
	LDA.b $23,x
	AND.w #$FF00
	ADC.b $1A,x
	STA.b $1A,x
	LDA.w #$FF00
	AND.b $24,x
	BPL.b CODE_8087D1
	ORA.w #$00FF
CODE_8087D1:
	XBA
	ADC.b $0E
	STA.b $1C,x
	STA.b $0C
CODE_8087D8:
	RTS

CODE_8087D9:
	LDA.b $10,x
	BMI.b CODE_8087D8
	BIT.w #$4000
	BNE.b CODE_8087D8
	LDA.w $00EA,x
	CMP.w #$0080
	BCC.b CODE_8087D8
	LDA.b $A0,x
	BNE.b CODE_8087D8
	CPX.w $1094
	BEQ.b CODE_808823
	CPX.w $1194
	BEQ.b CODE_808847
	RTS

CODE_8087F9:
	CPX.w $1196
	BEQ.b CODE_808803
	CPX.w $1096
	BNE.b CODE_8087D8
CODE_808803:
	LDA.w #$C000
	STA.b $12
	LDA.b $E6,x
	BEQ.b CODE_8087D8
	CMP.w #$0006
	BCS.b CODE_8087D8
	BRA.b CODE_80882F

CODE_808813:
	LDA.w #$C000
	STA.b $12
	LDA.b $E6,x
	BEQ.b CODE_8087D8
	CMP.w #$0006
	BCS.b CODE_8087D8
	BRA.b CODE_80882F

CODE_808823:
	LDA.w #$4000
	STA.b $12
	LDA.b $2E,x
	CMP.w #$FF89
	BCC.b CODE_8087D8
CODE_80882F:
	LDY.w #$1000
	LDA.w $1090
	STA.b $10
	LDA.b $2C,x
	CLC
	ADC.w #$0080
	BPL.b CODE_808865
CODE_80883F:
	LDA.w $00A4,y
	SEC
	SBC.b $12
	BRA.b CODE_80886B

CODE_808847:
	LDA.w #$4000
	STA.b $12
	LDA.b $34,x
	BPL.b CODE_808855
	CMP.w #$FFFA
	BCS.b CODE_8087D8
CODE_808855:
	LDY.w #$1100
	LDA.w $1190
	STA.b $10
	LDA.b $32,x
	CLC
	ADC.w #$0080
	BMI.b CODE_80883F
CODE_808865:
	LDA.w $00A4,y
	CLC
	ADC.b $12
CODE_80886B:
	STA.b $12
	SEC
	SBC.b $A2,x
	BPL.b CODE_808876
	EOR.w #$FFFF
	INC
CODE_808876:
	CMP.w #$1800
	BCC.b CODE_8088CC
	SEP.b #$20
	LDA.b #!DSP1_Command04_TrigonometricCalculation
	STA.l !REGISTER_DSP1_DataRegister
	REP.b #$20
	LDA.b $12
	STA.l !REGISTER_DSP1_DataRegister
	LDA.b $10
	CMP.w #$0040
	BCC.b CODE_808895
	LDA.w #$003F
CODE_808895:
	LSR
	AND.w #$001E
	TAY
	LDA.w !RAM_SMK_Global_RacetrackType
	BEQ.b CODE_8088A9							; Note: !Define_SMK_RacetrackType_GhostValley 
	CMP.w #!Define_SMK_RacetrackType_RainbowRoad
	BEQ.b CODE_8088A9
	LDA.w DATA_8088CD,y
	BRA.b CODE_8088AC

CODE_8088A9:
	LDA.w DATA_8088ED,y
CODE_8088AC:
	STA.l !REGISTER_DSP1_DataRegister
CODE_8088B0:
	LDA.l !REGISTER_DSP1_StatusRegister
	BPL.b CODE_8088B0
	LDA.l !REGISTER_DSP1_DataRegister
	CLC
	ADC.b $22,x
	STA.b $22,x
	LDA.l !REGISTER_DSP1_DataRegister
	EOR.w #$FFFF
	INC
	CLC
	ADC.b $24,x
	STA.b $24,x
CODE_8088CC:
	RTS

DATA_8088CD:
	dw $00D0,$00E0,$00F0,$0100,$0100,$00F0,$00E0,$00D0
	dw $00C0,$00B0,$00A0,$0090,$0080,$0070,$0060,$0040

DATA_8088ED:
	dw $0040,$0040,$0030,$0030,$0020,$0020,$0010,$0010
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

;--------------------------------------------------------------------

CODE_80890D:
	LDA.b $10,x
	AND.w #$FFFC
	STA.b $10,x
	LDA.b $0A
	CMP.w #$0400
	BCS.b CODE_808986
	LSR
	LSR
	LSR
	LSR
	STA.b $0A
	LDA.b $0C
	ASL
	ASL
	AND.w #$FFC0
	ORA.b $0A
	CMP.w #$1000
	BCS.b CODE_808986
	PHX
	TAX
	LDA.l $7F5000,x
	AND.w #$00FF
	PLX
	BIT.w #$0080
	BEQ.b CODE_808962
	AND.w #$007F
	CMP.w #$007F
	BNE.b CODE_80894F
	LDA.w #$0002
	ORA.b $10,x
	STA.b $10,x
	BRA.b CODE_808959

CODE_80894F:
	SEP.b #$20
	CMP.b $DC,x
	BEQ.b CODE_808959
	STA.b $C0,x
	STA.b $DC,x
CODE_808959:
	REP.b #$20
	JSR.w CODE_808994
	JSR.w CODE_80A01F
	RTS

CODE_808962:
	CMP.w #$007F
	BEQ.b CODE_80898C
	LDY.b $E2,x
	BPL.b CODE_808974
	PHA
	ASL
	TAY
	LDA.w $07FF,y
	BMI.b CODE_80898B
	PLA
CODE_808974:
	SEP.b #$20
	CMP.b $DC,x
	BEQ.b CODE_808983
	STA.b $C0,x
	STA.b $DC,x
	REP.b #$20
	JSR.w CODE_80A01F
CODE_808983:
	REP.b #$20
	RTS

CODE_808986:
	LDA.w #$0001
	BRA.b CODE_80898F

CODE_80898B:
	PLA
CODE_80898C:
	LDA.w #$0002
CODE_80898F:
	ORA.b $10,x
	STA.b $10,x
CODE_808993:
	RTS

;--------------------------------------------------------------------

CODE_808994:
	LDA.b $10,x
	BIT.w #$0020
	BNE.b CODE_808993
	AND.w #$FFF3
	STA.b $10,x
	LDA.w $014A
	CMP.b $0E
	BNE.b CODE_8089AE
	CMP.b $0C
	BEQ.b CODE_808993
	BCS.b CODE_8089B6
	RTS

CODE_8089AE:
	BCS.b CODE_8089ED
	CMP.b $0C
	BEQ.b CODE_8089FB
	BCC.b CODE_8089FB
CODE_8089B6:
	LDA.b $C0,x
	CLC
	ADC.w #$0100
	AND.w #$FF00
	STA.b $C0,x
	CMP.b $F8,x
	BCC.b CODE_8089FB
	BEQ.b CODE_8089FB
	STA.b $F8,x
	CMP.w #$8000
	BEQ.b CODE_8089FB
	SEC
	SBC.w $014C
	BCS.b CODE_8089FC
	CMP.w #$FF00
	BEQ.b CODE_808A4B
	LDA.w #$0004
	ORA.b $10,x
	STA.b $10,x
	BPL.b CODE_8089EC
	LDA.w #$0100
	ORA.b $D4,x
	STA.b $D4,x
	JSR.w CODE_808A89
CODE_8089EC:
	RTS

CODE_8089ED:
	CMP.b $0C
	BEQ.b CODE_8089F3
	BCS.b CODE_8089FB
CODE_8089F3:
	LDA.b $C0,x
	SEC
	SBC.w #$0100
	STA.b $C0,x
CODE_8089FB:
	RTS

CODE_8089FC:
	LDA.b $10,x
	BIT.w #$0020
	BNE.b CODE_808A4A
	CPX.w #$1100
	BEQ.b CODE_808A13
	BCS.b CODE_808A2E
	LDA.b $2E
	CMP.w #$0004
	BNE.b CODE_808A1A
	BRA.b CODE_808A2E

CODE_808A13:
	LDA.b $2E
	CMP.w #$0002
	BEQ.b CODE_808A2E
CODE_808A1A:
	JSR.w CODE_809814
	LDA.w #$4000
	ORA.b $D4,x
	STA.b $D4,x
	JSR.w CODE_808A89
	LDA.w #$0068
	JSL.l CODE_81F57A
CODE_808A2E:
	LDA.w $0100
	STA.b $F2,x
	LDA.w $0102
	STA.b $F4,x
	LDA.w $0104
	STA.b $F6,x
	LDY.w $0E8E
	TXA
	STA.w $0E90,y
	INC.w $0E8E
	INC.w $0E8E
CODE_808A4A:
	RTS

CODE_808A4B:
	LDA.w #$0008
	ORA.b $10,x
	STA.b $10,x
	CPX.w #$1100
	BEQ.b CODE_808A61
	BCS.b CODE_808A4A
	LDA.b $2E
	CMP.w #$0004
	BNE.b CODE_808A68
	RTS

CODE_808A61:
	LDA.b $2E
	CMP.w #$0002
	BEQ.b CODE_808A4A
CODE_808A68:
	LDA.w $0E0E
	BNE.b CODE_808A82
	INC.w $0E0E
	LDA.w #$003C
	STA.w $0E12
	LDA.w #$000A
	STA.w $0E5E
	LDA.w #$0005
	JSR.w CODE_809851
CODE_808A82:
	LDA.w #$0080
	ORA.b $D4,x
	STA.b $D4,x
CODE_808A89:
	PHX
	TXA
	XBA
	AND.w #$0001
	ASL
	TAY
	LDA.b $F9,x
	ASL
	CLC
	ADC.b $F9,x
	ASL
	CLC
	ADC.w DATA_808AB7,y
	AND.w #$00FF
	TAX
	LDA.w $0100
	STA.l $000F2C,x
	LDA.w $0102
	STA.l $000F2E,x
	LDA.w $0104
	STA.l $000F30,x
	PLX
	RTS

DATA_808AB7:
	db $00,$00,$1E,$00

CODE_808ABB:
	SEP.b #$30
	LDA.b #!SpriteGFXLocationInVRAMLo_4000|!SpriteGFXLocationInVRAMHi_Add1000|!SpriteSize_8x8_16x16
	STA.w !REGISTER_OAMSizeAndDataAreaDesignation
	JSR.w CODE_808AE9
	LDA.b #$FE
	STA.w !REGISTER_HDMAEnable
	LDA.b $D4
	STA.w !REGISTER_Mode7TilemapSettings
	LDA.w $0FD8
	BEQ.b CODE_808AE0
	STZ.w !REGISTER_CGRAMAddress
	STA.w !REGISTER_WriteToCGRAMPort
	LDA.w $0FD9
	STA.w !REGISTER_WriteToCGRAMPort
CODE_808AE0:
	JSR.w CODE_8086FD
	JSR.w CODE_808BBF
	REP.b #$30
	RTS

CODE_808AE9:
	LDA.w $0172
	CMP.b #$04
	BNE.b CODE_808B09
	REP.b #$30
	LDA.b $2E
	AND.w #$0002
	TAX
	LDA.w $0174
	STA.b $A4,x
	TAY
	LDA.w DATA_808B0A,y
	STA.b $D4,x
	JSL.l CODE_81F7D3
	SEP.b #$30
CODE_808B09:
	RTS

DATA_808B0A:
	dw $0000,$00C1,$0000,$00C0

;--------------------------------------------------------------------

DATA_808B12:
	dw CODE_808B36
	dw CODE_808B37
	dw CODE_808B73
	dw CODE_808B8A
	dw CODE_808B8F
	dw CODE_808B9C

CODE_808B1E:
	JSR.w CODE_808B22
	RTL

CODE_808B22:
	LDA.b #$02
	STA.b $D0
	LDA.b #$C0
	STA.b $D4
	STA.b $D6
	LDA.b #$B1
	STA.w !REGISTER_IRQNMIAndJoypadEnableFlags
	LDA.b #$6B
	STA.w !REGISTER_VCountTimerLo
CODE_808B36:
	RTS

;--------------------------------------------------------------------

CODE_808B37:
	LDX.b #!SpriteGFXLocationInVRAMLo_4000|!SpriteGFXLocationInVRAMHi_Add2000|!SpriteSize_8x8_16x16
	LDY.b #!ScreenDisplayRegister_SetForceBlank|!ScreenDisplayRegister_MinBrightness00
	LDA.b #$40
CODE_808B3D:
	BIT.w !REGISTER_HVBlankFlagsAndJoypadStatus
	BEQ.b CODE_808B3D
	STY.w !REGISTER_ScreenDisplayRegister
	STX.w !REGISTER_OAMSizeAndDataAreaDesignation
	LDA.b #$72
	STA.w !REGISTER_VCountTimerLo
	LDA.b $D6
	STA.w !REGISTER_Mode7TilemapSettings
	LDA.b #$04
	STA.b $D0
	LDA.w $0FDA
	BEQ.b CODE_808B67
	STZ.w !REGISTER_CGRAMAddress
	STA.w !REGISTER_WriteToCGRAMPort
	LDA.w $0FDB
	STA.w !REGISTER_WriteToCGRAMPort
CODE_808B67:
	JSR.w CODE_808709
	LDX.b #$01
	JSR.w CODE_808BBF
	JSR.w CODE_80947A
	RTS

CODE_808B73:
	LDX.w !RAM_SMK_Global_ScreenDisplayRegister
	LDA.b #$40
CODE_808B78:
	BIT.w !REGISTER_HVBlankFlagsAndJoypadStatus
	BEQ.b CODE_808B78
	STX.w !REGISTER_ScreenDisplayRegister
	LDA.b #$08
	STA.b $D0
	LDA.b #$D3
	STA.w !REGISTER_VCountTimerLo
	RTS

CODE_808B8A:
	JSL.l $09DD94
	RTS

CODE_808B8F:
	LDA.b #$0A
	STA.b $D0
	LDA.b #$DB
	STA.w !REGISTER_VCountTimerLo
	DEC.w $0E8C
	RTS

CODE_808B9C:
	LDX.b #!ScreenDisplayRegister_SetForceBlank|!ScreenDisplayRegister_MinBrightness00
	LDA.b #$40
CODE_808BA0:
	BIT.w !REGISTER_HVBlankFlagsAndJoypadStatus
	BEQ.b CODE_808BA0
	STX.w !REGISTER_ScreenDisplayRegister
	STZ.w !REGISTER_HDMAEnable
	LDA.b #$02
	STA.b $D0
	LDA.b #$6B
	STA.w !REGISTER_VCountTimerLo
	REP.b #$30
	JSR.w CODE_80946E
	JSR.w CODE_8083C9
	SEP.b #$30
	RTS

;--------------------------------------------------------------------

CODE_808BBF:
	LDA.w $016A,x
	STA.w !REGISTER_ColorMathSelectAndEnable
	LDA.w $016C,x
	STA.w !REGISTER_FixedColorData
	LDA.w $016E,x
	STA.w !REGISTER_FixedColorData
	LDA.w $0170,x
	STA.w !REGISTER_FixedColorData
	LDA.w $0108,x
	STA.w !REGISTER_ObjectAndColorWindowSettings
	LDA.w $014E,x
	STA.w !REGISTER_MainScreenWindowMask
	LDA.w $017A,x
	STA.w !REGISTER_ColorMathInitialSettings
	RTS

;--------------------------------------------------------------------

CODE_808BEA:
	PHB
	PHK
	PLB
	SEP.b #$30
	LDA.b #!SpriteGFXLocationInVRAMLo_4000|!SpriteGFXLocationInVRAMHi_Add1000|!SpriteSize_8x8_16x16
	STA.w !REGISTER_OAMSizeAndDataAreaDesignation
	STZ.w !REGISTER_MosaicSizeAndBGEnable
	STZ.w !REGISTER_BG1And2WindowMaskSettings
	STZ.w !REGISTER_BG3And4WindowMaskSettings
	STZ.w !REGISTER_ObjectAndColorWindowSettings
	LDA.b #$10
	STA.w !REGISTER_MainScreenLayers
	STA.w !REGISTER_SubScreenLayers
	STZ.w !REGISTER_MainScreenWindowMask
	STZ.w !REGISTER_SubScreenWindowMask
	STZ.w !REGISTER_InitialScreenSettings
	STZ.w !REGISTER_ColorMathInitialSettings
	STZ.w !REGISTER_ColorMathSelectAndEnable
	STZ.w !REGISTER_FixedColorData
	REP.b #$30
	LDA.w #$0080
	STA.w !REGISTER_VRAMAddressIncrementValue
	LDA.w #$4000
	STA.w !REGISTER_VRAMAddressLo
	LDX.w #$0001
	LDA.w #(!REGISTER_WriteToVRAMPortLo&$0000FF<<8)+$01
	STA.w DMA[$00].Parameters
	LDA.w #DATA_84A000+$2500			; Note: Nintendo logo graphics
	STA.w DMA[$00].SourceLo
	LDA.w #(DATA_84A000+$2500)>>16
	STA.w DMA[$00].SourceBank
	LDA.w #$0400
	STA.w DMA[$00].SizeLo
	STX.w !REGISTER_DMAEnable
	LDY.w #SMK_PaletteData_GhostValleyCourse
	LDA.w #SMK_PaletteData_GhostValleyCourse>>16
	LDX.w #$7E3A80
	JSL.l CODE_84DF38
	JSR.w CODE_808413
	JSR.w CODE_80B93E
	LDX.w #$0000
CODE_808C5C:
	LDA.w DATA_808C7D,x
	STA.w $0200,x
	INX
	INX
	CPX.w #$0010
	BCC.b CODE_808C5C
	LDA.w #$55AA
	STA.w $0400
	JSR.w CODE_80946E
	SEP.b #$20
	LDA.b #!ScreenDisplayRegister_MaxBrightness0F
	STA.w !REGISTER_ScreenDisplayRegister
	REP.b #$30
	PLB
	RTL

DATA_808C7D:
	db $60,$70,$00,$30,$70,$70,$02,$30
	db $80,$70,$04,$30,$90,$70,$06,$30

;--------------------------------------------------------------------

; Note: Routine that animates the character placement markers for the racers that finished the race.

CODE_808C8D:
	LDY.w !RAM_SMK_Race_NumberOfRacersWhoFinished
	BEQ.b CODE_808CCF
	LDA.b $38
	AND.w #$0006
	TAX
	LDA.w DATA_808CE3,x
	STA.b $04
CODE_808C9D:
	LDA.b $38
	AND.w #$000F
	ASL
	TAX
	LDA.w DATA_808CEB-$02,y
	BIT.w DATA_808CFB,x
	BNE.b CODE_808CD0
	LDX.w $010C,y
	LDA.b $12,x
	TAX
	LDA.w DATA_808D1B-$02,y
	ORA.w DATA_80848E,x
	LDX.w DATA_808D73-$02,y
	STA.b $00,x
CODE_808CBD:
	CPY.w #$000A
	BCS.b CODE_808CCB
	LDA.b $04,x
	AND.w #$F1FF
	ORA.b $04
	STA.b $04,x
CODE_808CCB:
	DEY
	DEY
	BNE.b CODE_808C9D
CODE_808CCF:
	RTS

CODE_808CD0:
	LDX.w $010C,y
	LDA.b $12,x
	TAX
	ORA.w DATA_80848E,x
	ORA.w #$3120
	LDX.w DATA_808D73-$02,y
	STA.b $00,x
	BRA.b CODE_808CBD

DATA_808CE3:
	dw $0200,$0200,$0A00,$0C00

DATA_808CEB:
	dw $FF00,$3FC0,$0FF0,$03FC,$0000,$0000,$0000
	dw $0000

DATA_808CFB:
	dw $0001,$0002,$0004,$0008,$0010,$0020,$0040,$0080
	dw $0100,$0200,$0400,$0800,$1000,$2000,$4000,$8000

DATA_808D1B:
	dw $3144,$3146,$3148,$314A,$3144,$3146,$3148,$314A

;--------------------------------------------------------------------

CODE_808D2B:
	LDY.w $0144
	INC.w $0144
	INC.w $0144
	LDA.b $2C
	BNE.b CODE_808D62
	PHX
	LDA.w $010E,y
	TAX
	LDA.b $12,x
	STA.w $0130,y
	TAX
	ORA.w DATA_80848E,x
	ORA.w #$3120
	LDX.w DATA_808D73,y
	STA.b $00,x
	CPY.w #$0008
	BCS.b CODE_808D5B
	LDA.w DATA_808D63,y
	TRB.w $0400
	PLX
	RTS

CODE_808D5B:
	LDA.w DATA_808D63,y
	TRB.w $0620
	PLX
CODE_808D62:
	RTS

DATA_808D63:
	dw $0005,$0050,$0500,$5000,$0005,$0050,$0500,$5000

DATA_808D73:
	dw $0202,$020A,$0212,$021A,$0422,$042A,$0432,$043A

;--------------------------------------------------------------------

CODE_808D83:
	LDA.b $2C
	BNE.b CODE_808DD0
	LDX.w !RAM_SMK_Race_NumberOfRacersWhoFinished
	CPX.w $0144
	BCS.b CODE_808DD0
	LDY.b $4A
	LDA.w DATA_808DD1,x
	STA.w $0EA0,y
	CLC
	ADC.w #$0100
	STA.w $0EA6,y
	LDA.w #$407F
	STA.w $0EA4,y
	STA.w $0EAA,y
	LDA.w $0130,x
	CPX.w #$0008
	BCS.b CODE_808DB5
	TAX
	LDA.w DATA_808DE1,x
	BRA.b CODE_808DB9

CODE_808DB5:
	TAX
	LDA.w DATA_808DF1,x
CODE_808DB9:
	STA.w $0EA2,y
	CLC
	ADC.w #$0200
	STA.w $0EA8,y
	TYA
	CLC
	ADC.w #$000C
	STA.b $4A
	INC.w !RAM_SMK_Race_NumberOfRacersWhoFinished
	INC.w !RAM_SMK_Race_NumberOfRacersWhoFinished
CODE_808DD0:
	RTS

DATA_808DD1:
	dw $5440,$5460,$5480,$54A0,$6440,$6460,$6480,$64A0

DATA_808DE1:
	dw $C000,$C040,$C080,$C0C0,$C100,$C140,$C180,$C1C0

DATA_808DF1:
	dw $C400,$C440,$C480,$C4C0,$C500,$C540,$C580,$C5C0

;--------------------------------------------------------------------

CODE_808E01:
	PHP
	SEP.b #$30
	LDA.b #$01
	STA.w DMA[$00].Parameters
	LDA.b #!REGISTER_WriteToVRAMPortLo
	STA.w DMA[$00].Destination
	LDA.b #$80
	STA.w !REGISTER_VRAMAddressIncrementValue
	LDY.b #$01
	LDX.b $4A
	BEQ.b CODE_808E4B
CODE_808E19:
	LDA.w $0E9A,x
	STA.w !REGISTER_VRAMAddressLo
	LDA.w $0E9B,x
	STA.w !REGISTER_VRAMAddressHi
	LDA.w $0E9C,x
	STA.w DMA[$00].SourceLo
	LDA.w $0E9D,x
	STA.w DMA[$00].SourceHi
	LDA.w $0E9E,x
	STA.w DMA[$00].SourceBank
	LDA.w $0E9F,x
	STA.w DMA[$00].SizeLo
	STZ.w DMA[$00].SizeHi
	STY.w !REGISTER_DMAEnable
	DEX
	DEX
	DEX
	DEX
	DEX
	DEX
	BNE.b CODE_808E19
CODE_808E4B:
	STZ.b $4A
	PLP
	RTS

DATA_808E4F:
	db $18,$18,$19

;--------------------------------------------------------------------

CODE_808E52:
	PHB
	PHK
	PLB
	JSR.w CODE_808E60
	JSR.w CODE_808E91
	JSR.w CODE_808E01
	PLB
	RTL

;--------------------------------------------------------------------

CODE_808E60:
	STZ.b $1E
	LDA.b $38
	ROR
	BCS.b CODE_808E6D
	LDA.w #$0000
	JSR.w CODE_808EED
CODE_808E6D:
	LDA.w $0E4C
	INC
	AND.w #$0007
	STA.w $0E4C
	BEQ.b CODE_808E6D
	JSR.w CODE_808EED
	CPX.w #$0019
	BCS.b CODE_808E88
	LDA.b $1E
	CMP.w #$0007
	BCC.b CODE_808E6D
CODE_808E88:
	CPX.w #$0025
	BCS.b CODE_808EC4
	JSR.w CODE_808D83
	RTS

;--------------------------------------------------------------------

CODE_808E91:
	STZ.b $1E
	LDA.b $38
	ROR
	BEQ.b CODE_808E9E
	LDA.w #$0001
	JSR.w CODE_808F82
CODE_808E9E:
	LDA.w $0E4E
	INC
	AND.w #$0007
	STA.w $0E4E
	CMP.w #$0001
	BEQ.b CODE_808E9E
	JSR.w CODE_808F82
	CPX.w #$0049
	BCS.b CODE_808EBC
	LDA.b $1E
	CMP.w #$0007
	BCC.b CODE_808E9E
CODE_808EBC:
	CPX.w #$0055
	BCS.b CODE_808EC4
	JSR.w CODE_808D83
CODE_808EC4:
	RTS

;--------------------------------------------------------------------

CODE_808EC5:
	LDX.w DATA_809070,y
	LDA.w DATA_80848E,y
	ORA.w DATA_80847E,y
	STA.b $14,x
	LDA.w DATA_80846E,y
	STA.b $10
	LDA.w DATA_809080,y
	STA.b $16
	LDA.b $30,x
	CMP.b $BA,x
	BEQ.b CODE_808EC4
	STA.b $BA,x
	AND.w #$7FFF
	PHY
	TAY
	PLA
	BRA.b CODE_808F22

CODE_808EEA:
	LDX.b $4A
	RTS

;--------------------------------------------------------------------

CODE_808EED:
	INC.b $1E
	XBA
	ORA.w #$1000
	TAX
	LDA.b $10,x
	BEQ.b CODE_808EEA
	LDA.b $30,x
	CMP.b $BA,x
	BEQ.b CODE_808EEA
	STA.b $BA,x
	AND.w #$7FFF
	TAY
	CMP.w #$016E
	BCS.b CODE_808EEA
	CMP.w #$016A
	BCC.b CODE_808F1C
	STZ.b $08
	BEQ.b CODE_808F17
	LDA.w #$0400
	STA.b $08
CODE_808F17:
	LDA.b $B6,x
	JMP.w CODE_808FAE

CODE_808F1C:
	LDA.b $B6,x
CODE_808F1E:
	STA.b $10
	LDA.b $12,x
CODE_808F22:
	CMP.w #$0002
	BNE.b CODE_808F32
	LDA.w DATA_809292,y
	BMI.b CODE_808F2F
	JMP.w CODE_808FE5

CODE_808F2F:
	LDA.w #$0000
CODE_808F32:
	TAX
	LDA.w DATA_809080,x
	STA.b $16
	LDA.w DATA_809090,y
	PHA
	AND.w #$00FF
	TAX
	LDA.w DATA_8091FA,x
	STA.b $12
	PLA
	XBA
	PHA
	AND.w #$00F0
	STA.b $17
	PLA
	AND.w #$000F
	TAY
	LDX.b $4A
CODE_808F54:
	LDA.b $10
	STA.w $0EA0,x
	INX
	INX
	CLC
	ADC.w #$0100
	STA.b $10
	LDA.b $12
	STA.w $0EA0,x
	INX
	INX
	CLC
	ADC.w #$0200
	STA.b $12
	LDA.b $16
	STA.w $0EA0,x
	INX
	INX
	DEY
	BNE.b CODE_808F54
	STX.b $4A
	RTS

CODE_808F7B:
	LDA.b $B8,x
	BRA.b CODE_808F1E

;--------------------------------------------------------------------

CODE_808F7F:
	LDX.b $4A
	RTS

CODE_808F82:
	INC.b $1E
	XBA
	ORA.w #$1000
	TAX
	LDA.b $10,x
	BEQ.b CODE_808F7F
	LDA.b $36,x
	CMP.b $BC,x
	BEQ.b CODE_808F7F
	STA.b $BC,x
	AND.w #$7FFF
	TAY
	CMP.w #$016E
	BCS.b CODE_808F7F
	CMP.w #$016A
	BCC.b CODE_808F7B
	STZ.b $08
	BEQ.b CODE_808FAC
	LDA.w #$0400
	STA.b $08
CODE_808FAC:
	LDA.b $B8,x
CODE_808FAE:
	LDY.b $4A
	STA.w $0EA0,y
	CLC
	ADC.w #$0100
	STA.w $0EA6,y
	LDA.b $12,x
	XBA
	LSR
	LSR
	LSR
	CLC
	ADC.w #$CC00
	ADC.b $08
	STA.w $0EA2,y
	CLC
	ADC.w #$0200
	STA.w $0EA8,y
	LDA.w #$007F
	ORA.w #$4000
	STA.w $0EA4,y
	STA.w $0EAA,y
	TYA
	CLC
	ADC.w #$000C
	STA.b $4A
	TAX
	RTS

;--------------------------------------------------------------------

CODE_808FE5:
	PHA
	AND.w #$00FF
	TAX
CODE_808FEA:
	LDA.w DATA_8093FC,x
	STA.b $12
	LDA.w DATA_809090,y
	AND.w #$00FF
	TAY
	LDA.w DATA_8091FA,y
	STA.b $14
	LDX.b $4A
	LDA.b $10
	STA.w $0EA0,x
	CLC
	ADC.w #$0100
	STA.w $0EA6,x
	ADC.w #$0100
	STA.w $0EAC,x
	ADC.w #$0100
	STA.w $0EB2,x
	LDA.b $12
	STA.w $0EA2,x
	ADC.w #$0200
	STA.w $0EA8,x
	LDA.b $14
	ADC.w #$0400
	STA.w $0EAE,x
	ADC.w #$0200
	STA.w $0EB4,x
	PLA
	BIT.w #$0200
	BNE.b CODE_809052
	BIT.w #$0400
	BNE.b CODE_809060
	LDA.w #$8084
	STA.w $0EA4,x
	STA.w $0EAA,x
	LDA.w #$80C0
CODE_809045:
	STA.w $0EB0,x
	STA.w $0EB6,x
	TXA
	ADC.w #$0018
	STA.b $4A
	RTS

CODE_809052:
	LDA.w #$4084
	STA.w $0EA4,x
	STA.w $0EAA,x
	LDA.w #$40C0
	BRA.b CODE_809045

CODE_809060:
	LDA.w #$8084
	STA.w $0EA4,x
	STA.w $0EAA,x
	TXA
	ADC.w #$000C
	STA.b $4A
	RTS

;--------------------------------------------------------------------

DATA_809070:
	dw $1000,$1100,$1200,$1300,$1400,$1500,$1600,$1700

DATA_809080:
	dw $00C0,$0084,$00C1,$00C2,$00C3,$00C5,$00C6,$00C4

;--------------------------------------------------------------------

DATA_809090:
	dw $4400,$8402,$8404,$8406,$8408,$840A,$840C,$840E
	dw $840E,$8410,$8410,$8412,$8412,$8414,$8414,$4416
	dw $4418,$841A,$841C,$841E,$8420,$8422,$8424,$8426
	dw $8426,$8428,$8428,$842A,$842A,$842C,$842C,$442E
	dw $4430,$8432,$8434,$8436,$8438,$843A,$843C,$843E
	dw $843E,$8440,$8440,$8442,$8442,$8444,$8444,$4446
	dw $4348,$4348,$634A,$634A,$634C,$634C,$634E,$634E
	dw $6350,$6350,$6352,$6352,$6354,$6354,$4356,$4356
	dw $4358,$4358,$635A,$635A,$635C,$635C,$635E,$635E
	dw $6360,$6360,$6362,$6362,$6364,$6364,$4366,$4366
	dw $4268,$4268,$4268,$4268,$426A,$426A,$426A,$426A
	dw $426C,$426C,$426C,$426C,$426E,$426E,$426E,$426E
	dw $4270,$4270,$4270,$4270,$4272,$4272,$4272,$4272
	dw $4274,$4274,$4274,$4274,$4276,$4276,$4276,$4276
	dw $4278,$4278,$4278,$4278,$427A,$427A,$427A,$427A
	dw $427C,$427C,$427C,$427C,$427E,$427E,$427E,$427E
	dw $4180,$4180,$4180,$4180,$4182,$4182,$4182,$4182
	dw $4182,$4182,$4182,$4182,$4184,$4184,$4184,$4184
	dw $2186,$2186,$2186,$2186,$2188,$2188,$2188,$2188
	dw $2188,$2188,$2188,$2188,$2186,$2186,$2186,$2186
	dw $218A,$218A,$218A,$218A,$218C,$218C,$218C,$218C
	dw $218C,$218C,$218C,$218C,$218A,$218A,$218A,$218A
	dw $848E,$8290,$8292,$8494,$8496

DATA_8091FA:
	dw $2000,$2080,$2100,$2180,$2800,$2880,$2900,$2980
	dw $3000,$3080,$3100,$2040,$3180,$3800,$3880,$3900
	dw $3980,$4000,$4080,$4100,$4180,$4800,$4880,$31C0
	dw $4900,$4980,$5000,$5080,$5100,$5180,$5800,$5880
	dw $5900,$5980,$6000,$4940,$6800,$6080,$60E0,$6140
	dw $61A0,$6680,$66E0,$6840,$6E00,$6740,$67A0,$6C80
	dw $6CE0,$6D40,$6DA0,$6E40,$7280,$72C0,$7300,$7340
	dw $7380,$73C0,$7400,$7440,$7800,$7840,$7880,$78C0
	dw $7680,$7740,$76C0,$7700,$7780,$7720,$77A0,$7980
	dw $7C00,$7C80,$7900,$7940

DATA_809292:
	dw $0200,$0004,$0006,$0008,$000A,$000C,$000E,$0010
	dw $0010,$0012,$0012,$0014,$0014,$0016,$0016,$0202
	dw $0218,$001C,$001E,$0020,$0022,$0024,$0026,$0028
	dw $0028,$002A,$002A,$002C,$002C,$002E,$002E,$021A
	dw $0230,$0034,$0036,$0038,$003A,$003C,$003E,$0040
	dw $0040,$0042,$0042,$0044,$0044,$0046,$0046,$0232

	%FREE_BYTES(NULLROM, 256, $FF)

DATA_8093F2:
	dw $004E,$0450,$0448,$024A,$024C

DATA_8093FC:
	dw $A000,$A040,$A080,$A100,$A180,$A400,$A480,$A500
	dw $A580,$A800,$A880,$A900,$A980,$A9C0,$AC00,$AC80
	dw $AD00,$AD80,$B000,$B080,$B100,$B180,$B400,$B480
	dw $B500,$B540,$B580,$B800,$B880,$B900,$B980,$BC00
	dw $BC80,$BD00,$BD80,$C000,$C080,$C100,$C140,$C180
	dw $C400,$5000,$5040,$5080,$50C0,$5400,$5440,$5480
	dw $54C0,$5800,$5840,$5880,$58C0,$5C00,$5C40,$5C80
	dw $5CC0

;--------------------------------------------------------------------

CODE_80946E:
	SEP.b #$30
	STZ.w DMA[$00].SourceLo
	LDA.b #!RAM_SMK_Global_OAMBuffer1>>8
	STA.w DMA[$00].SourceHi
	BRA.b CODE_809486

CODE_80947A:
	SEP.b #$30
	LDA.b #!RAM_SMK_Global_OAMBuffer2
	STA.w DMA[$00].SourceLo
	LDA.b #!RAM_SMK_Global_OAMBuffer2>>8
	STA.w DMA[$00].SourceHi
CODE_809486:
	STZ.w DMA[$00].SourceBank
	STZ.w !REGISTER_OAMAddressLo
	STZ.w !REGISTER_OAMAddressHi
	STZ.w DMA[$00].Parameters
	LDA.b #!REGISTER_OAMDataWritePort
	STA.w DMA[$00].Destination
	LDA.b #$20
	STA.w DMA[$00].SizeLo
	LDA.b #$02
	STA.w DMA[$00].SizeHi
	LDA.b #$01
	STA.w !REGISTER_DMAEnable
	REP.b #$30
	RTS

;--------------------------------------------------------------------

CODE_8094A9:
	LDA.w $0E32
	BNE.b CODE_8094B9
	LDA.b $38
	ROR
	BCS.b CODE_8094B9
	JSR.w CODE_8097A9
	JSR.w CODE_8098E7
CODE_8094B9:
	RTS

;--------------------------------------------------------------------

CODE_8094BA:
	RTS

;--------------------------------------------------------------------

CODE_8094BB:
	LDA.b $38
	ROR
	BCS.b CODE_8094B9
	LDA.w $0E32
	BNE.b CODE_8094B9
	JSR.w CODE_8097A9
	JSR.w CODE_8094CC
	RTS

CODE_8094CC:
	LDX.w $0E46
	BEQ.b CODE_8094DB
	REP.b #$20
	LDA.b $42
	AND.w #$8080
	STA.b $42
	RTS

CODE_8094DB:
	LDX.b $2E
	JMP.w (DATA_8094E0,x)

DATA_8094E0:
	dw CODE_8094E6
	dw CODE_809500
	dw CODE_809527

CODE_8094E6:
	LDY.w #$0002
	LDX.w #$1100
	LDA.w #$007F
	TRB.b $43
	LDA.w $1110
	BEQ.b CODE_80950E
	JSR.w CODE_809543
	TSB.b $43
	JSR.w CODE_809539
	BRA.b CODE_80950E

CODE_809500:
	LDA.w $0E60
	BEQ.b CODE_80950E
	LDY.w #$0002
	LDX.w #$1100
	JSR.w CODE_809543
CODE_80950E:
	LDY.w #$0000
	LDX.w #$1000
	LDA.w $1010
	BEQ.b CODE_809526
CODE_809519:
	LDA.w #$007F
	TRB.b $42
	JSR.w CODE_809543
	TSB.b $42
	JSR.w CODE_80952F
CODE_809526:
	RTS

CODE_809527:
	LDY.w #$0002
	LDX.w #$1100
	BRA.b CODE_809519

CODE_80952F:
	LDA.w #$0080
	LDX.b $02
	BPL.b CODE_809540
CODE_809536:
	TRB.b $41
	RTS

CODE_809539:
	LDA.w #$0040
	LDX.b $02
	BMI.b CODE_809536
CODE_809540:
	TSB.b $41
	RTS

;--------------------------------------------------------------------

CODE_809543:
	STZ.b $02
	LDA.w $0020,y
	BPL.b CODE_80954C
	DEC.b $02
CODE_80954C:
	LDA.b $2C
	BEQ.b CODE_809563
	CMP.w #$0004
	BCC.b CODE_80956A
CODE_809555:
	LDA.b $C2,x
	CMP.w #$30C0
	BCS.b CODE_809591
	CMP.w #$2DC0
	BCS.b CODE_80957F
	BRA.b CODE_809576

CODE_809563:
	LDA.b $E6,x
	CMP.w #$0004
	BCS.b CODE_809555
CODE_80956A:
	LDA.b $C2,x
	CMP.w #$3000
	BCS.b CODE_809591
	CMP.w #$2E80
	BCS.b CODE_80957F
CODE_809576:
	LDA.b $E0,x
	AND.w #$FFFE
	STA.b $E0,x
	BRA.b CODE_80958A

CODE_80957F:
	LDA.b $02
	BPL.b CODE_809576
	LDA.b $E0,x
	ORA.w #$0001
	STA.b $E0,x
CODE_80958A:
	LDA.b $E2,x
	AND.w #$FFFE
	BRA.b CODE_80959D

CODE_809591:
	LDA.b $E0,x
	AND.w #$FFFE
	STA.b $E0,x
	LDA.b $E2,x
	ORA.w #$0001
CODE_80959D:
	STA.b $E2,x
	LDA.b $02
	BMI.b CODE_8095BB
	LDA.w $00C4,x
	BNE.b CODE_8095C0
	LDA.w $00C2,x
	SEC
	SBC.w #$0180
	BMI.b CODE_8095B6
	CMP.w #$0100
	BCS.b CODE_8095E0
CODE_8095B6:
	LDA.w #$0100
	BRA.b CODE_8095E0

CODE_8095BB:
	LDA.w $00C4,x
	BEQ.b CODE_8095D1
CODE_8095C0:
	LDA.w $00C2,x
	SEC
	SBC.w #$0280
	CMP.w #$3F00
	BCS.b CODE_8095E0
	STZ.w $00C4,x
	BRA.b CODE_8095E0

CODE_8095D1:
	LDA.w $00C2,x
	CLC
	ADC.w #$00C0
	CMP.w #$4F00
	BCC.b CODE_8095E0
	DEC.w $00C4,x
CODE_8095E0:
	STA.w $00C2,x
	XBA
	AND.w #$00FF
	RTS

;--------------------------------------------------------------------

CODE_8095E8:
	LDA.w $0E0C
	BEQ.b CODE_8095F4
	STZ.w $0E0C
	LDA.b #$16
	BRA.b CODE_809615

CODE_8095F4:
	LDA.w $0E6A
	BEQ.b CODE_809615
	TAX
	DEX
	DEX
	STX.w $0E6A
	LDA.w $0E6C,x
	BRA.b CODE_809615

CODE_809604:
	LDA.w $0E0C
	BEQ.b CODE_809615
	DEC
	TAX
	STA.w $0E0C
	LDA.w $0E18,x
	CMP.b #$1E
	BNE.b CODE_809618
CODE_809615:
	STA.w !REGISTER_APUPort0
CODE_809618:
	REP.b #$30
	RTS

CODE_80961B:
	SEP.b #$20
	LDA.b $34
	ROR
	BCS.b CODE_809618
	LDA.w $0E6A
	BEQ.b CODE_809615
	DEC
	DEC
	STA.w $0E6A
	TAX
	LDA.w $0E6C,x
	BRA.b CODE_809615

CODE_809632:
	SEP.b #$30
	LDA.b $34
	ROR
	BCS.b CODE_809618
	LDA.w $0E32
	BNE.b CODE_809604
	LDA.w $0E50
	BNE.b CODE_8095E8
	LDA.b $42
	STA.w !REGISTER_APUPort2
	LDA.b $43
	STA.w !REGISTER_APUPort3
	LDA.b $2E
	CMP.b #$02
	BEQ.b CODE_809665
	BCS.b CODE_80965C
	LDA.w $1010
	BIT.b #$20
	BEQ.b CODE_809675
CODE_80965C:
	LDA.w $1110
	BIT.b #$20
	BEQ.b CODE_809675
	BRA.b CODE_80966C

CODE_809665:
	LDA.w $1010
	BIT.b #$20
	BEQ.b CODE_809675
CODE_80966C:
	STZ.w $00D2
	STZ.w $00D3
	JMP.w CODE_80974A

CODE_809675:
	LDA.w $00D2
	BEQ.b CODE_8096DA
	PHA
	LDA.b $34
	ROR
	ROR
	BCC.b CODE_809688
	PLA
	STZ.w !REGISTER_APUPort0
	REP.b #$30
	RTS

CODE_809688:
	PLA
	BIT.b #$80
	BNE.b CODE_8096D3
	BIT.b #$40
	BNE.b CODE_8096B9
	BIT.b #$20
	BNE.b CODE_8096A0
	BIT.b #$10
CODE_809696:
	BNE.b CODE_8096B2
	LDA.b #$60
	PHA
	LDA.b #$08
	BRA.b CODE_8096A5

CODE_8096A0:
	LDA.b #$5E
	PHA
	LDA.b #$20
CODE_8096A5:
	PHA
	LDA.b $42
	ORA.b #$80
	STA.b $42
	STA.w !REGISTER_APUPort2
	PLA
	BRA.b CODE_8096C9

CODE_8096B2:
	LDA.b #$60
	PHA
	LDA.b #$10
	BRA.b CODE_8096BE

CODE_8096B9:
	LDA.b #$5E
CODE_8096BA:
	PHA
	LDA.b #$40
CODE_8096BE:
	PHA
	LDA.b $42
	AND.b #$7F
	STA.b $42
	STA.w !REGISTER_APUPort2
	PLA
CODE_8096C9:
	TRB.w $00D2
	PLA
	STA.w !REGISTER_APUPort0
	REP.b #$30
	RTS

CODE_8096D3:
	LDA.b #$63
	PHA
	LDA.b #$80
	BRA.b CODE_8096C9

CODE_8096DA:
	LDA.w $00D3
	BEQ.b CODE_80974A
	PHA
	LDA.b $34
	ROR
	ROR
	BCC.b CODE_8096ED
	PLA
	STZ.w !REGISTER_APUPort0
	REP.b #$30
	RTS

CODE_8096ED:
	PLA
	BMI.b CODE_809710
	BIT.b #$40
	BNE.b CODE_809729
	BIT.b #$20
	BNE.b CODE_809717
	BIT.b #$10
	BNE.b CODE_809730
	BIT.b #$08
	BNE.b CODE_809709
	BIT.b #$04
	LDA.b #$62
	PHA
	LDA.b #$04
	BRA.b CODE_809740

CODE_809709:
	LDA.b #$61
	PHA
	LDA.b #$08
	BRA.b CODE_809740

CODE_809710:
	LDA.b #$5D
	PHA
	LDA.b #$80
	BRA.b CODE_80971C

CODE_809717:
	LDA.b #$5F
	PHA
	LDA.b #$20
CODE_80971C:
	PHA
	LDA.b $42
	AND.b #$7F
	STA.b $42
	STA.w !REGISTER_APUPort2
	PLA
	BRA.b CODE_809740

CODE_809729:
	LDA.b #$5D
	PHA
	LDA.b #$40
	BRA.b CODE_809735

CODE_809730:
	LDA.b #$5F
	PHA
	LDA.b #$10
CODE_809735:
	PHA
	LDA.b $42
	ORA.b #$80
	STA.b $42
	STA.w !REGISTER_APUPort2
	PLA
CODE_809740:
	TRB.w $00D3
	PLA
	STA.w !REGISTER_APUPort0
	REP.b #$30
	RTS

CODE_80974A:
	LDA.b $41
	STA.w !REGISTER_APUPort1
	LDX.w $0E0C
	BEQ.b CODE_80975D
	DEX
	STX.w $0E0C
	LDA.w $0E18,x
	BRA.b CODE_80979D

CODE_80975D:
	LDX.w $0E46
	BEQ.b CODE_80976B
	DEX
	STX.w $0E46
	LDA.w $0E48,x
	BRA.b CODE_80979D

CODE_80976B:
	LDX.w $0E6A
	BEQ.b CODE_809790
	DEX
	DEX
	STX.w $0E6A
	LDA.b #$80
	LDY.w $0E74,x
	BPL.b CODE_809782
	LDA.b $42
	ORA.b #$80
	BRA.b CODE_809786

CODE_809782:
	LDA.b $42
	AND.b #$7F
CODE_809786:
	STA.b $42
	STA.w !REGISTER_APUPort2
	LDA.w $0E6C,x
	BRA.b CODE_80979D

CODE_809790:
	LDA.w $0E14
	CMP.w $0E16
	STA.w $0E16
	BNE.b CODE_80979D
	LDA.b #$00
CODE_80979D:
	CMP.b #$14
	BEQ.b CODE_8097A3
	ORA.b $40
CODE_8097A3:
	STA.w !REGISTER_APUPort0
	REP.b #$30
	RTS

;--------------------------------------------------------------------

CODE_8097A9:
	LDA.w $0142
	BMI.b CODE_8097C5
	DEC
	BEQ.b CODE_8097B5
	STA.w $0142
	RTS

CODE_8097B5:
	DEC
	STA.w $0142
	LDA.w #$000A
	STA.w $0E5E
	LDA.w #$0004
	JMP.w CODE_809851

CODE_8097C5:
	LDA.w $0E12
	BEQ.b CODE_8097F3
	DEC
	STA.w $0E12
	BNE.b CODE_809813
	LDA.w $0E10
	BMI.b CODE_8097DA
	LDA.w #$0008
	BRA.b CODE_809851

CODE_8097DA:
	LDA.w !RAM_SMK_Global_RacetrackType
	BEQ.b CODE_8097E9							; Note: !Define_SMK_RacetrackType_GhostValley
	CMP.w #!Define_SMK_RacetrackType_BowserCastle
	BEQ.b CODE_8097EE
	LDA.w #$0007
	BRA.b CODE_809851

CODE_8097E9:
	LDA.w #$0015
	BRA.b CODE_809851

CODE_8097EE:
	LDA.w #$0006
	BRA.b CODE_809851

CODE_8097F3:
	LDA.w $0128
	BEQ.b CODE_809813
	DEC
	STA.w $0128
	BNE.b CODE_809813
CODE_8097FE:
	LDA.w #$0010
	STA.w $0E5E
	LDA.w $0122
	CMP.w #$0010
	BCS.b CODE_809813
	LSR
	CLC
	ADC.w #$000C
	BRA.b CODE_809851

CODE_809813:
	RTS

CODE_809814:
	LDA.b $2C
	BEQ.b CODE_809829
	CMP.w #$0004
	BEQ.b CODE_809850
	LDA.w $0122
	BPL.b CODE_809850
	LDA.b $12,x
	STA.w $0122
	BRA.b CODE_8097FE

CODE_809829:
	LDA.w $0122
	BPL.b CODE_809850
	LDA.w $0144
	CMP.w #$0008
	BCC.b CODE_809844
	LDA.w #$000B
	JSL.l CODE_80985F
	LDA.w #$0010
	STA.w $0122
	RTS

CODE_809844:
	LDA.w #$0009
	JSL.l CODE_80985F
	LDA.b $12,x
	STA.w $0122
CODE_809850:
	RTS

CODE_809851:
	LDY.w $0E0C
	STA.w $0E18,y
	INC.w $0E0C
	RTS

CODE_80985B:
	JSR.w CODE_809851
	RTL

CODE_80985F:
	JSR.w CODE_809851
	LDA.w #$00B0
	STA.w $0128
	LDA.w #$FFFF
	STA.w $0E0E
	LDA.b $2E
	CMP.w #$0004
	BCS.b CODE_80987A
	LDA.w $1012
	BRA.b CODE_80987D

CODE_80987A:
	LDA.w $1112
CODE_80987D:
	STA.w $0122
	RTL

CODE_809881:
	PHX
	JSR.w CODE_8098C6
	PLX
	BCS.b CODE_809895
	STX.w $0E10
	LDA.w $0E0E
	BMI.b CODE_809895
	LDA.w #$0008
	BRA.b CODE_809851

CODE_809895:
	RTS

CODE_809896:
	CPX.w $0E10
	BNE.b CODE_809895
	PHX
	JSR.w CODE_8098C6
	PLX
	BCS.b CODE_809895
	LDA.w #$FFFF
	STA.w $0E10
	LDA.w $0E0E
	BEQ.b CODE_8098C1
	BMI.b CODE_809895
	LDA.w !RAM_SMK_Global_RacetrackType
	CMP.w #!Define_SMK_RacetrackType_BowserCastle
	BEQ.b CODE_8098BC
	LDA.w #$0007
	BRA.b CODE_809851

CODE_8098BC:
	LDA.w #$0006
	BRA.b CODE_809851

CODE_8098C1:
	LDA.w #$0004
	BRA.b CODE_809851

CODE_8098C6:
	LDX.b $2E
	JMP.w (DATA_8098CB,x)

DATA_8098CB:
	dw CODE_8098D1
	dw CODE_8098D6
	dw CODE_8098DB

CODE_8098D1:
	JSR.w CODE_8098DB
	BCS.b CODE_8098E5
CODE_8098D6:
	LDA.w $1010
	BRA.b CODE_8098DE

CODE_8098DB:
	LDA.w $1110
CODE_8098DE:
	BIT.w #$0020
	BNE.b CODE_8098E5
	CLC
	RTS

CODE_8098E5:
	SEC
	RTS

;--------------------------------------------------------------------

CODE_8098E7:
	LDX.b $2E
	JMP.w (DATA_8098EC,x)

DATA_8098EC:
	dw CODE_8098F4
	dw CODE_809903
	dw CODE_809912
	dw CODE_809927

CODE_8098F4:
	LDA.b $38
	BIT.w #$0002
	BNE.b CODE_8098FF
	JSR.w CODE_809A0B
	RTS

CODE_8098FF:
	JSR.w CODE_809A51
	RTS

CODE_809903:
	LDA.b $38
	BIT.w #$0002
	BNE.b CODE_80990E
	JSR.w CODE_809A0B
	RTS

CODE_80990E:
	JSR.w CODE_809933
	RTS

CODE_809912:
	LDA.b $38
	BIT.w #$0002
	BNE.b CODE_80991D
	JSR.w CODE_809A7B
	RTS

CODE_80991D:
	JSR.w CODE_809933
	RTS

CODE_809921:
	LDA.w #$007F
	TRB.b $42
	RTS

CODE_809927:
	LDA.w #$0040
	TSB.b $41
	LDA.b $38
	BIT.w #$0002
	BNE.b CODE_809921
CODE_809933:
	LDA.w $1EA4
	CMP.w #$0100
	BCS.b CODE_80999B
	LDX.w $1EA0
	LDY.b $12,x
	LDA.w DATA_8099B7,y
	STA.w $0E14
	LDX.w $0178
	BMI.b CODE_809994
	LDA.w $1EA8
	CLC
	ADC.w #$0020
	BMI.b CODE_80999B
	CMP.w #$0040
	BCS.b CODE_80999B
	ASL
	AND.w #$0070
	STA.b $14
	LDA.w $1EA4
	LSR
	LSR
	LSR
	CMP.w #$0007
	BCS.b CODE_80999B
	TAY
	LDA.w $1EA4
	SEC
	SBC.w $0178
	BEQ.b CODE_809980
	BCC.b CODE_80997B
	LDA.w DATA_8099A9,y
	BRA.b CODE_809988

CODE_80997B:
	LDA.w DATA_8099B0,y
	BRA.b CODE_809988

CODE_809980:
	CPY.w #$0002
	BCS.b CODE_80999A
	LDA.w #$0008
CODE_809988:
	AND.w #$000F
	ORA.b $14
	TSB.b $43
	EOR.w #$007F
	TRB.b $43
CODE_809994:
	LDA.w $1EA4
	STA.w $0178
CODE_80999A:
	RTS

CODE_80999B:
	LDA.b $43
	AND.w #$FF80
	STA.b $43
	LDA.w #$FFFF
	STA.w $0178
	RTS

DATA_8099A9:
	db $09,$0A,$0B,$0C,$0D,$0E,$0F

DATA_8099B0:
	db $07,$06,$05,$04,$03,$02,$01

DATA_8099B7:
	dw $0078,$0078,$0079,$007B,$0079,$007A,$007A,$007B

;--------------------------------------------------------------------

CODE_8099C7:
	LDA.b $EA,x
	CMP.w #$01FF
	BCC.b CODE_8099D1
	LDA.w #$01FF
CODE_8099D1:
	ASL
	ASL
	ASL
	AND.w #$1F00
	STA.b $04
	SEP.b #$20
	LDA.b $A6,x
	CMP.b #$12
	BNE.b CODE_8099E5
	LDA.b #$03
	BRA.b CODE_8099E7

CODE_8099E5:
	LDA.b #$00
CODE_8099E7:
	STA.b $00
	LDA.w $0E00,y
	CMP.b #$0A
	BCC.b CODE_8099F2
	LDA.b #$0A
CODE_8099F2:
	CLC
	ADC.b $00
	STA.b $00
	ASL
	CLC
	ADC.b $00
	CMP.b $05
	BCC.b CODE_809A01
	LDA.b $05
CODE_809A01:
	CLC
	ADC.b $C3,x
	CMP.b #$7F
	BCC.b CODE_809A0A
	LDA.b #$7F
CODE_809A0A:
	RTS

;--------------------------------------------------------------------

CODE_809A0B:
	REP.b #$20
	LDA.w $1010
	BEQ.b CODE_809A35
	BIT.w #$0040
	BNE.b CODE_809A35
	STZ.b $02
	LDA.w $0020
	BPL.b CODE_809A20
	DEC.b $02
CODE_809A20:
	JSR.w CODE_80952F
	LDA.w #$007F
	TRB.b $42
	LDX.w #$1000
	LDY.w #$0000
	JSR.w CODE_8099C7
	TSB.b $42
	BRA.b CODE_809AA5

CODE_809A35:
	LDA.b $41
	AND.w #$80C0
	ORA.w #$002F
	STA.b $41
	RTS

CODE_809A40:
	SEP.b #$20
	LDA.b #$7F
	TRB.b $43
	LDA.b $41
	AND.b #$C0
	ORA.b #$1F
	STA.b $41
	REP.b #$20
	RTS

CODE_809A51:
	REP.b #$20
	LDA.w $1110
	BEQ.b CODE_809A40
	BIT.w #$0040
	BNE.b CODE_809A40
	STZ.b $02
	LDA.w $0022
	BPL.b CODE_809A66
	DEC.b $02
CODE_809A66:
	JSR.w CODE_809539
	LDA.w #$007F
	TRB.b $43
	LDX.w #$1100
	LDY.w #$0002
	JSR.w CODE_8099C7
	TSB.b $43
	BRA.b CODE_809ACB

;--------------------------------------------------------------------

CODE_809A7B:
	REP.b #$20
	LDA.w $1110
	BEQ.b CODE_809A35
	BIT.w #$0040
	BNE.b CODE_809A35
	STZ.b $02
	LDA.w $0022
	BPL.b CODE_809A90
	DEC.b $02
CODE_809A90:
	JSR.w CODE_80952F
	LDA.w #$007F
CODE_809A94:
	TRB.b $42
	LDX.w #$1100
	LDY.w #$0002
	JSR.w CODE_8099C7
	TSB.b $42
	BRA.b CODE_809AEE

CODE_809AA5:
	LDX.w #$1000
	LDY.w #$0000
	JSR.w CODE_809B06
	CMP.w $0E04
	BEQ.b CODE_809ABD
	STA.w $0E04
CODE_809AB6:
	ORA.b #$20
	TSB.b $41
CODE_809ABA:
	REP.b #$20
	RTS

CODE_809ABD:
	CMP.b #$0F
	BNE.b CODE_809ABA
	LDA.b $38
	BIT.b #$04
	BNE.b CODE_809ABA
	LDA.b #$0F
	BRA.b CODE_809AB6

CODE_809ACB:
	LDX.w #$1100
	LDY.w #$0002
	JSR.w CODE_809B06
	CMP.w $0E06
	BEQ.b CODE_809AE0
	STA.w $0E06
CODE_809ADC:
	ORA.b #$10
	TSB.b $41
CODE_809AE0:
	CMP.b #$0F
	BNE.b CODE_809ABA
	LDA.b $38
	BIT.b #$04
	BNE.b CODE_809ABA
	LDA.b #$0F
	BRA.b CODE_809ADC

CODE_809AEE:
	LDX.w #$1100
	LDY.w #$0002
	JSR.w CODE_809B06
	CMP.w $0E06
	BEQ.b CODE_809ABD
	STA.w $0E06
	ORA.b #$20
	TSB.b $41
	REP.b #$20
	RTS

CODE_809B06:
	LDA.b $10,x
	BIT.b #$40
	BNE.b CODE_809B7E
	LDA.b #$3F
	TRB.b $41
	LDA.b $61,x
	BEQ.b CODE_809B1C
	LDA.b #$00
	STA.w $00D8,y
	LDA.b #$0E
	RTS

CODE_809B1C:
	LDA.w $00D8,y
	BEQ.b CODE_809B3A
	LDA.w $0D71,y
	BIT.b #$20
	BNE.b CODE_809B48
	LDA.b #$00
	STA.w $00D8,y
	REP.b #$20
	LDA.w #$0055
	JSL.l CODE_81F57A
	SEP.b #$20
	BRA.b CODE_809B4B

CODE_809B3A:
	LDA.w $0D71,y
	AND.b #$A0
	CMP.b #$A0
	BNE.b CODE_809B4B
	LDA.b #$FF
	STA.w $00D8,y
CODE_809B48:
	LDA.b #$0B
	RTS

CODE_809B4B:
	LDA.b $E2,x
	BIT.b #$01
	BEQ.b CODE_809B54
	LDA.b #$01
	RTS

CODE_809B54:
	LDA.b $11,x
	BIT.b #$01
	BEQ.b CODE_809B5D
	LDA.b #$0D
	RTS

CODE_809B5D:
	LDA.b #$00
	XBA
	LDA.b $A0,x
	PHX
	TAX
	JMP.w (DATA_809B67,x)

DATA_809B67:
	dw CODE_809B8B
	dw CODE_809BC3
	dw CODE_809B7D
	dw CODE_809B77
	dw CODE_809B81
	dw CODE_809B77
	dw CODE_809B85
	dw CODE_809B85

CODE_809B77:
	PLX
	STZ.b $C2,x
CODE_809B7A:
	LDA.b #$0D
	RTS

CODE_809B7D:
	PLX
CODE_809B7E:
	LDA.b #$0F
	RTS

CODE_809B81:
	PLX
	LDA.b #$03
	RTS

CODE_809B85:
	PLX
	STZ.b $C2,x
	LDA.b #$0A
	RTS

CODE_809B8B:
	PLX
	LDA.b #$00
	XBA
	LDA.b $A6,x
	PHX
	TAX
	JMP.w (DATA_809B96,x)

DATA_809B96:
	dw CODE_809BC6
	dw CODE_809BF4
	dw CODE_809BF4
	dw CODE_809BF4
	dw CODE_809BF4
	dw CODE_809BB4
	dw CODE_809BB4
	dw CODE_809BB4
	dw CODE_809BB4
	dw CODE_809BC6
	dw CODE_809BC6
	dw CODE_809C0F
	dw CODE_809BC3
	dw CODE_809BB4
	dw CODE_809BC6

CODE_809BB4:
	PLX
	STZ.w $00C2,x
	STZ.w $00C3,x
	LDA.b #$09
	RTS

CODE_809BBE:
	LDY.b $EB,x
	BEQ.b CODE_809BD8
	RTS

CODE_809BC3:
	PLX
	BRA.b CODE_809BD8

CODE_809BC6:
	PLX
CODE_809BC7:
	LDA.b $EB,x
	BEQ.b CODE_809BD8
	LDY.b $B0,x
	LDA.w DATA_809C1D,y
	BPL.b CODE_809BBE
	LDA.b $C5,x
	BIT.b #$40
	BNE.b CODE_809C12
CODE_809BD8:
	LDA.b $11,x
	BIT.b #$04
	BNE.b CODE_809B7A
	LDA.b $2C
	BNE.b CODE_809BF1
	LDA.b $C1,x
	CMP.b #$84
	BCC.b CODE_809BF1
	LDA.b $E6,x
	CMP.b #$08
	BCC.b CODE_809BF1
	LDA.b #$0D
	RTS

CODE_809BF1:
	LDA.b #$0F
	RTS

CODE_809BF4:
	PLX
	LDA.b $E2,x
	BIT.b #$04
	BEQ.b CODE_809BC7
CODE_809BFB:
	LDA.b $EB,x
	BEQ.b CODE_809BD8
	LDY.b $B0,x
	LDA.w DATA_809C1D,y
	BPL.b CODE_809BBE
	LDA.w !RAM_SMK_Global_RacetrackType
	LSR
	TAY
	LDA.w DATA_809C15,y
	RTS

CODE_809C0F:
	PLX
	BRA.b CODE_809BFB

CODE_809C12:
	LDA.b #$00
	RTS

DATA_809C15:
	db $0C,$01,$01,$01,$01,$01,$02,$01

DATA_809C1D:
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $0006,$FFFF,$0004,$0004,$0007,$0005,$0008,$0008

;--------------------------------------------------------------------

CODE_809C3D:
	LDA.w $0E54
	BNE.b CODE_809C5B
	LDA.w $1D0C
	BNE.b CODE_809C89
	LDA.w #$FFFF
	STA.w $0E56
	JSL.l CODE_81E280
	STZ.w $0E56
	LDA.w #$1000
	STA.w $0E54
	RTS

CODE_809C5B:
	DEC.w $0E54
	BNE.b CODE_809C86
	LDA.w $0E52
	INC
	INC
	CMP.w #$0010
	BCC.b CODE_809C74
	LDA.w #$1200
	STA.w $0E54
	JML.l CODE_8085E6

CODE_809C74:
	STA.w $0E52
	JSL.l CODE_809CAA
	JSL.l CODE_81E654
	LDA.w #$8000
	STA.w $1D0C
	RTS

CODE_809C86:
	JSR.w CODE_80A269
CODE_809C89:
	RTS

;--------------------------------------------------------------------

DATA_809C8A:
	dw $0002,$0003,$0003,$0002,$0002,$0003,$0003,$0003

DATA_809C9A:
	dw $0004,$0000,$0002,$0003,$0001,$0001,$0003,$0004

CODE_809CAA:
	PHB
	PHK
	PLB
	LDX.w $0E52
	TXA
	AND.w #$0002
	INC
	INC
	STA.b $2E
	STZ.b $2C
	STZ.w $0030
	LDA.w DATA_809C8A,x
	STA.w !RAM_SMK_Global_RaceCup
	LDA.w DATA_809C9A,x
	STA.w !RAM_SMK_Global_CurrentRound
	PLB
	RTL

;--------------------------------------------------------------------

CODE_809CCB:
	LDA.b $C0,x
	STA.b $08
	SED
	PHX
	LDX.w $010C,y
	LDA.w $1F26
	AND.w #$9900
	BCC.b CODE_809CDF
	LDA.w #$0000
CODE_809CDF:
	CLC
	ADC.b $F2,x
	STA.b $00
	LDA.b $F4,x
	STA.b $02
	LDA.b $F6,x
	STA.b $04
	CLD
	LDA.b $C0,x
	SEP.b #$20
	XBA
	CMP.b $09
	BEQ.b CODE_809D01
	STA.b $09
	XBA
	REP.b #$20
	CLC
	ADC.w $0148
	BRA.b CODE_809D02

CODE_809D01:
	XBA
CODE_809D02:
	REP.b #$20
	SEC
	PLX
	SBC.b $C0,x
	LSR
	LSR
	LSR
	LSR
	INC
	STA.b $06
CODE_809D0F:
	RTS

;--------------------------------------------------------------------

CODE_809D10:
	LDY.w #$0002
CODE_809D13:
	LDX.w $010E,y
	BEQ.b CODE_809D0F
	LDA.b $F6,x
	BPL.b CODE_809D4C
	LDA.b $10,x
	BEQ.b CODE_809D4C
	BMI.b CODE_809D4C
	JSR.w CODE_809CCB
CODE_809D25:
	SED
	LDA.b $02
	CLC
	ADC.w #$0001
	STA.b $02
	CMP.w #$0060
	BNE.b CODE_809D37
	STZ.b $02
	INC.b $04
CODE_809D37:
	DEC.b $06
	BNE.b CODE_809D25
	LDA.b $02
	STA.b $F4,x
	LDA.b $04
	STA.b $F6,x
	LDA.w DATA_809D51,y
	CLC
	ADC.b $00
	STA.b $F2,x
	CLD
CODE_809D4C:
	INY
	INY
	BRA.b CODE_809D13

CODE_809D50:
	RTS

DATA_809D51:
	dw $0123,$1234,$2345,$3456,$4567,$5678,$6789,$7890

;--------------------------------------------------------------------

CODE_809D61:
	LDY.w $0E8E
	BEQ.b CODE_809D50
	JSR.w CODE_80A007
	CPY.w #$0004
	BNE.b CODE_809DE2
	LDX.w $0E90
	LDY.w $0E92
	LDA.w $001C,y
	CMP.b $1C,x
	BEQ.b CODE_809D87
	BCC.b CODE_809D9E
	BRA.b CODE_809DA7

CODE_809D7F:
	LDA.w $00E6,x
	CMP.w $00E6,y
	BCS.b CODE_809DE2
CODE_809D87:
	LDA.w $00EA,y
	CMP.b $EA,x
	BEQ.b CODE_809D9A
	BCS.b CODE_809DA7
	BRA.b CODE_809D9E

CODE_809D92:
	LDA.w $00E6,x
	CMP.w $00E6,y
	BCS.b CODE_809DE2
CODE_809D9A:
	LDA.b $10,x
	BMI.b CODE_809DA7
CODE_809D9E:
	STX.w $0E92
	STY.w $0E90
	PHY
	TXY
	PLX
CODE_809DA7:
	SED
	LDA.b $F2,x
	SEC
	SBC.w #$0100
	STA.b $F2,x
	BCS.b CODE_809DC3
	LDA.b $F2,x
	SEC
	SBC.w #$0001
	STA.b $F4,x
	BCS.b CODE_809DC3
	LDA.w #$0059
	STA.b $F4,x
	DEC.b $F6,x
CODE_809DC3:
	CLD
	LDA.b $E6,x
	CMP.w $00E6,y
	BCC.b CODE_809DE2
	PHA
	LDA.w $00E6,y
	STA.b $E6,x
	PLA
	STA.w $00E6,y
	TAX
	LDA.w $0E92
	STA.w $010E,x
	LDA.w $0E90
	STA.w $010C,x
CODE_809DE2:
	LDY.w #$0000
CODE_809DE5:
	LDX.w $0E90,y
	LDA.b $10,x
	AND.w #$FFC7
	ORA.w #$2038
	STA.b $10,x
	PHY
	BIT.w #$8000
	BPL.b CODE_809DFC
	JSL.l CODE_84D50D
CODE_809DFC:
	JSR.w CODE_808D2B
	PLY
	INY
	INY
	CPY.w $0E8E
	BCC.b CODE_809DE5
	STZ.w $0E8E
	RTS

;--------------------------------------------------------------------

DATA_809E0B:
	dw $0000,$0000,$0000,$0000,$0000,$FFFF,$FFFF,$FFFF
	dw $FFFF,$0000,$0000,$0000,$0000,$FFFF,$0000

CODE_809E29:
	LDA.b $38
	AND.w #$00F8
	CMP.w #$00F8
	BEQ.b CODE_809E6B
	LDA.b $A0,x
	BNE.b CODE_809E6B
	LDY.w $00A6,x
	LDA.w DATA_809E0B,y
	BNE.b CODE_809E6B
	JSR.w CODE_80B0B1
	SEC
	SBC.b $2A,x
	BPL.b CODE_809E4B
	EOR.w #$FFFF
	INC
CODE_809E4B:
	STA.b $0C
	LDA.b $2C
	CMP.w #$0006
	BCS.b CODE_809E6A
	LDA.b $10,x
	BIT.w #$0400
	BNE.b CODE_809E63
	LDA.b $0C
	CMP.w #$7000
	BCS.b CODE_809E95
	RTS

CODE_809E63:
	LDA.b $0C
	CMP.w #$3000
	BCC.b CODE_809EA3
CODE_809E6A:
	RTS

CODE_809E6B:
	LDA.w $00D2
	BNE.b CODE_809E6A
	LDY.w $0E6A
	CPY.w #$0004
	BCS.b CODE_809E6A
	LDA.b $84,x
	BNE.b CODE_809E6A
	INC.w $0E6A
	INC.w $0E6A
	CPX.w #$1100
	BEQ.b CODE_809E8E
	LDA.w #$007E
	STA.w $0E6C,y
	RTS

CODE_809E8E:
	LDA.w #$007F
	STA.w $0E6C,y
	RTS

CODE_809E95:
	LDA.b $10,x
	ORA.w #$0400
	STA.b $10,x
	LDA.b $D4,x
	ORA.w #$1000
	BRA.b CODE_809EAF

CODE_809EA3:
	LDA.b $10,x
	AND.w #$FBFF
	STA.b $10,x
	LDA.b $D4,x
	ORA.w #$0800
CODE_809EAF:
	STA.b $D4,x
	RTS

;--------------------------------------------------------------------

CODE_809EB2:
	LDA.w $0E68
	BEQ.b CODE_809EC7
	LDA.b $32
	BNE.b CODE_809EC7
	LDX.w #$0000
	JSR.w CODE_809FAC
	LDX.w #$0002
	JSR.w CODE_809FAC
CODE_809EC7:
	RTS

CODE_809EC8:
	LDX.b $2E
	JMP.w (DATA_809ECD,x)

DATA_809ECD:
	dw CODE_809ED3
	dw CODE_809EE2
	dw CODE_809EF1

CODE_809ED3:
	LDX.w #$0002
	JSL.l CODE_809F64
	LDX.w #$0000
	JSL.l CODE_809F64
	RTS

CODE_809EE2:
	LDX.w #$0000
	JSL.l CODE_809F64
	LDY.w #$0000
	LDX.w #$0002
	BRA.b CODE_809EFE

CODE_809EF1:
	LDX.w #$0002
	JSL.l CODE_809F64
	LDY.w #$0002
	LDX.w #$0000
CODE_809EFE:
	LDA.w $0E32
	BNE.b CODE_809F5F
	LDA.w $1F24
	BMI.b CODE_809F5F
	LDA.w $0144
	BEQ.b CODE_809F1A
	LDA.w $0172
	BNE.b CODE_809F5C
	LDA.b $A4,x
	CMP.w #$0002
	BEQ.b CODE_809F4D
	RTS

CODE_809F1A:
	LDA.w $0172
	BNE.b CODE_809F5C
	LDA.w $0162
	BMI.b CODE_809F5F
	LDA.w $00AC,y
	BIT.w #$0040
	BNE.b CODE_809F5F
	BIT.w #$0020
	BEQ.b CODE_809F39
	AND.w #$FFDF
	STA.w $00AC,y
	BRA.b CODE_809F41

CODE_809F39:
	LDA.w $0028,y
	BIT.w #$2040
	BEQ.b CODE_809F5F
CODE_809F41:
	LDA.b $A4,x
	CMP.w #$0002
	BEQ.b CODE_809F4D
	LDA.w #$0002
	BRA.b CODE_809F50

CODE_809F4D:
	LDA.w #$0006
CODE_809F50:
	STA.w $0174
	LDY.b $2E
	LDA.w DATA_809F60-$02,y
	STA.w $0172
	RTS

CODE_809F5C:
	DEC.w $0172
CODE_809F5F:
	RTS

DATA_809F60:
	dw $0005,$0006

;--------------------------------------------------------------------

CODE_809F64:
	LDA.w $0E5E
	BEQ.b CODE_809F6D
	DEC.w $0E5E
	RTL

CODE_809F6D:
	LDA.w $0142
	BPL.b CODE_809FA5
	LDA.w $0128
	BNE.b CODE_809FA5
	LDA.w $0162
	BMI.b CODE_809FA5
	LDA.b $AB,x
	BMI.b CODE_809FA5
	LDA.b $28,x
	BIT.w #$1000
	BEQ.b CODE_809FA5
	LDA.w $0172
	BNE.b CODE_809FA5
	STX.w $0164
	LDY.w $00A8,x
	LDA.w $0010,y
	BIT.w #$2000
	BNE.b CODE_809FA5
	LDA.w #$C000
	STA.w $0162
	LDA.w #$0080
	TSB.b $40
CODE_809FA5:
	RTL

;--------------------------------------------------------------------

CODE_809FA6:
	LDA.w #$0080
	TRB.b $40
	RTL

;--------------------------------------------------------------------

CODE_809FAC:
	LDA.b $20,x
	AND.w #$D000
	CMP.w #$D000
	BCC.b CODE_809FDA
	LDA.b $28,x
	BIT.w #$2000
	BEQ.b CODE_809FDA
	JSL.l CODE_81F4B2
	LDA.w #$4000
	STA.w $0140
	JSR.w CODE_8085FD
	LDA.b $36
	CMP.w #$0010
	BEQ.b CODE_809FD6
	CMP.w #$0012
	BNE.b CODE_809FDA
CODE_809FD6:
	JSL.l CODE_81E576
CODE_809FDA:
	RTS

;--------------------------------------------------------------------

CODE_809FDB:
	PHB
	PHK
	PLB
	LDA.w #$FEB0
	STA.w $0146
	LDA.w #$8000
	LDX.b $2E
	JMP.w (DATA_809FEC,x)

DATA_809FEC:
	dw CODE_809FF2
	dw CODE_809FFA
	dw CODE_809FF5

CODE_809FF2:
	STA.w $10D4
CODE_809FF5:
	STA.w $11D4
	PLB
	RTL

CODE_809FFA:
	STA.w $10D4
	PLB
	RTL

;--------------------------------------------------------------------

CODE_809FFF:
	PHB
	PHK
	PLB
	JSR.w CODE_80A007
	PLB
	RTL

CODE_80A007:
	PHX
	PHY
	LDY.w #$0002
CODE_80A00C:
	PHY
	JSR.w CODE_80A027
	PLY
	INY
	INY
	CPY.w #$0010
	BCC.b CODE_80A00C
	PLY
	PLX
	RTS

;--------------------------------------------------------------------

CODE_80A01B:
	JSR.w CODE_808C8D
	RTS

;--------------------------------------------------------------------

CODE_80A01F:
	PHX
	LDY.b $E6,x
	JSR.w CODE_80A027
	PLX
	RTS

CODE_80A027:
	CPY.w #$0000
	BEQ.b CODE_80A05B
	LDX.w $010E,y
	BEQ.b CODE_80A05B
	LDA.b $C0,x
	PHX
	LDX.w $010C,y
	BEQ.b CODE_80A05A
	CMP.b $C0,x
	BEQ.b CODE_80A05A
	BCC.b CODE_80A05A
	LDA.b $10,x
	BIT.w #$0020
	BNE.b CODE_80A05A
	TXA
	STA.w $010E,y
	TYA
	STA.b $E6,x
	PLX
	TXA
	STA.w $010C,y
	TYA
	DEC
	DEC
	STA.b $E6,x
	TAY
	BRA.b CODE_80A027

CODE_80A05A:
	PLX
CODE_80A05B:
	RTS

;--------------------------------------------------------------------

DATA_80A05C:
	dw $0202,$020A,$0212,$021A,$0422,$042A,$0432,$043A

;--------------------------------------------------------------------

CODE_80A06C:
	SED
	LDA.w $0100
	CLC
	ADC.w #$0166
	STA.w $0100
	BCS.b CODE_80A07B
	CLD
	RTS

CODE_80A07B:
	LDA.w $0102
	CLC
	ADC.w #$0001
	CMP.w #$0060
	BEQ.b CODE_80A08C
	STA.w $0102
	CLD
	RTS

CODE_80A08C:
	STZ.w $0102
	LDA.w $0104
	CLC
	ADC.w #$0001
	CMP.w #$0010
	BCC.b CODE_80A0AA
	LDA.w #$9999
	STA.w $0100
	LDA.w #$0059
	STA.w $0102
	LDA.w #$0009
CODE_80A0AA:
	STA.w $0104
	CLD
	RTS

;--------------------------------------------------------------------

CODE_80A0AF:
	AND.w #$EFFF
	STA.b $10,x
	PHY
	PHX
	LDA.b $24,x
	TAY
	LDA.b $22,x
	TAX
	JSL.l CODE_81F638
	PLX
	PLY
	BCC.b CODE_80A0C6
	STA.b $A2,x
CODE_80A0C6:
	RTS

;--------------------------------------------------------------------

CODE_80A0C7:
	AND.w #$EFFF
	STA.b $10,x
	PHY
	PHX
	LDA.b $24,x
	TAY
	LDA.b $22,x
	TAX
	JSL.l CODE_81F638
	PLX
	PLY
	BCC.b CODE_80A0E4
	LDA.b $A4,x
	STA.b $A2,x
	STZ.b $A8,x
	BRA.b CODE_80A10F

CODE_80A0E4:
	STA.b $0C
	SEC
	SBC.b $A4,x
	BMI.b CODE_80A101
	CMP.w #$2000
	BCS.b CODE_80A106
CODE_80A0F0:
	STA.b $A8,x
	LDA.b $C4,x
	BPL.b CODE_80A106
	LDA.b $0C
	STA.b $A2,x
	LDA.w #$001C
	STA.b $A6,x
	BRA.b CODE_80A10F

CODE_80A101:
	CMP.w #$E000
	BCS.b CODE_80A0F0
CODE_80A106:
	STA.b $A8,x
	LDA.w #$0016
	STA.b $AC,x
	STA.b $A6,x
CODE_80A10F:
	LDA.b $C2,x
	LSR
	CMP.w #$0100
	BCS.b CODE_80A11A
	LDA.w #$0100
CODE_80A11A:
	STA.b $C2,x
	JSR.w CODE_80A511
	RTS

;--------------------------------------------------------------------

CODE_80A120:
	LDX.b $3A
	JMP.w (DATA_80A125,x)

DATA_80A125:
	dw CODE_80A13B
	dw CODE_80A147
	dw CODE_80A1F5
	dw CODE_80A25D
	dw CODE_80A131
	dw CODE_80A14D

CODE_80A131:
	JSR.w CODE_80A147
	LDA.w #$FFFF
	STA.w $0146
	RTS

CODE_80A13B:
	LDA.w #$000A
	STA.b $3A
	LDA.w #$0001
	JSR.w CODE_809851
	RTS

CODE_80A147:
	JSR.w CODE_80A1EB
	BRA.b CODE_80A1C1

CODE_80A14C:
	RTS

CODE_80A14D:
	LDX.b $2E
	JMP.w (DATA_80A152,x)

DATA_80A152:
	dw CODE_80A158
	dw CODE_80A171
	dw CODE_80A166

CODE_80A158:
	JSR.w CODE_80A244
	LDY.w #$0000
	LDX.w #$1000
	JSR.w CODE_80A17A
	BRA.b CODE_80A169

CODE_80A166:
	JSR.w CODE_80A244
CODE_80A169:
	LDY.w #$0002
	LDX.w #$1100
	BRA.b CODE_80A17A

CODE_80A171:
	JSR.w CODE_80A244
	LDY.w #$0000
	LDX.w #$1000
CODE_80A17A:
	LDA.b $1C,x
	ASL
	ASL
	CMP.w $008C,y
	BEQ.b CODE_80A1AE
	SEC
	SBC.w $008C,y
	BEQ.b CODE_80A1A5
	BMI.b CODE_80A1A5
	CMP.w #$0800
	BCC.b CODE_80A196
	LDA.w #$2100
	STA.w $0146
CODE_80A196:
	LDA.w $0146
	XBA
	AND.w #$00FF
	CLC
	ADC.w $008C,y
	STA.w $008C,y
	RTS

CODE_80A1A5:
	LDA.b $1C,x
	ASL
	ASL
	STA.w $008C,y
	BRA.b CODE_80A1EB

CODE_80A1AE:
	LDA.b $1C,x
	ASL
	ASL
	STA.w $008C,y
	LDA.w DATA_80A259,y
	CLC
	ADC.w $0094,y
	STA.w $0094,y
	BNE.b CODE_80A1F4
CODE_80A1C1:
	JSL.l CODE_809FDB
	LDA.w #$00D0
	STA.w $0142
	STZ.b $38
	STZ.b $34
	JSL.l CODE_84E677
	LDA.w #$0004
	STA.b $3A
	JSR.w CODE_80A22E
	LDX.b $2C
	LDA.w DATA_80A1E3,x
	JMP.w CODE_809851

DATA_80A1E3:
	dw $0003,$0002,$0002,$0002

CODE_80A1EB:
	LDA.w #$0040
	TRB.w $1010
	TRB.w $1110
CODE_80A1F4:
	RTS

CODE_80A1F5:
	JSR.w CODE_8094BB
	INC.w $0146
	BNE.b CODE_80A243
	LDA.w #$0006
	STA.b $3A
	LDA.w #$00C0
	LDX.b $2E
	JMP.w (DATA_80A20A,x)

DATA_80A20A:
	dw CODE_80A210
	dw CODE_80A216
	dw CODE_80A212

CODE_80A210:
	TRB.b $AC
CODE_80A212:
	TRB.b $AE
	BRA.b CODE_80A218

CODE_80A216:
	TRB.b $AC
CODE_80A218:
	LDX.w #$1000
	JSR.w CODE_80A221
	LDX.w #$1100
CODE_80A221:
	LDA.b $E2,x
	BIT.w #$0001
	BEQ.b CODE_80A22D
	LDA.w #$3000
	STA.b $C2,x
CODE_80A22D:
	RTS

CODE_80A22E:
	LDA.w #$C000
	LDX.b $2E
	JMP.w (DATA_80A236,x)

DATA_80A236:
	dw CODE_80A23C
	dw CODE_80A241
	dw CODE_80A23E

CODE_80A23C:
	TSB.b $AC
CODE_80A23E:
	TSB.b $AE
	RTS

CODE_80A241:
	TSB.b $AC
CODE_80A243:
	RTS

CODE_80A244:
	LDA.w $0146
	BMI.b CODE_80A258
	SEC
	SBC.w #$0040
	CMP.w #$0300
	BCS.b CODE_80A255
	LDA.w #$0300
CODE_80A255:
	STA.w $0146
CODE_80A258:
	RTS

DATA_80A259:
	dw $0400,$FC00

CODE_80A25D:
	JSR.w CODE_8094A9
	JSR.w CODE_80A06C
	JSR.w CODE_80A273
	JSR.w CODE_80A01B
CODE_80A269:
	JSR.w CODE_80A285
	JSR.w CODE_80A2A3
	JSR.w CODE_80A294
	RTS

;--------------------------------------------------------------------

CODE_80A273:
	LDA.w $0E32
	BEQ.b CODE_80A284
	DEC.w $0E38
	BNE.b CODE_80A284
	JSL.l CODE_81F4B2
	JMP.w CODE_8085FD

CODE_80A284:
	RTS

;--------------------------------------------------------------------

CODE_80A285:
	LDA.w $1F05
	BPL.b CODE_80A293
	SEP.b #$20
	LDA.b #!ScreenDisplayRegister_Brightness0A
	STA.w !REGISTER_ScreenDisplayRegister
	REP.b #$20
CODE_80A293:
	RTS

;--------------------------------------------------------------------

CODE_80A294:
	LDA.w $1F05
	BPL.b CODE_80A2A2
	SEP.b #$20
	LDA.b #!ScreenDisplayRegister_MaxBrightness0F
	STA.w !REGISTER_ScreenDisplayRegister
	REP.b #$20
CODE_80A2A2:
	RTS

;--------------------------------------------------------------------

CODE_80A2A3:
	LDX.w #$1700
CODE_80A2A6:
	LDA.b $10,x
	BEQ.b CODE_80A2C4
	BMI.b CODE_80A2B6
	BIT.w #$4000
	BNE.b CODE_80A2C4
	JSR.w CODE_80AD48
	BRA.b CODE_80A2C4

CODE_80A2B6:
	BIT.w #$4000
	BNE.b CODE_80A2BE
	JSR.w CODE_80A4D0
CODE_80A2BE:
	JSR.w CODE_80B1BE
	JSR.w CODE_80A892
CODE_80A2C4:
	TXA
	SEC
	SBC.w #$0100
	TAX
	CMP.w #$1000
	BCS.b CODE_80A2A6
	LDX.w #$1000
	LDY.w #$0000
	LDA.w $1010
	BEQ.b CODE_80A2E3
	JSR.w CODE_80A3B7
	JSR.w CODE_80B0EE
	JSR.w CODE_80B7EB
CODE_80A2E3:
	LDX.w #$1100
	LDY.w #$0002
	LDA.w $1110
	BEQ.b CODE_80A2FC
	JSR.w CODE_80A3B7
	JSR.w CODE_80B0EE
	LDA.w $0E60
	BNE.b CODE_80A2FC
	JSR.w CODE_80B7EB
CODE_80A2FC:
	LDA.w $0E8C
	BEQ.b CODE_80A304
	STZ.w $0E8C
CODE_80A304:
	LDA.b $34
	BIT.w #$0002
	BNE.b CODE_80A31A
	BIT.w #$0001
	BNE.b CODE_80A315
	LDX.w #$1200
	BRA.b CODE_80A33C

CODE_80A315:
	LDX.w #$1600
	BRA.b CODE_80A327

CODE_80A31A:
	BIT.w #$0001
	BNE.b CODE_80A324
	LDX.w #$1300
	BRA.b CODE_80A33C

CODE_80A324:
	LDX.w #$1700
CODE_80A327:
	LDA.w $0E8C
	BNE.b CODE_80A370
	JSR.w CODE_80AD5E
	TXA
	SEC
	SBC.w #$0200
	CMP.w #$1300
	BCC.b CODE_80A351
	TAX
	BRA.b CODE_80A327

CODE_80A33C:
	LDA.w $0E8C
	BNE.b CODE_80A370
	JSR.w CODE_80AD5E
	TXA
	CLC
	ADC.w #$0200
	CMP.w #$1800
	BCS.b CODE_80A351
	TAX
	BRA.b CODE_80A33C

CODE_80A351:
	LDA.w $0E8C
	BNE.b CODE_80A370
	LDA.b $38
	AND.w #$0007
	ORA.w #$0010
	XBA
	TAX
	LDA.b $10,x
	BEQ.b CODE_80A370
	BPL.b CODE_80A36D
	JSR.w CODE_809E29
	JSR.w CODE_80B112
	RTS

CODE_80A36D:
	JSR.w CODE_80AD8E
CODE_80A370:
	RTS

;--------------------------------------------------------------------

CODE_80A371:
	JSR.w CODE_80AD5E
	RTS

;--------------------------------------------------------------------

CODE_80A375:
	JSR.w CODE_80B0B1
	AND.w #$FF00
	PHA
	STA.b $FA,x
	JSR.w CODE_80AFC0
	PLA
	SEC
	SBC.b $A4,x
	BMI.b CODE_80A391
	CMP.w #$0100
	BCC.b CODE_80A396
	LDA.w #$0100
	BRA.b CODE_80A39E

CODE_80A391:
	CMP.w #$FF00
	BCC.b CODE_80A39B
CODE_80A396:
	LDA.w #$0000
	BRA.b CODE_80A39E

CODE_80A39B:
	LDA.w #$0200
CODE_80A39E:
	STA.b $C4,x
	LDA.b $EA,x
	CMP.w #$0200
	BCS.b CODE_80A3AC
	LDA.w #$8000
	BRA.b CODE_80A3AF

CODE_80A3AC:
	LDA.w #$4000
CODE_80A3AF:
	ORA.b $C4,x
	STA.b $C4,x
CODE_80A3B3:
	RTS

;--------------------------------------------------------------------

CODE_80A3B4:
	LDA.b $C4,x
CODE_80A3B6:
	RTS

CODE_80A3B7:
	LDA.b $10,x
	BEQ.b CODE_80A3B3
	BPL.b CODE_80A371
	BIT.w #$4000
	BNE.b CODE_80A3B6
	BIT.w #$0020
	BEQ.b CODE_80A3CC
	JSR.w CODE_80A375
	BRA.b CODE_80A428

CODE_80A3CC:
	LDA.w $0E00,y
	AND.w #$00FF
	CMP.w #$000A
	BCC.b CODE_80A3DA
	LDA.w #$000A
CODE_80A3DA:
	ASL
	ASL
	ASL
	CLC
	ADC.b $B4,x
	STA.b $D6,x
	LDA.w $0029,y
	AND.w #$0003
	STA.b $08
	LDA.w $0028,y
	LSR
	LSR
	AND.w #$000C
	ORA.w $0020,y
	ORA.b $08
	STA.b $C4,x
	BIT.w #$4000
	BNE.b CODE_80A43C
	BIT.w #$0030
	BNE.b CODE_80A43C
	LDA.b $E2,x
	BIT.w #$0002
	BNE.b CODE_80A432
	LDY.b $B0,x
	LDA.w #$0040
	STA.b $DE,x
	LDA.w DATA_80A4A0,y
	STA.b $08
	BEQ.b CODE_80A444
	LDY.w $0012,x
	LDA.w DATA_80A4C0,y
	CLC
	ADC.b $08
	BPL.b CODE_80A444
	LDA.w #$0000
	BRA.b CODE_80A444

CODE_80A428:
	LDA.w #$0050
	STA.b $DE,x
	LDA.w #$0000
	BRA.b CODE_80A437

CODE_80A432:
	LDA.w #$0040
	STA.b $DE,x
CODE_80A437:
	LDA.w #$0000
	BRA.b CODE_80A444

CODE_80A43C:
	LDA.w #$0050
	STA.b $DE,x
	LDA.w #$0070
CODE_80A444:
	STA.b $28,x
	LDA.w #$0710
	CPX.w #$1000
	BEQ.b CODE_80A451
	LDA.w #$0768
CODE_80A451:
	STA.b $10
	JSR.w CODE_80A460
	JSR.w CODE_80AA18
	JSR.w CODE_80A80F
	JSR.w CODE_80A553
	RTS

CODE_80A460:
	LDA.b $60,x
	BPL.b CODE_80A49F
	LDA.b $86,x
	BNE.b CODE_80A48D
	LDA.b $10,x
	BIT.w #$0020
	BNE.b CODE_80A48D
	LDA.b $C4,x
	BIT.w #$0003
	BEQ.b CODE_80A478
	INC.b $FE,x
CODE_80A478:
	LDA.b $FE,x
	AND.w #$000F
	CMP.w #$0005
	BCS.b CODE_80A48D
	LDA.b $DA,x
	CMP.w #$003C
	BCS.b CODE_80A49B
	INC
	STA.b $DA,x
	RTS

CODE_80A48D:
	LDA.b $60,x
CODE_80A48F:
	AND.w #$7FFF
	STA.b $60,x
	LDA.w #$0065
	JSL.l CODE_81F57A
CODE_80A49B:
	STZ.b $DA,x
	STZ.b $FE,x
CODE_80A49F:
	RTS

DATA_80A4A0:
	dw $0020,$0020,$0020,$0030,$0020,$0040,$0040,$0050
	dw $0020,$0060,$0030,$0030,$0000,$0040,$0000,$0060

DATA_80A4C0:
	dw $0000,$0000,$0000,$0000,$0000,$FFF0,$FFF0,$0000

;--------------------------------------------------------------------

CODE_80A4D0:
	SEP.b #$20
	LDA.b #!DSP1_Command04_TrigonometricCalculation
	STA.l !REGISTER_DSP1_DataRegister
	REP.b #$20
	LDA.b $A2,x
	STA.l !REGISTER_DSP1_DataRegister
	LDA.b $E8,x
	CLC
	ADC.b $EC,x
	STA.b $E8,x
	LDA.b $EA,x
	ADC.b $EE,x
	STA.b $EA,x
	BPL.b CODE_80A4F6
	LDA.w #$0000
	STA.b $E8,x
	STA.b $EA,x
CODE_80A4F6:
	STA.l !REGISTER_DSP1_DataRegister
CODE_80A4FA:
	LDA.l !REGISTER_DSP1_StatusRegister
	BPL.b CODE_80A4FA
	LDA.l !REGISTER_DSP1_DataRegister
	STA.b $22,x
	LDA.l !REGISTER_DSP1_DataRegister
	EOR.w #$FFFF
	INC
	STA.b $24,x
	RTS

;--------------------------------------------------------------------

CODE_80A511:
	SEP.b #$20
	LDA.b #!DSP1_Command28_VectorAbsoluteValueCalculation
	STA.l !REGISTER_DSP1_DataRegister
	REP.b #$20
	LDA.b $22,x
	STA.l !REGISTER_DSP1_DataRegister
	LDA.b $24,x
	STA.l !REGISTER_DSP1_DataRegister
	LDA.w #$0000
	STA.l !REGISTER_DSP1_DataRegister
CODE_80A52E:
	LDA.l !REGISTER_DSP1_StatusRegister
	BPL.b CODE_80A52E
	LDA.l !REGISTER_DSP1_DataRegister
	STA.b $EA,x
	RTS

;--------------------------------------------------------------------

DATA_80A53B:
	dw CODE_80A69D
	dw CODE_80A647
	dw CODE_80A5A8
	dw CODE_80A5A8
	dw CODE_80A5AD
	dw CODE_80A5A8
	dw CODE_80A5A8
	dw CODE_80A5A8
	dw CODE_80A5E3
	dw CODE_80A606
	dw CODE_80A5A1
	dw CODE_80A55A

CODE_80A553:
	PHX
	LDA.b $AC,x
	TAX
	JMP.w (DATA_80A53B,x)

CODE_80A55A:
	PLX
	LDA.b $A6,x
	CMP.w #$0016
	BNE.b CODE_80A58D
	LDA.b $A8,x
	BEQ.b CODE_80A588
	LDA.w #$FFFF
	STA.b $EE,x
	LDA.b $A8,x
	BPL.b CODE_80A573
	EOR.w #$FFFF
	INC
CODE_80A573:
	CMP.w #$4000
	BCC.b CODE_80A57B
	LDA.w #$3F00
CODE_80A57B:
	XBA
	LSR
	LSR
	AND.w #$001E
	TAY
	LDA.w DATA_80A590,y
	STA.b $EE,x
	RTS

CODE_80A588:
	LDA.w #$001C
	STA.b $A6,x
CODE_80A58D:
	STZ.b $AC,x
	RTS

DATA_80A590:
	dw $FFFC,$FFF8,$FFF0,$FFE8,$FFDC,$FFC8,$FFC0,$FFAB

CODE_80A5A0:
	RTS

CODE_80A5A1:
	PLX
	LDA.w #$FFC8
	STA.b $EE,x
	RTS

CODE_80A5A8:
	PLX
	JSR.w CODE_80B768
	RTS

CODE_80A5AD:
	PLX
	LDA.b $C4,x
	BPL.b CODE_80A5BF
	LDA.b $EA,x
	CMP.w #$007C
	BCS.b CODE_80A5BF
	LDA.w #$0001
	STA.b $EE,x
	RTS

CODE_80A5BF:
	LDA.w #$FFFF
	STA.b $EE,x
	RTS

CODE_80A5C5:
	PLX
	DEC.b $FC,x
	BEQ.b CODE_80A5D8
	LDA.b $D6,x
	CLC
	ADC.w #$00C0
	CMP.b $EA,x
	BCS.b CODE_80A5DE
	STA.b $EA,x
	BRA.b CODE_80A5F1

CODE_80A5D8:
	LDA.w #$001C
	STA.b $A6,x
	RTS

CODE_80A5DE:
	LDA.w #$0002
	BRA.b CODE_80A5F9

CODE_80A5E3:
	PLX
CODE_80A5E4:
	DEC.b $FC,x
	BEQ.b CODE_80A5FC
	LDA.w #$07E0
	CMP.b $EA,x
	BCS.b CODE_80A5F6
	STA.b $EA,x
CODE_80A5F1:
	LDA.w #$0000
	BRA.b CODE_80A5F9

CODE_80A5F6:
	LDA.w #$0032
CODE_80A5F9:
	STA.b $EE,x
	RTS

CODE_80A5FC:
	LDA.b $E2,x
	AND.w #$FF3F
	STA.b $E2,x
	STZ.b $AC,x
	RTS

CODE_80A606:
	PLX
CODE_80A607:
	LDA.b $C4,x
	BIT.w #$4000
	BNE.b CODE_80A62B
	BPL.b CODE_80A626
	LDA.b $EA,x
	CMP.w #$0520
	BCS.b CODE_80A62B
	CMP.w #$0300
	BCC.b CODE_80A621
	LDA.w #$0002
	BRA.b CODE_80A62E

CODE_80A621:
	LDA.w #$0020
	BRA.b CODE_80A62E

CODE_80A626:
	LDA.w #$FFF8
	BRA.b CODE_80A62E

CODE_80A62B:
	LDA.w #$FFE0
CODE_80A62E:
	STA.b $EE,x
	RTS

CODE_80A631:
	LDA.b $A0,x
	STA.b $AC,x
	JSR.w CODE_809896
	LDA.b $E2,x
	AND.w #$FFFC
	STA.b $E2,x
	RTL

CODE_80A640:
	LDA.w #$0012
	STA.b $AC,x
	BRA.b CODE_80A607

CODE_80A647:
	PLX
	LDA.w #$0000
	STA.b $EE,x
	RTS

CODE_80A64E:
	RTS

CODE_80A64F:
	PLX
CODE_80A650:
	LDA.w #$FFF0
	STA.b $EE,x
	RTS

CODE_80A656:
	PLX
	LDA.w #$FFF8
	STA.b $EE,x
	RTS

DATA_80A65D:
	dw $FFFC,$FFF6,$FFF0,$FFE8,$FFD0,$FF90,$FF60,$FF40

DATA_80A66D:
	dw $FFFC,$FFF9,$FFF7,$FFF4,$FFE4,$FFB8,$FF92,$FF60

DATA_80A67D:
	dw $FFFC,$FFFA,$FFF8,$FFF6,$FFF0,$FFD8,$FFB0,$FF88

DATA_80A68D:
	dw $FFFE,$FFF8,$FFF0,$FFE8,$FFE0,$FFD8,$FFD0,$FFC8

CODE_80A69D:
	PLX
	LDA.b $E2,x
	BIT.w #$0002
	BNE.b CODE_80A640
	LDA.b $10,x
	BIT.w #$0080
	BNE.b CODE_80A650
	BIT.w #$8000
	BEQ.b CODE_80A6D2
	LDA.b $C4,x
	BIT.w #$0030
	BEQ.b CODE_80A6D0
	BIT.w #$0300
	BEQ.b CODE_80A6D0
	LDA.b $CA,x
	INC
	STA.b $CA,x
	CMP.w #$0080
	BCC.b CODE_80A6CE
	LDA.b $E2,x
	ORA.w #$0040
	STA.b $E2,x
CODE_80A6CE:
	BRA.b CODE_80A6D2

CODE_80A6D0:
	STZ.b $CA,x
CODE_80A6D2:
	LDA.b $A6,x
	PHX
	TAX
	JMP.w (DATA_80A6D9,x)

DATA_80A6D9:
	dw CODE_80A6F7
	dw CODE_80A6F7
	dw CODE_80A6F7
	dw CODE_80A6F7
	dw CODE_80A6F7
	dw CODE_80A656
	dw CODE_80A656
	dw CODE_80A64F
	dw CODE_80A64F
	dw CODE_80A5C5
	dw CODE_80A5C5
	dw CODE_80A55A
	dw CODE_80A647
	dw CODE_80A64F
	dw CODE_80A752

CODE_80A6F7:
	PLX
	LDA.b $C4,x
	BIT.w #$4000
	BNE.b CODE_80A72F
	BPL.b CODE_80A741
	LDA.b $B0,x
	CLC
	ADC.b $10
	TAY
	LDA.w $0020,y
	BMI.b CODE_80A755
	SEC
	SBC.b $EA,x
	BCS.b CODE_80A755
	JSR.w CODE_80A74A
	LDA.w DATA_80A65D,y
	BRA.b CODE_80A747

CODE_80A719:
	SEC
	SBC.b $D6,x
	CMP.w #$0200
	BCC.b CODE_80A724
	LDA.w #$01FF
CODE_80A724:
	ASL
	ASL
	XBA
	JSR.w CODE_80A74C
	LDA.w DATA_80A68D,y
	BRA.b CODE_80A747

CODE_80A72F:
	BVS.b CODE_80A739
	JSR.w CODE_80A74A
	LDA.w DATA_80A66D,y
	BRA.b CODE_80A747

CODE_80A739:
	JSR.w CODE_80A74A
	LDA.w DATA_80A65D,y
	BRA.b CODE_80A747

CODE_80A741:
	JSR.w CODE_80A74A
	LDA.w DATA_80A67D,y
CODE_80A747:
	STA.b $EE,x
	RTS

;--------------------------------------------------------------------

CODE_80A74A:
	LDA.b $EB,x
CODE_80A74C:
	ASL
	AND.w #$000E
	TAY
	RTS

;--------------------------------------------------------------------

CODE_80A752:
	PLX
	BRA.b CODE_80A77F

CODE_80A755:
	LDA.b $84,x
	BEQ.b CODE_80A76E
	BPL.b CODE_80A767
	LDA.b $D6,x
	SEC
	SBC.w #$0080
	CMP.b $EA,x
	BCC.b CODE_80A719
	BRA.b CODE_80A77F

CODE_80A767:
	LDA.b $EA,x
	CMP.w #$02A0
	BCS.b CODE_80A719
CODE_80A76E:
	LDA.b $60,x
	BPL.b CODE_80A779
	LDA.b $EA,x
	CMP.w #$0200
	BCS.b CODE_80A719
CODE_80A779:
	LDA.b $EA,x
	CMP.b $D6,x
	BCS.b CODE_80A719
CODE_80A77F:
	SEP.b #$20
	LDA.b #!DSP1_Command00_16BitMultiplication
	STA.l !REGISTER_DSP1_DataRegister
	REP.b #$20
	LDA.b $EA,x
	CMP.w #$03FF
	BCC.b CODE_80A795
	LDA.w #$000E
	BRA.b CODE_80A7A7

CODE_80A795:
	SEC
	SBC.w #$0300
	BCS.b CODE_80A7A0
	LDA.w #$0000
	BRA.b CODE_80A7A7

CODE_80A7A0:
	LSR
	LSR
	LSR
	LSR
	AND.w #$000E
CODE_80A7A7:
	TAY
	LDA.w DATA_80A7FF,y
	STA.l !REGISTER_DSP1_DataRegister
	LDA.b $B2,x
	STA.l !REGISTER_DSP1_DataRegister
CODE_80A7B5:
	LDA.l !REGISTER_DSP1_StatusRegister
	BPL.b CODE_80A7B5
	LDA.l !REGISTER_DSP1_DataRegister
	CLC
	ADC.b $B2,x
	STA.b $B2,x
	LDA.b $E2,x
	BIT.w #$0001
	BNE.b CODE_80A7DC
	JSR.w CODE_80A7E1
CODE_80A7CE:
	STZ.b $EE,x
	STA.b $ED,x
	RTS

CODE_80A7D3:
	JSR.w CODE_80A74A
	LDA.w DATA_80A65D,y
	JMP.w CODE_80A747

CODE_80A7DC:
	LDA.w #$00C0
	BRA.b CODE_80A7CE

CODE_80A7E1:
	LDA.b $EA,x
	CMP.w #$0400
	BCC.b CODE_80A7EB
	LDA.w #$03FF
CODE_80A7EB:
	CMP.w #$0300
	BCS.b CODE_80A7F0
CODE_80A7F0:
	ASL
	ASL
	ASL
	AND.w #$FE00
	XBA
	CLC
	ADC.b $10
	TAY
	LDA.w !ContextDependentTable,y
	RTS

DATA_80A7FF:
	dw $0000,$FF80,$FF00,$FE80,$FE00,$FD80,$FD00,$FC80

;--------------------------------------------------------------------

CODE_80A80F:
	LDA.b $0F,x
	BPL.b CODE_80A816
	STZ.b $B2,x
	RTS

CODE_80A816:
	LDA.b $DE,x
	CLC
	ADC.b $10
	TAY
	LDA.b $E2,x
	BIT.w #$0200
	BEQ.b CODE_80A829
	BIT.w #$0400
	BNE.b CODE_80A829
	RTS

CODE_80A829:
	LDA.b $C4,x
	BIT.w #$0200
	BNE.b CODE_80A84F
	BIT.w #$0100
	BNE.b CODE_80A877
	LDA.b $B2,x
	BMI.b CODE_80A844
	SEC
	SBC.w !ContextDependentTable+$06,y
	BCS.b CODE_80A88F
	LDA.w #$0000
	BRA.b CODE_80A88F

CODE_80A844:
	CLC
	ADC.w !ContextDependentTable+$06,y
	BCC.b CODE_80A88F
	LDA.w #$0000
	BRA.b CODE_80A88F

CODE_80A84F:
	LDA.b $B2,x
	BEQ.b CODE_80A86D
	BMI.b CODE_80A85B
	SEC
	SBC.w !ContextDependentTable+$02,y
	BRA.b CODE_80A88F

CODE_80A85B:
	EOR.w #$FFFF
	INC
	CMP.w !ContextDependentTable,y
	BCC.b CODE_80A86D
	LDA.w !ContextDependentTable,y
	EOR.w #$FFFF
	INC
	BRA.b CODE_80A88F

CODE_80A86D:
	CLC
	ADC.w !ContextDependentTable+$04,y
	EOR.w #$FFFF
	INC
	BRA.b CODE_80A88F

CODE_80A877:
	LDA.b $B2,x
	BMI.b CODE_80A88B
	CMP.w !ContextDependentTable,y
	BCC.b CODE_80A885
	LDA.w !ContextDependentTable,y
	BRA.b CODE_80A88F

CODE_80A885:
	CLC
	ADC.w !ContextDependentTable+$04,y
	BRA.b CODE_80A88F

CODE_80A88B:
	CLC
	ADC.w !ContextDependentTable+$02,y
CODE_80A88F:
	STA.b $B2,x
	RTS

;--------------------------------------------------------------------

CODE_80A892:
	LDA.b $EA,x
	CMP.w #$0080
	BCC.b CODE_80A8C5
CODE_80A899:
	LDA.w $00B2,x
	CMP.w #$8000
	ROR
	CMP.w #$8000
	ROR
	CMP.w #$8000
	ROR
CODE_80A8A8:
	CLC
	ADC.b $A4,x
	STA.b $A4,x
	PHA
	LDA.b $10,x
	BIT.w #$2000
	BNE.b CODE_80A8C3
	PLA
	PHA
	CLC
	ADC.b $A8,x
	STA.b $A2,x
	PLA
	SEC
	SBC.b $AA,x
	STA.b $2A,x
	RTS

CODE_80A8C3:
	PLA
	RTS

CODE_80A8C5:
	LDY.b $E2,x
	BMI.b CODE_80A899
	LDY.b $A0,x
	CPY.w #$0008
	BNE.b CODE_80A8D5
	LDY.w #$0010
	BRA.b CODE_80A8DE

CODE_80A8D5:
	STZ.b $B2,x
	LSR
	LSR
	LSR
	AND.w #$FFFE
	TAY
CODE_80A8DE:
	LDA.b $10,x
	BIT.w #$2000
	BNE.b CODE_80A8F1
	LDA.b $C4,x
	BIT.w #$0200
	BNE.b CODE_80A8FB
	BIT.w #$0100
	BNE.b CODE_80A8F6
CODE_80A8F1:
	LDA.w #$0000
	BRA.b CODE_80A8A8

CODE_80A8F6:
	LDA.w DATA_80A9B8,y
	BRA.b CODE_80A8A8

CODE_80A8FB:
	LDA.w DATA_80A9B8,y
	EOR.w #$FFFF
	INC
	BRA.b CODE_80A8A8

CODE_80A904:
	PLX
	LDA.b $E2,x
	ORA.w #$0008
	STA.b $E2,x
	BIT.w #$0002
	BNE.b CODE_80A940
	LDA.b $EA,x
	CMP.w #$0180
	BCS.b CODE_80A91E
	JSR.w CODE_80A91E
	BCC.b CODE_80A940
	RTS

CODE_80A91E:
	LDA.b $AA,x
	SEC
	SBC.w #$0480
	STA.b $AA,x
	RTS

;--------------------------------------------------------------------

CODE_80A927:
	PLX
	LDA.b $E2,x
	ORA.w #$0008
	STA.b $E2,x
	BIT.w #$0002
	BNE.b CODE_80A940
	LDA.b $EA,x
	CMP.w #$0180
	BCS.b CODE_80A946
	JSR.w CODE_80A946
	BCC.b CODE_80A94E
CODE_80A940:
	LDA.w #$001C
	STA.b $A6,x
	RTS

CODE_80A946:
	LDA.b $AA,x
	CLC
	ADC.w #$0480
	STA.b $AA,x
CODE_80A94E:
	RTS

CODE_80A94F:
	PLX
	LDA.b $E2,x
	ORA.w #$0008
	STA.b $E2,x
	BIT.w #$0002
	BNE.b CODE_80A999
	LDA.b $FA,x
	BNE.b CODE_80A96F
	LDA.b $EA,x
	CMP.w #$0100
	BCS.b CODE_80A971
	STZ.b $EA,x
	JSR.w CODE_80A91E
	BCC.b CODE_80A940
	RTS

CODE_80A96F:
	DEC.b $FA,x
CODE_80A971:
	LDA.b $AA,x
	SEC
	SBC.w #$0A00
	STA.b $AA,x
	RTS

CODE_80A97A:
	PLX
	LDA.b $E2,x
	ORA.w #$0008
	STA.b $E2,x
	BIT.w #$0002
	BNE.b CODE_80A999
	LDA.b $FA,x
	BNE.b CODE_80A9AD
	LDA.b $EA,x
	CMP.w #$0100
	BCS.b CODE_80A9AF
	STZ.b $EA,x
	JSR.w CODE_80A9AF
	BCC.b CODE_80A9B7
CODE_80A999:
	LDA.w #$0400
	ORA.b $E2,x
	STA.b $E2,x
	LDA.w #$001C
	STA.b $A6,x
	LDA.w #$002A
	JSL.l CODE_81F57A
	RTS

CODE_80A9AD:
	DEC.b $FA,x
CODE_80A9AF:
	LDA.b $AA,x
	CLC
	ADC.w #$0A00
	STA.b $AA,x
CODE_80A9B7:
	RTS

DATA_80A9B8:
	dw $0000,$0010,$0020,$0030,$0038,$003C,$003E,$0040
	dw $0080

CODE_80A9CA:
	PLX
	LDA.b $C4,x
	BMI.b CODE_80A9D7
	LDA.b $EA,x
	CMP.w #$0010
	BCC.b CODE_80AA0E
	RTS

CODE_80A9D7:
	LDA.b $EA,x
	CMP.w #$00C0
	BCC.b CODE_80AA0E
	LDA.b $AA,x
	BEQ.b CODE_80A9F7
	BMI.b CODE_80A9EC
	SEC
	SBC.w #$0040
	BCS.b CODE_80A9F5
	BRA.b CODE_80A9F2

CODE_80A9EC:
	CLC
	ADC.w #$0040
	BCC.b CODE_80A9F5
CODE_80A9F2:
	LDA.w #$0000
CODE_80A9F5:
	STA.b $AA,x
CODE_80A9F7:
	LDA.b $A8,x
	BEQ.b CODE_80AA10
	BMI.b CODE_80AA05
	SEC
	SBC.w #$0040
	BCC.b CODE_80AA0E
	BRA.b CODE_80AA0B

CODE_80AA05:
	CLC
	ADC.w #$0040
	BCS.b CODE_80AA0E
CODE_80AA0B:
	STA.b $A8,x
	RTS

CODE_80AA0E:
	STZ.b $A8,x
CODE_80AA10:
	LDA.w #$001C
	STA.b $A6,x
	STZ.b $AC,x
	RTS

CODE_80AA18:
	LDA.b $E2,x
	BIT.w #$0001
	BNE.b CODE_80AA24
	AND.w #$FFD3
	STA.b $E2,x
CODE_80AA24:
	LDY.b $28,x
	PHX
	LDA.b $A6,x
	TAX
	JMP.w (DATA_80AA2D,x)

DATA_80AA2D:
	dw CODE_80AA52
	dw CODE_80AAFA
	dw CODE_80AAFA
	dw CODE_80AAFA
	dw CODE_80AAFA
	dw CODE_80A94F
	dw CODE_80A97A
	dw CODE_80A904
	dw CODE_80A927
	dw CODE_80AA4B
	dw CODE_80AA4B
	dw CODE_80A9CA
	dw CODE_80B6D1
	dw CODE_80B709
	dw CODE_80AA8D

CODE_80AA4B:
	PLX
	CPY.w #$0070
	BEQ.b CODE_80AA53
	RTS

CODE_80AA52:
	PLX
CODE_80AA53:
	STZ.b $FA,x
	LDA.w $0030
	CMP.w #$0004
	BNE.b CODE_80AA65
	LDA.b $EA,x
	CLC
	ADC.w #$0120
	BRA.b CODE_80AA6C

CODE_80AA65:
	LDA.b $EA,x
	CMP.w #$0100
	BCC.b CODE_80AA89
CODE_80AA6C:
	SEC
	SBC.b $B4,x
	BCS.b CODE_80AA83
	CMP.w DATA_80AC36,y
	BCC.b CODE_80AA89
	LDA.b $B2,x
	BPL.b CODE_80AA7E
	EOR.w #$FFFF
	INC
CODE_80AA7E:
	CMP.w #$0300
	BCC.b CODE_80AA89
CODE_80AA83:
	LDA.w #$0002
	STA.b $A6,x
	RTS

CODE_80AA89:
	JSR.w CODE_80AAB4
	RTS

CODE_80AA8D:
	PLX
	LDY.w #$0000
	JSR.w CODE_80AAB4
	LDA.b $A8,x
	BEQ.b CODE_80AAAD
	BMI.b CODE_80AAA7
	CMP.w #$4000
	BCC.b CODE_80AAAC
CODE_80AA9F:
	LDA.w #$0016
	STA.b $A6,x
	STA.b $AC,x
	RTS

CODE_80AAA7:
	CMP.w #$C000
	BCC.b CODE_80AA9F
CODE_80AAAC:
	RTS

CODE_80AAAD:
	LDA.b $A8,x
	BNE.b CODE_80AAB3
	STZ.b $A6,x
CODE_80AAB3:
	RTS

CODE_80AAB4:
	LDA.b $AA,x
	BMI.b CODE_80AAC0
	SEC
	SBC.w DATA_80AC36+$0C,y
	BCC.b CODE_80AAC6
	BRA.b CODE_80AAC9

CODE_80AAC0:
	CLC
	ADC.w DATA_80AC36+$0C,y
	BCC.b CODE_80AAC9

CODE_80AAC6:
	LDA.w #$0000
CODE_80AAC9:
	STA.b $AA,x
	LDA.b $A8,x
	BMI.b CODE_80AAD7
	SEC
	SBC.w DATA_80AC36+$08,y
	BCC.b CODE_80AADD
	BRA.b CODE_80AAE7

CODE_80AAD7:
	CLC
	ADC.w DATA_80AC36+$08,y
	BCC.b CODE_80AAE7
CODE_80AADD:
	LDA.b $E2,x
	BIT.w #$0040
	BNE.b CODE_80AAEA
	STZ.b $A6,x
	RTS

CODE_80AAE7:
	STA.b $A8,x
	RTS

CODE_80AAEA:
	AND.w #$FFBF
	STA.b $E2,x
	LDA.w #$0012
	STA.b $A6,x
	LDA.w #$0030
	STA.b $FC,x
	RTS

CODE_80AAFA:
	PLX
	CPY.w #$0000
	BNE.b CODE_80AB06
	LDA.w #$001C
	STA.b $A6,x
	RTS

CODE_80AB06:
	LDA.b $EA,x
	CMP.w #$0100
	BCS.b CODE_80AB13
	LDA.w #$001C
	STA.b $A6,x
	RTS

CODE_80AB13:
	LDA.b $C4,x
	BMI.b CODE_80AB25
	BIT.w #$0030
	BEQ.b CODE_80AB2F
	LDA.b $EA,x
	CMP.w #$01C0
	BCC.b CODE_80AB2F
	LDA.b $C4,x
CODE_80AB25:
	BIT.w #$0200
	BNE.b CODE_80AB76
	BIT.w #$0100
	BNE.b CODE_80AB36
CODE_80AB2F:
	JSR.w CODE_80AB94
	JSR.w CODE_80AAB4
	RTS

CODE_80AB36:
	JSR.w CODE_80ABFA
	LDA.b $A8,x
	BPL.b CODE_80AB59
	JSR.w CODE_80ABB7
	SEC
	SBC.w DATA_80AC36+$06,y
	BPL.b CODE_80AB86
CODE_80AB46:
	EOR.w #$FFFF
	INC
	CMP.w DATA_80AC36+$04,y
	BCC.b CODE_80AB6F
	LDA.w DATA_80AC36+$04,y
	EOR.w #$FFFF
	INC
	STA.b $A8,x
	RTS

CODE_80AB59:
	JSR.w CODE_80ABA3
	SEC
	SBC.w DATA_80AC36+$0A,y
	BMI.b CODE_80AB46
	BRA.b CODE_80AB86

CODE_80AB64:
	JSR.w CODE_80ABAD
	CLC
	ADC.w DATA_80AC36+$0A,y
	BMI.b CODE_80AB46
	BRA.b CODE_80AB86

CODE_80AB6F:
	EOR.w #$FFFF
	INC
	STA.b $A8,x
	RTS

CODE_80AB76:
	JSR.w CODE_80ABE5
	LDA.b $A8,x
	BMI.b CODE_80AB64
	JSR.w CODE_80ABCE
	CLC
	ADC.w DATA_80AC36+$06,y
	BMI.b CODE_80AB46
CODE_80AB86:
	CMP.w DATA_80AC36+$04,y
	BCC.b CODE_80AB91
	LDA.w DATA_80AC36+$04,y
	STA.b $A8,x
	RTS

CODE_80AB91:
	STA.b $A8,x
	RTS

CODE_80AB94:
	PHA
	LDA.w DATA_80AC36+$02,y
	ADC.w #$00E0
	STA.b $08
	LDA.b $FA,x
	BMI.b CODE_80ABB0
	BRA.b CODE_80ABA6

CODE_80ABA3:
	PHA
	LDA.b $FA,x
CODE_80ABA6:
	SEC
	SBC.b $08
	STA.b $FA,x
	PLA
	RTS

CODE_80ABAD:
	PHA
	LDA.b $FA,x
CODE_80ABB0:
	CLC
	ADC.b $08
	STA.b $FA,x
	PLA
	RTS

CODE_80ABB7:
	PHA
	LDA.b $FA,x
	CLC
	ADC.w DATA_80AC36+$02,y
	STA.b $FA,x
	BMI.b CODE_80ABCC
	CMP.w #$7A00
	BCC.b CODE_80ABCC
	LDA.w #$000E
	STA.b $A6,x
CODE_80ABCC:
	PLA
	RTS

CODE_80ABCE:
	PHA
	LDA.b $FA,x
	SEC
	SBC.w DATA_80AC36+$02,y
	STA.b $FA,x
	BPL.b CODE_80ABCC
	CMP.w #$8600
	BCS.b CODE_80ABCC
	LDA.w #$0010
	STA.b $A6,x
	PLA
	RTS

CODE_80ABE5:
	LDA.b $AA,x
	BMI.b CODE_80ABF1
	JSR.w CODE_80AC13
	CMP.w DATA_80AC36+$0E,y
	BCS.b CODE_80AC0A
CODE_80ABF1:
	LDA.b $AA,x
	CLC
	ADC.w DATA_80AC36+$0C,y
	STA.b $AA,x
	RTS

CODE_80ABFA:
	LDA.b $AA,x
	BPL.b CODE_80AC0A
	EOR.w #$FFFF
	INC
	JSR.w CODE_80AC13
	CMP.w DATA_80AC36+$0E,y
	BCS.b CODE_80ABF1
CODE_80AC0A:
	LDA.b $AA,x
	SEC
	SBC.w DATA_80AC36+$0C,y
	STA.b $AA,x
	RTS

CODE_80AC13:
	PHA
	CMP.w #$1800
	BCS.b CODE_80AC25
	CMP.w #$0C00
	LDA.b $E2,x
	BCS.b CODE_80AC2C
	AND.w #$FFDB
	BRA.b CODE_80AC32

CODE_80AC25:
	LDA.b $E2,x
	ORA.w #$0024
	BRA.b CODE_80AC32

CODE_80AC2C:
	AND.w #$FFDF
	ORA.w #$0004
CODE_80AC32:
	STA.b $E2,x
	PLA
	RTS

DATA_80AC36:
	dw $FFF0,$0100,$0800,$0080,$00A0,$00C0,$00E0,$0800
	dw $FFD0,$0040,$0900,$0040,$0060,$0080,$0120,$1100
	dw $FFE0,$0100,$1800,$0040,$0060,$0080,$0120,$2100
	dw $FFC0,$0110,$2000,$0080,$00C0,$0100,$0140,$2100
	dw $FF00,$0120,$2800,$00C0,$0120,$0100,$0180,$2100
	dw $FE00,$0140,$3000,$0100,$0180,$0200,$0200,$2900
	dw $FD00,$0200,$2800,$0240,$0360,$0480,$0280,$3100
	dw $FE00,$00E0,$2000,$0140,$01E0,$0280,$0200,$2900

;--------------------------------------------------------------------

CODE_80ACB6:
	SEP.b #$20
	LDA.b #!DSP1_Command02_ProjectionParameterSetting
	STA.l !REGISTER_DSP1_DataRegister
	REP.b #$20
	LDA.b $88,x
	STA.l !REGISTER_DSP1_DataRegister
	LDA.b $8C,x
	STA.l !REGISTER_DSP1_DataRegister
	LDA.w #$0000
	STA.l !REGISTER_DSP1_DataRegister
	LDA.b $7C,x
	ASL
	ASL
	STA.l !REGISTER_DSP1_DataRegister
	LDA.b $84,x
	STA.l !REGISTER_DSP1_DataRegister
	LDA.b $94,x
	STA.l !REGISTER_DSP1_DataRegister
	LDA.b $80,x
	STA.l !REGISTER_DSP1_DataRegister
CODE_80ACED:
	LDA.l !REGISTER_DSP1_StatusRegister
	BPL.b CODE_80ACED
	CLC
	LDA.b $98,x
	ADC.l !REGISTER_DSP1_DataRegister
	STA.b $9C,x
	CLC
	ADC.l !REGISTER_DSP1_DataRegister
	JSR.w (DATA_80AD32,x)
	STA.b $A0,x
	SEC
	LDA.l !REGISTER_DSP1_DataRegister
	LDA.b $88,x
	CMP.w #$8000
	ROR
	CMP.w #$8000
	ROR
	STA.b $58,x
	SBC.w #$007F
	STA.b $4C,x
	LDA.l !REGISTER_DSP1_DataRegister
	LDA.b $8C,x
	CMP.w #$8000
	ROR
	CMP.w #$8000
	ROR
	STA.b $5E,x
	SBC.b $9C,x
	INC
	STA.b $52,x
	RTS

DATA_80AD32:
	dw CODE_80AD36
	dw CODE_80AD3F

CODE_80AD36:
	CMP.w #$0020
	BCC.b CODE_80AD3E
	LDA.w #$0001
CODE_80AD3E:
	RTS

CODE_80AD3F:
	CMP.w #$0090
	BCC.b CODE_80AD47
	LDA.w #$0071
CODE_80AD47:
	RTS

;--------------------------------------------------------------------

CODE_80AD48:
	LDA.b $10,x
	BEQ.b CODE_80AD5D
	JSR.w CODE_80B1BE
	JSR.w CODE_80AF8F
	JSR.w CODE_80A4D0
	LDA.w $017E
	BNE.b CODE_80AD5D
	JSR.w CODE_80B7EB
CODE_80AD5D:
	RTS

;--------------------------------------------------------------------

CODE_80AD5E:
	LDA.b $10,x
	BEQ.b CODE_80AD5D
	JSR.w CODE_80B0B1
	AND.w #$FF00
	STA.b $FA,x
	LDA.w #$8000
	STA.b $C4,x
	PHX
	LDA.b $AC,x
	TAX
	JMP.w (DATA_80AD76,x)

DATA_80AD76:
	dw CODE_80B035
	dw CODE_80A647
	dw CODE_80A5A8
	dw CODE_80A5A8
	dw CODE_80A5AD
	dw CODE_80A5A8
	dw CODE_80A5A8
	dw CODE_80A5A8
	dw CODE_80B015
	dw CODE_80A606
	dw CODE_80A5A1
	dw CODE_80A55A

;--------------------------------------------------------------------

CODE_80AD8E:
	PHX
	JSR.w CODE_80AD96
	PLX
	STA.b $C8,x
	RTS

CODE_80AD96:
	LDA.w $0E50
	BEQ.b CODE_80AD9F
	LDA.w #$0000
	RTS

CODE_80AD9F:
	LDA.b $DA,x
	STA.b $00
	STX.b $02
	LDA.b $84,x
	BNE.b CODE_80ADB0
	LDA.b $10,x
	BIT.w #$0020
	BEQ.b CODE_80ADB4
CODE_80ADB0:
	LDA.w #$0018
	RTS

CODE_80ADB4:
	LDY.w $00E6,x
	STY.b $08
	LDA.b $E2,x
	BIT.w #$0002
	BEQ.b CODE_80ADE0
	CPY.w #$0000
	BEQ.b CODE_80ADCC
	LDX.w $010C,y
	LDA.b $10,x
	BMI.b CODE_80ADDC
CODE_80ADCC:
	CPY.w #$000E
	BEQ.b CODE_80ADDC
	LDX.w $0110,y
	LDA.b $10,x
	BPL.b CODE_80ADDC
	LDA.w #$0010
	RTS

CODE_80ADDC:
	LDA.w #$0008
	RTS

CODE_80ADE0:
	CPY.w #$0000
	BNE.b CODE_80AE23
	LDX.w $0110
	LDA.b $10,x
	BPL.b CODE_80ADF5
	JSR.w CODE_80AEBC
	BCS.b CODE_80AE1F
CODE_80ADF1:
	LDA.w #$0000
	RTS

CODE_80ADF5:
	LDA.b $00
	CMP.b $DA,x
	BCC.b CODE_80AE1F
	TXY
	LDX.b $02
	LDA.b $C1,x
	AND.w #$0007
	BEQ.b CODE_80AE1B
	STZ.b $08
	JSR.w CODE_80AF5F
	JSR.w CODE_80AEFC
	BCS.b CODE_80ADF1
	LDX.w $0112
	LDA.b $10,x
	BMI.b CODE_80AE1B
	LDX.w $0114
	BPL.b CODE_80ADF1
CODE_80AE1B:
	LDA.w #$0008
	RTS

CODE_80AE1F:
	LDA.w #$0010
	RTS

CODE_80AE23:
	CPY.w #$000E
	BNE.b CODE_80AE4C
	LDX.w $011A
	LDA.b $10,x
	BPL.b CODE_80AE38
	JSR.w CODE_80AECF
	BCC.b CODE_80ADF1
CODE_80AE34:
	LDA.w #$0008
	RTS

CODE_80AE38:
	LDA.b $DA,x
	CMP.b $00
	BCC.b CODE_80AE34
	LDY.b $02
	JSR.w CODE_80AF5F
	JSR.w CODE_80AEFC
	BCC.b CODE_80AE1F
CODE_80AE48:
	LDA.w #$0000
	RTS

CODE_80AE4C:
	LDX.w $0110,y
	LDA.b $10,x
	BPL.b CODE_80AE79
	PHX
	LDX.w $010C,y
	LDA.b $C8,x
	CMP.w #$0010
	BEQ.b CODE_80AE74
	LDA.b $DA,x
	CMP.b $00
	BCS.b CODE_80AE74
	PLX
	JSR.w CODE_80AEBC
	BCC.b CODE_80AE48
	LDA.b $04
	CMP.b $00
	BCS.b CODE_80AE48
CODE_80AE70:
	LDA.w #$0010
	RTS

CODE_80AE74:
	PLX
	LDA.w #$0010
	RTS

CODE_80AE79:
	LDA.b $DA,x
	STA.b $06
	LDX.w $010C,y
	LDA.b $10,x
	BPL.b CODE_80AE97
	LDA.b $00
	CMP.b $06
	BCC.b CODE_80AE70
	JSR.w CODE_80AECF
	BCC.b CODE_80AE93
	LDA.w #$0008
	RTS

CODE_80AE93:
	LDA.w #$0000
	RTS

CODE_80AE97:
	LDA.b $DA,x
	STA.b $04
	LDA.b $00
	CMP.b $06
	BCS.b CODE_80AEA5
	LDA.w #$0010
	RTS

CODE_80AEA5:
	LDA.b $04
	CMP.b $00
	BCS.b CODE_80AEAF
	LDA.w #$0008
	RTS

CODE_80AEAF:
	LDY.b $02
	JSR.w CODE_80AF5F
	JSR.w CODE_80AEFC
	BCC.b CODE_80AE70
	LDA.b $C8,x
	RTS

;--------------------------------------------------------------------

CODE_80AEBC:
	LDA.b $92,x
	LDY.b $96,x
	CPY.w $0002
	BEQ.b CODE_80AECB
	LDY.w $0002
	JSR.w CODE_80AF5F
CODE_80AECB:
	CMP.w #$0140
	RTS

;--------------------------------------------------------------------

CODE_80AECF:
	LDA.b $90,x
	LDY.b $94,x
	CPY.w $0002
	BEQ.b CODE_80AEDB
	JSR.w CODE_80AF5F
CODE_80AEDB:
	CMP.w #$0080
	RTS

;--------------------------------------------------------------------

CODE_80AEDF:
	PHA
	LDA.b $C1,x
	AND.w #$0007
	ASL
	TAY
	PLA
	CMP.w DATA_80AEEC,y
	RTS

DATA_80AEEC:
	dw $0080,$0060,$0040,$00A0,$0100,$0060,$0060,$0080

;--------------------------------------------------------------------

CODE_80AEFC:
	PHA
	LDA.b $C1,x
	AND.w #$0007
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $08
	TAY
	PLA
	CMP.w DATA_80AF0F,y
	RTS

DATA_80AF0F:
	dw $0080,$0080,$0040,$0040,$0040,$0040,$0060,$0080
	dw $00A0,$00A0,$0050,$0050,$0080,$00A0,$00C0,$00C0
	dw $00C0,$00C0,$0060,$0070,$0080,$00C0,$00E0,$0500
	dw $00E0,$00E0,$0060,$0080,$00A0,$0120,$0500,$0500
	dw $0100,$00A0,$0080,$0008,$0080,$0500,$0500,$0500

;--------------------------------------------------------------------

CODE_80AF5F:
	SEP.b #$20
	LDA.b #!DSP1_Command28_VectorAbsoluteValueCalculation
	STA.l !REGISTER_DSP1_DataRegister
	REP.b #$20
	LDA.w #$0000
	STA.l !REGISTER_DSP1_DataRegister
	LDA.w $0018,y
	SEC
	SBC.b $18,x
	STA.l !REGISTER_DSP1_DataRegister
	LDA.w $001C,y
	SEC
	SBC.b $1C,x
	STA.l !REGISTER_DSP1_DataRegister
CODE_80AF84:
	LDA.l !REGISTER_DSP1_StatusRegister
	BPL.b CODE_80AF84
	LDA.l !REGISTER_DSP1_DataRegister
	RTS

;--------------------------------------------------------------------

CODE_80AF8F:
	LDA.b $E2,x
	BIT.w #$0A00
	BNE.b CODE_80AFEE
	LDA.b $2A,x
	SEC
	SBC.b $A2,x
	BEQ.b CODE_80AFBE
	BMI.b CODE_80AFAC
	CMP.w #$0800
	BCC.b CODE_80AFB9
	LDA.b $A2,x
	CLC
	ADC.w #$0600
	BRA.b CODE_80AFBB

CODE_80AFAC:
	CMP.w #$F800
	BCS.b CODE_80AFB9
	LDA.b $A2,x
	SEC
	SBC.w #$0600
	BRA.b CODE_80AFBB

CODE_80AFB9:
	LDA.b $2A,x
CODE_80AFBB:
	STA.b $A2,x
	RTS

CODE_80AFBE:
	LDA.b $FA,x
CODE_80AFC0:
	SEC
	SBC.b $A2,x
	BMI.b CODE_80AFD1
	CMP.w #$0200
	BCS.b CODE_80AFDF
CODE_80AFCA:
	LDA.b $FA,x
	STA.b $A2,x
	STA.b $2A,x
	RTS

CODE_80AFD1:
	CMP.w #$FE00
	BCS.b CODE_80AFCA
	JSR.w CODE_80AFF9
	EOR.w #$FFFF
	INC
	BRA.b CODE_80AFE6

CODE_80AFDF:
	EOR.w #$FFFF
	INC
	JSR.w CODE_80AFF9
CODE_80AFE6:
	CLC
	ADC.b $A2,x
	STA.b $A2,x
	STA.b $2A,x
	RTS

CODE_80AFEE:
	JSR.w CODE_80B70A
	LDA.b $A2,x
	CLC
	ADC.b $AA,x
	STA.b $2A,x
	RTS

CODE_80AFF9:
	CMP.w #$0200
	BCC.b CODE_80B001
	LDA.w #$01FF
CODE_80B001:
	ASL
	ASL
	ASL
	XBA
	AND.w #$000E
	STA.b $12
	LDA.b $C8,x
	ASL
	CLC
	ADC.b $12
	TAY
	LDA.w $06D0,y
	RTS

;--------------------------------------------------------------------

CODE_80B015:
	PLX
	LDA.b $EA,x
	CMP.w #$0100
	BCC.b CODE_80B02F
	LDA.b $C0,x
	AND.w #$007F
	ASL
	TAY
	LDA.w $0800,y
	AND.w #$0003
	CMP.w #$0003
	BNE.b CODE_80B032
CODE_80B02F:
	JMP.w CODE_80A5E4

CODE_80B032:
	JMP.w CODE_80A5FC

;--------------------------------------------------------------------

CODE_80B035:
	PLX
	JSR.w CODE_80B074
	SEC
	SBC.b $EA,x
	BCC.b CODE_80B04B
	LDY.w #$0690
	STY.b $10
	JSR.w CODE_80A7E1
	STZ.b $EE,x
	STA.b $ED,x
	RTS

CODE_80B04B:
	EOR.w #$FFFF
	INC
	CMP.w #$0200
	BCC.b CODE_80B057
	LDA.w #$01FF
CODE_80B057:
	ASL
	ASL
	XBA
	AND.w #$0006
	TAY
	LDA.w DATA_80B064,y
	STA.b $EE,x
	RTS

DATA_80B064:
	dw $FFFC,$FFF8,$FFF0,$FFE8,$FFE0,$FFD0,$FFC0,$FFB0

;--------------------------------------------------------------------

CODE_80B074:
	LDA.b $C0,x
	AND.w #$007F
	ASL
	TAY
	LDA.w $0800,y
	AND.w #$0003
	ASL
	CLC
	ADC.b $C8,x
	TAY
	LDA.w $06B0,y
	LDY.w $00DA,x
	BEQ.b CODE_80B092
	ADC.w DATA_80B099,y
	RTS

CODE_80B092:
	LDY.w $00E6,x
	ADC.w DATA_80B0A1,y
	RTS

DATA_80B099:
	dw $0002,$0004,$0008,$0010

DATA_80B0A1:
	dw $0000,$FFFE,$FFFC,$FFF8,$FFF4,$FFF0,$FFEC,$FFE8

;--------------------------------------------------------------------

CODE_80B0B1:
	LDA.b $10,x
	AND.w #$0003
	BEQ.b CODE_80B0D5
	LDA.b $C0,x
	AND.w #$00FF
	ASL
	TAY
	LDA.w $0A00,y
	SEC
	SBC.b $1C,x
	PHA
	LDA.w $0900,y
	PLY
	SEC
	SBC.b $18,x
	PHX
	TAX
	JSL.l CODE_81F638
	PLX
	RTS

CODE_80B0D5:
	PHX
	LDA.b $18,x
	LSR
	LSR
	LSR
	LSR
	STA.b $12
	LDA.b $1C,x
	ASL
	ASL
	AND.w #$0FC0
	ORA.b $12
	TAX
	LDA.l $7F3FFF,x
	PLX
	RTS

;--------------------------------------------------------------------

CODE_80B0EE:
	LDA.b $E2,x
	BIT.w #$0001
	BEQ.b CODE_80B111
	LDA.b $C2,x
	CMP.w #$2000
	BCC.b CODE_80B10A
	SEC
	SBC.w #$0070
	STA.b $C2,x
	LDA.b $E2,x
	ORA.w #$0020
	STA.b $E2,x
	RTS

CODE_80B10A:
	LDA.b $E2,x
	AND.w #$FFDE
	STA.b $E2,x
CODE_80B111:
	RTS

;--------------------------------------------------------------------

CODE_80B112:
	LDA.b $70,x
	BEQ.b CODE_80B119
	STZ.b $C2,x
	RTS

CODE_80B119:
	LDA.b $E2,x
	BIT.w #$0001
	BEQ.b CODE_80B121
	RTS

CODE_80B121:
	LDA.w #$4000
	BIT.b $C4,x
	BNE.b CODE_80B12A
	BMI.b CODE_80B14C
CODE_80B12A:
	LDA.w $0E26
	BRA.b CODE_80B169

CODE_80B12F:
	LDA.w $0E20
	SEC
	SBC.w #$1800
	CMP.w $00C2,x
	BCS.b CODE_80B15A
	LDA.w $0E2A
	BRA.b CODE_80B169

CODE_80B140:
	LDA.b $C2,x
	CMP.w #$1000
	BCC.b CODE_80B15C
	LDA.w $0E28
	BRA.b CODE_80B169

CODE_80B14C:
	LDA.b $B0,x
	CMP.w #$0014
	BCS.b CODE_80B140
	LDA.b $E2,x
	BIT.w #$0004
	BNE.b CODE_80B12F
CODE_80B15A:
	LDA.b $C2,x
CODE_80B15C:
	CMP.w #$2000
	BCS.b CODE_80B166
	LDA.w $0E22
	BRA.b CODE_80B169

CODE_80B166:
	LDA.w $0E24
CODE_80B169:
	CLC
	ADC.b $C2,x
	BMI.b CODE_80B173
	CMP.w #$0100
	BCS.b CODE_80B176
CODE_80B173:
	LDA.w #$0100
CODE_80B176:
	CMP.w $0E20
	BCC.b CODE_80B17E
	LDA.w $0E20
CODE_80B17E:
	STA.b $C2,x
	RTS

;--------------------------------------------------------------------

CODE_80B181:
	LDA.b $48
	BEQ.b CODE_80B1B3
	BPL.b CODE_80B19E
	SEC
	SBC.w $015E
	CMP.w #$8000
	BCS.b CODE_80B197
	STZ.b $48
	LDA.w #$8000
	BRA.b CODE_80B1B0

CODE_80B197:
	STA.b $48
	AND.w #$7FFF
	BRA.b CODE_80B1B0

CODE_80B19E:
	CLC
	ADC.w $015E
	CMP.w #$0F00
	BCC.b CODE_80B1AE
	STZ.b $48
	LDA.w #$0F00
	BRA.b CODE_80B1B0

CODE_80B1AE:
	STA.b $48
CODE_80B1B0:
	STA.w $0160
CODE_80B1B3:
	SEP.b #$20
	LDA.w !RAM_SMK_Global_ScreenDisplayRegister
	STA.w !REGISTER_ScreenDisplayRegister
	REP.b #$20
	RTS

;--------------------------------------------------------------------

CODE_80B1BE:
	PHX
	LDA.b $A0,x
	TAX
	JMP.w (DATA_80B1C5,x)

DATA_80B1C5:
	dw CODE_80B3B7
	dw CODE_80B1D5
	dw CODE_80B221
	dw CODE_80B231
	dw CODE_80B24D
	dw CODE_80B231
	dw CODE_80B2B6
	dw CODE_80B32E

CODE_80B1D5:
	PLX
	LDA.b $26,x
	SEC
	SBC.w #$001A
	STA.b $26,x
	CLC
	ADC.b $1F,x
	BPL.b CODE_80B21E
	STZ.b $1F,x
	STZ.b $26,x
	LDA.b $E2,x
	AND.w #$7FFF
	STA.b $E2,x
	LDA.b $AE,x
	BMI.b CODE_80B20B
	CMP.w #$005C
	BCC.b CODE_80B1FC
	LDA.w #$004C
	BRA.b CODE_80B20E

CODE_80B1FC:
	CMP.w #$0022
	BNE.b CODE_80B20B
	LDA.w #$004C
	JSL.l CODE_81F57A
	JMP.w CODE_80B5DC

CODE_80B20B:
	LDA.w #$0025
CODE_80B20E:
	JSL.l CODE_81F57A
	STZ.b $A0,x
	LDA.b $AC,x
	CMP.w #$0010
	BEQ.b CODE_80B21D
	STZ.b $AC,x
CODE_80B21D:
	RTS

CODE_80B21E:
	STA.b $1F,x
	RTS

CODE_80B221:
	PLX
	DEC.b $CA,x
	BNE.b CODE_80B230
	LDA.w #$3000
	STA.b $1F,x
	LDA.w #$000C
	STA.b $A0,x
CODE_80B230:
	RTS

CODE_80B231:
	PLX
	LDA.b $10,x
	BIT.w #$2000
	BEQ.b CODE_80B23E
	LDA.w #$0007
	STA.b $20,x
CODE_80B23E:
	LDA.b $20,x
	BMI.b CODE_80B24C
	CMP.w #$0007
	BCC.b CODE_80B24C
	LDA.w #$000C
	STA.b $A0,x
CODE_80B24C:
	RTS

CODE_80B24D:
	PLX
	LDA.b $CA,x
	BEQ.b CODE_80B276
	DEC.b $CA,x
	CMP.w #$00F0
	BCS.b CODE_80B24C
	CMP.w #$0078
	BCS.b CODE_80B26C
	LDA.b $10,x
	ORA.w #$0100
	STA.b $10,x
	LDA.w #$0400
	ORA.b $D4,x
	STA.b $D4,x
CODE_80B26C:
	JSR.w CODE_80B373
	LDA.b $AE,x
	CMP.w #$0024
	BNE.b CODE_80B27C
CODE_80B276:
	JSR.w CODE_80B2AE
	JMP.w CODE_80B64B

CODE_80B27C:
	CMP.w #$0022
	BEQ.b CODE_80B2B5
	CMP.w #$0080
	BCS.b CODE_80B2B5
	LDA.b $E2,x
	ORA.w #$0010
	STA.b $E2,x
	LDA.w #$0200
	ORA.b $D4,x
	STA.b $D4,x
	JSR.w CODE_80B2AE
	LDA.w #$0100
	STA.b $EA,x
	LDA.w #$3E00
	JSR.w CODE_80B7BB
	LDA.w #$0021
	JSR.w CODE_80B49D
	LDA.w #$0002
	JMP.w CODE_80B637

CODE_80B2AE:
	LDA.b $10,x
	AND.w #$FEFF
	STA.b $10,x
CODE_80B2B5:
	RTS

CODE_80B2B6:
	PLX
	JSR.w CODE_80B346
	LDA.b $18,x
	CMP.b $CC,x
	BEQ.b CODE_80B2EB
	BIT.w #$8000
	BMI.b CODE_80B2CF
	SEC
	SBC.b $CC,x
	BCS.b CODE_80B2D8
	CMP.w #$FFFD
	BCS.b CODE_80B2E6
CODE_80B2CF:
	LDA.b $18,x
	CLC
	ADC.w #$0002
	STA.b $18,x
	RTS

CODE_80B2D8:
	CMP.w #$0003
	BCC.b CODE_80B2E6
	LDA.b $18,x
	SEC
	SBC.w #$0002
	STA.b $18,x
	RTS

CODE_80B2E6:
	LDA.b $CC,x
	STA.b $18,x
	RTS

CODE_80B2EB:
	STA.b $0A
	LDA.b $1C,x
	STA.b $0E
	BMI.b CODE_80B2FD
	SEC
	SBC.b $CE,x
	BCS.b CODE_80B304
	CMP.w #$FFFD
	BCS.b CODE_80B316
CODE_80B2FD:
	LDA.b $1C,x
	ADC.w #$0002
	BRA.b CODE_80B30E

CODE_80B304:
	CMP.w #$0003
	BCC.b CODE_80B316
	LDA.b $1C,x
	SBC.w #$0002
CODE_80B30E:
	STA.b $1C,x
	STA.b $0C
	JSR.w CODE_80890D
	RTS

CODE_80B316:
	LDA.b $CE,x
	STA.b $1C,x
	LDA.b $10,x
	BIT.w #$2000
	BNE.b CODE_80B328
	LDA.w #$0040
	ORA.b $D4,x
	STA.b $D4,x
CODE_80B328:
	LDA.w #$000E
	STA.b $A0,x
	RTS

CODE_80B32E:
	PLX
	JSR.w CODE_80B346
	BCC.b CODE_80B345
	LDA.b $1F,x
	SEC
	SBC.w #$0080
	BCC.b CODE_80B33F
	STA.b $1F,x
	RTS

CODE_80B33F:
	STZ.b $1F,x
	STZ.b $A0,x
	STZ.b $AC,x
CODE_80B345:
	RTS

CODE_80B346:
	LDA.b $A4,x
	SEC
	SBC.b $D0,x
	BEQ.b CODE_80B372
	BPL.b CODE_80B360
	CMP.w #$FE00
	BCS.b CODE_80B35C
	LDA.b $A4,x
	CLC
	ADC.w #$0140
	BRA.b CODE_80B36B

CODE_80B35C:
	LDA.b $D0,x
	BRA.b CODE_80B36B

CODE_80B360:
	CMP.w #$0200
	BCC.b CODE_80B35C
	LDA.b $A4,x
	SEC
	SBC.w #$0140
CODE_80B36B:
	STA.b $A4,x
	STA.b $2A,x
	STA.b $A2,x
	CLC
CODE_80B372:
	RTS

CODE_80B373:
	LDA.b $C0,x
	AND.w #$00FF
	ASL
	TAY
	LDA.w $0900,y
	STA.b $CC,x
	LSR
	LSR
	LSR
	LSR
	STA.b $00
	LDA.w $0A00,y
	STA.b $CE,x
	ASL
	ASL
	AND.w #$0FC0
	ORA.b $00
	PHX
	TAX
	LDA.l $7F3FFF,x
	PLX
	STA.b $D0,x
	RTS

;--------------------------------------------------------------------

DATA_80B39B:
	dw CODE_80B5B7
	dw CODE_80B56D
	dw CODE_80B643
	dw CODE_80B626
	dw CODE_80B5D4

DATA_80B3A5:
	dw CODE_80B67C
	dw CODE_80B666
	dw CODE_80B3B5
	dw CODE_80B47B
	dw CODE_80B426
	dw CODE_80B3B5
	dw CODE_80B666
	dw CODE_80B69D

CODE_80B3B5:
	PLX
	RTS

CODE_80B3B7:
	PLX
	LDA.b $2C
	CMP.w #$0006
	BCC.b CODE_80B3C9
	LDA.b $AE,x
	CMP.w #$005A
	BNE.b CODE_80B3C9
	JMP.w CODE_80B627

CODE_80B3C9:
	LDA.b $C4,x
	BPL.b CODE_80B3DB
	BIT.w #$0300
	BEQ.b CODE_80B3DB
	BIT.w #$0030
	BEQ.b CODE_80B3DB
	INC.b $CA,x
	BRA.b CODE_80B3DD

CODE_80B3DB:
	STZ.b $CA,x
CODE_80B3DD:
	LDA.b $10,x
	BIT.w #$1000
	BEQ.b CODE_80B3F1
	BIT.w #$2000
	BEQ.b CODE_80B3EE
	JSR.w CODE_80A0AF
	BRA.b CODE_80B3F1

CODE_80B3EE:
	JSR.w CODE_80A0C7
CODE_80B3F1:
	JSR.w CODE_80B49D
	LDA.b $AE,x
	BMI.b CODE_80B425
	CMP.w #$0040
	BCS.b CODE_80B420
	CMP.w #$0020
	BCC.b CODE_80B418
	AND.w #$000F
	PHA
	LDA.b $E2,x
	AND.w #$4000
	STA.b $E2,x
	LDA.w #$001C
	STA.b $A6,x
	PLA
	PHX
	TAX
	JMP.w (DATA_80B39B,x)

CODE_80B418:
	AND.w #$000F
	PHX
	TAX
	JMP.w (DATA_80B3A5,x)

CODE_80B420:
	AND.w #$001E
	STA.b $B0,x
CODE_80B425:
	RTS

CODE_80B426:
	PLX
	LDA.b $E2,x
	BIT.w #$0002
	BNE.b CODE_80B463
	LDY.b $EA,x
	CPY.w #$0300
	BCC.b CODE_80B463
CODE_80B435:
	LDA.b $AA,x
	BMI.b CODE_80B43E
	LDA.w #$0010
	BRA.b CODE_80B45F

CODE_80B43E:
	LDA.w #$000E
	BRA.b CODE_80B45F

CODE_80B443:
	LDA.w #$0300
	CMP.b $EA,x
	BCS.b CODE_80B44C
	STA.b $EA,x
CODE_80B44C:
	STZ.b $AC,x
	LDA.w #$003C
	STA.b $FA,x
	LDA.b $AA,x
	BMI.b CODE_80B45C
	LDA.w #$000C
	BRA.b CODE_80B45F

CODE_80B45C:
	LDA.w #$000A
CODE_80B45F:
	STA.b $A6,x
	STZ.b $A8,x
CODE_80B463:
	LDA.b $E2,x
	AND.w #$E7FF
	STA.b $E2,x
	RTS

CODE_80B46B:
	LDA.b $E0,x
	AND.w #$7FFF
	STA.b $E0,x
	STZ.b $A8,x
	LDA.w #$001C
	STA.b $A6,x
	BRA.b CODE_80B47C

CODE_80B47B:
	PLX
CODE_80B47C:
	LDY.w $00A6,x
	LDA.w DATA_809E0B,y
	BNE.b CODE_80B49C
	LDA.w #$0020
	STA.b $FC,x
CODE_80B489:
	LDA.w #$0048
	JSL.l CODE_81F57A
	LDA.b $E2,x
	ORA.w #$0080
	STA.b $E2,x
	LDA.w #$0010
	STA.b $AC,x
CODE_80B49C:
	RTS

CODE_80B49D:
	LDA.b $E2,x
	BIT.w #$0200
	BNE.b CODE_80B4D1
CODE_80B4A4:
	BIT.w #$0800
	BNE.b CODE_80B435
	BIT.w #$1000
	BNE.b CODE_80B443
	LDA.b $E0,x
	BMI.b CODE_80B46B
	BIT.w #$2000
	BEQ.b CODE_80B4F0
	LDA.b $E2,x
	ORA.w #$0002
	STA.b $E2,x
	LDA.b $E0,x
	AND.w #$DFFF
	STA.b $E0,x
	LDA.w #$0012
	STA.b $AC,x
	STA.w $0E5E
	JSR.w CODE_809881
	RTS

CODE_80B4D1:
	LDA.b $10,x
	BPL.b CODE_80B4E5
	TXA
	XBA
	AND.w #$0001
	ASL
	TAY
	LDA.w $00AC,y
	ORA.w #$2000
	STA.w $00AC,y
CODE_80B4E5:
	LDA.w #$001A
	STA.b $A6,x
	LDA.w #$0014
	STA.b $AC,x
	RTS

CODE_80B4F0:
	BIT.w #$0001
	BEQ.b CODE_80B4FE
	STZ.b $E0,x
	LDA.w #$0018
	STA.b $FC,x
	BRA.b CODE_80B489

CODE_80B4FE:
	BIT.w #$4000
	BNE.b CODE_80B578
	BIT.w #$0080
	BNE.b CODE_80B528
	LDA.b $C4,x
	BIT.w #$0004
	BNE.b CODE_80B51B
	BIT.w #$0008
	BEQ.b CODE_80B520
	BIT.w #$0010
	BEQ.b CODE_80B53D
	BRA.b CODE_80B520

CODE_80B51B:
	BIT.w #$0020
	BEQ.b CODE_80B53D
CODE_80B520:
	LDA.b $10,x
	AND.w #$F7FF
	STA.b $10,x
	RTS

CODE_80B528:
	LDA.b $E0,x
	AND.w #$FF7F
	STA.b $E0,x
CODE_80B52F:
	LDA.w #$0100
	CMP.b $EA,x
	BCC.b CODE_80B538
	STA.b $EA,x
CODE_80B538:
	LDA.w #$0100
	BRA.b CODE_80B55C

CODE_80B53D:						; Note: Something related to doing a small hop.
	LDY.w $00B0,x
	CPY.w #$0014
	BCC.b CODE_80B552
	LDA.b $EA,x
	CMP.w DATA_80B561-$14,y
	BCC.b CODE_80B552
	SEC
	SBC.w #$0040
	STA.b $EA,x
CODE_80B552:
	LDA.w #$0021
	JSL.l CODE_81F57A
	JSR.w CODE_80B77B
CODE_80B55C:
	STA.b $26,x
	JMP.w CODE_80B6BD

DATA_80B561:
	dw $0250,$0120,$01F0,$0230,$0240,$0290

CODE_80B56D:
	PLX
	LDA.b $10,x
	BIT.w #$2000
	BEQ.b CODE_80B5DC
	JMP.w CODE_80B52F

CODE_80B578:
	LDA.w #$0024
	JSL.l CODE_81F57A
	LDA.b $E0,x
	AND.w #$BFFF
	STA.b $E0,x
	LDA.w #$01E0
	STA.b $26,x
	LDA.w #$0100
	STA.b $1E,x
	LDA.w #$0018
	STA.b $A6,x
	LDA.b $C4,x
	BIT.w #$0100
	BNE.b CODE_80B5A5
	BIT.w #$0200
	BNE.b CODE_80B5AA
	LDA.b $37
	BMI.b CODE_80B5AA
CODE_80B5A5:
	LDA.w #$8000
	BRA.b CODE_80B5AD

CODE_80B5AA:
	LDA.w #$A000
CODE_80B5AD:
	ORA.b $E2,x
	STA.b $E2,x
	LDA.w #$0002
	JMP.w CODE_80B637

CODE_80B5B7:
	PLX
CODE_80B5B8:
	LDA.w #$0027
	JSL.l CODE_81F57A
	JSR.w CODE_80B768
	JSR.w CODE_80B373
	LDA.w #$003C
	STA.b $CA,x
	LDA.w #$0001
	STA.b $1F,x
	LDA.w #$0004
	BRA.b CODE_80B637

CODE_80B5D4:
	PLX
	LDA.b $10,x
	BMI.b CODE_80B5B8
	JMP.w CODE_80B53D

CODE_80B5DC:
	LDA.b $60,x
	BPL.b CODE_80B5E5
	JSR.w CODE_80A48F
	BRA.b CODE_80B5EC

CODE_80B5E5:
	LDA.b $EA,x
	CMP.w #$0200
	BCS.b CODE_80B606
CODE_80B5EC:
	LDA.b $E2,x
	AND.w #$4002
	STA.b $E2,x
	STZ.b $20,x
	STZ.b $1E,x
	STZ.b $26,x
	JSR.w CODE_80B768
	LDA.w #$0102
	STA.b $CA,x
	LDA.w #$0008
	BRA.b CODE_80B637

CODE_80B606:
	CMP.w #$0400
	BCC.b CODE_80B611
	SEC
	SBC.w #$02C0
	BRA.b CODE_80B615

CODE_80B611:
	SEC
	SBC.w #$00A0
CODE_80B615:
	STA.b $EA,x
	LDA.b $E2,x
	ORA.w #$0010
	STA.b $E2,x
	LDA.w #$0800
	JSR.w CODE_80B7BB
	BRA.b CODE_80B698

CODE_80B626:
	PLX
CODE_80B627:
	JSR.w CODE_80B373
	JSR.w CODE_80B768
	LDA.w #$0020
	ORA.b $D4,x
	STA.b $D4,x
	LDA.w #$000A
CODE_80B637:
	STA.b $AC,x
	STA.b $A0,x
	LDA.b $10,x
	ORA.w #$0800
	STA.b $10,x
	RTS

CODE_80B643:
	PLX
	LDA.w #$0028
	JSL.l CODE_81F57A
CODE_80B64B:
	JSR.w CODE_80B768
	JSR.w CODE_80B373
	LDA.b $10,x
	BMI.b CODE_80B65A
	LDA.w #$3000
	STA.b $1F,x
CODE_80B65A:
	LDA.w #$0010
	ORA.b $D4,x
	STA.b $D4,x
	LDA.w #$0006
	BRA.b CODE_80B637

CODE_80B666:
	PLX
	LDA.w #$0023
	JSL.l CODE_81F57A
	LDA.b $EA,x
	PHA
	LDA.w #$0D00
	JSR.w CODE_80B7BB
	PLA
	STA.b $EA,x
	BRA.b CODE_80B698

CODE_80B67C:
	PLX
	LDA.b $AC,x
	CMP.w #$0010
	BNE.b CODE_80B689
	LDA.w #$004E
	BRA.b CODE_80B68C

CODE_80B689:
	LDA.w #$0021
CODE_80B68C:
	JSL.l CODE_81F57A
	JSR.w CODE_80B79E
	LDA.w #$0280
	STA.b $1F,x
CODE_80B698:
	LDA.w #$0002
	BRA.b CODE_80B637

CODE_80B69D:
	PLX
	LDA.b $EA,x
	CMP.w #$0100
	BCC.b CODE_80B702
	LDA.w #$0080
	STA.b $26,x
	LDA.w #$0100
	STA.b $1E,x
	LDA.w #$8000
	ORA.b $E2,x
	STA.b $E2,x
	LDA.w #$0022
	JSL.l CODE_81F57A
CODE_80B6BD:
	LDA.w #$0002
	STA.b $A0,x
	LDA.b $E2,x
	ORA.w #$8000
	STA.b $E2,x
	LDA.b $10,x
	ORA.w #$0800
	STA.b $10,x
	RTS

;--------------------------------------------------------------------

CODE_80B6D1:
	PLX
	LDA.b $E2,x
	BPL.b CODE_80B703
	BIT.w #$2000
	BNE.b CODE_80B6E6
	LDA.b $AA,x
	SEC
	SBC.w #$0800
	STA.b $AA,x
	BCC.b CODE_80B6F0
	RTS

CODE_80B6E6:
	LDA.b $AA,x
	CLC
	ADC.w #$0800
	STA.b $AA,x
	BCC.b CODE_80B702
CODE_80B6F0:
	LDA.b $26,x
	BPL.b CODE_80B702
	STZ.b $AA,x
	LDA.w #$001C
	STA.b $A6,x
	LDA.b $E2,x
	AND.w #$7FFF
	STA.b $E2,x
CODE_80B702:
	RTS

CODE_80B703:
	LDA.w #$001C
	STA.b $A6,x
	RTS

;--------------------------------------------------------------------

CODE_80B709:
	PLX
CODE_80B70A:
	LDA.b $E4,x
	CMP.w #$1000
	BCC.b CODE_80B714
	LDA.w #$1000
CODE_80B714:
	STA.b $00
	LDA.b $E2,x
	BIT.w #$0100
	BEQ.b CODE_80B723
	LDA.b $00
	ADC.b $AA,x
	BRA.b CODE_80B72B

CODE_80B723:
	LDA.b $00
	EOR.w #$FFFF
	INC
	ADC.b $AA,x
CODE_80B72B:
	STA.b $AA,x
	LDA.b $E4,x
	CMP.w #$0100
	BCC.b CODE_80B73B
	SEC
	SBC.w #$0040
	STA.b $E4,x
	RTS

CODE_80B73B:
	LDA.b $AA,x
	BMI.b CODE_80B75F
	SEC
	SBC.w #$0180
	BCS.b CODE_80B765
CODE_80B745:
	STZ.b $AC,x
	STZ.b $AA,x
	STZ.b $A8,x
	STZ.b $A6,x
	LDA.b $E2,x
	AND.w #$40FF
	ORA.w #$0400
	STA.b $E2,x
	LDA.w #$002A
	JSL.l CODE_81F57A
	RTS

CODE_80B75F:
	CLC
	ADC.w #$0180
	BCS.b CODE_80B745
CODE_80B765:
	STA.b $AA,x
	RTS

;--------------------------------------------------------------------

CODE_80B768:
	STZ.b $E8,x
	STZ.b $EA,x
	STZ.b $EC,x
	STZ.b $EE,x
	STZ.b $B2,x
	STZ.b $A6,x
	STZ.b $A8,x
	STZ.b $AA,x
	STZ.b $C2,x
	RTS

;--------------------------------------------------------------------

CODE_80B77B:
	LDA.b $60,x
	BPL.b CODE_80B785
	INC.b $FE,x
	LDA.w #$0070
	RTS

CODE_80B785:
	LDA.w #$00E0
	RTS

;--------------------------------------------------------------------

CODE_80B789:
	LDA.w $00A6,y
	BEQ.b CODE_80B794
	LDA.w $00AA,y
	STA.b $DC,x
	RTS

CODE_80B794:
	STZ.b $DC,x
	LDA.b $AC,x
	AND.w #$CFFF
	STA.b $AC,x
	RTS

;--------------------------------------------------------------------

CODE_80B79E:
	LDA.w !RAM_SMK_Global_RacetrackType
	CMP.w #!Define_SMK_RacetrackType_BowserCastle
	BNE.b CODE_80B7AF
	LDA.w #$0400
	CMP.b $EA,x
	BCS.b CODE_80B7AF
	STA.b $EA,x
CODE_80B7AF:
	LDA.w #$02E0
	CMP.b $EA,x
	BCC.b CODE_80B7B8
	STA.b $EA,x
CODE_80B7B8:
	LDA.w #$0E00
CODE_80B7BB:
	PHA
	SEP.b #$20
	LDA.b #!DSP1_Command04_TrigonometricCalculation
	STA.l !REGISTER_DSP1_DataRegister
	REP.b #$20
	PLA
	STA.l !REGISTER_DSP1_DataRegister
	LDA.b $EA,x
	STA.l !REGISTER_DSP1_DataRegister
CODE_80B7D1:
	LDA.l !REGISTER_DSP1_StatusRegister
	BPL.b CODE_80B7D1
	LDA.l !REGISTER_DSP1_DataRegister
	STA.b $26,x
	LDA.b $E2,x
	ORA.w #$8000
	STA.b $E2,x
	LDA.l !REGISTER_DSP1_DataRegister
	STA.b $EA,x
	RTS

;--------------------------------------------------------------------

CODE_80B7EB:
	LDA.b $C6,x
	BEQ.b CODE_80B80F
	BMI.b CODE_80B7F7
	DEC
	BEQ.b CODE_80B804
	STA.b $C6,x
	RTS

CODE_80B7F7:
	INC
	BEQ.b CODE_80B7FD
	STA.b $C6,x
	RTS

CODE_80B7FD:
	JSR.w CODE_80B847
	STA.b $C6,x
	BRA.b CODE_80B826

CODE_80B804:
	JSR.w CODE_80B847
	EOR.w #$FFFF
	INC
	STA.b $C6,x
	BRA.b CODE_80B815

CODE_80B80F:
	JSR.w CODE_80B847
	STA.b $C6,x
	RTS

CODE_80B815:
	LDA.b $12,x
	TAY
	LDA.w DATA_80B837,y
	PHX
	TAX
	LDA.w #$35A9
	STA.l $7E3A80,x
	PLX
	RTS

CODE_80B826:
	LDA.b $12,x
	TAY
	LDA.w DATA_80B837,y
	PHX
	TAX
	LDA.w #$2525
	STA.l $7E3A80,x
	PLX
	RTS

DATA_80B837:
	dw $0126,$0146,$0106,$0166,$016A,$014A,$012A,$010A

CODE_80B847:
	LDA.b $EA,x
	CMP.w #$0800
	BCC.b CODE_80B851
	LDA.w #$07FF
CODE_80B851:
	ASL
	ASL
	ASL
	XBA
	AND.w #$003E
	TAY
	LDA.w DATA_80B85D,y
	RTS

DATA_80B85D:
	dw $0000,$000C,$000B,$000A,$0009,$0008,$0007,$0006
	dw $0005,$0004,$0003,$0003,$0003,$0002,$0002,$0002
	dw $0002,$0001,$0001,$0001,$0001,$0001,$0001,$0001
	dw $0001,$0001,$0001,$0001,$0001,$0001,$0001,$0001
	dw $0000,$FF00,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF,$00FF,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$FF00,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF
	db $FF

;--------------------------------------------------------------------

CODE_80B900:
	LDA.l $2FFFFF
	LDA.l $2FFFFF
	LDA.l $2FFFFF
	LDA.l $2FFFFF
	JMP.w CODE_80B900

;--------------------------------------------------------------------

CODE_80B913:
	LDX.w #CODE_818200
	JSL.l CODE_81CC26
	RTS

;--------------------------------------------------------------------

CODE_80B91B:
	LDX.w #CODE_818179
	JSL.l CODE_81CC26
	RTS

;--------------------------------------------------------------------

CODE_80B923:
	JSL.l CODE_818587
	RTS

;--------------------------------------------------------------------

CODE_80B928:
	JSL.l CODE_81856D
	RTS

;--------------------------------------------------------------------

CODE_80B92D:
	LDA.w $1EF6
	BEQ.b CODE_80B93D
	LDA.w $0FA8
	BEQ.b CODE_80B93A
CODE_80B937:
	DEC
	BNE.b CODE_80B937
CODE_80B93A:
	JMP.w ($1EF6)

CODE_80B93D:
	RTS

;--------------------------------------------------------------------

CODE_80B93E:
	JSL.l CODE_8194C2
	RTS

;--------------------------------------------------------------------

CODE_80B943:
	LDX.w #DATA_80B94B
	JSL.l CODE_819578
	RTS

DATA_80B94B:
	dw DATA_80B95C
	dw DATA_80B963
	dw DATA_80B955
	dw DATA_80B96A
	dw $0000

DATA_80B955:
	dw $0000 : dl $000F80 : dw $0080

DATA_80B95C:
	dw $0000 : dl $000C00 : dw $0180

DATA_80B963:
	dw $0000 : dl $001800 : dw $0700

DATA_80B96A:
	dw $0000 : dl $7FDE00 : dw $0100

;--------------------------------------------------------------------

CODE_80B971:
	LDA.w $1D80
	BEQ.b CODE_80B9A2
	STZ.w $1D80
	STA.w DMA[$00].SizeLo
	SEP.b #$20
	LDX.w #(!REGISTER_WriteToVRAMPortLo&$0000FF<<8)+$01
	STX.w DMA[$00].Parameters
	LDX.w $1D82
	STX.w DMA[$00].SourceLo
	LDA.w $1D84
	STA.w DMA[$00].SourceBank
	LDA.b #$80
	STA.w !REGISTER_VRAMAddressIncrementValue
	LDX.w $1D86
	STX.w !REGISTER_VRAMAddressLo
	LDA.b #$01
	STA.w !REGISTER_DMAEnable
	REP.b #$20
CODE_80B9A2:
	RTS

;--------------------------------------------------------------------

CODE_80B9A3:
	LDA.w $1DDC
	BEQ.b CODE_80B9AE
	LDX.w #$0000
	JSR.w CODE_80B9B6
CODE_80B9AE:
	LDA.w $1DDE
	BEQ.b CODE_80B9C5
	LDX.w #$0002
CODE_80B9B6:
	LDA.w $1DE0,x
	STA.b $88,x
	LDA.w $1DE4,x
	STA.b $8C,x
	LDA.w $1DE8,x
	STA.b $94,x
CODE_80B9C5:
	RTS

;--------------------------------------------------------------------

CODE_80B9C6:
	PHB
	PHK
	PLB
	JSR.w CODE_808675
	PLB
	RTL

;--------------------------------------------------------------------

CODE_80B9CE:
	JMP.w CODE_80B971

;--------------------------------------------------------------------

CODE_80B9D1:
	PEA.w $8081
	PLB
	JSL.l CODE_81A16E
	PLB
	RTS

;--------------------------------------------------------------------

CODE_80B9DB:
	LDA.w #$0000
	RTL

;--------------------------------------------------------------------

CODE_80B9DF:
	SEP.b #$30
	LDX.b #$02
CODE_80B9E3:
	LDA.b $21,x
	AND.b #$0F
	LDY.w $0D16,x
	JSR.w CODE_80BA11
	STA.b $00
	LDA.b $29,x
	AND.b #$F0
	ORA.b $00
	STA.w $0D13,x
	LDA.b $28,x
	STA.w $0D12,x
	TYA
	STA.w $0D16,x
	DEX
	DEX
	BPL.b CODE_80B9E3
	REP.b #$30
	LDA.w $0D12
	ORA.w $0D14
	STA.w $0D10
	RTL

CODE_80BA11:
	STY.b $00
	CLC
	TAY
	BEQ.b CODE_80BA23
	SEC
	LDY.b $00
	BEQ.b CODE_80BA22
	CPY.b #$12
	BCC.b CODE_80BA22
	LDY.b #$0C
CODE_80BA22:
	INY
CODE_80BA23:
	BCS.b CODE_80BA27
	LDA.b #$00
CODE_80BA27:
	RTS

;--------------------------------------------------------------------

CODE_80BA28:
	PHB
	PHK
	PLB
	STX.w $1F28
	LDX.w #$1F28
	JSR.w (!ContextDependentTable,x)
	PLB
	RTL

;--------------------------------------------------------------------

CODE_80BA36:
	PHB
	PHK
	PLB
	JSR.w (!ContextDependentTable,x)
	PLB
	RTL

;--------------------------------------------------------------------

CODE_80BA3E:
	JSL.l CODE_84DF38
	RTS

;--------------------------------------------------------------------

CODE_80BA43:
	LDX.w #$7F0000
	JSL.l CODE_84E09E
	RTS

;--------------------------------------------------------------------

CODE_80BA4B:
	JSL.l CODE_84E473
	RTS

;--------------------------------------------------------------------

CODE_80BA50:
	PEA.w $8085
	PLB
	LDX.b $B8
	LDY.b $C8,x
	BMI.b CODE_80BA5E
	JSL.l CODE_85DFB4
CODE_80BA5E:
	PLB
	RTS

;--------------------------------------------------------------------

CODE_80BA60:
	RTS

;--------------------------------------------------------------------

CODE_80BA61:
	JSL.l CODE_81BECA
	BRA.b CODE_80BA71

CODE_80BA67:
	JSL.l CODE_81D60E
	BRA.b CODE_80BA71

CODE_80BA6D:
	JSL.l CODE_8192D7
CODE_80BA71:
	JSL.l CODE_81D77A
	JSL.l CODE_83F32E
	JSL.l CODE_81BA4A
	JSL.l CODE_81B7D7
	JSR.w CODE_80FC2C
	JSR.w CODE_80F68D
	JSL.l CODE_81BCDD
	JMP.w CODE_80B971

;--------------------------------------------------------------------

CODE_80BA8E:
	JSL.l CODE_83F32E
	JSL.l CODE_81BA4A
	RTS

;--------------------------------------------------------------------

CODE_80BA97:
	PHB
	PHK
	PLB
	JSR.w CODE_80BBCC
	LDY.b $B2
	BRA.b CODE_80BAAE

CODE_80BAA1:
	STY.b $B4
	LDX.b $04,y
	INX
	INX
	JSR.w (!ContextDependentTable,x)
	LDX.b $B4
	LDY.b $02,x
CODE_80BAAE:
	CPY.w #$00B0
	BNE.b CODE_80BAA1
	JSR.w CODE_80EC30
	BIT.b $C8
	BVS.b CODE_80BAD5
	LDA.w $0D28
	BNE.b CODE_80BAD5
	LDY.b $C2
	BRA.b CODE_80BAD0

CODE_80BAC3:
	STY.b $B4
	LDX.b $04,y
	INX
	INX
	JSR.w (!ContextDependentTable,x)
	LDX.b $B4
	LDY.b $02,x
CODE_80BAD0:
	CPY.w #$00C0
	BNE.b CODE_80BAC3
CODE_80BAD5:
	PLB
	RTL

;--------------------------------------------------------------------

CODE_80BAD7:
	PHB
	PHK
	PLB
	JSR.w CODE_80BBCC
	LDX.w #$00B0
	STX.w $0FF0
	LDX.w #$00C0
	STX.w $0FF4
CODE_80BAE9:
	LDX.w $0FF0
	LDY.b $02,x
	CPY.w #$00B0
	BNE.b CODE_80BAFF
	LDX.w $0FF4
	LDY.b $02,x
	CPY.w #$00C0
	BNE.b CODE_80BB19
	BEQ.b CODE_80BB27			; Note: This will always branch.

CODE_80BAFF:
	TYA
	LDX.w $0FF4
	LDY.b $02,x
	CPY.w #$00C0
	BEQ.b CODE_80BB13
	TAX
	LDA.b $06,x
	CMP.w !ContextDependentTable+$06,y
	BCC.b CODE_80BB19
	TXA
CODE_80BB13:
	STA.w $0FF0
	TAY
	BRA.b CODE_80BB1C

CODE_80BB19:
	STY.w $0FF4
CODE_80BB1C:
	STY.b $B4
	LDX.b $04,y
	INX
	INX
	JSR.w (!ContextDependentTable,x)
	BRA.b CODE_80BAE9

CODE_80BB27:
	JSR.w CODE_80EC30
	PLB
	RTL

;--------------------------------------------------------------------

CODE_80BB2C:
	PHB
	PHK
	PLB
	JSR.w CODE_80BBCC
	LDY.b $BE
	BRA.b CODE_80BB43

CODE_80BB36:
	STY.b $B4
	LDX.b $0C,y
	INX
	INX
	JSR.w (!ContextDependentTable,x)
	LDX.b $B4
	LDY.b $0A,x
CODE_80BB43:
	CPY.w #$00B4
	BNE.b CODE_80BB36
	JSR.w CODE_80EC30
	BIT.b $CA
	BVS.b CODE_80BB6A
	LDA.w $0D28
	BNE.b CODE_80BB6A
	LDY.b $C6
	BRA.b CODE_80BB65

CODE_80BB58:
	STY.b $B4
	LDX.b $04,y
	INX
	INX
	JSR.w (!ContextDependentTable,x)
	LDX.b $B4
	LDY.b $02,x
CODE_80BB65:
	CPY.w #$00C4
	BNE.b CODE_80BB58
CODE_80BB6A:
	PLB
	RTL

;--------------------------------------------------------------------

CODE_80BB6C:
	PHB
	PHK
	PLB
	JSR.w CODE_80BBCC
	LDX.w #$00B4
	STX.w $0FF0
	LDX.w #$00C4
	STX.w $0FF4
CODE_80BB7E:
	LDX.w $0FF0
	LDY.b $0A,x
	CPY.w #$00B4
	BNE.b CODE_80BB94
	LDX.w $0FF4
	LDY.b $02,x
	CPY.w #$00C4
	BNE.b CODE_80BBB9
	BEQ.b CODE_80BBC7			; Note: This will always branch.

CODE_80BB94:
	TYA
	LDX.w $0FF4
	LDY.b $02,x
	CPY.w #$00C4
	BEQ.b CODE_80BBA8
	TAX
	LDA.b $0E,x
	CMP.w !ContextDependentTable+$0E,y
	BCC.b CODE_80BBB9
	TXA
CODE_80BBA8:
	STA.w $0FF0
	TAY
	STY.b $B4
	LDX.b $0C,y
	INX
	INX
	JSR.w (!ContextDependentTable,x)
	BRA.b CODE_80BB7E

CODE_80BBB7:
	BRA.b CODE_80BBBC

CODE_80BBB9:
	STY.w $0FF4
CODE_80BBBC:
	STY.b $B4
	LDX.b $04,y
	INX
	INX
	JSR.w (!ContextDependentTable,x)
	BRA.b CODE_80BB7E

CODE_80BBC7:
	JSR.w CODE_80EC30
	PLB
	RTL

;--------------------------------------------------------------------

CODE_80BBCC:
	LDX.b $B8
	LDA.w $1E96,x
	BPL.b CODE_80BBFE
	LDA.w $1EB0,x
	BMI.b CODE_80BBE2
	ORA.w #$8000
	STA.w $1EB0,x
	JSL.l CODE_81AF50
CODE_80BBE2:
	LDA.w #$0020
	STA.w $1EF8,x
	JSL.l CODE_81BB4A
	LDX.w #CODE_81D3A1
	JSL.l CODE_81CC26
	LDX.w #CODE_81D3B0
	JSL.l CODE_81CC26
	JSL.l CODE_81AFB4
CODE_80BBFE:
	RTS

;--------------------------------------------------------------------

DATA_80BBFF:
	dw $1555,$0545,$1151,$0141,$1454,$0444,$1050,$0040

;--------------------------------------------------------------------

CODE_80BC0F:
	LDA.w !ContextDependentTable+$06,x
	CLC
	ADC.b $1E
	STA.b $1E
CODE_80BC17:
	LDA.w #$00AA
	BRA.b CODE_80BC27

CODE_80BC1C:
	LDA.w !ContextDependentTable+$06,x
	CLC
	ADC.b $1E
	STA.b $1E
	LDA.w #$0000
CODE_80BC27:
	STA.b $0B
	LDA.w !ContextDependentTable+$04,x
	STA.b $04
	LDY.w !ContextDependentTable+$02,x
	BIT.b $1A
	BVS.b CODE_80BC39
	BPL.b CODE_80BC3C
	INX
	INX
CODE_80BC39:
	LDY.w !ContextDependentTable+$08,x
CODE_80BC3C:
	STZ.b $00
	LDX.b $3C
	LDA.b $1E
	CLC
	ADC.w !ContextDependentTable+$00,y
	STA.b $01,x
	LDA.b $1C
	CLC
	ADC.w !ContextDependentTable+$02,y
	SEP.b #$20
	STA.b $00,x
	XBA
	LSR
	ROL.b $00
	REP.b #$21
	LDA.b $1E
	ADC.w !ContextDependentTable+$04,y
	STA.b $05,x
	LDA.b $1C
	CLC
	ADC.w !ContextDependentTable+$06,y
	SEP.b #$20
	STA.b $04,x
	XBA
	LSR
	ROL.b $00
	ASL.b $00
	ASL.b $00
	LDA.b #$E0
	STA.b $09,x
	STA.b $0D,x
	REP.b #$21
	LDY.b $04
	JMP.w CODE_80BD1C

CODE_80BC7E:
	LDA.w !ContextDependentTable+$06,x
	CLC
	ADC.b $1E
	STA.b $1E
CODE_80BC86:
	LDA.w #$00AA
	BRA.b CODE_80BC96

CODE_80BC8B:
	LDA.w !ContextDependentTable+$06,x
	CLC
	ADC.b $1E
	STA.b $1E
CODE_80BC93:
	LDA.w #$0000
CODE_80BC96:
	STA.b $0B
	LDA.w !ContextDependentTable+$04,x
	STA.b $04
	LDY.w !ContextDependentTable+$02,x
	BIT.b $1A
	BVS.b CODE_80BCA8
	BPL.b CODE_80BCAB
	INX
	INX
CODE_80BCA8:
	LDY.w !ContextDependentTable+$08,x
CODE_80BCAB:
	LDX.b $3C
	STZ.b $00
	LDA.b $1E
	CLC
	ADC.w !ContextDependentTable,y
	STA.b $01,x
	LDA.b $1C
	CLC
	ADC.w !ContextDependentTable+$02,y
	SEP.b #$20
	STA.b $00,x
	XBA
	LSR
	ROL.b $00
	REP.b #$21
	LDA.b $1E
	ADC.w !ContextDependentTable+$04,y
	STA.b $05,x
	LDA.b $1C
	CLC
	ADC.w !ContextDependentTable+$06,y
	SEP.b #$20
	STA.b $04,x
	XBA
	LSR
	ROL.b $00
	REP.b #$21
	LDA.b $1E
	ADC.w !ContextDependentTable+$08,y
	STA.b $09,x
	LDA.b $1C
	CLC
	ADC.w !ContextDependentTable+$0A,y
	SEP.b #$20
	STA.b $08,x
	XBA
	LSR
	ROL.b $00
	REP.b #$21
	LDA.b $1E
	ADC.w !ContextDependentTable+$0C,y
	STA.b $0D,x
	LDA.b $1C
	CLC
	ADC.w !ContextDependentTable+$0E,y
	SEP.b #$20
	STA.b $0C,x
	XBA
	LSR
	ROL.b $00
	REP.b #$21
	LDY.b $04
	LDA.w !ContextDependentTable+$06,y
	EOR.b $1A
	STA.b $0E,x
	LDA.w !ContextDependentTable+$04,y
	EOR.b $1A
	STA.b $0A,x
CODE_80BD1C:
	LDA.w !ContextDependentTable+$02,y
	EOR.b $1A
	STA.b $06,x
	LDA.w !ContextDependentTable,y
	EOR.b $1A
	STA.b $02,x
	TXA
	ADC.w #$0010
	STA.b $3C
	TXA
	LSR
	LSR
	LSR
	LSR
	ADC.b $CC
	TAX
	SEP.b #$20
	LDY.b $00
	LDA.w DATA_80BBFF,y
	ORA.b $0B
	STA.b $00,x
	REP.b #$20
	RTS

;--------------------------------------------------------------------

DATA_80BD46:
	dw $FFFC,$FFF8

DATA_80BD4A:
	dw $FFFC,$FFF7

DATA_80BD4E:
	dw $FFF8,$FFF0

DATA_80BD52:
	dw $FFF8,$FFEF

CODE_80BD56:
	LDA.w #$0003
	LDY.w #DATA_80BD52
	BRA.b CODE_80BD84

CODE_80BD5E:
	LDA.w !ContextDependentTable+$04,x
	CLC
	ADC.b $1E
	STA.b $1E
CODE_80BD66:
	LDA.w #$0003
	LDY.w #DATA_80BD4E
	BRA.b CODE_80BD84

CODE_80BD6E:
	LDA.w #$0001
	LDY.w #DATA_80BD4A
	BRA.b CODE_80BD84

CODE_80BD76:
	LDA.w !ContextDependentTable+$04,x
	CLC
	ADC.b $1E
	STA.b $1E
CODE_80BD7E:
	LDA.w #$0001
	LDY.w #DATA_80BD46
CODE_80BD84:
	STA.b $0B
	LDA.w !ContextDependentTable+$02,x
	LDX.b $3C
	EOR.b $1A
	STA.b $02,x
	LDA.w !ContextDependentTable,y
	CLC
	ADC.b $1C
	SEP.b #$20
	STA.b $00,x
	XBA
	AND.b #$01
	EOR.b $0B
	STA.b $0B
	REP.b #$21
	LDA.w !ContextDependentTable+$02,y
	ADC.b $1E
	SEP.b #$20
	STA.b $01,x
	LDA.b #$E0
	STA.b $05,x
	STA.b $09,x
	STA.b $0D,x
	REP.b #$21
	TXA
	ADC.w #$0010
	STA.b $3C
	LSR
	LSR
	LSR
	LSR
	ADC.b $CC
	TAY
	LDA.b $0B
	STA.w !ContextDependentTable-$01,y
	RTS

;--------------------------------------------------------------------

CODE_80BDC8:
	STX.b $12
	STY.b $10
	CLC
	ADC.b $CE
	TAY
	LDA.b $10
	ADC.b $BA
	STA.b $10
	LDX.b $14	
	LDA.w !ContextDependentTable,x
	AND.w #$00FF
	DEC
	ASL
	TAX
	LDA.b $14
	ADC.l DATA_80BE54,x
	PHA
	LDA.w #$E0E0
	JSR.w (DATA_80BE64,x)
	CLC
	JSR.w (DATA_80BE84,x)
	TXA
	LSR
	LSR
	LSR
	LSR
	ADC.b $CC
	TAX
	PLY
	LDA.w !ContextDependentTable,y
	STA.b $00,x
	RTL

CODE_80BE01:
	PEA.w $807E
	PLB
	STX.b $12
	STY.b $10
	LDA.b $3C
	TAY
	CLC
	ADC.w #$0020
	STA.b $3C
	LDX.b $14
	LDA.w $7E0000,x
	AND.w #$00FF
	DEC
	ASL
	TAX
	LDA.b $14
	ADC.l DATA_80BE54,x
	PHA
	LDA.w #$E0E0
	JSR.w (DATA_80BE64,x)
	BIT.b $12
	BVC.b CODE_80BE3E
	SEP.b #$21
	LDA.b $10
	SBC.b #$0F
	STA.b $10
	LDA.b #$FF
	STA.b $04
	REP.b #$21
	BRA.b CODE_80BE41

CODE_80BE3E:
	CLC
	STZ.b $04
CODE_80BE41:
	JSR.w (DATA_80BE74,x)
	TXA
	LSR
	LSR
	LSR
	LSR
	ADC.b $CC
	TAX
	PLY
	LDA.w $7E0000,y
	STA.b $00,x
	PLB
	RTS

DATA_80BE54:
	dw $0005,$0009,$000D,$0011,$0015,$0019,$001D,$0021

DATA_80BE64:
	dw CODE_80C040
	dw CODE_80C043
	dw CODE_80C046
	dw CODE_80C049
	dw CODE_80C04C
	dw CODE_80C04F
	dw CODE_80C052
	dw CODE_80C055

DATA_80BE74:
	dw CODE_80BEB8
	dw CODE_80BEB2
	dw CODE_80BEAC
	dw CODE_80BEA6
	dw CODE_80BEA0
	dw CODE_80BE9A
	dw CODE_80BE94
	dw CODE_80BF64

DATA_80BE84:
	dw CODE_80BEE2
	dw CODE_80BEDC
	dw CODE_80BED6
	dw CODE_80BED0
	dw CODE_80BECA
	dw CODE_80BEC4
	dw CODE_80BEBE
	dw CODE_80BEE8

CODE_80BE94:
	TYX
	LDY.b $14
	JMP.w CODE_80BF82

CODE_80BE9A:
	TYX
	LDY.b $14
	JMP.w CODE_80BF9D

CODE_80BEA0:
	TYX
	LDY.b $14
	JMP.w CODE_80BFB8

CODE_80BEA6:
	TYX
	LDY.b $14
	JMP.w CODE_80BFD3

CODE_80BEAC:
	TYX
	LDY.b $14
	JMP.w CODE_80BFEE

CODE_80BEB2:
	TYX
	LDY.b $14
	JMP.w CODE_80C009

CODE_80BEB8:
	TYX
	LDY.b $14
	JMP.w CODE_80C024

CODE_80BEBE:
	TYX
	LDY.b $14
	JMP.w CODE_80BEFA

CODE_80BEC4:
	TYX
	LDY.b $14
	JMP.w CODE_80BF09

CODE_80BECA:
	TYX
	LDY.b $14
	JMP.w CODE_80BF18

CODE_80BED0:
	TYX
	LDY.b $14
	JMP.w CODE_80BF27

CODE_80BED6:
	TYX
	LDY.b $14
	JMP.w CODE_80BF36

CODE_80BEDC:
	TYX
	LDY.b $14
	JMP.w CODE_80BF45

CODE_80BEE2:
	TYX
	LDY.b $14
	JMP.w CODE_80BF54

CODE_80BEE8:
	TYX
	LDY.b $14
	LDA.w $001F,y
	EOR.b $12
	STA.b $1E,x
	CLC
	LDA.w $001D,y
	ADC.b $10
	STA.b $1C,x
CODE_80BEFA:
	LDA.w $001B,y
	EOR.b $12
	STA.b $1A,x
	CLC
	LDA.w $0019,y
	ADC.b $10
	STA.b $18,x
CODE_80BF09:
	LDA.w $0017,y
	EOR.b $12
	STA.b $16,x
	CLC
	LDA.w $0015,y
	ADC.b $10
	STA.b $14,x
CODE_80BF18:
	LDA.w $0013,y
	EOR.b $12
	STA.b $12,x
	CLC
	LDA.w $0011,y
	ADC.b $10
	STA.b $10,x
CODE_80BF27:
	LDA.w $000F,y
	EOR.b $12
	STA.b $0E,x
	CLC
	LDA.w $000D,y
	ADC.b $10
	STA.b $0C,x
CODE_80BF36:
	LDA.w $000B,y
	EOR.b $12
	STA.b $0A,x
	CLC
	LDA.w $0009,y
	ADC.b $10
	STA.b $08,x
CODE_80BF45:
	LDA.w $0007,y
	EOR.b $12
	STA.b $06,x
	CLC
	LDA.w $0005,y
	ADC.b $10
	STA.b $04,x
CODE_80BF54:
	LDA.w $0003,y
	EOR.b $12
	STA.b $02,x
	CLC
	LDA.w $0001,y
	ADC.b $10
	STA.b $00,x
	RTS

CODE_80BF64:
	TYX
	LDY.b $14
	LDA.w $001F,y
	EOR.b $12
	STA.b $1E,x
	SEP.b #$20
	LDA.w $001E,y
	ADC.b $11
	XBA
	CLC
	LDA.w $001D,y
	EOR.b $04
	ADC.b $10
	REP.b #$21
	STA.b $1C,x
CODE_80BF82:
	LDA.w $001B,y
	EOR.b $12
	STA.b $1A,x
	SEP.b #$20
	LDA.w $001A,y
	ADC.b $11
	XBA
	CLC
	LDA.w $0019,y
	EOR.b $04
	ADC.b $10
	REP.b #$21
	STA.b $18,x
CODE_80BF9D:
	LDA.w $0017,y
	EOR.b $12
	STA.b $16,x
	SEP.b #$20
	LDA.w $0016,y
	ADC.b $11
	XBA
	CLC
	LDA.w $0015,y
	EOR.b $04
	ADC.b $10
	REP.b #$21
	STA.b $14,x
CODE_80BFB8:
	LDA.w $0013,y
	EOR.b $12
	STA.b $12,x
	SEP.b #$20
	LDA.w $0012,y
	ADC.b $11
	XBA
	CLC
	LDA.w $0011,y
	EOR.b $04
	ADC.b $10
	REP.b #$21
	STA.b $10,x
CODE_80BFD3:
	LDA.w $000F,y
	EOR.b $12
	STA.b $0E,x
	SEP.b #$20
	LDA.w $000E,y
	ADC.b $11
	XBA
	CLC
	LDA.w $000D,y
	EOR.b $04
	ADC.b $10
	REP.b #$21
	STA.b $0C,x
CODE_80BFEE:
	LDA.w $000B,y
	EOR.b $12
	STA.b $0A,x
	SEP.b #$20
	LDA.w $000A,y
	ADC.b $11
	XBA
	CLC
	LDA.w $0009,y
	EOR.b $04
	ADC.b $10
	REP.b #$21
	STA.b $08,x
CODE_80C009:
	LDA.w $0007,y
	EOR.b $12
	STA.b $06,x
	SEP.b #$20
	LDA.w $0006,y
	ADC.b $11
	XBA
	CLC
	LDA.w $0005,y
	EOR.b $04
	ADC.b $10
	REP.b #$21
	STA.b $04,x
CODE_80C024:
	LDA.w $0003,y
	EOR.b $12
	STA.b $02,x
	SEP.b #$20
	LDA.w $0002,y
	ADC.b $11
	XBA
	CLC
	LDA.w $0001,y
	EOR.b $04
	ADC.b $10
	REP.b #$21
	STA.b $00,x
	RTS

CODE_80C040:
	STA.w $0005,y
CODE_80C043:
	STA.w $0009,y
CODE_80C046:
	STA.w $000D,y
CODE_80C049:
	STA.w $0011,y
CODE_80C04C:
	STA.w $0015,y
CODE_80C04F:
	STA.w $0019,y
CODE_80C052:
	STA.w $001D,y
CODE_80C055:
	RTS

CODE_80C056:
	STA.b $00
	LDA.w #$3000
	BIT.w $0162
	BMI.b CODE_80C063
	ORA.w #$0100
CODE_80C063:
	STA.b $08
	SEP.b #$20
	LDX.w #$0000
	LDA.w !ContextDependentTable,y
	BPL.b CODE_80C074
	LDX.w #$AAAA
	AND.b #$7F
CODE_80C074:
	PHA
	LSR
	LSR
	STA.b $06
	STX.b $04
	INY
	LDX.b $3C
	BRA.b CODE_80C085

CODE_80C080:
	LDA.b #$04
	JSR.w CODE_80C096
CODE_80C085:
	DEC.b $06
	BPL.b CODE_80C080
	PLA
	AND.b #$03
	BEQ.b CODE_80C091
	JSR.w CODE_80C096
CODE_80C091:
	REP.b #$20
	STX.b $3C
	RTL

CODE_80C096:
	STA.b $02
	PHX
	REP.b #$21
	TXA
	LSR
	LSR
	LSR
	LSR
	CLC
	ADC.b $CC
	TAX
	SEP.b #$20
	LDA.b $04
	STA.b $00,x
	PLX
CODE_80C0AB:
	LDA.w !ContextDependentTable,y
	CLC
	ADC.b $00
	STA.b $00,x
	LDA.w !ContextDependentTable+$01,y
	CLC
	ADC.b $01
	STA.b $01,x
	REP.b #$21
	LDA.w !ContextDependentTable+$02,y
	ORA.b $08
	STA.b $02,x
	SEP.b #$20
	INX
	INX
	INX
	INX
	INY
	INY
	INY
	INY
	INY
	DEC.b $02
	BNE.b CODE_80C0AB
	RTS

DATA_80C0D4:
	dw $0040,$00A0

CODE_80C0D8:
	LDA.w #$FF00
	BRA.b CODE_80C0F5

CODE_80C0DD:
	LDA.w #$FFE0
	BRA.b CODE_80C0F5

CODE_80C0E2:
	PHX
	LDX.b $B4
	LDA.b $2E,x
	STA.b $1E
	LDA.b $2C,x
	BPL.b CODE_80C0DD
	CMP.w #$FF20
	BCC.b CODE_80C0D8
	SBC.w #$0020
CODE_80C0F5:
	STA.b $1C
	LDY.w #$0000
	LDA.b $84,x
	BEQ.b CODE_80C100
	INY
	INY
CODE_80C100:
	LDA.b $2A,x
	BPL.b CODE_80C10E
	AND.w #$7800
	EOR.w #$7900
	XBA
	LSR
	BRA.b CODE_80C113

CODE_80C10E:
	AND.w #$7800
	XBA
	LSR
CODE_80C113:
	ROR
	ADC.w DATA_80C0D4,y
	STA.b $30,x
	LDY.b $BA,x
	JMP.w CODE_80C161

CODE_80C11E:
	LDA.w #$FF00
	BRA.b CODE_80C13B

CODE_80C123:
	LDA.w #$FFE0
	BRA.b CODE_80C13B

CODE_80C128:
	PHX
	LDX.b $B4
	LDA.b $34,x
	STA.b $1E
	LDA.b $32,x
	BPL.b CODE_80C123
	CMP.w #$FF20
	BCC.b CODE_80C11E
	SBC.w #$0020
CODE_80C13B:
	STA.b $1C
	LDY.w #$0000
	LDA.b $84,x
	BEQ.b CODE_80C146
	INY
	INY
CODE_80C146:
	LDA.b $2A,x
	BPL.b CODE_80C154
	AND.w #$7800
	EOR.w #$7900
	XBA
	LSR
	BRA.b CODE_80C159

CODE_80C154:
	AND.w #$7800
	XBA
	LSR
CODE_80C159:
	ROR
	ADC.w DATA_80C0D4,y
	STA.b $36,x
	LDY.b $BC,x
CODE_80C161:
	TYA
	LSR
	AND.w #$4000
	TSB.b $1A
	STZ.b $00
	TYA
	ASL
	CMP.w #$0140
	BCC.b CODE_80C173
	DEC.b $00
CODE_80C173:
	TYA
	LDY.w #DATA_80C21F
	AND.w #$001E
	BEQ.b CODE_80C184
	CMP.w #$001E
	BEQ.b CODE_80C184
	LDY.w #DATA_80C217
CODE_80C184:
	LDA.b $82,x
	BEQ.b CODE_80C18D
	LDA.w $1EE4
	BEQ.b CODE_80C194
CODE_80C18D:
	LDA.b $10,x
	AND.w #$0020
	BEQ.b CODE_80C1A3
CODE_80C194:
	LDX.b $3C
	LDA.w #$E0E0
	STA.b $00,x
	STA.b $04,x
	STA.b $08,x
	STA.b $0C,x
	BRA.b CODE_80C1F8

CODE_80C1A3:
	SEP.b #$20
	LDA.b $1E
	XBA
	LDA.b $1C
	REP.b #$21
	LDX.b $3C
	BIT.b $00
	BMI.b CODE_80C205
	BIT.b $1A
	BVS.b CODE_80C1CA
	STA.b $00,x
	ADC.w #$0010
	STA.b $04,x
	ADC.w #$1000
	STA.b $0C,x
	SEC
	SBC.w #$0010
	STA.b $08,x
	BRA.b CODE_80C1DC

CODE_80C1CA:
	STA.b $04,x
	ADC.w #$0010
	STA.b $00,x
	ADC.w #$1000
	STA.b $08,x
	SEC
	SBC.w #$0010
	STA.b $0C,x
CODE_80C1DC:
	LDA.w !ContextDependentTable,y
	EOR.b $1A
	STA.b $02,x
	LDA.w !ContextDependentTable+$02,y
	EOR.b $1A
	STA.b $06,x
	LDA.w !ContextDependentTable+$04,y
	EOR.b $1A
	STA.b $0A,x
	LDA.w !ContextDependentTable+$06,y
	EOR.b $1A
	STA.b $0E,x
CODE_80C1F8:
	TXA
	CLC
	ADC.w #$0010
	STA.b $3C
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

CODE_80C205:
	ADC.w #$0B08
	LDX.b $3C
	STA.b $00,x
	LDA.w #$E0E0
	STA.b $04,x
	STA.b $08,x
	STA.b $0C,x
	BRA.b CODE_80C1DC

DATA_80C217:
	dw $2000,$2002,$2020,$2022

DATA_80C21F:
	dw $2000,$6000,$2020,$6020

;--------------------------------------------------------------------

CODE_80C227:
	LDY.w #$00B0
	STY.b $B0
	STY.b $B2
	LDY.w #$00B4
	STY.b $BC
	STY.b $BE
	LDY.w #$00C0
	STY.b $C0
	STY.b $C2
	LDY.w #$00C4
	STY.b $C4
	STY.b $C6
	LDY.w #$0D00
	STY.w $0D60
	STY.w $0D62
	RTS

;--------------------------------------------------------------------

CODE_80C24D:
	BEQ.b CODE_80C259
	PHY
	LDY.w #$00B4
	STA.b $0C,x
	JSR.w CODE_80C267
	PLY
CODE_80C259:
	RTL

CODE_80C25A:
	BEQ.b CODE_80C266
	PHY
	LDY.w #$00B0
	STA.b $04,x
	JSR.w CODE_80C279
	PLY
CODE_80C266:
	RTL

CODE_80C267:
	PHY
	LDA.w !ContextDependentTable+$0A,y
	STX.b $0A,y
	TAY
	LDA.w !ContextDependentTable+$08,y
	STX.b $08,y
	STA.b $08,x
	STY.b $0A,x
	PLY
	RTS

CODE_80C279:
	PHY
	LDA.w !ContextDependentTable+$02,y
	STX.b $02,y
	TAY
	LDA.w !ContextDependentTable,y
	STX.b $00,y
	STA.b $00,x
	STY.b $02,x
	PLY
	RTS

;--------------------------------------------------------------------

CODE_80C28B:
	LDY.b $BE
	LDA.w !ContextDependentTable+$0A,y
	STX.b $0A,y
	STY.b $08,x
	TAY
	STY.b $0A,x
	STX.b $08,y
	LDY.b $B2
CODE_80C29B:
	LDA.w !ContextDependentTable+$02,y
	STX.b $02,y
	STY.b $00,x
	TAY
	STY.b $02,x
	STX.b $00,y
	RTL

;--------------------------------------------------------------------

CODE_80C2A8:
	PHX
	LDA.b ($04,x)
	TAY
	LDA.w !ContextDependentTable,y
	STX.b $00,y
	LDY.b $00,x
	STA.b $00,x
	LDA.b $02,x
	TAX
	STY.b $00,x
	STX.b $02,y
	BRA.b CODE_80C2C8

CODE_80C2BE:
	PHX
	LDY.b $00,x
	LDA.b $02,x
	TAX
	STY.b $00,x
	STX.b $02,y
CODE_80C2C8:
	PLX
	LDA.b $12,x
	ASL
	PHX
	LDY.b $08,x
	LDA.b $0A,x
	TAX
	STY.b $08,x
	STX.b $0A,y
	PLX
	BCC.b CODE_80C2E4
	STZ.b $12,x
	LDY.b $60,x
	LDA.b $62,x
	TAX
	STY.b $60,x
	STX.b $62,y
CODE_80C2E4:
	RTL

;--------------------------------------------------------------------

CODE_80C2E5:
	TXY
	LDX.w !ContextDependentTable+$02,y
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80C2EC:
	PHX
	TXY
	LDX.w !ContextDependentTable+$02,y
	JSR.w (!ContextDependentTable,x)
	PLX
	INX
	INX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80C2FC:
	TXY
	LDX.b $B4
	LDA.b $14,x
	STA.b $1A
	TYX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80C309:
	STX.b $02
	LDA.w !ContextDependentTable+$02,x
	STA.b $04
	LDY.w #$0000
	LDA.b $18
CODE_80C315:
	CMP.b ($04),y
	INY
	INY
	BCC.b CODE_80C315
	TYA
	ADC.b $02
	TAY
	LDX.w !ContextDependentTable+$01,y
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80C325:
	LDY.b $B4
	LDA.w $00BC,y
	BRA.b CODE_80C331

CODE_80C32C:
	LDY.b $B4
	LDA.w $00BA,y
CODE_80C331:
	AND.w #$01E0
	LSR
	LSR
	LSR
	LSR
	ADC.w !ContextDependentTable+$02,x
	TAY
	LDX.w !ContextDependentTable,y
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80C342:
	INX
	INX
CODE_80C344:
	LDA.b $BA,x
	BPL.b CODE_80C352
	TAY
	LDA.w #$4000
	TSB.b $1A
	TYA
	AND.w #$7FFF
CODE_80C352:
	CLC
	ADC.b $02
	TAY
	LDX.w !ContextDependentTable,y
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

DATA_80C35C:
	dw $0160,$0160,$0160,$0160,$0160,$8160,$8160,$8160
	dw $8160,$8160,$0160,$0160,$0160,$0160,$8160,$8160
	dw $8160,$8160

;--------------------------------------------------------------------

DATA_80C380:
	dw $0160,$0160,$0160,$8160,$8160,$8160,$0160,$0160
	dw $8160,$8160,$0160,$0160,$8160,$8160,$0160,$0160

DATA_80C3A0:
	dw $0000,$0020,$0040,$0060,$0080,$00A0,$00C0,$00E0
	dw $0100,$0120,$0140,$0140,$0140,$0140,$0140,$0140
	dw $0140,$0140

CODE_80C3C4:
	LDA.w !ContextDependentTable+$02,x
	STA.b $02
	LDA.w !ContextDependentTable+$04,x
	STA.b $04
	LDY.w #$FFFE
	LDA.b $18
CODE_80C3D3:
	INY
	INY
	CMP.b ($04),y
	BCC.b CODE_80C3D3
	LDX.b $B4
	LDA.b $84,x
	BEQ.b CODE_80C3E2
	JSR.w CODE_80C42A
CODE_80C3E2:
	LDA.b $2A,x
	SEC
	SBC.b $94
	BPL.b CODE_80C3F3
	AND.w #$7800
	EOR.w #$7900
	XBA
	LSR
	BRA.b CODE_80C3F8

CODE_80C3F3:
	AND.w #$7800
	XBA
	LSR
CODE_80C3F8:
	ROR
	ADC.w DATA_80C3A0,y
	BIT.w #$7FFF
	BNE.b CODE_80C404
	JSR.w CODE_80C40C
CODE_80C404:
	EOR.w $1E92
	STA.b $30,x
	JMP.w CODE_80C344

CODE_80C40C:
	LDA.b $88,x
	BPL.b CODE_80C426
	BIT.w #$00E0
	BNE.b CODE_80C426
	AND.w #$0018
	LSR
	LSR
	TAY
	LDA.w DATA_80C58E,y
	BIT.b $88,x
	BVC.b CODE_80C425
	ORA.w #$8000
CODE_80C425:
	RTS

CODE_80C426:
	LDA.w #$0000
	RTS

CODE_80C42A:
	BMI.b CODE_80C436
	CMP.w #$0040
	BCC.b CODE_80C43D
	CMP.w #$0400
	BCS.b CODE_80C43D
CODE_80C436:
	TYA
	CLC
	ADC.w #$0008
	TAY
	RTS

CODE_80C43D:
	CLC
	AND.w #$0008
	BEQ.b CODE_80C436
	INY
	INY
	INY
	INY
	RTS

;--------------------------------------------------------------------

DATA_80C448:
	dw $0400,$0400,$0400,$0400,$00E0,$00C0,$00A0,$0080
	dw $0050,$0020,$0000

CODE_80C45E:
	LDA.w !ContextDependentTable+$02,x
	STA.b $02
	LDA.w !ContextDependentTable+$04,x
	STA.b $04
	LDY.w #$FFFE
	LDA.b $18
CODE_80C46D:
	INY
	INY
	CMP.b ($04),y
	BCC.b CODE_80C46D
	LDX.b $B4
	LDA.b $84,x
	BEQ.b CODE_80C47C
	JSR.w CODE_80C42A
CODE_80C47C:
	LDA.b $8E,x
	BEQ.b CODE_80C485
	LDA.w #$2000
	TSB.b $1A
CODE_80C485:
	LDA.b $2A,x
	SEC
	SBC.b $94
	BPL.b CODE_80C496
	AND.w #$7800
	EOR.w #$7900
	XBA
	LSR
	BRA.b CODE_80C49B

CODE_80C496:
	AND.w #$7800
	XBA
	LSR
CODE_80C49B:
	ROR
	ADC.w DATA_80C3A0,y
	BIT.w #$7FFF
	BNE.b CODE_80C4A7
	JSR.w CODE_80C546
CODE_80C4A7:
	EOR.w $1E92
	STA.b $30,x
	TAY
	LDA.b $6C,x
	BPL.b CODE_80C4B6
	JSR.w CODE_80C4C1
	STA.b $30,x
CODE_80C4B6:
	JMP.w CODE_80C344

DATA_80C4B9:
	dw CODE_80C4F0
	dw CODE_80C4C9
	dw CODE_80C52E
	dw CODE_80C53D

CODE_80C4C1:
	STY.b $06
	TXY
	ASL
	TAX
	JMP.w (DATA_80C4B9,x)

CODE_80C4C9:
	LDA.w $00E4,y
	CMP.w #$0300
	BCC.b CODE_80C4D5
	TYX
	LDA.b $06
	RTS

CODE_80C4D5:
	LDA.w $1E9A,x
	INC.w $1E9A,x
	BIT.w #$0080
	BEQ.b CODE_80C4EB
	AND.w #$0078
	LSR
	LSR
	TAX
	LDA.w DATA_80C506,x
	BRA.b CODE_80C544

CODE_80C4EB:
	LDA.w #$0168
	BRA.b CODE_80C544

CODE_80C4F0:
	LDA.w $1E9A,x
	INC
	STA.w $1E9A,x
	AND.w #$0010
	BEQ.b CODE_80C501
	LDA.w DATA_80C526,x
	BRA.b CODE_80C544

CODE_80C501:
	LDA.w DATA_80C52A,x
	BRA.b CODE_80C544

DATA_80C506:
	dw $0000,$0000,$0000,$0000,$0000,$0162,$0164,$0164
	dw $0164,$0164,$0164,$0164,$0164,$0164,$0162,$0000

DATA_80C526:
	dw $0166,$0168

DATA_80C52A:
	dw $001E,$0000

CODE_80C52E:
	LDA.b $06
	AND.w #$7FFF
	CMP.w #$001E
	BNE.b CODE_80C542
	LDA.w #$0166
	BRA.b CODE_80C544

CODE_80C53D:
	LDA.w #$016A
	BRA.b CODE_80C544

CODE_80C542:
	LDA.b $06
CODE_80C544:
	TYX
	RTS

;--------------------------------------------------------------------

CODE_80C546:
	LDA.b $48,x
	BNE.b CODE_80C55B
	LDA.b $E2,x
	BIT.w #$0400
	BEQ.b CODE_80C567
	AND.w #$FBFF
	STA.b $E2,x
	LDA.w #$001C
	STA.b $5C,x
CODE_80C55B:
	DEC
	STA.b $48,x
	AND.w #$FFFE
	TAY
	LDA.w DATA_80C380,y
	BRA.b CODE_80C5CE

CODE_80C567:
	LDA.b $BA,x
	ASL
	BEQ.b CODE_80C571
	CMP.w #$02C0
	BCC.b CODE_80C59E
CODE_80C571:
	LDA.b $88,x
	BPL.b CODE_80C5A0
	BIT.w #$00E0
	BNE.b CODE_80C596
	AND.w #$0018
	LSR
	LSR
	TAY
	LDA.w DATA_80C58E,y
	BIT.b $88,x
	BVC.b CODE_80C58A
	ORA.w #$8000
CODE_80C58A:
	INC.b $88,x
	BRA.b CODE_80C5CE

DATA_80C58E:
	dw $0162,$0164,$0164,$0162

CODE_80C596:
	INC
	STA.b $88,x
	BIT.w #$0080
	BEQ.b CODE_80C5A0
CODE_80C59E:
	STZ.b $88,x
CODE_80C5A0:
	CPX.b $C8
	BNE.b CODE_80C5CB
	LDA.b $1F,x
	BNE.b CODE_80C5CB
CODE_80C5A8:
	CLC
	LDA.b $9E,x
	BEQ.b CODE_80C5CE
	BPL.b CODE_80C5B4
	EOR.w #$FFFF
	INC
	SEC
CODE_80C5B4:
	AND.w #$0006
	TAY
	PHP
	LDA.b $EA,x
	CMP.w #$0200
	BCS.b CODE_80C5C5
	LDA.w DATA_80C5D7,y
	BRA.b CODE_80C5C8

CODE_80C5C5:
	LDA.w DATA_80C5CF,y
CODE_80C5C8:
	PLP
	ROR
	RTS

CODE_80C5CB:
	LDA.w #$0000
CODE_80C5CE:
	RTS

DATA_80C5CF:
	dw $02C0,$02C0,$02C0,$0004

DATA_80C5D7:
	dw $02C0,$02C0,$02C0,$02C0

;--------------------------------------------------------------------

CODE_80C5DF:
	LDA.w !ContextDependentTable+$02,x
	STA.b $02
	LDA.w !ContextDependentTable+$04,x
	STA.b $04
	LDY.w #$FFFE
	LDA.b $18
CODE_80C5EE:
	INY
	INY
	CMP.b ($04),y
	BCC.b CODE_80C5EE
	LDX.b $B4
	LDA.b $84,x
	BEQ.b CODE_80C5FD
	JSR.w CODE_80C42A
CODE_80C5FD:
	LDA.b $2A,x
	SEC
	SBC.b $96
	BPL.b CODE_80C60E
	AND.w #$7800
	EOR.w #$7900
	XBA
	LSR
	BRA.b CODE_80C613

CODE_80C60E:
	AND.w #$7800
	XBA
	LSR
CODE_80C613:
	ROR
	ADC.w DATA_80C3A0,y
	BIT.w #$7FFF
	BNE.b CODE_80C61F
	JSR.w CODE_80C40C
CODE_80C61F:
	EOR.w $1E94
	STA.b $36,x
	JMP.w CODE_80C342

;--------------------------------------------------------------------

CODE_80C627:
	LDA.w !ContextDependentTable+$02,x
	STA.b $02
	LDA.w !ContextDependentTable+$04,x
	STA.b $04
	LDY.w #$FFFE
	LDA.b $18
CODE_80C636:
	INY
	INY
	CMP.b ($04),y
	BCC.b CODE_80C636
	LDX.b $B4
	LDA.b $84,x
	BEQ.b CODE_80C645
	JSR.w CODE_80C42A
CODE_80C645:
	LDA.b $8E,x
	BEQ.b CODE_80C64E
	LDA.w #$2000
	TSB.b $1A
CODE_80C64E:
	LDA.b $2A,x
	SEC
	SBC.b $96
	BPL.b CODE_80C65F
	AND.w #$7800
	EOR.w #$7900
	XBA
	LSR
	BRA.b CODE_80C664

CODE_80C65F:
	AND.w #$7800
	XBA
	LSR
CODE_80C664:
	ROR
	ADC.w DATA_80C3A0,y
	BIT.w #$7FFF
	BNE.b CODE_80C670
	JSR.w CODE_80C682
CODE_80C670:
	EOR.w $1E94
	STA.b $36,x
	TAY
	LDA.b $6E,x
	BPL.b CODE_80C67F
	JSR.w CODE_80C4C1
	STA.b $36,x
CODE_80C67F:
	JMP.w CODE_80C342

CODE_80C682:
	LDA.b $48,x
	BNE.b CODE_80C697
	LDA.b $E2,x
	BIT.w #$0400
	BEQ.b CODE_80C6A3
	AND.w #$FBFF
	STA.b $E2,x
	LDA.w #$001C
	STA.b $5C,x
CODE_80C697:
	DEC
	STA.b $48,x
	AND.w #$FFFE
	TAY
	LDA.w DATA_80C380,y
	BRA.b CODE_80C6E2

CODE_80C6A3:
	LDA.b $BC,x
	ASL
	BEQ.b CODE_80C6AD
	CMP.w #$02C0
	BCC.b CODE_80C6D2
CODE_80C6AD:
	LDA.b $88,x
	BPL.b CODE_80C6D4
	BIT.w #$00E0
	BNE.b CODE_80C6CA
	AND.w #$0018
	LSR
	LSR
	TAY
	LDA.w DATA_80C58E,y
	BIT.b $88,x
	BVC.b CODE_80C6C6
	ORA.w #$8000
CODE_80C6C6:
	INC.b $88,x
	BRA.b CODE_80C6E2

CODE_80C6CA:
	INC
	STA.b $88,x
	BIT.w #$0080
	BEQ.b CODE_80C6D4
CODE_80C6D2:
	STZ.b $88,x
CODE_80C6D4:
	CPX.b $CA
	BNE.b CODE_80C6DF
	LDA.b $1F,x
	BNE.b CODE_80C6DF
	JMP.w CODE_80C5A8

CODE_80C6DF:
	LDA.w #$0000
CODE_80C6E2:
	RTS

;--------------------------------------------------------------------

CODE_80C6E3:
	RTS

;--------------------------------------------------------------------

CODE_80C6E4:
	CLC
	LDA.w !ContextDependentTable+$02,x
	ADC.b $1E
	STA.b $1E
	TXY
	LDX.w !ContextDependentTable+$04,y
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80C6F3:
	LDA.w $0062,y
	STX.b $62,y
	TAY
	LDA.w $0060,y
	STX.b $60,y
	STA.b $60,x
	STY.b $62,x
	RTS

;--------------------------------------------------------------------

CODE_80C703:
	LDY.b $60,x
	LDA.b $62,x
	TAX
	STY.b $60,x
	STX.b $62,y
	RTS

;--------------------------------------------------------------------

CODE_80C70D:
	TXY
	BIT.b $CA
	BVS.b CODE_80C769
	LDX.b $B4
	LDA.b $0E,x
	CMP.w $0FBA
	BCS.b CODE_80C729
	LDA.w $1EFA
	CMP.w $1EFC
	BCS.b CODE_80C729
	LDX.w !ContextDependentTable+$02,y
	JMP.w (!ContextDependentTable,x)

CODE_80C729:
	LDA.w #$0140
	STA.b $36,x
	BRA.b CODE_80C751

CODE_80C730:
	TXY
	BIT.b $C8
	BVS.b CODE_80C769
	LDX.b $B4
	LDA.b $06,x
	CMP.w $0FBA
	BCS.b CODE_80C74C
	LDA.w $1EF8
	CMP.w $1EFC
	BCS.b CODE_80C74C
	LDX.w !ContextDependentTable+$02,y
	JMP.w (!ContextDependentTable,x)

CODE_80C74C:
	LDA.w #$0140
	STA.b $30,x
CODE_80C751:
	LDA.b $37
	AND.w #$0700
	ORA.w #$1000
	CMP.b $B4
	BNE.b CODE_80C763
	LDX.w !ContextDependentTable+$04,y
	JMP.w (!ContextDependentTable,x)

CODE_80C763:
	LDX.w !ContextDependentTable+$06,y
	JMP.w (!ContextDependentTable,x)

CODE_80C769:
	LDX.w !ContextDependentTable+$08,y
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80C76F:
	TXY
	LDX.b $B4
	SEP.b #$20
	LDA.b #!DSP1_Command06_ObjectProjectionCalculation
	STA.w !REGISTER_DSP1_DataRegister
	REP.b #$20
	LDA.b $18,x
	ASL
	ASL
	STA.w !REGISTER_DSP1_DataRegister
	LDA.b $1C,x
	ASL
	ASL
	STA.w !REGISTER_DSP1_DataRegister
	LDA.w #$0000
	STA.w !REGISTER_DSP1_DataRegister
	TYX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80C795:
	LDX.b $B4
	LDA.b $B8
	LSR
	LSR
CODE_80C79B:
	LDA.l !REGISTER_DSP1_StatusRegister
	BPL.b CODE_80C79B
	LDA.w !REGISTER_DSP1_DataRegister
	LDA.l $000000
	LDA.w !REGISTER_DSP1_DataRegister
	LDA.l $000000
	LDA.w !REGISTER_DSP1_DataRegister
	BCC.b CODE_80C7B7
	STA.b $0E,x
	RTS

CODE_80C7B7:
	STA.b $06,x
	RTS

;--------------------------------------------------------------------

CODE_80C7BA:
	TXY
	LDX.b $B4
	SEP.b #$20
	LDA.b #!DSP1_Command06_ObjectProjectionCalculation
	STA.w !REGISTER_DSP1_DataRegister
	REP.b #$20
	LDA.b $16,x
	STA.b $00
	LDA.b $18,x
	ASL.b $00
	ROL
	ASL.b $00
	ROL
	STA.w !REGISTER_DSP1_DataRegister
	LDA.b $1A,x
	STA.b $00
	LDA.b $1C,x
	ASL.b $00
	ROL
	ASL.b $00
	ROL
	STA.w !REGISTER_DSP1_DataRegister
	LDA.w #$0000
	STA.w !REGISTER_DSP1_DataRegister
	STZ.b $1A
	TYX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80C7F2:
	TXY
	LDX.b $B4
	SEP.b #$20
	LDA.b #!DSP1_Command06_ObjectProjectionCalculation
	STA.w !REGISTER_DSP1_DataRegister
	REP.b #$20
	LDA.b $16,x
	STA.b $00
	LDA.b $18,x
	ASL.b $00
	ROL
	ASL.b $00
	ROL
	STA.w !REGISTER_DSP1_DataRegister
	LDA.b $1A,x
	STA.b $00
	LDA.b $1C,x
	ASL.b $00
	ROL
	ASL.b $00
	ROL
	STA.w !REGISTER_DSP1_DataRegister
	LDA.b $1F,x
	LSR
	LSR
	LSR
	LSR
	LSR
	LSR
	CLC
	ADC.w #$FE00
	EOR.w #$FE00
	STA.w !REGISTER_DSP1_DataRegister
	STZ.b $1A
	TYX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80C836:
	TXY
	BIT.b $C8
	BPL.b CODE_80C857
	LDX.b $B4
	CLC
CODE_80C83E:
	LDA.l !REGISTER_DSP1_StatusRegister
	BPL.b CODE_80C83E
	LDA.w #$0000
	ADC.w !REGISTER_DSP1_DataRegister
	EOR.w #$FFFF
	SEC
	SBC.w #$007F
	STA.b $1C
	STA.b $2C,x
	BRA.b CODE_80C86A

CODE_80C857:
	LDX.b $B4
	CLC
CODE_80C85A:
	LDA.l !REGISTER_DSP1_StatusRegister
	BPL.b CODE_80C85A
	LDA.w #$FF80
	ADC.w !REGISTER_DSP1_DataRegister
	STA.b $1C
	STA.b $2C,x
CODE_80C86A:
	CLC
	LDA.w #$FF00
	ADC.b $98
	ADC.w !REGISTER_DSP1_DataRegister
	STA.b $1E
	STA.b $38,x
	STA.b $2E,x
	LDA.w !REGISTER_DSP1_DataRegister
	CMP.w #$0300
	STA.b $18
	STA.b $06,x
	BCS.b CODE_80C8AB
	LDA.b $1E
	ADC.w #$0120
	CMP.w #$00C0
	BCS.b CODE_80C8B0
	LDA.b $1C
	ADC.w #$0110
	CMP.w #$0120
	BCS.b CODE_80C8B0
	LDA.w $1EF8
	CMP.w $1EFC
	BCS.b CODE_80C8AB
	INC
	STA.w $1EF8
	TYX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

CODE_80C8AB:
	LDA.w #$0140
	STA.b $30,x
CODE_80C8B0:
	RTS

;--------------------------------------------------------------------

CODE_80C8B1:
	TXY
	BIT.b $CA
	BPL.b CODE_80C8DA
	LDX.b $B4
	LDA.b $3A,x
	STA.b $3C,x
	LDA.b $32,x
	STA.b $3E,x
	CLC
CODE_80C8C1:
	LDA.l !REGISTER_DSP1_StatusRegister
	BPL.b CODE_80C8C1
	LDA.w #$0000
	ADC.w !REGISTER_DSP1_DataRegister
	EOR.w #$FFFF
	SEC
	SBC.w #$007F
	STA.b $1C
	STA.b $32,x
	BRA.b CODE_80C8F5

CODE_80C8DA:
	LDX.b $B4
	LDA.b $3A,x
	STA.b $3C,x
	LDA.b $32,x
	STA.b $3E,x
	CLC
CODE_80C8E5:
	LDA.l !REGISTER_DSP1_StatusRegister
	BPL.b CODE_80C8E5
	LDA.w #$FF80
	ADC.w !REGISTER_DSP1_DataRegister
	STA.b $1C
	STA.b $32,x
CODE_80C8F5:
	CLC
	LDA.w #$FF00
	ADC.b $9A
	ADC.w !REGISTER_DSP1_DataRegister
	STA.b $1E
	STA.b $3A,x
	STA.b $34,x
	LDA.w !REGISTER_DSP1_DataRegister
	CMP.w #$0300
	STA.b $18
	STA.b $0E,x
	BCS.b CODE_80C916
	TYX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

CODE_80C916:
	LDA.w #$0140
	STA.b $36,x
	RTS

;--------------------------------------------------------------------

CODE_80C91C:
	TXY
	LDX.b $B4
	LDA.b $1F,x
	BEQ.b CODE_80C941
	SEP.b #$20
	LDA.b #!DSP1_Command00_16BitMultiplication
	STA.w !REGISTER_DSP1_DataRegister
	REP.b #$20
	LDA.b $1F,x
	STA.w !REGISTER_DSP1_DataRegister
	LDA.b $06,x
	ASL
	STA.w !REGISTER_DSP1_DataRegister
	SEC
	LDA.b $2E,x
	SBC.w !REGISTER_DSP1_DataRegister
	STA.b $1E
	STA.b $2E,x
CODE_80C941:
	TYX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80C947:
	TXY
	LDX.b $B4
	LDA.b $1F,x
	BEQ.b CODE_80C96C
	SEP.b #$20
	LDA.b #!DSP1_Command00_16BitMultiplication
	STA.w !REGISTER_DSP1_DataRegister
	REP.b #$20
	LDA.b $1F,x
	STA.w !REGISTER_DSP1_DataRegister
	LDA.b $0E,x
	ASL
	STA.w !REGISTER_DSP1_DataRegister
	SEC
	LDA.b $34,x
	SBC.w !REGISTER_DSP1_DataRegister
	STA.b $1E
	STA.b $34,x
CODE_80C96C:
	TYX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80C972:
	RTS

CODE_80C973:
	TXY
	LDX.b $B4
	LDA.b $82,x
	BNE.b CODE_80C972
	LDA.b $A0,x
	TAX
	LDA.w DATA_80CD7C,x
	AND.w #$005C
	BNE.b CODE_80C972
	LDX.b $B4
	LDA.b $1F,x
	BEQ.b CODE_80C972
	LDA.b $06,x
	CMP.w #$0300
	BCS.b CODE_80C972
	STA.b $18
	LDA.b $38,x
	STA.b $1E
	ADC.w #$0120
	CMP.w #$00C0
	BCS.b CODE_80C972
	LDA.b $2C,x
	STA.b $1C
	ADC.w #$0110
	CMP.w #$0120
	BCS.b CODE_80C972
	TYX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

CODE_80C9B2:
	TXY
	LDX.b $B4
	LDA.b $0E,x
	CMP.w #$0300
	BCS.b CODE_80CA27
	STA.b $18
	LDA.b $34,x
	STA.b $1E
	ADC.w #$00A0
	CMP.w #$00C0
	BCS.b CODE_80CA27
	LDA.b $32,x
	STA.b $1C
	ADC.w #$0110
	CMP.w #$0120
	BCS.b CODE_80CA27
	LDA.w $1EFA
	CMP.w $1EFC
	BCS.b CODE_80CA28
	INC
	STA.w $1EFA
	TYX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

CODE_80C9E8:
	TXY
	LDX.b $B4
	LDA.b $82,x
	BNE.b CODE_80CA27
	LDA.b $A0,x
	TAX
	LDA.w DATA_80CD7C,x
	AND.w #$005C
	BNE.b CODE_80CA27
	LDX.b $B4
	LDA.b $1F,x
	BEQ.b CODE_80CA27
	LDA.b $0E,x
	CMP.w #$0300
	BCS.b CODE_80CA27
	STA.b $18
	LDA.b $3C,x
	STA.b $1E
	ADC.w #$00A0
	CMP.w #$00C0
	BCS.b CODE_80CA27
	LDA.b $3E,x
	STA.b $1C
	ADC.w #$0110
	CMP.w #$0120
	BCS.b CODE_80CA27
	TYX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

CODE_80CA27:
	RTS

CODE_80CA28:
	BIT.b $12,x
	BMI.b CODE_80CA27
	LDA.w #$0140
	STA.b $36,x
	RTS

CODE_80CA32:
	PHX
	LDY.w !ContextDependentTable+$02,x
	TYX
	JSR.w (!ContextDependentTable,x)
	PLX
	INX
	INX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

CODE_80CA42:
	LDX.b $B4
	CLC
CODE_80CA45:
	LDA.l !REGISTER_DSP1_StatusRegister
	BPL.b CODE_80CA45
	LDA.w #$FF90
	ADC.w !REGISTER_DSP1_DataRegister
	STA.b $2C,x
	CLC
	LDA.w #$FEE7
	ADC.b $98
	ADC.w !REGISTER_DSP1_DataRegister
	STA.b $2E,x
	LDA.w !REGISTER_DSP1_DataRegister
	STA.b $06,x
	RTS

CODE_80CA64:
	LDX.b $B4
	CLC
CODE_80CA67:
	LDA.l !REGISTER_DSP1_StatusRegister
	BPL.b CODE_80CA67
	LDA.w #$FF90
	ADC.w !REGISTER_DSP1_DataRegister
	STA.b $32,x
	CLC
	LDA.w #$FEE7
	ADC.b $9A
	ADC.w !REGISTER_DSP1_DataRegister
	STA.b $34,x
	LDA.w !REGISTER_DSP1_DataRegister
	STA.b $0E,x
	RTS

CODE_80CA86:
	LDY.b $B4
	LDA.w $0084,y
	BEQ.b CODE_80CA9F
	LDA.w $001F,y
	BNE.b CODE_80CA9F
	LDA.w $00A0,y
	CMP.w #$0006
	BEQ.b CODE_80CAA9
	CMP.w #$0008
	BEQ.b CODE_80CAA9
CODE_80CA9F:
	LDA.w $0082,y
	BEQ.b CODE_80CAAB
	LDA.b $38
	LSR
	BCC.b CODE_80CAAB
CODE_80CAA9:
	INX
	INX
CODE_80CAAB:
	LDY.w !ContextDependentTable+$02,x
	TYX
	JMP.w (!ContextDependentTable,x)

DATA_80CAB2:
	dw $0000
	dw CODE_80C7BA
	dw CODE_80F930
	dw CODE_80EB29
	dw CODE_80CCF1
	dw CODE_80C836
	dw CODE_80C91C
	dw CODE_80CD1C
	dw CODE_80C2E5
	dw DATA_80DA50

DATA_80CAC6:
	dw $0000
	dw CODE_80CADC
	dw CODE_80F930
	dw CODE_80C7BA
	dw CODE_80CCF1
	dw CODE_80CD48
	dw CODE_80CA32
	dw DATA_80DA48
	dw CODE_80C8B1
	dw CODE_80C947
	dw CODE_80C6E3

;--------------------------------------------------------------------

CODE_80CADC:
	LDA.w $0E52
	AND.w #$0002
	BNE.b CODE_80CAE6
	INX
	INX
CODE_80CAE6:
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

DATA_80CAEB:
	dw CODE_80CCC3
	dw CODE_80EAA7
	dw CODE_80D7E2
	dw CODE_80D580
	dw CODE_80F930
	dw CODE_80CCE1
	dw CODE_80E88A
	dw CODE_80D6BB
	dw CODE_80D7C0 : dw DATA_80CB01,DATA_80D854

DATA_80CB01:
	dw CODE_80CEBB
	dw CODE_80CD9C
	dw CODE_80C91C
	dw CODE_80CF47
	dw CODE_80CCF1
	dw CODE_80CA86 : dw DATA_80CB11,DATA_80CB1B

DATA_80CB11:
	dw CODE_80CA32
	dw CODE_80DA5C
	dw CODE_80FE9F
	dw CODE_80FC9E
	dw CODE_80C6E3

DATA_80CB1B:
	dw CODE_80FE9F
	dw CODE_80FC9E
	dw CODE_80C6E3

DATA_80CB21:
	dw CODE_80CCC3
	dw CODE_80EAA7
	dw CODE_80D7E2
	dw CODE_80F930
	dw CODE_80CEBB
	dw CODE_80C91C
	dw CODE_80CF47
	dw CODE_80CCF1
	dw CODE_80CA32
	dw CODE_80DA5C
	dw CODE_80C6E3

DATA_80CB37:
	dw CODE_80CCC3
	dw CODE_80EAA7
	dw CODE_80D7E2
	dw CODE_80D580
	dw CODE_80CCE1
	dw CODE_80E88A
	dw CODE_80D730
	dw CODE_80D7C0 : dw DATA_80CB4B,DATA_80D860

DATA_80CB4B:
	dw CODE_80CEDB
	dw CODE_80CD9C
	dw CODE_80C947
	dw CODE_80CF8D
	dw CODE_80CCF1
	dw CODE_80CA86 : dw DATA_80CB5B,DATA_80CB63

DATA_80CB5B:
	dw CODE_80CA32 : dw DATA_80DA56
	dw CODE_80FE9F
	dw CODE_80FC9E

DATA_80CB63:
	dw CODE_80FE9F
	dw CODE_80FC9E

DATA_80CB67:
	dw CODE_80CCC3
	dw CODE_80EAA7
	dw CODE_80D7E2
	dw CODE_80CEDB
	dw CODE_80C947
	dw CODE_80CF8D
	dw CODE_80CCF1
	dw CODE_80CA32 : dw DATA_80DA56
	dw CODE_80C6E3

DATA_80CB7B:
	dw CODE_80EAA7
	dw CODE_80C730 : dw DATA_80CB93,DATA_80CBA3,DATA_80CBA9,DATA_80CBAD

DATA_80CB87:
	dw $0000
DATA_80CB89:
	dw CODE_80C730 : dw DATA_80CB93,DATA_80CBA3,DATA_80CBA9,DATA_80CBAD

DATA_80CB93:
	dw CODE_80C7BA
	dw CODE_80F930
	dw CODE_80CCF1
	dw CODE_80C836
	dw CODE_80C91C
	dw CODE_80CD1C
	dw CODE_80C2E5 : dw DATA_80DA50

DATA_80CBA3:
	dw CODE_80C76F
	dw CODE_80F930
	dw CODE_80C795

DATA_80CBA9:
	dw CODE_80F930
	dw CODE_80C6E3

DATA_80CBAD:
	dw CODE_80F930
	dw CODE_80C7F2
	dw CODE_80CCF1
	dw CODE_80C0E2
	dw CODE_80CA42
	dw CODE_80C6E3

DATA_80CBB9:
	dw $0000
	dw CODE_80C730 : dw DATA_80CBC5,DATA_80CBD7,DATA_80CBDF,DATA_80CBE5

DATA_80CBC5:
	dw CODE_80C7BA
	dw CODE_80F930
	dw CODE_80EB29
	dw CODE_80CCF1
	dw CODE_80C836
	dw CODE_80C91C
	dw CODE_80CD1C
	dw CODE_80C2E5 : dw DATA_80DA50

DATA_80CBD7:
	dw CODE_80C76F
	dw CODE_80F930
	dw CODE_80EB29
	dw CODE_80C795

DATA_80CBDF:
	dw CODE_80F930
	dw CODE_80EB29
	dw CODE_80C6E3

DATA_80CBE5:
	dw CODE_80F930
	dw CODE_80EB29
	dw CODE_80C7F2
	dw CODE_80CCF1
	dw CODE_80C0E2
	dw CODE_80CA42

DATA_80CBF1:
	dw CODE_80EAA7
	dw CODE_80C70D : dw DATA_80CC09,DATA_80CC19,DATA_80CC1D,DATA_80CC1F

DATA_80CBFD:
	dw $0000
DATA_80CBFF:
	dw CODE_80C70D : dw DATA_80CC09,DATA_80CC19,DATA_80CC1D,DATA_80CC1F

DATA_80CC09:
	dw CODE_80C7BA
	dw CODE_80CCF1
	dw CODE_80CD48
	dw CODE_80CA32 : dw DATA_80DA48
	dw CODE_80C8B1
	dw CODE_80C947
	dw CODE_80C6E3

DATA_80CC19:
	dw CODE_80C76F
	dw CODE_80C795

DATA_80CC1D:
	dw CODE_80C6E3

DATA_80CC1F:
	dw CODE_80C7F2
	dw CODE_80CCF1
	dw CODE_80C128
	dw CODE_80CA64

DATA_80CC27:
	dw $0000
	dw CODE_80CCA1 : dw DATA_80CB7B,DATA_80CAEB,DATA_80CB21

DATA_80CC31:
	dw $0000
	dw CODE_80CCA1 : dw DATA_80CBF1,DATA_80CB37,DATA_80CB67

DATA_80CC3B:
	dw $0000
	dw CODE_80CC89 : dw DATA_80CB89,DATA_80CC6B

DATA_80CC43:
	dw $0000
	dw CODE_80CC89 : dw DATA_80CBFF,DATA_80CC5D

DATA_80CC4B:
	dw DATA_80CC4D

DATA_80CC4D:
	dw DATA_80CC55
	dw CODE_80F930
	dw CODE_80CCE1
	dw CODE_80E88A

DATA_80CC55:
	dw CODE_80C6E3
	dw CODE_80CCE1
	dw CODE_80E88A

DATA_80CC5B:
	dw CODE_80C6E3

DATA_80CC5D:
	dw CODE_80CEDB
	dw CODE_80CD9C
	dw CODE_80C947
	dw CODE_80CF8D
	dw CODE_80CCF1
	dw CODE_80CC7B : dw DATA_80DA56

DATA_80CC6B:
	dw CODE_80F930
	dw CODE_80CEBB
	dw CODE_80CD9C
	dw CODE_80C91C
	dw CODE_80CF47
	dw CODE_80CCF1
	dw CODE_80CC7B
	dw CODE_80DA5C

CODE_80CC7B:
	TXY
	LDX.b $B4
	LDA.b $8E,x
	BNE.b CODE_80CC88
	LDX.w !ContextDependentTable+$02,y
	JMP.w (!ContextDependentTable,x)

CODE_80CC88:
	RTS

CODE_80CC89:
	TXY
	LDX.b $B8
	BIT.b $C8,x
	BVS.b CODE_80CC9B
	BVC.b CODE_80CC99			; Note: This will always branch.

CODE_80CC92:
	TXY
	LDX.b $B8
	LDA.b $AC,x
	BPL.b CODE_80CC9B
CODE_80CC99:
	INY
	INY
CODE_80CC9B:
	LDX.w !ContextDependentTable+$02,y
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80CCA1:
	TXY
	LDX.b $B8
	LDA.b $AC,x
	BPL.b CODE_80CCBD
	LDX.b $B4
	LDA.b $10,x
	AND.w #$0020
	BNE.b CODE_80CCB7
	LDX.w !ContextDependentTable+$04,y
	JMP.w (!ContextDependentTable,x)

CODE_80CCB7:
	LDX.w !ContextDependentTable+$06,y
	JMP.w (!ContextDependentTable,x)

CODE_80CCBD:
	LDX.w !ContextDependentTable+$02,y
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80CCC3:
	LDY.b $B8
	LDA.w $1E96,y
	BEQ.b CODE_80CCCD
	LDX.w DATA_80CC4B,y
CODE_80CCCD:
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80CCD2:
	TXY
	LDX.b $B8
	BIT.b $C8,x
	BVC.b CODE_80CCDB
	INY
	INY
CODE_80CCDB:
	LDX.w !ContextDependentTable+$02,y
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80CCE1:
	PHX
	PEA.w $8081
	PLB
	JSL.l CODE_81B387
	PLB
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80CCF1:
	PHX
	LDX.b $B4
	LDA.b $86,x
	BEQ.b CODE_80CD02
	LDA.b $38
	AND.w #$0007
	ASL
	TAY
	LDA.w DATA_80CD0C,y
CODE_80CD02:
	EOR.b $14,x
	STA.b $1A
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

DATA_80CD0C:
	dw $0000,$0200,$0400,$0600,$0800,$0A00,$0C00,$0E00

;--------------------------------------------------------------------

CODE_80CD1C:
	TXY
	LDX.b $B4
	LDA.b $8E,x
	BNE.b CODE_80CD47
	LDA.b $82,x
	BEQ.b CODE_80CD36
	CMP.w #$0400
	BCS.b CODE_80CD31
	CMP.w #$0080
	BCS.b CODE_80CD47
CODE_80CD31:
	LDA.b $38
	LSR
	BCC.b CODE_80CD47
CODE_80CD36:
	LDA.b $A0,x
	TAX
	LDA.w DATA_80CD7C,x
	AND.w #$005C
	BNE.b CODE_80CD47
	TYX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

CODE_80CD47:
	RTS

;--------------------------------------------------------------------

CODE_80CD48:
	TXY
	LDX.b $B4
	LDA.b $8E,x
	BNE.b CODE_80CD6D
	LDA.b $82,x
	BEQ.b CODE_80CD62
	CMP.w #$0400
	BCS.b CODE_80CD5D
	CMP.w #$0080
	BCS.b CODE_80CD6D
CODE_80CD5D:
	LDA.b $38
	LSR
	BCC.b CODE_80CD6D
CODE_80CD62:
	LDA.b $A0,x
	TAX
	LDA.w DATA_80CD7C,x
	AND.w #$005C
	BEQ.b CODE_80CD76
CODE_80CD6D:
	TYA
	CLC
	ADC.w #$0006
	TAX
	JMP.w (!ContextDependentTable,x)

CODE_80CD76:
	TYX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

DATA_80CD7C:
	dw $0001,$0002,$0004,$0008,$0010,$0020,$0040,$0080
	dw $0100,$0200,$0400,$0800,$1000,$2000,$4000,$8000

;--------------------------------------------------------------------

CODE_80CD9C:
	PHX
	LDX.b $B4
	LDY.w !RAM_SMK_Global_RacetrackType
	BEQ.b CODE_80CDD3					; Note: !Define_SMK_RacetrackType_GhostValley
	LDY.b $EA,x
	LDA.b $AE,x
	CMP.w #$0040
	BCC.b CODE_80CDCD
	CMP.w #$0080
	BCS.b CODE_80CDCD
	CPY.w #$0080
	BCC.b CODE_80CDCD
	AND.w #$001F
	TAY
CODE_80CDBB:
	LDA.w DATA_80CE17,y
	STA.b $00
	LDA.b $38
	AND.w #$0007
	ASL
	TAY
	LDA.b ($00),y
CODE_80CDC9:
	ADC.b $1E
	STA.b $1E
CODE_80CDCD:
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

CODE_80CDD3:
	LDA.b $EA,x
	CMP.w #$0100
	BCC.b CODE_80CE01
	LDA.b $62,x
	BEQ.b CODE_80CDF0
	INC
	CMP.w #$0008
	BCC.b CODE_80CDE7
	LDA.w #$0000
CODE_80CDE7:
	STA.b $62,x
	ASL
	TAY
	LDA.w DATA_80CE07,y
	BRA.b CODE_80CDC9

CODE_80CDF0:
	LDA.b $AE,x
	CMP.w #$0042
	BEQ.b CODE_80CDFC
	LDY.w #$0000
	BRA.b CODE_80CDBB

CODE_80CDFC:
	LDA.w #$0001
	STA.b $62,x
CODE_80CE01:
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

DATA_80CE07:
	dw $0000,$0000,$FFFF,$FFFE,$FFFE,$FFFF,$0000,$0000

DATA_80CE17:
	dw DATA_80CE67,DATA_80CE77,DATA_80CE47,DATA_80CE67,DATA_80CE57,DATA_80CE57,DATA_80CE57,DATA_80CE67
	dw DATA_80CE47,DATA_80CE67,DATA_80CE57,DATA_80CE47,DATA_80CE47,DATA_80CE47,DATA_80CE37,DATA_80CE37

DATA_80CE37:
	dw $0000,$0001,$0000,$0001,$0000,$0001,$0000,$0001

DATA_80CE47:
	dw $0000,$FFFF,$FFFF,$FFFD,$FFFF,$FFFF,$0000,$0000

DATA_80CE57:
	dw $0000,$FFFF,$FFFE,$FFFE,$FFFF,$0000,$FFFF,$0000

DATA_80CE67:
	dw $0000,$FFFF,$0000,$FFFF,$0000,$FFFF,$0000,$FFFF

DATA_80CE77:
	dw $FFFD,$FFFD,$FFFD,$FFFD,$FFFD,$FFFD,$FFFD,$FFFD

;--------------------------------------------------------------------

CODE_80CE87:
	dw CODE_80CEBB
	dw CODE_80CA32 : dw DATA_80DA50
	dw CODE_80C6E3

DATA_80CE8F:
	dw CODE_80CEDB
	dw CODE_80CA32 : dw DATA_80DA56
	dw CODE_80C6E3

CODE_80CE97:
	LDX.b $B4
	LDA.b $72,x
	BEQ.b CODE_80CE9E
	RTS

CODE_80CE9E:
	SEP.b #$20
	LDA.b $1B
	BNE.b CODE_80CEA8
	LDA.b $15,x
	STA.b $1B
CODE_80CEA8:
	LDA.b $14,x
	STA.b $1A
	REP.b #$20
	LDX.w #CODE_80CE87
	LDY.b $B8
	BEQ.b CODE_80CEB8
	LDX.w #DATA_80CE8F
CODE_80CEB8:
	JMP.w (!ContextDependentTable,x)

CODE_80CEBB:
	TXY
	LDX.b $B4
	LDA.w #$0108
	STA.b $18
	STA.b $06,x
	LDA.w #$FF66
	STA.b $1E
	STA.b $2E,x
	STA.b $38,x
	LDA.w #$FF80
	STA.b $1C
	STA.b $2C,x
	TYX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

CODE_80CEDB:
	TXY
	LDX.b $B4
	LDA.w #$0108
	STA.b $18
	STA.b $0E,x
	LDA.w #$FFD6
	STA.b $1E
	STA.b $34,x
	STA.b $3A,x
	STA.b $3C,x
	LDA.w #$FF80
	STA.b $1C
	STA.b $32,x
	STA.b $3E,x
	TYX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

DATA_80CEFF:
	dw $0000
	dw CODE_80FE02
	dw CODE_80CF0B
	dw CODE_80CCF1
	dw CODE_80C2E5 : dw DATA_80DA50

;--------------------------------------------------------------------

CODE_80CF0B:
	PHX
	LDX.b $B4
	LDA.b $18,x
	CLC
	ADC.w #$FF00
	STA.b $1C
	LDA.b $1C,x
	CLC
	ADC.w #$FF00
	STA.b $1E
	LDA.b $92,x
	ASL
	TAY
	LDA.w DATA_80DD35,y
	STA.b $06,x
	STA.b $18
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

DATA_80CF2F:
	db $00,$01,$02,$03,$04,$05,$06,$07
	db $08,$08,$09,$09,$0A,$0A,$0B,$0B

DATA_80CF3F:
	db $00,$00,$00,$0B,$00,$00,$00,$00

CODE_80CF47:
	PHX
	LDX.b $B4
	LDA.b $BA,x
	STA.w $1E3E
	AND.w #$7FFF
	LSR
	CMP.w #$00B0
	AND.w #$000F
	BCC.b CODE_80CF62
	TAY
	LDA.w DATA_80CF3F,y
	AND.w #$00FF
CODE_80CF62:
	TAY
	LDA.w DATA_80CF2F,y
	AND.w #$00FF
	STA.w $1E3C
	LDA.b $84,x
	BEQ.b CODE_80CF75
	LDA.w #DATA_80D252
	BRA.b CODE_80CF78

CODE_80CF75:
	LDA.w $0FA0
CODE_80CF78:
	STA.w $0FB8
	LDY.w #$1E00
	JSR.w CODE_80D4A3
	BCC.b CODE_80CFEA
	LDA.w $1010
	AND.w #$0020
	BEQ.b CODE_80CFD1
	BNE.b CODE_80CFEA			; Note: This will always branch.

CODE_80CF8D:
	PHX
	LDX.b $B4
	LDA.b $BC,x
	STA.w $1E3E
	AND.w #$7FFF
	LSR
	CMP.w #$00B0
	AND.w #$000F
	BCC.b CODE_80CFA8
	TAY
	LDA.w DATA_80CF3F,y
	AND.w #$00FF
CODE_80CFA8:
	TAY
	LDA.w DATA_80CF2F,y
	AND.w #$00FF
	STA.w $1E3C
	LDA.b $84,x
	BEQ.b CODE_80CFBB
	LDA.w #DATA_80D252
	BRA.b CODE_80CFBE

CODE_80CFBB:
	LDA.w $0FA0
CODE_80CFBE:
	STA.w $0FB8
	LDY.w #$1E20
	JSR.w CODE_80D4A3
	BCC.b CODE_80CFEA
	LDA.w $1110
	AND.w #$0020
	BNE.b CODE_80CFEA
CODE_80CFD1:
	LDA.w $1E3E
	LSR
	AND.w #$4000
	EOR.b $4E,x
	TAX
	SEP.b #$21
	LDA.b $1E
	SBC.b #$10
	XBA
	LDA.b $1C
	REP.b #$20
	TAY
	JSR.w CODE_80BE01
CODE_80CFEA:
	LDY.b $B4
	LDX.b $A0,y
	JSR.w (DATA_80CFF7,x)
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

DATA_80CFF7:
	dw CODE_80D007
	dw CODE_80D025
	dw CODE_80D008
	dw CODE_80D008
	dw CODE_80D008
	dw CODE_80D008
	dw CODE_80D007
	dw CODE_80D025

CODE_80D007:
	RTS

CODE_80D008:
	TYX
	STZ.b $9E,x
	LDA.w #$FBD7
	AND.b $E2,x
	STA.b $E2,x
	STZ.b $E4,x
	LDA.w #$0004
	CMP.b $86,x
	BCS.b CODE_80D024
	STA.b $86,x
	LDA.w #$4000
	AND.b $E2,x
	STA.b $E2,x
CODE_80D024:
	RTS

CODE_80D025:
	TYX
	LDA.w #$FBD7
	AND.b $E2,x
	STA.b $E2,x
	STZ.b $E0,x
	RTS

DATA_80D030:
	dw $0000,$0100,$0200,$0300,$3080,$00D0,$0004,$0005
	dw $0006,$8007,$D03B,$0800,$0900,$0A00,$0B00,$4680
	dw $00D0,$000C,$000D,$000E,$800F,$D051,$1000,$1100
	dw $1200,$1300,$5C80,$00D0,$0014,$0015,$0016,$8017
	dw $D067,$1800,$1900,$1A00,$1B00,$7280,$00D0,$001C
	dw $001D,$001E,$801F,$D07D,$2000,$2100,$2200,$2300
	dw $8880,$00D0,$0024,$0025,$0026,$8027,$D093,$2800
	dw $2900,$2A00,$2B00,$9E80,$00D0,$002C,$002D,$002E
	dw $802F,$D0A9,$3000,$3100,$3200,$3300,$B480,$00D0
	dw $0034,$0035,$0036,$8037,$D0BF,$3800,$3900,$3A00
	dw $3B00,$CA80,$02D0,$0300,$0205,$0302,$8003,$D0D5
	dw $0402,$0503,$0602,$0703,$E080,$02D0,$0308,$0209
	dw $030A,$800B,$D0EB,$0C02,$0D03,$0E02,$0F03,$F680
	dw $02D0,$0310,$0211,$0312,$8013,$D101,$1402,$1503
	dw $1602,$1703,$0C80,$02D1,$0318,$0219,$031A,$801B
	dw $D117,$1C02,$1D03,$1E02,$1F03,$2280,$02D1,$0320
	dw $0221,$0322,$8023,$D12D,$2402,$2503,$2602,$2703
	dw $3880,$02D1,$0328,$0229,$032A,$802B,$D143,$2802
	dw $2D03,$2E02,$2F03,$4E80,$00D1,$0000,$0001,$0202
	dw $0203,$0404,$0405,$0606,$8007,$D159,$FF01,$0000
	dw $0100,$0200,$0302,$0402,$0504,$0604,$0706,$0000
	dw $0100,$0200,$0302,$0402,$0504,$0604,$0706,$FF10
	dw $8E80,$08D1,$8030,$D193,$060F,$070F,$9880,$0FD1
	dw $0F08,$8009,$D19F,$0002,$0100,$0204,$0100,$0302
	dw $0100,$0401,$0100,$0504,$0110,$0510,$0110,$BA80
	dw $02D1,$0002,$0101,$0003,$1001,$80FF,$D1C9

DATA_80D1CE:
	dw $33B1,$D2C8,$0100,$26CF,$D2C8,$0000,$2CAB,$D310
	dw $0000,$2DBF,$D2F8,$0000,$333F,$D314,$0100,$333F
	dw $D314,$0500,$33B1,$D2C8,$0500,$33B1,$D2C8,$0100
	dw $2CAB,$D316,$0000,$2CAB,$D294,$0000,$2DBF,$D318
	dw $0000

DATA_80D210:
	dw $2000,$D2E0,$0100,$26CF,$D2B0,$0000,$2CAB,$D310
	dw $0000,$2DBF,$D2F8,$0000,$333F,$D314,$0100,$333F
	dw $D314,$0500,$2000,$D2E0,$0500,$2000,$D2E0,$0100
	dw $2CAB,$D316,$0000,$2CAB,$D294,$0000,$2DBF,$D318
	dw $0000

DATA_80D252:
	dw $2000,$D298,$0100,$26CF,$D2C8,$0000,$2CAB,$D310
	dw $0000,$2DBF,$D2F8,$0000,$333F,$D314,$0100,$333F
	dw $D314,$0500,$2000,$D298,$0500,$2000,$D298,$0100
	dw $2CAB,$D316,$0000,$2CAB,$D296,$0000,$2DBF,$D318
	dw $0000,$D198,$D19F,$D0B4,$D0B4,$D0BF,$D0BF,$D0CA
	dw $D0CA,$D0CA,$D0CA,$D0CA,$D0CA,$D0CA,$D0CA,$D030
	dw $D030,$D07D,$D07D,$D07D,$D07D,$D07D,$D07D,$D07D
	dw $D093,$D09E,$D0A9,$D030,$D03B,$D046,$D051,$D051
	dw $D051,$D072,$D07D,$D088,$D093,$D09E,$D0A9,$D030
	dw $D03B,$D046,$D051,$D05C,$D067,$D072,$D07D,$D088
	dw $D093,$D09E,$D0A9,$D0D5,$D0E0,$D0EB,$D0F6,$D101
	dw $D10C,$D117,$D122,$D12D,$D138,$D143,$D14E,$D1A6
	dw $D159,$D16C,$D1C1,$D193

;--------------------------------------------------------------------

DATA_80D31A:
	dw CODE_80D37A
	dw CODE_80D37A
	dw CODE_80D37A
	dw CODE_80D37A
	dw CODE_80D37A
	dw CODE_80D37A
	dw CODE_80D37A
	dw CODE_80D37A
	dw CODE_80D37A
	dw CODE_80D37A
	dw CODE_80D37A
	dw CODE_80D37A
	dw CODE_80D37A
	dw CODE_80D37A
	dw CODE_80D37A
	dw CODE_80D37A
	dw CODE_80D40B
	dw CODE_80D418
	dw CODE_80D418
	dw CODE_80D443
	dw CODE_80D443
	dw CODE_80D443
	dw CODE_80D443
	dw CODE_80D443
	dw CODE_80D443
	dw CODE_80D443
	dw CODE_80D443
	dw CODE_80D443
	dw CODE_80D443
	dw CODE_80D443
	dw CODE_80D443
	dw CODE_80D443
	dw CODE_80D37A
	dw CODE_80D37A
	dw CODE_80D37A
	dw CODE_80D37A
	dw CODE_80D37A
	dw CODE_80D37A
	dw CODE_80D37A
	dw CODE_80D37A
	dw CODE_80D37A
	dw CODE_80D37A
	dw CODE_80D3B6
	dw CODE_80D3B6
	dw CODE_80D3B6
	dw CODE_80D3F3
	dw CODE_80D3D2
	dw CODE_80D3D2

CODE_80D37A:
	TYX
	LDA.b $1F,x
	BNE.b CODE_80D38B
	STZ.b $8E,x
	JSR.w CODE_80D44E
	BCS.b CODE_80D39D
	BIT.w #$0020
	BNE.b CODE_80D38E
CODE_80D38B:
	JMP.w CODE_80D444

CODE_80D38E:
	JSR.w CODE_80D460
	LDY.w #$0024
	BIT.w $1EE7
	BPL.b CODE_80D39C
	LDY.w #$002A
CODE_80D39C:
	RTS

CODE_80D39D:
	LDY.w #$0018
	BIT.w $1EE7
	BPL.b CODE_80D3A8
CODE_80D3A5:
	LDY.w #$001E
CODE_80D3A8:
	LDA.b $E2,x
	AND.w #$0100
	LSR
	XBA
	STA.w $1E3E
	STZ.w $1E3C
	RTS

CODE_80D3B6:
	TYX
	JSR.w CODE_80D44E
	BCS.b CODE_80D3A5
	LDY.w #$002A
	BIT.w #$0020
	BNE.b CODE_80D3D1
	LDA.b $EA,x
	CMP.w #$0080
	BCS.b CODE_80D3CE
	JMP.w CODE_80D444

CODE_80D3CE:
	LDY.w #$0000
CODE_80D3D1:
	RTS

CODE_80D3D2:
	TYX
	STZ.b $8E,x
	INC.b $1E
	INC.b $1E
	LDA.b $EA,x
	CMP.w #$0020
	BCS.b CODE_80D3E5
	JSR.w CODE_80D44E
	BCC.b CODE_80D3E9
CODE_80D3E5:
	LDY.w #$0006
	RTS

CODE_80D3E9:
	STZ.w $1E3E
	STZ.w $1E3C
	LDY.w #$0036
	RTS

CODE_80D3F3:
	TYX
	JSR.w CODE_80D44E
	BCS.b CODE_80D407
	LDA.b $EA,x
	CMP.w #$0010
	BCS.b CODE_80D407
	LDY.w #$003C
	STZ.w $1E3C
	RTS

CODE_80D407:
	LDY.w #$0012
	RTS

CODE_80D40B:
	TYX
	INC.b $8E,x
	LDA.w $0FD6
	STA.l $7F6004
	JMP.w CODE_80D47F

CODE_80D418:
	TYX
	LDA.b $A0,x
	LDY.w !RAM_SMK_Global_RacetrackType
	CPY.w #!Define_SMK_RacetrackType_BowserCastle
	BNE.b CODE_80D428
	CMP.w #$0006
	BNE.b CODE_80D444
CODE_80D428:
	CMP.w #$0003
	BCC.b CODE_80D434
	LDA.w $0FD6
	STA.l $7F6004
CODE_80D434:
	STZ.w $1E3C
	LDY.w #$000C
	RTS

CODE_80D43B:
	TYX
	LDY.w #$0030
	STZ.w $1E3C
	RTS

CODE_80D443:
	TYX
CODE_80D444:
	PLA
CODE_80D445:
	STZ.b $8E,x
CODE_80D447:
	PLX
	STZ.b $44,x
	STZ.b $42,x
	CLC
	RTS

CODE_80D44E:
	LDA.b $E4,x
	CMP.w #$0400
	BCS.b CODE_80D45E
	LDA.b $E2,x
	BIT.w #$0008
	BNE.b CODE_80D45E
	CLC
	RTS

CODE_80D45E:
	SEC
	RTS

CODE_80D460:
	LDA.b $38
	AND.w #$0007
	ASL
	TAX
	LDA.w DATA_80D46F,x
	ADC.b $1C
	STA.b $1C
	RTS

DATA_80D46F:
	dw $0000,$0001,$0002,$0001,$0000,$FFFF,$FFFE,$FFFF

CODE_80D47F:
	LDA.b $8E,x
	CMP.w #$0010
	BCC.b CODE_80D489
	LDA.w #$000F
CODE_80D489:
	ASL
	ASL
	ADC.b $1E
	STA.b $1E
	PLA
	JMP.w CODE_80D447

DATA_80D493:
	dw $0000,$0000,$0020,$FFFF,$0024,$0000,$0000,$0000

CODE_80D4A3:
	PHY
	LDA.b $1F,x
	BEQ.b CODE_80D4CD
	CMP.w #$0200
	BCS.b CODE_80D4C1
	LDA.b $E2,x
	AND.w #$0010
	BEQ.b CODE_80D4CD
	TXY
	JSR.w CODE_80D43B
	PLX
	LDA.b $46,x
	CMP.w #$D1C9
	BCC.b CODE_80D505
	PHX
CODE_80D4C1:
	LDA.w #$FFEF
	AND.b $E2,x
	STA.b $E2,x
	LDX.b $B4
	JMP.w CODE_80D445

CODE_80D4CD:
	LDA.w #$FFEF
	AND.b $E2,x
	STA.b $E2,x
	LDY.b $A0,x
	LDA.w DATA_80D493,y
	BEQ.b CODE_80D4F1
	BMI.b CODE_80D4E8
	CMP.w #$0020
	BEQ.b CODE_80D4FC
	LDY.b $1F,x
	BEQ.b CODE_80D4FC
	BNE.b CODE_80D4FA			; Note: This will always branch.

CODE_80D4E8:
	LDY.b $1F,x
	BNE.b CODE_80D4F5
	LDA.w #$0024
	BRA.b CODE_80D4FC

CODE_80D4F1:
	LDY.b $1F,x
	BEQ.b CODE_80D4FA
CODE_80D4F5:
	LDA.w #$0040
	BRA.b CODE_80D4FC

CODE_80D4FA:
	LDA.b $AE,x
CODE_80D4FC:
	AND.w #$007E
	TXY
	TAX
	JSR.w (DATA_80D31A,x)
	PLX
CODE_80D505:
	TYA
	CLC
	ADC.w $0FB8
	TAY
	LDA.w !ContextDependentTable,y
	STA.b $42,x
	LDA.w #$007E
	STA.b $4C,x
	LDA.w !ContextDependentTable+$02,y
	STA.b $00
	LDA.w !ContextDependentTable+$04,y
	STA.b $4E,x
	LDA.w $1E3C
	ASL
	TAY
	LDA.b ($00),y
	BNE.b CODE_80D52E
	STZ.b $44,x
	STZ.b $42,x
	CLC
	RTS

CODE_80D52E:
	DEC
	DEC
	CMP.b $44,x
	BEQ.b CODE_80D53A
	STA.b $44,x
	STA.b $46,x
	STZ.b $48,x
CODE_80D53A:
	LDY.b $46,x
	DEC.b $48,x
	BPL.b CODE_80D55A
	INY
	INY
	STY.b $46,x
	LDA.w !ContextDependentTable,y
	BIT.w #$0080
	BEQ.b CODE_80D555
	LDA.w !ContextDependentTable+$01,y
	TAY
	STY.b $46,x
	LDA.w !ContextDependentTable,y
CODE_80D555:
	AND.w #$00FF
	STA.b $48,x
CODE_80D55A:
	LDA.w !ContextDependentTable+$01,y
	AND.w #$00FF
	CMP.w #$00FF
	BEQ.b CODE_80D576
	ASL
	ADC.b $42,x
	STA.b $00
	LDA.b $4C,x
	STA.b $02
	LDA.b [$00]
	ADC.b $42,x
	STA.b $14
	SEC
	RTS

CODE_80D576:
	CLC
	RTS

;--------------------------------------------------------------------

CODE_80D578:
	STZ.b $52,x
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80D580:
	PHX
	LDX.b $B4
	LDA.b $52,x
	BEQ.b CODE_80D5FC
	BMI.b CODE_80D58E
	DEC
	STA.b $52,x
	BRA.b CODE_80D5B1

CODE_80D58E:
	LDY.b $B8
	BIT.w #$4000
	BEQ.b CODE_80D5A0
	INY
	INY
	INY
	INY
	AND.w #$3FFF
	STA.b $52,x
	BRA.b CODE_80D5A5

CODE_80D5A0:
	AND.w #$3FFF
	STA.b $52,x
CODE_80D5A5:
	TXA
	TYX
	JSR.w (DATA_80D652,x)
	REP.b #$21
	SBC.w #$100F
	STA.b $54,x
CODE_80D5B1:
	LDA.b $54,x
	STA.b $00
	LDA.b $52,x
	ASL
	TAY
	LDX.b $3C
	LDA.w DATA_80D602,y
	CLC
	ADC.b $00
	STA.b $00,x
	LDA.w DATA_80D612,y
	CLC
	ADC.b $00
	STA.b $04,x
	LDA.w DATA_80D622,y
	CLC
	ADC.b $00
	STA.b $08,x
	LDA.w DATA_80D632,y
	STA.b $02,x
	LDA.w DATA_80D642,y
	STA.b $06,x
	LDA.w DATA_80D642,y
	STA.b $0A,x
	LDA.w #$E0E0
	STA.b $0C,x
	TXA
	CLC
	ADC.w #$0010
	STA.b $3C
	TXA
	LSR
	LSR
	LSR
	LSR
	CLC
	ADC.b $CC
	TAX
	LDA.w #$00AA
	STA.b $00,x
CODE_80D5FC:
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

DATA_80D602:
	dw $0108,$0008,$FF08,$FE08,$0008,$0008,$0008,$0008

DATA_80D612:
	dw $0800,$0801,$0802,$0802,$0603,$0403,$8000,$8000

DATA_80D622:
	dw $0810,$080F,$080E,$080E,$060D,$040D,$8000,$8000

DATA_80D632:
	dw $6D6A,$2D6A,$6D6A,$2D6A,$6C2E,$2C2E,$6C2E,$2C2E

DATA_80D642:
	dw $6D6C,$2D6C,$6D6C,$2D6C,$6D6C,$2D6C,$0044,$0044

DATA_80D652:
	dw CODE_80D695
	dw CODE_80D6A8
	dw CODE_80D684
	dw CODE_80D68A

DATA_80D65A:
	dw CODE_80D670
	dw CODE_80D677
	dw CODE_80D662
	dw CODE_80D669

CODE_80D662:
	TYX
	BIT.b $22,x
	BPL.b CODE_80D67C
	BMI.b CODE_80D680			; Note: This will always branch.

CODE_80D669:
	TYX
	BIT.b $22,x
	BPL.b CODE_80D680
	BMI.b CODE_80D67C			; Note: This will always branch.

CODE_80D670:
	TYX
	BIT.b $24,x
	BPL.b CODE_80D680
	BMI.b CODE_80D67C			; Note: This will always branch.

CODE_80D677:
	TYX
	BIT.b $24,x
	BMI.b CODE_80D680
CODE_80D67C:
	LDA.w #$6673
	RTS

CODE_80D680:
	LDA.w #$668D
	RTS

CODE_80D684:
	TAY
	LDX.b $56,y
	JMP.w (DATA_80D65A,x)

CODE_80D68A:
	TAY
	LDX.b $56,y
	JSR.w (DATA_80D65A,x)
	CLC
	ADC.w #$7000
	RTS

CODE_80D695:
	TAX
	LDY.b $50,x
	SEP.b #$20
	LDA.b $2E,x
	ADC.w $002E,y
	ROR
	XBA
	LDA.b $2C,x
	ADC.w $002C,y
	ROR
	RTS

CODE_80D6A8:
	TAX
	LDY.b $50,x
CODE_80D6AA:
	SEP.b #$20
	LDA.b $34,x
	ADC.w $0034,y
	ROR
	XBA
	LDA.b $32,x
	ADC.w $0032,y
	ROR
	RTS

;--------------------------------------------------------------------

CODE_80D6BB:
	PHX
	LDA.b $2C
	CMP.w #$0006
	BEQ.b CODE_80D72A
	LDX.b $B4
	LDA.b $EA,x
	BEQ.b CODE_80D72A
	LDY.b $00,x
	CPY.w #$00B0
	BEQ.b CODE_80D6FD
	LDA.b $88,x
	BMI.b CODE_80D6FD
	LDA.b $12,x
	AND.w #$3000
	BNE.b CODE_80D6FD
	LDA.w $002E,y
	ADC.w #$00C0
	CMP.w #$0060
	BCS.b CODE_80D6FD
	LDA.w $002C,y
	CMP.w #$FF00
	BCC.b CODE_80D6FD
	CMP.w #$FF80
	LDA.w #$A000
	BCS.b CODE_80D6F9
	LDA.w #$C000
CODE_80D6F9:
	ORA.b $88,x
	STA.b $88,x
CODE_80D6FD:
	LDY.b $02,x
	CPY.w #$00B0
	BEQ.b CODE_80D72A
	TYX
	LDA.b $12,x
	BMI.b CODE_80D72A
	LDA.b $88,x
	BMI.b CODE_80D72A
	LDA.b $30,x
	AND.w #$7FFF
	BNE.b CODE_80D72A
	LDA.b $2C,x
	CMP.w #$FF00
	BCC.b CODE_80D72A
	CMP.w #$FF80
	LDA.w #$C000
	BCS.b CODE_80D726
	LDA.w #$A000
CODE_80D726:
	ORA.b $88,x
	STA.b $88,x
CODE_80D72A:
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80D730:
	PHX
	LDA.b $2C
	CMP.w #$0006
	BEQ.b CODE_80D79D
	LDX.b $B4
	LDA.b $EA,x
	BEQ.b CODE_80D79D
	LDY.b $08,x
	CPY.w #$00B4
	BEQ.b CODE_80D774
	LDA.b $88,x
	BMI.b CODE_80D774
	LDA.b $12,x
	AND.w #$3000
	BNE.b CODE_80D774
	LDA.w $0034,y
	ADC.w #$0050
	CMP.w #$0060
	BCS.b CODE_80D774
	LDA.w $0032,y
	BPL.b CODE_80D6FD
	CMP.w #$FF00
	BCC.b CODE_80D774
	CMP.w #$FF80
	LDA.w #$A000
	BCS.b CODE_80D770
	LDA.w #$C000
CODE_80D770:
	ORA.b $88,x
	STA.b $88,x
CODE_80D774:
	LDY.b $0A,x
	CPY.w #$00B4
	BEQ.b CODE_80D79D
	TYX
	LDA.b $12,x
	BMI.b CODE_80D79D
	LDA.b $36,x
	AND.w #$7FFF
	BNE.b CODE_80D79D
	LDA.b $32,x
	CMP.w #$FF00
	BCC.b CODE_80D79D
	CMP.w #$FF80
	LDA.w #$C000
	BCS.b CODE_80D799
	LDA.w #$A000
CODE_80D799:
	ORA.b $88,x
	STA.b $88,x
CODE_80D79D:
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80D7A3:
	LDY.w #$0000
CODE_80D7A6:
	LDX.w $010E,y
	BEQ.b CODE_80D7BF
	LDA.b $B8
	BNE.b CODE_80D7B6
	LDA.w #$0140
	STA.b $30,x
	BRA.b CODE_80D7BB

CODE_80D7B6:
	LDA.w #$0140
	STA.b $36,x
CODE_80D7BB:
	INY
	INY
	BRA.b CODE_80D7A6

CODE_80D7BF:
	RTS

;--------------------------------------------------------------------

CODE_80D7C0:
	TXA
	LDX.b $B4
	CLC
	ADC.b $70,x
	TAY
	LDX.w !ContextDependentTable+$02,y
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80D7CD:
	TXA
	LDX.b $B4
	CLC
	ADC.b $72,x
	TAY
	LDX.w !ContextDependentTable+$02,y
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

DATA_80D7DA:
	dw $003F,$0040,$0041,$0041

CODE_80D7E2:
	PHX
	LDX.b $B4
	LDY.b $B8
	BIT.b $5A,x
	BPL.b CODE_80D7FA
	LDA.b $AE,x
	AND.w #$0007
	TAX
	LDA.w DATA_80D7DA,x
	JSL.l CODE_84D717
	BRA.b CODE_80D84E

CODE_80D7FA:
	LDA.b $8C,x
	BIT.w #$0002
	BEQ.b CODE_80D80E
	AND.w #$FFFD
	STA.b $8C,x
	LDA.w #$0004
	STA.w $0FC0,y
	BRA.b CODE_80D84E

CODE_80D80E:
	BIT.w #$4000
	BEQ.b CODE_80D84E
	AND.w #$BFFF
	STA.b $8C,x
	LDA.b $50,x
	CMP.w #$1200
	BCC.b CODE_80D825
	JSL.l CODE_84D726
	BRA.b CODE_80D829

CODE_80D825:
	JSL.l CODE_84D720
CODE_80D829:
	LDA.b $86,x
	BNE.b CODE_80D84E
	LDA.w $0E00,y
	BEQ.b CODE_80D84E
	LDA.b $70,x
	BNE.b CODE_80D84E
	LDA.b $50,x
	TAX
	LDA.b $4E,x
	AND.w #$0010
	BEQ.b CODE_80D84E
	LDA.w $0FC0,y
	CMP.w #$0012
	BEQ.b CODE_80D84E
	LDA.w #$0010
	STA.w $0FC0,y
CODE_80D84E:
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

DATA_80D854:
	dw CODE_80D7CD : dw DATA_80D86C,DATA_80D878,DATA_80D884,DATA_80D894,DATA_80CB01

DATA_80D860:
	dw CODE_80D7CD : dw DATA_80D8A0,DATA_80D8AC,DATA_80D8B8,DATA_80D8C8,DATA_80CB4B

DATA_80D86C:
	dw CODE_80D8E8
	dw CODE_80DE61
	dw CODE_80CCF1
	dw CODE_80CA32 : dw DATA_80DD4B
	dw CODE_80FC9E

DATA_80D878:
	dw CODE_80D930
	dw CODE_80DE61
	dw CODE_80CCF1
	dw CODE_80CA32 : dw DATA_80DD4B
	dw CODE_80FC9E

DATA_80D884:
	dw CODE_80DE19
	dw CODE_80DE4A
	dw CODE_80DE61
	dw CODE_80D976
	dw CODE_80CCF1
	dw CODE_80CA32 : dw DATA_80DD4B
	dw CODE_80FC9E

DATA_80D894:
	dw CODE_80D9A1
	dw CODE_80DE19
	dw CODE_80DE61
	dw CODE_80CCF1
	dw CODE_80C2E5 : dw DATA_80DD4B

DATA_80D8A0:
	dw CODE_80D8D4
	dw CODE_80DE8B
	dw CODE_80CCF1
	dw CODE_80CA32 : dw DATA_80DD4B
	dw CODE_80FC9E

DATA_80D8AC:
	dw CODE_80D930
	dw CODE_80DE8B
	dw CODE_80CCF1
	dw CODE_80CA32 : dw DATA_80DD4B
	dw CODE_80FC9E

DATA_80D8B8:
	dw CODE_80DE19
	dw CODE_80DE4A
	dw CODE_80DE8B
	dw CODE_80D976
	dw CODE_80CCF1
	dw CODE_80CA32 : dw DATA_80DD4B
	dw CODE_80FC9E

DATA_80D8C8:
	dw CODE_80D9A1
	dw CODE_80DE19
	dw CODE_80DE8B
	dw CODE_80CCF1
	dw CODE_80C2E5 : dw DATA_80DD4B

;--------------------------------------------------------------------

CODE_80D8D4:
	PHX
	LDX.b $B4
	LDA.w #$016A
	LDY.b $84,x
	BEQ.b CODE_80D8E0
	INC
	INC
CODE_80D8E0:
	STA.b $36,x
	CMP.b $BC,x
	BEQ.b CODE_80D8FA
	BNE.b CODE_80D92E				; Note: This will always branch.

CODE_80D8E8:
	PHX
	LDX.b $B4
	LDA.w #$016A
	LDY.b $84,x
	BEQ.b CODE_80D8F4
	INC
	INC
CODE_80D8F4:
	STA.b $30,x
	CMP.b $BA,x
	BNE.b CODE_80D92E
CODE_80D8FA:
	LDA.b $60,x
	AND.w #$7FFF
	STA.b $60,x
	LDA.w #$0008
	STA.b $80,x
	LDA.w #$6600
	STA.b $7A,x
	STZ.b $7E,x
	LDA.w #$8000
	STA.b $78,x
	STZ.b $7C,x
	INC.b $72,x
	INC.b $72,x
	LDA.w #$0028
	STA.b $76,x
	LDA.b $84,x
	BMI.b CODE_80D928
	BEQ.b CODE_80D928
	LDA.w #$001E
	STA.b $84,x
CODE_80D928:
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

CODE_80D92E:
	PLX
	RTS

;--------------------------------------------------------------------

CODE_80D930:
	PHX
	LDX.b $B4
	LDA.b $84,x
	DEC
	BNE.b CODE_80D943
	LDA.w #$0010
	CPX.w #$1000
	BEQ.b CODE_80D941
	LSR
CODE_80D941:
	TSB.b $D2
CODE_80D943:
	DEC.b $76,x
	BNE.b CODE_80D970
	LDA.b $2A,x
	ADC.w #$8000
	STA.b $00
	LDA.w #$0040
	STA.b $02
	JSL.l CODE_819C67
	STA.b $24,x
	LDA.w #$1000
	STA.b $20,x
	LDA.w #$FFC0
	STA.b $7E,x
	INC.b $72,x
	INC.b $72,x
	LDA.w #DATA_80DA25
	STA.b $74,x
	JSL.l CODE_84D949
CODE_80D970:
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80D976:
	PHX
	LDX.b $B4
	LDA.b $7A,x
	CMP.w #$6600
	BEQ.b CODE_80D98C
	CMP.w #$5900
	BNE.b CODE_80D99B
	LDA.w #$0040
	STA.b $7E,x
	BRA.b CODE_80D99B

CODE_80D98C:
	LDA.w #DATA_80DA08
	STA.b $74,x
	STZ.b $76,x
	INC.b $72,x
	INC.b $72,x
	STZ.b $22,x
	STZ.b $24,x
CODE_80D99B:
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80D9A1:
	PHX
	LDX.b $B4
	LDA.b $74,x
	CMP.w #DATA_80DA12
	BNE.b CODE_80D9B1
	LDA.b $B8
	JSL.l CODE_84D92D
CODE_80D9B1:
	LDA.b $80,x
	SEC
	SBC.w #$0014
	BMI.b CODE_80D9C1
	TAY
	LDA.w DATA_80DF06,y
	TAY
	JSR.w CODE_80DEB9
CODE_80D9C1:
	LDA.b $80,x
	CMP.w #$0022
	BEQ.b CODE_80D9E3
	CMP.w #$0018
	BNE.b CODE_80D9FF
	LDA.w #$0000
	BIT.b $84,x
	BPL.b CODE_80D9D7
	LDA.w #$0080
CODE_80D9D7:
	LDY.b $B8
	BNE.b CODE_80D9DF
	STA.b $30,x
	BRA.b CODE_80D9E1

CODE_80D9DF:
	STA.b $36,x
CODE_80D9E1:
	BRA.b CODE_80D9FF

CODE_80D9E3:
	LDA.w #$0400
	ORA.b $E2,x
	STA.b $E2,x
	LDA.w #$002A
	JSL.l CODE_80DA05
	STZ.b $6C,x
	STZ.b $6E,x
	STZ.b $70,x
	STZ.b $72,x
	STZ.b $76,x
	STZ.b $5E,x
	STZ.b $20,x
CODE_80D9FF:
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

CODE_80DA05:
	JMP.w [$0FDC]

;--------------------------------------------------------------------

DATA_80DA08:
	db $03,$12,$03,$08,$03,$12,$03,$08
	db $03,$12

DATA_80DA12:
	db $03,$08,$03,$16,$03,$18,$03,$1A
	db $03,$1C,$05,$1E,$05,$20,$05,$22
	db $80,$20,$DA

DATA_80DA25:
	db $01,$08,$03,$06,$03,$04,$05,$02
	db $17,$00,$05,$02,$03,$04,$03,$06
	db $01,$08,$03,$0A,$03,$0C,$05,$0E
	db $17,$10,$05,$0E,$03,$0C,$03,$0A
	db $80,$25,$DA

DATA_80DA48:
	dw CODE_80C9B2
	dw CODE_80C5DF : dw DATA_80DA62,DATA_80DD35

DATA_80DA50:
	dw CODE_80C3C4 : dw DATA_80DA62,DATA_80DD35

DATA_80DA56:
	dw CODE_80C627 : dw DATA_80DA62,DATA_80DD35

CODE_80DA5C:
	dw CODE_80C45E : dw DATA_80DA62,DATA_80DD35

DATA_80DA62:
	dw DATA_80DC2D,DATA_80DC23,DATA_80DC23,DATA_80DC23,DATA_80DC23,DATA_80DC23,DATA_80DC23,DATA_80DC23
	dw DATA_80DC23,DATA_80DC23,DATA_80DC23,DATA_80DC23,DATA_80DC23,DATA_80DC23,DATA_80DC23,DATA_80DC2D
	dw DATA_80DC4B,DATA_80DC41,DATA_80DC41,DATA_80DC41,DATA_80DC41,DATA_80DC41,DATA_80DC41,DATA_80DC41
	dw DATA_80DC41,DATA_80DC41,DATA_80DC41,DATA_80DC41,DATA_80DC41,DATA_80DC41,DATA_80DC41,DATA_80DC4B
	dw DATA_80DC5F,DATA_80DC55,DATA_80DC55,DATA_80DC55,DATA_80DC55,DATA_80DC55,DATA_80DC55,DATA_80DC55
	dw DATA_80DC55,DATA_80DC55,DATA_80DC55,DATA_80DC55,DATA_80DC55,DATA_80DC55,DATA_80DC55,DATA_80DC5F
	dw DATA_80DC73,DATA_80DC73,DATA_80DC69,DATA_80DC69,DATA_80DC69,DATA_80DC69,DATA_80DC69,DATA_80DC69
	dw DATA_80DC69,DATA_80DC69,DATA_80DC69,DATA_80DC69,DATA_80DC69,DATA_80DC69,DATA_80DC73,DATA_80DC73
	dw DATA_80DC87,DATA_80DC87,DATA_80DC7D,DATA_80DC7D,DATA_80DC7D,DATA_80DC7D,DATA_80DC7D,DATA_80DC7D
	dw DATA_80DC7D,DATA_80DC7D,DATA_80DC7D,DATA_80DC7D,DATA_80DC7D,DATA_80DC7D,DATA_80DC87,DATA_80DC87
	dw DATA_80DC91,DATA_80DC91,DATA_80DC91,DATA_80DC91,DATA_80DC91,DATA_80DC91,DATA_80DC91,DATA_80DC91
	dw DATA_80DC91,DATA_80DC91,DATA_80DC91,DATA_80DC91,DATA_80DC91,DATA_80DC91,DATA_80DC91,DATA_80DC91
	dw DATA_80DC97,DATA_80DC97,DATA_80DC97,DATA_80DC97,DATA_80DC97,DATA_80DC97,DATA_80DC97,DATA_80DC97
	dw DATA_80DC97,DATA_80DC97,DATA_80DC97,DATA_80DC97,DATA_80DC97,DATA_80DC97,DATA_80DC97,DATA_80DC97
	dw DATA_80DC9D,DATA_80DC9D,DATA_80DC9D,DATA_80DC9D,DATA_80DC9D,DATA_80DC9D,DATA_80DC9D,DATA_80DC9D
	dw DATA_80DC9D,DATA_80DC9D,DATA_80DC9D,DATA_80DC9D,DATA_80DC9D,DATA_80DC9D,DATA_80DC9D,DATA_80DC9D
	dw DATA_80DCA3,DATA_80DCA3,DATA_80DCA3,DATA_80DCA3,DATA_80DCA3,DATA_80DCA3,DATA_80DCA3,DATA_80DCA3
	dw DATA_80DCA3,DATA_80DCA3,DATA_80DCA3,DATA_80DCA3,DATA_80DCA3,DATA_80DCA3,DATA_80DCA3,DATA_80DCA3
	dw DATA_80DCAD,DATA_80DCAD,DATA_80DCAD,DATA_80DCAD,DATA_80DCAD,DATA_80DCAD,DATA_80DCAD,DATA_80DCAD
	dw DATA_80DCAD,DATA_80DCAD,DATA_80DCAD,DATA_80DCAD,DATA_80DCAD,DATA_80DCAD,DATA_80DCAD,DATA_80DCAD
	dw DATA_80DCB3,DATA_80DCB3,DATA_80DCB3,DATA_80DCB3,DATA_80DCB3,DATA_80DCB3,DATA_80DCB3,DATA_80DCB3
	dw DATA_80DCB3,DATA_80DCB3,DATA_80DCB3,DATA_80DCB3,DATA_80DCB3,DATA_80DCB3,DATA_80DCB3,DATA_80DCB3
	dw DATA_80DC23,DATA_80DC37,DATA_80DC37,DATA_80DC2D,DATA_80DC2D,DATA_80DD4B,DATA_80DC2D,DATA_80DC2D

DATA_80DBD2:
	dw $1E00,$1E20

CODE_80DBD6:
	LDY.w #DATA_80DC19
	BRA.b CODE_80DBDE

CODE_80DBDB:
	LDY.w #DATA_80DC0F
CODE_80DBDE:
	PHX
	LDX.b $B8
	LDA.b $A8,x
	CMP.b $B4
	BNE.b CODE_80DC09
	LDX.b $B4
	LDA.b $A0,x
	CMP.w #$0004
	BCC.b CODE_80DC09
	LDX.b $B8
	LDA.w DATA_80DBD2,x
	TAX
	LDA.b $42,x
	CMP.w #$2CAB
	BNE.b CODE_80DC09
	LDA.b $46,x
	CMP.w #$D1AA
	BCS.b CODE_80DC0D
	PLX
	TYX
	JMP.w CODE_80BC86

CODE_80DC09:
	PLX
	JMP.w CODE_80BC86

CODE_80DC0D:
	PLX
	RTS

DATA_80DC0F:
	dw CODE_80BC86 : dw DATA_80DCF5,DATA_80DCE5,$0000,DATA_80DD05

DATA_80DC19:
	dw CODE_80BC86 : dw DATA_80DCF5,DATA_80DCED,$0000,DATA_80DD05

DATA_80DC23:
	dw CODE_80DBDB : dw DATA_80E7DA,DATA_80DCC1,$0000,DATA_80E7EA

DATA_80DC2D:
	dw CODE_80DBD6 : dw DATA_80E7DA,DATA_80DCD5,$0000,DATA_80E7EA

DATA_80DC37:
	dw CODE_80DBD6 : dw DATA_80E7DA,DATA_80DCB9,$0000,DATA_80E7EA

DATA_80DC41:
	dw CODE_80BC7E : dw DATA_80E7DA,DATA_80DCC1,$0001,DATA_80E7EA

DATA_80DC4B:
	dw CODE_80BC7E : dw DATA_80E7DA,DATA_80DCD5,$0001,DATA_80E7EA

DATA_80DC55:
	dw CODE_80BC7E : dw DATA_80E7DA,DATA_80DCC1,$0002,DATA_80E7EA

DATA_80DC5F:
	dw CODE_80BC7E : dw DATA_80E7DA,DATA_80DCD5,$0002,DATA_80E7EA

DATA_80DC69:
	dw CODE_80BC7E : dw DATA_80E80A,DATA_80DCC9,$FFFE,DATA_80E81A

DATA_80DC73:
	dw CODE_80BC7E : dw DATA_80DD15,DATA_80DCDD,$FFFE,DATA_80DD25

DATA_80DC7D:
	dw CODE_80BC7E : dw DATA_80E80A,DATA_80DCC9,$FFFF,DATA_80E81A

DATA_80DC87:
	dw CODE_80BC7E : dw DATA_80DD15,DATA_80DCDD,$FFFF,DATA_80DD25

DATA_80DC91:
	dw CODE_80BD5E,$2000,$FFFE

DATA_80DC97:
	dw CODE_80BD5E,$2000,$FFFF

DATA_80DC9D:
	dw CODE_80BD5E,$2000,$0000

DATA_80DCA3:
	dw CODE_80BC1C,DATA_80E832,DATA_80DCD1,$0001,DATA_80E832

DATA_80DCAD:
	dw CODE_80BD76,$2000,$FFFE

DATA_80DCB3:
	dw CODE_80BD76,$2000,$FFFF

DATA_80DCB9:
	dw $2000,$2002,$2020,$6020

DATA_80DCC1:
	dw $2000,$2002,$2020,$2022

DATA_80DCC9:
	dw $2000,$2001,$2010,$2011

DATA_80DCD1:
	dw $2000,$2001

DATA_80DCD5:
	dw $2000,$6000,$2020,$6020

DATA_80DCDD:
	dw $2000,$6000,$2010,$6010

DATA_80DCE5:
	dw $2000,$2002,$2000,$2002

DATA_80DCED:
	dw $2000,$6000,$2000,$6000

DATA_80DCF5:
	dw $FFF0,$FFF0,$FFF0,$0000,$FFF0,$FFF0,$FFF0,$0000

DATA_80DD05:
	dw $FFF0,$0000,$FFF0,$FFF0,$FFF0,$0000,$FFF0,$FFF0

DATA_80DD15:
	dw $FFE8,$FFF4,$FFE8,$FFFB,$FFF0,$FFF4,$FFF0,$FFFB

DATA_80DD25:
	dw $FFE8,$FFFB,$FFE8,$FFF4,$FFF0,$FFFB,$FFF0,$FFF4

DATA_80DD35:
	dw $00E0,$00C0,$00A0,$0080,$0070,$0060,$0050,$0040
	dw $0030,$0020,$0000

DATA_80DD4B:
	dw CODE_80DDED : dw DATA_80DD6F,DATA_80DD73
	dw DATA_80DD77,DATA_80DD7B,DATA_80DD7F,DATA_80DD83,DATA_80DD87
	dw DATA_80DD8B,DATA_80DD8F,DATA_80DD93,DATA_80DD7F,DATA_80DD7F,$0000,DATA_80DD97,DATA_80DD97
	dw DATA_80DD97,DATA_80DD97

DATA_80DD6F:
	dw DATA_80DD97,DATA_80DD9D

DATA_80DD73:
	dw DATA_80DCD5,DATA_80DDA5

DATA_80DD77:
	dw DATA_80DCD5,DATA_80DDAD

DATA_80DD7B:
	dw DATA_80DCD5,DATA_80DDB5

DATA_80DD7F:
	dw DATA_80DCD5,DATA_80DDBD

DATA_80DD83:
	dw DATA_80DCD5,DATA_80DDC5

DATA_80DD87:
	dw DATA_80DCD5,DATA_80DDCD

DATA_80DD8B:
	dw DATA_80DCD5,DATA_80DDD5

DATA_80DD8F:
	dw DATA_80DCD5,DATA_80DDDD

DATA_80DD93:
	dw DATA_80DCD5,DATA_80DDE5

DATA_80DD97:
	dw DATA_80DCD5,DATA_80E7DA,DATA_80DCD5

DATA_80DD9D:
	dw $FFEB,$FFE0,$FFEC,$FFF0

DATA_80DDA5:
	dw $FFEC,$FFE3,$FFED,$FFF3

DATA_80DDAD:
	dw $FFEE,$FFE6,$FFEE,$FFF6

DATA_80DDB5:
	dw $FFEF,$FFEA,$FFEF,$FFFA

DATA_80DDBD:
	dw $FFF0,$FFF0,$FFF0,$0000

DATA_80DDC5:
	dw $FFEF,$FFF6,$FFEF,$0006

DATA_80DDCD:
	dw $FFEE,$FFFA,$FFEE,$000A

DATA_80DDD5:
	dw $FFED,$FFFD,$FFEC,$000D

DATA_80DDDD:
	dw $FFEC,$0000,$FFEB,$0010

DATA_80DDE5:
	dw $FFEF,$FFF0,$FFEF,$0000

;--------------------------------------------------------------------

CODE_80DDED:
	STX.b $00
	LDX.b $B4
	LDA.b $80,x
	CMP.w #$0018
	BEQ.b CODE_80DE18
	BCS.b CODE_80DE04
	CLC
	ADC.b $00
	TAY
	LDX.w !ContextDependentTable+$02,y
	JMP.w CODE_80BC17

CODE_80DE04:
	CLC
	ADC.b $00
	TAY
	BIT.b $84,x
	BMI.b CODE_80DE12
	LDX.w !ContextDependentTable+$02,y
	JMP.w CODE_80BC86

CODE_80DE12:
	LDX.w #DATA_80DC87
	JMP.w CODE_80BC7E

CODE_80DE18:
	RTS

;--------------------------------------------------------------------

CODE_80DE19:
	PHX
	LDX.b $B4
	DEC.b $76,x
	BPL.b CODE_80DE44
	LDY.b $74,x
	LDA.w !ContextDependentTable,y
	BIT.w #$0080
	BEQ.b CODE_80DE33
	LDA.w !ContextDependentTable+$01,y
	TAY
	STY.b $74,x
	LDA.w !ContextDependentTable,y
CODE_80DE33:
	AND.w #$00FF
	STA.b $76,x
	LDA.w !ContextDependentTable+$01,y
	AND.w #$00FF
	STA.b $80,x
	INC.b $74,x
	INC.b $74,x
CODE_80DE44:
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80DE4A:
	TXY
	LDX.b $B4
	LDA.b $78,x
	CLC
	ADC.b $7C,x
	STA.b $78,x
	LDA.b $7A,x
	CLC
	ADC.b $7E,x
	STA.b $7A,x
	TYX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80DE61:
	TXY
	LDX.b $B4
	LDA.w #$00EC
	STA.b $18
	STA.b $06,x
	LDA.b $79,x
	AND.w #$00FF
	ORA.w #$FF00
	STA.b $2C,x
	STA.b $1C
	LDA.b $7B,x
	AND.w #$00FF
	ORA.w #$FF00
	STA.b $2E,x
	STA.b $38,x
	STA.b $1E
	TYX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80DE8B:
	TXY
	LDX.b $B4
	LDA.w #$00EC
	STA.b $18
	STA.b $0E,x
	LDA.b $79,x
	AND.w #$00FF
	ORA.w #$FF00
	STA.b $32,x
	STA.b $1C
	LDA.b $7B,x
	CLC
	ADC.w #$0070
	AND.w #$00FF
	ORA.w #$FF00
	STA.b $34,x
	STA.b $3A,x
	STA.b $1E
	TYX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80DEB9:
	PHX
	LDX.b $3C
	LDA.w !ContextDependentTable,y
	CLC
	ADC.b $BA
	STA.b $00,x
	LDA.w !ContextDependentTable+$02,y
	STA.b $02,x
	LDA.w !ContextDependentTable+$04,y
	CLC
	ADC.b $BA
	STA.b $04,x
	LDA.w !ContextDependentTable+$06,y
	STA.b $06,x
	LDA.w !ContextDependentTable+$08,y
	CLC
	ADC.b $BA
	STA.b $08,x
	LDA.w !ContextDependentTable+$0A,y
	STA.b $0A,x
	LDA.w !ContextDependentTable+$0C,y
	CLC
	ADC.b $BA
	STA.b $0C,x
	LDA.w !ContextDependentTable+$0E,y
	STA.b $0E,x
	TXA
	CLC
	ADC.w #$0010
	STA.b $3C
	TXA
	LSR
	LSR
	LSR
	LSR
	ADC.b $CC
	TAX
	LDA.w #$00AA
	STA.b $00,x
	PLX
	RTS

;--------------------------------------------------------------------

DATA_80DF06:
	dw DATA_80DF2E,DATA_80DF2A,DATA_80DF16,DATA_80DF3E,DATA_80DF4E,DATA_80DF5E,DATA_80DF6E,DATA_80DF2E

DATA_80DF16:
	dw $5678,$6C2E,$E0E0,$0000,$E0E0,$0000,$E0E0,$0000
	dw $E0E0,$0000

DATA_80DF2A:
	dw $5678,$2C2E

DATA_80DF2E:
	dw $E0E0,$0000,$E0E0,$0000,$E0E0,$0000,$E0E0,$0000

DATA_80DF3E:
	dw $4670,$2B0E,$4680,$2B00,$5670,$2B04,$5680,$2B02

DATA_80DF4E:
	dw $E070,$0000,$4680,$2B0E,$5670,$2B02,$5680,$2B00

DATA_80DF5E:
	dw $E070,$0000,$E080,$0000,$5670,$2B00,$5680,$2B0E

DATA_80DF6E:
	dw $E070,$0000,$E080,$0000,$5670,$2B0E,$E080,$0000

DATA_80DF7E:
	dw $0000,CODE_80C7F2
	dw CODE_80DFD8
	dw CODE_80FE07
	dw CODE_80C836
	dw CODE_80E528
	dw CODE_80C2E5 : dw DATA_80DFA2

DATA_80DF8E:
	dw $0000,CODE_80DFED
	dw CODE_80FE07
	dw CODE_80E509
	dw CODE_80C7F2
	dw CODE_80CA32 : dw DATA_80DFA0
	dw CODE_80C8B1
	dw CODE_80C6E3

DATA_80DFA0:
	dw CODE_80C9B2

DATA_80DFA2:
	dw CODE_80E088 : dw DATA_80E0BC,DATA_80E0D8

DATA_80DFA8:
	dw $0060,$FFD0,$0020,$FF90,$0030,$FFC0,$0000,$FFB0
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0100,$0080,$0020,$00C0,$0120,$0100,$0060,$0070

;--------------------------------------------------------------------

CODE_80DFD8:
	PHX
	LDX.b $B4
	LDA.b $62,x
	STA.b $22,x
	LDA.b $64,x
	STA.b $24,x
	LDA.b $66,x
	STA.b $26,x
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80DFED:
	PHX
	LDX.b $B4
	LDA.b $26,x
	SEC
	SBC.w #$0012
	STA.b $26,x
	LDA.b $1F,x
	BPL.b CODE_80E049
	JSL.l CODE_81BB70
	AND.w #$00FF
	CLC
	ADC.w #$0040
	STA.b $26,x
	LDA.b $18,x
	SEC
	SBC.b $28,x
	BPL.b CODE_80E01A
	CMP.w #$FFE0
	BCS.b CODE_80E024
	JSR.w CODE_80E05A
	BRA.b CODE_80E027

CODE_80E01A:
	CMP.w #$0020
	BCC.b CODE_80E024
	JSR.w CODE_80E062
	BRA.b CODE_80E027

CODE_80E024:
	JSR.w CODE_80E04F
CODE_80E027:
	STA.b $22,x
	LDA.b $1C,x
	SEC
	SBC.b $2A,x
	BPL.b CODE_80E03A
	CMP.w #$FFE0
	BCS.b CODE_80E044
	JSR.w CODE_80E05A
	BRA.b CODE_80E047

CODE_80E03A:
	CMP.w #$0020
	BCC.b CODE_80E044
	JSR.w CODE_80E062
	BRA.b CODE_80E047

CODE_80E044:
	JSR.w CODE_80E04F
CODE_80E047:
	STA.b $24,x
CODE_80E049:
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

CODE_80E04F:
	JSL.l CODE_81BB70
	AND.w #$007F
	LSR
	BCC.b CODE_80E069
	RTS

CODE_80E05A:
	JSL.l CODE_81BB70
	AND.w #$007F
	RTS

;--------------------------------------------------------------------

CODE_80E062:
	JSL.l CODE_81BB70
	AND.w #$007F
CODE_80E069:
	EOR.w #$FFFF
	INC
	RTS

;--------------------------------------------------------------------

DATA_80E06E:
	dw $0000
	dw CODE_80E509
	dw CODE_80C7F2
	dw CODE_80C836
	dw CODE_80C2E5 : dw DATA_80E0B6

DATA_80E07A:
	dw $0000
	dw CODE_80E509
	dw CODE_80C7F2
	dw CODE_80CA32 : dw DATA_80E0B4
	dw CODE_80C8B1
	dw CODE_80C6E3

;--------------------------------------------------------------------

CODE_80E088:
	TXY
	LDX.b $B4
	LDA.b $38
	AND.w #$0010
	BEQ.b CODE_80E094
	INY
	INY
CODE_80E094:
	LDX.w !ContextDependentTable+$02,y
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80E09A:
	TXY
	LDX.b $B4
	LDA.b $68,x
	CMP.w #$004C
	BNE.b CODE_80E0A5
	RTS

CODE_80E0A5:
	LDA.b $38
	AND.w #$0010
	BEQ.b CODE_80E0AE
	INY
	INY
CODE_80E0AE:
	LDX.w !ContextDependentTable+$02,y
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

DATA_80E0B4:
	dw CODE_80C9B2

DATA_80E0B6:
	dw CODE_80E09A : dw DATA_80E0BC,DATA_80E0D8

DATA_80E0BC:
	dw CODE_80C309 : dw DATA_80DD35
	dw DATA_80E0F4,DATA_80E0F8,DATA_80E0F8,DATA_80E0FC,DATA_80E100,DATA_80E104,DATA_80E108,DATA_80E10C
	dw DATA_80E110,DATA_80E114,DATA_80E118,DATA_80E118

DATA_80E0D8:
	dw CODE_80C309 : dw DATA_80DD35
	dw DATA_80E11C,DATA_80E120,DATA_80E120,DATA_80E124,DATA_80E128,DATA_80E12C,DATA_80E130,DATA_80E134
	dw DATA_80E138,DATA_80E13C,DATA_80E140,DATA_80E140

DATA_80E0F4:
	dw CODE_80BD66 : dw $2CC0

DATA_80E0F8:
	dw CODE_80BD66 : dw $2CC4

DATA_80E0FC:
	dw CODE_80BD66 : dw $2CC8

DATA_80E100:
	dw CODE_80BD66 : dw $2CCC

DATA_80E104:
	dw CODE_80BD66 : dw $2CE0

DATA_80E108:
	dw CODE_80BD7E : dw $2CE4

DATA_80E10C:
	dw CODE_80BD7E : dw $2CE5

DATA_80E110:
	dw CODE_80BD7E : dw $2CF4

DATA_80E114:
	dw CODE_80BD7E : dw $2CF5

DATA_80E118:
	dw CODE_80BD7E : dw $2CF5

DATA_80E11C:
	dw CODE_80BD66 : dw $2CC2

DATA_80E120:
	dw CODE_80BD66 : dw $2CC6

DATA_80E124:
	dw CODE_80BD66 : dw $2CCA

DATA_80E128:
	dw CODE_80BD66 : dw $2CCE

DATA_80E12C:
	dw CODE_80BD66 : dw $2CE2

DATA_80E130:
	dw CODE_80BD7E : dw $2CE6

DATA_80E134:
	dw CODE_80BD7E : dw $2CE7

DATA_80E138:
	dw CODE_80BD7E : dw $2CF6

DATA_80E13C:
	dw CODE_80BD7E : dw $2CF7

DATA_80E140:
	dw CODE_80BD7E : dw $2CF7

DATA_80E144:
	dw $0000
	dw CODE_80E1CB
	dw CODE_80E509
	dw CODE_80C7BA
	dw CODE_80E16E
	dw CODE_80C836
	dw CODE_80C91C
	dw CODE_80C2E5 : dw DATA_80E2C1

DATA_80E156:
	dw $0000
	dw CODE_80FE07
	dw CODE_80E2A0 : dw DATA_80E1B5
	dw CODE_80E509
	dw CODE_80C7BA
	dw CODE_80E16E
	dw CODE_80CA32 : dw DATA_80E2BF
	dw CODE_80C8B1
	dw CODE_80C947
	dw CODE_80C6E3

;--------------------------------------------------------------------

CODE_80E16E:
	PHX
	LDX.b $B4
	LDA.b $38
	AND.w #$0003
	ASL
	TAY
	LDA.w DATA_80E183,y
	STA.b $1A
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

DATA_80E183:
	dw $0C00,$0000,$0600,$0000

;--------------------------------------------------------------------

DATA_80E18B:
	dw $0000
	dw CODE_80E1CB
	dw CODE_80E509
	dw CODE_80C7BA
	dw CODE_80E1C1
	dw CODE_80C836
	dw CODE_80C91C
	dw CODE_80C2E5 : dw DATA_80E2C1


DATA_80E19D:
	dw $0000
	dw CODE_80FE07
	dw CODE_80E2A0 : dw DATA_80E1B5
	dw CODE_80E509
	dw CODE_80C7BA
	dw CODE_80E1C1
	dw CODE_80CA32 : dw DATA_80E2BF
	dw CODE_80C8B1
	dw CODE_80C947
	dw CODE_80C6E3

DATA_80E1B5:
	dw CODE_80E1E0
	dw CODE_80E212
	dw CODE_80E21F
	dw CODE_80E242
	dw CODE_80E268
	dw CODE_80E290

;--------------------------------------------------------------------

CODE_80E1C1:
	LDA.w #$0600
	STA.b $1A
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80E1CB:
	TXY
	LDX.b $B4
	LDA.b $5F,x
	STA.b $1F,x
	LDA.b $68,x
	STA.b $28,x
	LDA.b $4C,x
	STA.b $0C,x
	TYX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80E1E0:
	TYX
	STZ.b $14,x
	LDA.w #$0010
	STA.b $20,x
	STZ.b $22,x
	STZ.b $24,x
	STZ.b $24,x
	LDA.w #$8100
	LDY.b $C8
	BMI.b CODE_80E1FA
	CMP.w $00C0,y
	BCC.b CODE_80E203
CODE_80E1FA:
	LDY.b $CA
	BMI.b CODE_80E211
	CMP.w $00C0,y
	BCS.b CODE_80E211
CODE_80E203:
	JSL.l CODE_81BB70
	AND.w #$007F
	CLC
	ADC.w #$0010
	JMP.w CODE_80E2BA

CODE_80E211:
	RTS

;--------------------------------------------------------------------

CODE_80E212:
	TYX
	DEC.b $2A,x
	BNE.b CODE_80E21E
	INC.b $28,x
	LDA.w #$FFC0
	STA.b $26,x
CODE_80E21E:
	RTS

;--------------------------------------------------------------------

CODE_80E21F:
	TYX
	LDA.b $1F,x
	BPL.b CODE_80E239
	JSL.l CODE_84D83A
	STZ.b $1E,x
	STZ.b $20,x
	STZ.b $26,x
	LDA.w #$0078
	STA.b $0C,x
	LDA.w #$000E
	JMP.w CODE_80E2BA

CODE_80E239:
	SEC
	LDA.b $26,x
	SBC.w #$0020
	STA.b $26,x
	RTS

;--------------------------------------------------------------------

CODE_80E242:
	TYA
	SEC
	SBC.w #$0040
	CMP.w $1050
	BNE.b CODE_80E251
	LDA.w $1052
	BNE.b CODE_80E260
CODE_80E251:
	CPY.w $1150
	BNE.b CODE_80E25B
	LDA.w $1152
	BNE.b CODE_80E260
CODE_80E25B:
	TYX
	LDA.b $0C,x
	BRA.b CODE_80E2B6

CODE_80E260:
	TYX
	LDA.w #$000C
	STA.b $0C,x
	BRA.b CODE_80E2B6

CODE_80E268:
	TYA
	SEC
	SBC.w #$0040
	CMP.w $1050
	BNE.b CODE_80E277
	LDA.w $1052
	BNE.b CODE_80E284
CODE_80E277:
	CPY.w $1150
	BNE.b CODE_80E281
	LDA.w $1152
	BNE.b CODE_80E284
CODE_80E281:
	TYX
	BRA.b CODE_80E2B6

CODE_80E284:
	TYX
	LDA.w #$0014
	CMP.b $2A,x
	BCS.b CODE_80E2B6
	STA.b $2A,x
	BRA.b CODE_80E2B6

CODE_80E290:
	TYX
	LDA.w #$0040
	STA.b $26,x
	LDA.b $20,x
	CMP.w #$0010
	BCC.b CODE_80E29F
	STZ.b $28,x
CODE_80E29F:
	RTS

CODE_80E2A0:
	PHX
	LDY.b $B4
	LDA.w $0028,y
	ASL
	ADC.w !ContextDependentTable+$02,x
	TAX
	JSR.w (!ContextDependentTable,x)
	PLX
	INX
	INX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

CODE_80E2B6:
	DEC.b $2A,x
	BNE.b CODE_80E2BE
CODE_80E2BA:
	STA.b $2A,x
	INC.b $28,x
CODE_80E2BE:
	RTS

;--------------------------------------------------------------------

DATA_80E2BF:
	dw CODE_80C9B2

DATA_80E2C1:
	dw DATA_80E2DF
	dw CODE_80C309 : dw DATA_80DD35,DATA_80E59E,DATA_80E5A4,DATA_80E5AC,DATA_80E5B4,DATA_80E5E4,DATA_80E5EA,DATA_80E5F0
			 dw DATA_80E5F6,DATA_80E5FE,DATA_80E604,DATA_80E60A,DATA_80E610

DATA_80E2DF:
	dw CODE_80B4A4

;--------------------------------------------------------------------

CODE_80E2E1:
	LDA.w $001F,y
	BNE.b CODE_80E2F8
	LDA.w $0028,y
	CMP.w #$0003
	BNE.b CODE_80E2F8
	LDA.b $38
	LSR
	LDA.w #$0000
	ADC.b $1E
	STA.b $1E
CODE_80E2F8:
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

DATA_80E2FD:
	dw CODE_80E311
	dw CODE_80E324
	dw CODE_80E32B
	dw CODE_80E32F
	dw CODE_80E338

CODE_80E307:
	TXY
	LDX.b $B4
	LDA.b $28,x
	ASL
	TAX
	JMP.w (DATA_80E2FD,x)

CODE_80E311:
	LDX.b $B4
	STZ.b $1F,x
	STZ.b $26,x
	JSL.l CODE_81BB70
	AND.w #$003F
	CLC
	ADC.w #$0010
	BRA.b CODE_80E350

CODE_80E324:
	LDX.b $B4
	LDA.w #$001E
	BRA.b CODE_80E34C

CODE_80E32B:
	LDX.b $B4
	BRA.b CODE_80E34C

CODE_80E32F:
	LDX.b $B4
	LDA.w #$00A0
	STA.b $26,x
	BRA.b CODE_80E350

CODE_80E338:
	LDX.b $B4
	LDA.b $26,x
	SEC
	SBC.w #$0008
	STA.b $26,x
	LDA.b $1F,x
	BPL.b CODE_80E34A
	STZ.b $1F,x
	STZ.b $28,x
CODE_80E34A:
	BRA.b CODE_80E354

CODE_80E34C:
	DEC.b $2A,x
	BNE.b CODE_80E354
CODE_80E350:
	STA.b $2A,x
	INC.b $28,x
CODE_80E354:
	TYX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80E35A:
	STX.b $00
	LDX.b $B4
	LDA.b $28,x
	INC
	ASL
	ADC.b $00
	TAY
	LDX.w !ContextDependentTable,y
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

DATA_80E36B:
	dw $0000
	dw CODE_80E1CB
	dw CODE_80E509
	dw CODE_80C7F2
	dw CODE_80C836
	dw CODE_80E39F
	dw CODE_80C2E5 : dw DATA_80E3AE

DATA_80E37B:
	dw $0000
	dw CODE_80FE07
	dw CODE_80E307
	dw CODE_80E509
	dw CODE_80C7F2
	dw CODE_80E38F
	dw CODE_80CA32 : dw DATA_80E3AC
	dw CODE_80C8B1
	dw CODE_80C6E3

;--------------------------------------------------------------------

CODE_80E38F:
	LDY.b $B4
	LDA.w !ContextDependentTable+$08,y
	BPL.b CODE_80E39A
	INX
	INX
	INX
	INX
CODE_80E39A:
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80E39F:
	LDY.b $B4
	LDA.w !ContextDependentTable+$08,y
	BPL.b CODE_80E3A7
	RTS

CODE_80E3A7:
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

DATA_80E3AC:
	dw CODE_80C9B2

DATA_80E3AE:
	dw CODE_80E35A : dw DATA_80E3BA,DATA_80E3BA,DATA_80E3BC,DATA_80E3D8,DATA_80E3D8

DATA_80E3BA:
	dw CODE_80C6E3

DATA_80E3BC:
	dw CODE_80C309 : dw DATA_80DD35,DATA_80E46A,DATA_80E46A,DATA_80E476,DATA_80E476,DATA_80E482,DATA_80E488,DATA_80E48E
			 dw DATA_80E49A,DATA_80E4A6,DATA_80E4B2,DATA_80E4B8,DATA_80E4BE

DATA_80E3D8:
	dw CODE_80C309 : dw DATA_80DD35,DATA_80E3F4,DATA_80E3F4,DATA_80E400,DATA_80E400,DATA_80E40C,DATA_80E418,DATA_80E424
			 dw DATA_80E42A,DATA_80E430,DATA_80E436,DATA_80E442,DATA_80E448

DATA_80E3F4:
	dw CODE_80BC7E : dw DATA_80E7DA,DATA_80E44E,$0002,$0000,DATA_80E7FA

DATA_80E400:
	dw CODE_80BC7E : dw DATA_80E7DA,DATA_80E456,$0003,$0000,DATA_80E7FA

DATA_80E40C:
	dw CODE_80BC0F : dw DATA_80E82A,DATA_80E45E,$0003,$0000,DATA_80E83A

DATA_80E418:
	dw CODE_80BC0F : dw DATA_80E82A,DATA_80E45E,$0003,$0000,DATA_80E83A

DATA_80E424:
	dw CODE_80BD5E : dw $2EE0,$FFFE

DATA_80E42A:
	dw CODE_80BD5E : dw $2EE2,$FFFF

DATA_80E430:
	dw CODE_80BD5E : dw $2EE4,$0000

DATA_80E436:
	dw CODE_80BC1C : dw DATA_80E832,DATA_80E466,$0003,$0000,DATA_80E842

DATA_80E442:
	dw CODE_80BD76 : dw $2EE7,$FFFE

DATA_80E448:
	dw CODE_80BD76 : dw $2EF7,$FFFF

DATA_80E44E:
	dw $2EC0,$6EC0,$2EC2,$6EC2

DATA_80E456:
	dw $2EC4,$6EC4,$2EC6,$6EC6

DATA_80E45E:
	dw $2EC8,$2ECA,$2ECC,$2ECE

DATA_80E466:
	dw $2EE6,$2EF6

DATA_80E46A:
	dw CODE_80BC0F : dw DATA_80E84A,DATA_80E44E,$FFFF,$0000,DATA_80E85A

DATA_80E476:
	dw CODE_80BC0F : dw DATA_80E84A,DATA_80E456,$FFFF,$0000,DATA_80E85A

DATA_80E482:
	dw CODE_80BD5E : dw $2EC8,$FFFE

DATA_80E488:
	dw CODE_80BD5E : dw $2ECC,$FFFE

DATA_80E48E:
	dw CODE_80BC1C : dw DATA_80E852,DATA_80E4C4,$FFFE,$0000,DATA_80E862

DATA_80E49A:
	dw CODE_80BC1C : dw DATA_80E852,DATA_80E4C8,$FFFE,$0000,DATA_80E862

DATA_80E4A6:
	dw CODE_80BC1C : dw DATA_80E852,DATA_80E4CC,$FFFE,$0000,DATA_80E862

DATA_80E4B2:
	dw CODE_80BD76 : dw $2EE6,$FFFE

DATA_80E4B8:
	dw CODE_80BD76 : dw $2EE8,$FFFE

DATA_80E4BE:
	dw CODE_80BD76 : dw $2EF8,$FFFE

DATA_80E4C4:
	dw $2EE0,$2EE1

DATA_80E4C8:
	dw $2EE2,$2EE3

DATA_80E4CC:
	dw $2EE4,$2EE5

;--------------------------------------------------------------------

CODE_80E4D0:
	LDA.w !RAM_SMK_Race_CurrentRacetrack
	CMP.w #!Define_SMK_RacetrackID_DonutPlains1
	BNE.b CODE_80E4E2
	LDY.b $B4
	LDA.w #$0400
	LDY.b $B4
	STA.w $0014,y
CODE_80E4E2:
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

DATA_80E4E7:
	dw $0000
	dw CODE_80E509
	dw CODE_80C7F2
	dw CODE_80E4D0
	dw CODE_80C2FC
	dw CODE_80C836
	dw CODE_80C2E5 : dw DATA_80E582

DATA_80E4F7:
	dw $0000
	dw CODE_80E509
	dw CODE_80C7F2
	dw CODE_80E4D0
	dw CODE_80C2FC
	dw CODE_80CA32 : dw DATA_80E580
	dw CODE_80C8B1
	dw CODE_80C6E3

;--------------------------------------------------------------------

CODE_80E509:
	TXY
	LDX.b $B4
	BIT.b $08,x
	BMI.b CODE_80E527
	LDX.b $B8
	BIT.b $C8,x
	BVS.b CODE_80E527
	LDA.w $1EF8,x
	CMP.w $1EFC
	BCS.b CODE_80E524
	TYX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

CODE_80E524:
	JMP.w CODE_80E53E

CODE_80E527:
	RTS

;--------------------------------------------------------------------

CODE_80E528:
	TXY
	LDX.b $B8
	BIT.b $C8,x
	BVS.b CODE_80E53D
	LDA.w $1EF8,x
	CMP.w $1EFC
	BCS.b CODE_80E53D
	TYX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

CODE_80E53D:
	RTS

;--------------------------------------------------------------------

CODE_80E53E:
	LDX.b $B4
	SEP.b #$20
	LDA.b #!DSP1_Command06_ObjectProjectionCalculation
	STA.w !REGISTER_DSP1_DataRegister
	REP.b #$20
	LDA.b $18,x
	ASL
	ASL
	STA.w !REGISTER_DSP1_DataRegister
	LDA.b $1C,x
	ASL
	ASL
	STA.w !REGISTER_DSP1_DataRegister
	LDA.w #$0000
	STA.w !REGISTER_DSP1_DataRegister
	LDA.b $B8
	LSR
	LSR
CODE_80E561:
	LDA.l !REGISTER_DSP1_StatusRegister
	BPL.b CODE_80E561
	LDA.w !REGISTER_DSP1_DataRegister
	LDA.l $000000
	LDA.w !REGISTER_DSP1_DataRegister
	LDA.l $000000
	LDA.w !REGISTER_DSP1_DataRegister
	BCC.b CODE_80E57D
	STA.b $0E,x
	RTS

CODE_80E57D:
	STA.b $06,x
	RTS

;--------------------------------------------------------------------

DATA_80E580:
	dw CODE_80C9B2

DATA_80E582:
	dw CODE_80C309 : dw DATA_80DD35,DATA_80E59E,DATA_80E5A4,DATA_80E5AC,DATA_80E5B4,DATA_80E5E4,DATA_80E5EA,DATA_80E5F0
			 dw DATA_80E5F6,DATA_80E5FE,DATA_80E604,DATA_80E60A,DATA_80E610

DATA_80E59E:
	dw CODE_80BC86 : dw DATA_80E7DA,DATA_80E5BC

DATA_80E5A4:
	dw CODE_80BC7E : dw DATA_80E7DA,DATA_80E5C4,$0002

DATA_80E5AC:
	dw CODE_80BC7E : dw DATA_80E86A,DATA_80E5CC,$0004

DATA_80E5B4:
	dw CODE_80BC7E : dw DATA_80E86A,DATA_80E5D4,$0006

DATA_80E5BC:
	dw $2EC0,$6EC0,$2EC2,$6EC2

DATA_80E5C4:
	dw $2EC4,$6EC4,$2EC6,$6EC6

DATA_80E5CC:
	dw $2EC8,$2ECA,$2EC8,$2ECA

DATA_80E5D4:
	dw $2ECC,$2ECE,$2ECC,$2ECE

DATA_80E5DC:
	dw $2EE6,$2EF6,$2EE6,$2EF6

DATA_80E5E4:
	dw CODE_80BD5E : dw $2EE0,$0000

DATA_80E5EA:
	dw CODE_80BD5E : dw $2EE2,$0000

DATA_80E5F0:
	dw CODE_80BD5E : dw $2EE4,$0000

DATA_80E5F6:
	dw CODE_80BC8B : dw DATA_80E87A,DATA_80E5DC,$0001

DATA_80E5FE:
	dw CODE_80BD76 : dw $2EE7,$FFFF

DATA_80E604:
	dw CODE_80BD76 : dw $2EF7,$0000

DATA_80E60A:
	dw CODE_80BD76 : dw $2EE8,$0000

DATA_80E610:
	dw CODE_80BD76 : dw $2EF8,$0001

DATA_80E616:
	dw $0000
	dw CODE_80E684
	dw CODE_80C7BA
	dw CODE_80C2FC
	dw CODE_80C836
	dw CODE_80C91C
	dw CODE_80C2E5 : dw DATA_80E63C

DATA_80E626:
	dw $0000
	dw CODE_80E6B3
	dw CODE_80E684
	dw CODE_80C7BA
	dw CODE_80C2FC
	dw CODE_80CA32 : dw DATA_80E63A
	dw CODE_80C8B1
	dw CODE_80C947
	dw CODE_80C6E3

DATA_80E63A:
	dw CODE_80C9B2

DATA_80E63C:
	dw CODE_80C309 : dw DATA_80DD35,DATA_80E658,DATA_80E65C,DATA_80E65C,DATA_80E660,DATA_80E664,DATA_80E668,DATA_80E66C
			 dw DATA_80E670,DATA_80E674,DATA_80E678,DATA_80E67C,DATA_80E680

DATA_80E658:
	dw CODE_80BD66 : dw $2320


DATA_80E65C:
	dw CODE_80BD56,$2322

DATA_80E660:
	dw CODE_80BD56,$2324

DATA_80E664:
	dw CODE_80BD56,$2326

DATA_80E668:
	dw CODE_80BD56,$2328

DATA_80E66C:
	dw CODE_80BD6E,$232A

DATA_80E670:
	dw CODE_80BD6E,$232B

DATA_80E674:
	dw CODE_80BD6E,$232C

DATA_80E678:
	dw CODE_80BD6E,$233A

DATA_80E67C:
	dw CODE_80BD6E,$233B

DATA_80E680:
	dw CODE_80BD6E,$233C

CODE_80E684:
	PHX
	LDX.b $B4
	LDY.b $70,x
	LDX.b $82,y
	BEQ.b label_C0E6AD
	CPY.w #$1000
	BEQ.b label_C0E698
	LDA.b $B8
	BNE.b label_C0E6A6
	BEQ.b label_C0E69C				; Note: This will always branch.

label_C0E698:
	LDA.b $B8
	BEQ.b label_C0E6A6
label_C0E69C:
	CPX.w #$0400
	BCS.b label_C0E6A6
	CPX.w #$0080
	BCS.b label_C0E6AB
label_C0E6A6:
	LDA.b $38
	LSR
	BCC.b label_C0E6AD
label_C0E6AB:
	PLX
	RTS

label_C0E6AD:
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

CODE_80E6B3:
	PHX
	LDX.b $B4
	LDA.b $12,x
	AND.w #$1000
	BEQ.b label_C0E6C3
	JSL.l CODE_80C2BE
	PLX
	RTS

label_C0E6C3:
	LDY.b $70,x
	JSR.w label_C0E6DD
	LDA.b $72,x
	CLC
	ADC.w #$0400
	STA.b $72,x
	LDY.w #$0400
	JSL.l CODE_80FE52
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

label_C0E6DD:
	LDA.w $0016,y
	STA.b $16,x
	LDA.w $0018,y
	STA.b $18,x
	LDA.w $001A,y
	STA.b $1A,x
	LDA.w $001C,y
	STA.b $1C,x
	LDA.w $001E,y
	STA.b $1E,x
	LDA.w $0020,y
	STA.b $20,x
	RTS

DATA_80E6FC:
	dw $0000

DATA_80E6FE:
	dw $0000
	dw CODE_80C7BA
	dw CODE_80C836
	dw CODE_80C2E5 : dw DATA_80E716

DATA_80E708:
	dw $0000
	dw CODE_80C7BA
	dw CODE_80CA32 : dw DATA_80E714
	dw CODE_80C8B1
	dw CODE_80C6E3


DATA_80E714:
	dw CODE_80C9B2

DATA_80E716:
	dw CODE_80C309 : dw DATA_80DD35,DATA_80E732,DATA_80E738,DATA_80E73E,DATA_80E744,DATA_80E74A,DATA_80E750,DATA_80E756
			 dw DATA_80E75C,DATA_80E762,DATA_80E768,DATA_80E76E,DATA_80E774

DATA_80E732:
	dw CODE_80BC86 : dw DATA_80E7BA,DATA_80E77A

DATA_80E738:
	dw CODE_80BC86 : dw DATA_80E7BA,DATA_80E782

DATA_80E73E:
	dw CODE_80BC86 : dw DATA_80E7BA,DATA_80E78A

DATA_80E744:
	dw CODE_80BC86 : dw DATA_80E7BA,DATA_80E792

DATA_80E74A:
	dw CODE_80BC93 : dw DATA_80E7CA,DATA_80E79A

DATA_80E750:
	dw CODE_80BC93 : dw DATA_80E7CA,DATA_80E7A2

DATA_80E756:
	dw CODE_80BC93 : dw DATA_80E7CA,DATA_80E7AA

DATA_80E75C:
	dw CODE_80BC93 : dw DATA_80E7CA,DATA_80E7B2

DATA_80E762:
	dw CODE_80BD76 : dw $0EE8,$0006

DATA_80E768:
	dw CODE_80BD76 : dw $0EF8,$0006

DATA_80E76E:
	dw CODE_80BD76 : dw $0EE9,$0006

DATA_80E774:
	dw CODE_80BD76 : dw $0EF9,$0006

DATA_80E77A:
	dw $0EC0,$0EC2,$0EC4,$0E84

DATA_80E782:
	dw $0EC6,$0EC8,$0ECA,$0E84

DATA_80E78A:
	dw $0ECC,$0ECE,$0E84,$0E84

DATA_80E792:
	dw $0EE0,$0EE2,$0E84,$0E84

DATA_80E79A:
	dw $0EE4,$0EE4,$0EF4,$0E84

DATA_80E7A2:
	dw $0EE5,$0EF5,$0E84,$0E84

DATA_80E7AA:
	dw $0EE6,$0EF6,$0E84,$0E84

DATA_80E7B2:
	dw $0EE7,$0EF7,$0E84,$0E84

DATA_80E7BA:
	dw $FFFD,$FFF8,$000D,$FFF8,$001D,$FFF8,$001D,$FFF8

DATA_80E7CA:
	dw $FFFE,$FFFC,$0006,$FFFC,$000E,$FFFC,$000E,$FFFC

DATA_80E7DA:
	dw $FFE0,$FFF0,$FFE0,$0000,$FFF0,$FFF0,$FFF0,$0000

DATA_80E7EA:
	dw $FFE0,$0000,$FFE0,$FFF0,$FFF0,$0000,$FFF0,$FFF0

DATA_80E7FA:
	dw $FFF0,$FFF0,$FFF0,$0000,$FFE0,$FFF0,$FFE0,$0000

DATA_80E80A:
	dw $FFE8,$FFF4,$FFE8,$FFFC,$FFF0,$FFF4,$FFF0,$FFFC

DATA_80E81A:
	dw $FFE8,$FFFC,$FFE8,$FFF4,$FFF0,$FFFC,$FFF0,$FFF4

DATA_80E82A:
	dw $FFE0,$FFF8,$FFF0,$FFF8

DATA_80E832:
	dw $FFF0,$FFFC,$FFF8,$FFFC

DATA_80E83A:
	dw $FFF0,$FFF8,$FFE0,$FFF8

DATA_80E842:
	dw $FFF8,$FFFC,$FFF0,$FFFC

DATA_80E84A:
	dw $FFF0,$FFF0,$FFF0,$0000

DATA_80E852:
	dw $FFF8,$FFF8,$FFF8,$0000

DATA_80E85A:
	dw $FFF8,$FFF0,$FFF8,$0000

DATA_80E862:
	dw $FFFC,$FFF8,$FFFC,$0000

DATA_80E86A:
	dw $FFE0,$FFF8,$FFF0,$FFF8,$FFE0,$FFF8,$FFF0,$FFF8

DATA_80E87A:
	dw $FFF0,$FFFC,$FFF8,$FFFC,$FFF0,$FFFC,$FFF8,$FFFC

;--------------------------------------------------------------------

CODE_80E88A:
	PHX
	LDX.b $B4
	LDY.b $B8
	LDA.w $0021,y
	LDY.b $9E,x
	LSR
	BCS.b CODE_80E8AA
	LSR
	BCS.b CODE_80E8A1
	TYA
	BEQ.b CODE_80E8B3
	BMI.b CODE_80E8AA
	BPL.b CODE_80E8A1				; Note: This will always branch.

CODE_80E8A1:
	TYA
	CMP.w #$FFF9
	BEQ.b CODE_80E8B1
	DEC
	BRA.b CODE_80E8B1

CODE_80E8AA:
	TYA
	CMP.w #$0007
	BEQ.b CODE_80E8B1
	INC
CODE_80E8B1:
	STA.b $9E,x
CODE_80E8B3:
	LDA.w $1F06
	AND.w #$0010
	BEQ.b CODE_80E909
	LDY.b $B8
	LDA.w $0028,y
	LDY.w #$8000
	BIT.w #$0080
	BNE.b CODE_80E904
	LDY.w #$2000
	BIT.w #$0040
	BNE.b CODE_80E904
	BIT.w #$4000
	BEQ.b CODE_80E8EC
	LDY.w #$4000
	BIT.w #$0800
	BEQ.b CODE_80E8E2
	LDY.w #$0040
	BRA.b CODE_80E904

CODE_80E8E2:
	BIT.w #$0400
	BEQ.b CODE_80E904
	LDY.w #$0200
	BRA.b CODE_80E904

CODE_80E8EC:
	LDY.w #$0800
	BIT.w #$2000
	BNE.b CODE_80E904
	LDY.w #$1000
	BIT.w #$0020
	BNE.b CODE_80E904
	LDY.w #$0400
	BIT.w #$0010
	BEQ.b CODE_80E909
CODE_80E904:
	TYA
	ORA.b $E0,x
	STA.b $E0,x
CODE_80E909:
	LDA.b $E0,x
	BIT.w #$1C00
	BEQ.b CODE_80E954
	LDY.w #$0000
	BIT.w #$0800
	BNE.b CODE_80E92A
	INY
	BIT.w #$1000
	BNE.b CODE_80E93F
	INY
CODE_80E91F:
	AND.w #$E3FF
	STA.b $E0,x
	JSR.w CODE_80F17A
	JMP.w CODE_80EA35

CODE_80E92A:
	LDX.b $B8
	LDA.b $20,x
	AND.w #$0B00
	CMP.w #$0800
	BNE.b CODE_80E939
	LDY.w #$0006
CODE_80E939:
	LDX.b $B4
	LDA.b $E0,x
	BRA.b CODE_80E91F

CODE_80E93F:
	LDX.b $B8
	LDA.b $20,x
	AND.w #$0700
	CMP.w #$0400
	BNE.b CODE_80E94E
	LDY.w #$0007
CODE_80E94E:
	LDX.b $B4
	LDA.b $E0,x
	BRA.b CODE_80E91F

CODE_80E954:
	BIT.w #$0200
	BEQ.b CODE_80E9CB
	AND.w #$FDFF
	STA.b $E0,x
	LDA.w #$0480
	STA.b $82,x
	LDA.b $B8
	TAY
	EOR.w #$0002
	TAX
	LDA.w $0D70,x
	BPL.b CODE_80E9B2
	STA.w $0D70,y
	AND.w #$A000
	CMP.w #$A000
	BEQ.b CODE_80E98B
	LDA.w $0D70,y
	AND.w #$000F
	ORA.w #$8000
	STA.w $0D70,y
	LDA.w #$0040
	BRA.b CODE_80E98E

CODE_80E98B:
	LDA.w $0D78,x
CODE_80E98E:
	STA.w $0D78,y
	LDA.w $0D74,x
	STA.w $0D74,y
	LDA.w $0D7C,x
	STA.w $0D7C,y
	LDA.w #$0040
	STA.w $0D78,x
	LDA.w #$9000
	STA.w $0D70,x
	LDA.w #$0056
	JSL.l CODE_80E9C8
	BRA.b CODE_80E9C5

CODE_80E9B2:
	LDA.w #$0040
	STA.w $0D78,y
	LDA.w #$9000
	STA.w $0D70,y
	LDA.w #$0057
	JSL.l CODE_80E9C8
CODE_80E9C5:
	JMP.w CODE_80EA35

CODE_80E9C8:
	JMP.w [$0FDC]

CODE_80E9CB:
	BIT.w #$0100
	BEQ.b CODE_80E9E7
	AND.w #$FEFF
	STA.b $E0,x
	LDY.b $B8
	LDA.w #$000D
	STA.w $0FC0,y
	LDA.w $0E00,y
	INC
	INC
	STA.w $0E00,y
	BRA.b CODE_80EA35

CODE_80E9E7:
	BIT.w #$0040
	BEQ.b CODE_80E9F8
	AND.w #$FFBF
	STA.b $E0,x
	PHX
	JSR.w CODE_80EA3B
	PLX
	BRA.b CODE_80EA35

CODE_80E9F8:
	BIT.w #$2000
	BEQ.b CODE_80EA09
	LDA.w #$8000
	ORA.b $4E,x
	STA.b $4E,x
	LDA.w #$0200
	BRA.b CODE_80EA33

CODE_80EA09:
	LDA.b $86,x
	BEQ.b CODE_80EA35
	DEC
	BEQ.b CODE_80EA1F
	LDY.b $68,x
	CPY.w #$0052
	BCC.b CODE_80EA33
	DEC
	BEQ.b CODE_80EA1F
	BPL.b CODE_80EA33
	LDA.w #$0000
CODE_80EA1F:
	PHA
	LDA.w #$4000
	AND.b $E2,x
	STA.b $E2,x
	LDA.b $4E,x
	AND.w #$7FFF
	STA.b $4E,x
	JSL.l CODE_80A631
	PLA
CODE_80EA33:
	STA.b $86,x
CODE_80EA35:
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

CODE_80EA3B:
	STX.b $00
	LDA.w #$0800
	TSB.b $D2
	LDY.w #$0016
	LDA.w $1E88
	BNE.b CODE_80EA4D
	STY.w $1E88
CODE_80EA4D:
	LDA.w $1E8A
	BNE.b CODE_80EA55
	STY.w $1E8A
CODE_80EA55:
	LDA.w #$0040
	STA.w $0F8C
	STA.w $0F8E
	LDY.b $B8
	LDY.w #$010E
	LDX.b $00,y
CODE_80EA65:
	CPX.b $00
	BEQ.b CODE_80EAA0
	LDA.w #$0300
	ORA.b $E2,x
	STA.b $E2,x
	LDA.w #$1000
	STA.b $E4,x
	LDA.b $8C,x
	ORA.w #$0003
	STA.b $8C,x
	LDA.b $84,x
	BMI.b CODE_80EAA0
	BEQ.b CODE_80EA8C
	CMP.w #$0400
	BCS.b CODE_80EAA0
	LDA.w #$03FF
	BRA.b CODE_80EA9E

CODE_80EA8C:
	BIT.b $10,x
	BPL.b CODE_80EA9B
	LDA.w #$0040
	CPX.w #$1000
	BEQ.b CODE_80EA99
	LSR
CODE_80EA99:
	TSB.b $D2
CODE_80EA9B:
	LDA.w #$0440
CODE_80EA9E:
	STA.b $84,x
CODE_80EAA0:
	INY
	INY
	LDX.b $00,y
	BNE.b CODE_80EA65
	RTS

;--------------------------------------------------------------------

CODE_80EAA7:
	PHX
	LDX.b $B4
	LDA.b $4E,x
	LDY.b $AC,x
	CPY.w #$0010
	BNE.b CODE_80EAB8
	ORA.w #$0020
	BRA.b CODE_80EABB

CODE_80EAB8:
	AND.w #$FFDF
CODE_80EABB:
	STA.b $4E,x
	LDA.b $60,x
	BPL.b CODE_80EAD3
	LDA.b $E4,x
	CMP.w #$0100
	BCS.b CODE_80EACC
	LDA.b $86,x
	BEQ.b CODE_80EAD3
CODE_80EACC:
	LDA.w #$7FFF
	AND.b $60,x
	STA.b $60,x
CODE_80EAD3:
	LDA.b $82,x
	BEQ.b CODE_80EADA
	DEC
	STA.b $82,x
CODE_80EADA:
	LDA.b $2C
	CMP.w #$0006
	BEQ.b CODE_80EB23
	LDY.b $B8
	LDA.w $0E00,y
	BNE.b CODE_80EAEF
	LDA.b $4E,x
	AND.w #$FFF7
	BRA.b CODE_80EAF4

CODE_80EAEF:
	LDA.b $4E,x
	ORA.w #$0008
CODE_80EAF4:
	STA.b $4E,x
	LDA.b $84,x
	CMP.w #$0040
	BNE.b CODE_80EB08
	LDA.w #$2000
	CPX.w #$1000
	BEQ.b CODE_80EB06
	LSR
CODE_80EB06:
	TSB.b $D2
CODE_80EB08:
	LDA.b $84,x
	BEQ.b CODE_80EB23
	BMI.b CODE_80EB23
	DEC
	STA.b $84,x
	BEQ.b CODE_80EB1C
	LDA.b $4E,x
	AND.w #$FFEF
	STA.b $4E,x
	BRA.b CODE_80EB23

CODE_80EB1C:
	LDA.b $4E,x
	ORA.w #$0010
	STA.b $4E,x
CODE_80EB23:
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80EB29:
	PHX
	LDA.b $37
	AND.w #$0700
	ORA.w #$1000
	CMP.b $B4
	BNE.b CODE_80EB92
	TAX
	LDA.b $88,x
	BPL.b CODE_80EB49
	CLC
	ADC.w #$0008
	BIT.w #$0100
	BEQ.b CODE_80EB47
	LDA.w #$0000
CODE_80EB47:
	STA.b $88,x
CODE_80EB49:
	LDA.b $86,x
	BEQ.b CODE_80EB6A
	SEC
	SBC.w #$0008
	BPL.b CODE_80EB56
	LDA.w #$0000
CODE_80EB56:
	STA.b $86,x
	BEQ.b CODE_80EB63
	LDA.b $4E,x
	ORA.w #$8000
	STA.b $4E,x
	BRA.b CODE_80EB6A

CODE_80EB63:
	LDA.b $4E,x
	AND.w #$0FFF
	STA.b $4E,x
CODE_80EB6A:
	LDA.b $84,x
	BEQ.b CODE_80EB92
	BMI.b CODE_80EB92
	SEC
	SBC.w #$0008
	BPL.b CODE_80EB79
	LDA.w #$0000
CODE_80EB79:
	STA.b $84,x
	BEQ.b CODE_80EB86
	LDA.b $4E,x
	AND.w #$FFEF
	STA.b $4E,x
	BRA.b CODE_80EB92

CODE_80EB86:
	LDA.w #$0400
	TSB.b $D2
	LDA.b $4E,x
	ORA.w #$0010
	STA.b $4E,x
CODE_80EB92:
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80EB98:
	LDX.w #$0000
	LDY.w #DATA_80EBBF
	LDA.w #$0000
	JSR.w CODE_80EBE3
	LDA.w #$7000
	LDY.w #DATA_80EBBF
	JSR.w CODE_80EBE3
	LDY.w #DATA_80EBD1
	LDA.w #$0000
	JSR.w CODE_80EBE3
	LDY.w #DATA_80EBD1
	LDA.w #$7000
	JMP.w CODE_80EBE3

DATA_80EBBF:
	dw $5F70,$3AEB,$5F78,$3AEC,$5F80,$3AEC,$5F88,$6AEB
	dw $0000

DATA_80EBD1:
	dw $5C78,$3AEB,$5C80,$7AEB,$E000,$0000,$E000,$0000
	dw $0000

;--------------------------------------------------------------------

CODE_80EBE3:
	STA.b $00
CODE_80EBE5:
	LDA.w !ContextDependentTable,y
	BEQ.b CODE_80EC02
	CLC
	ADC.b $00
	STA.l $7FDF00,x
	LDA.w !ContextDependentTable+$02,y
	STA.l $7FDF02,x
	INY
	INY
	INY
	INY
	INX
	INX
	INX
	INX
	BRA.b CODE_80EBE5

CODE_80EC02:
	RTS

;--------------------------------------------------------------------

DATA_80EC03:
	dw $7FDF00
	dw $7FDF10
	dw $7FDF20
	dw $7FDF30
	
DATA_80EC0B:
	dw DATA_80EDCE
	dw DATA_80EDD4

DATA_80EC0F:
	dw DATA_80EC17
	dw DATA_80EC1D
	dw DATA_80EC23
	dw DATA_80EC29

DATA_80EC17:
	dw $1000,$1100,$0000

DATA_80EC1D:
	dw $1200,$1300,$0000

DATA_80EC23:
	dw $1400,$1500,$0000

DATA_80EC29:
	dw $1600,$1700,$0000

CODE_80EC2F:
	RTS

CODE_80EC30:
	LDA.w $0FBE
	BNE.b CODE_80EC2F
	LDY.b $B8
	LDA.w $1EF8,y
	CMP.w #$0020
	BCS.b CODE_80EC2F
	LDA.w $00C8,y
	BPL.b CODE_80EC4B
	BIT.w #$4000
	BNE.b CODE_80EC2F
	BEQ.b CODE_80EC78				; Note: This will always branch.

CODE_80EC4B:
	CPY.w $1EE4
	BNE.b CODE_80EC78
	TAX
	LDA.w $0E50
	BNE.b CODE_80EC78
	LDA.b $8E,x
	BNE.b CODE_80EC78
	LDA.b $1F,x
	BEQ.b CODE_80EC78
	CMP.w #$1800
	BCS.b CODE_80EC78
	LDA.b $84,x
	BEQ.b CODE_80EC6B
	INY
	INY
	INY
	INY
CODE_80EC6B:
	LDX.w DATA_80EC03,y
	LDY.b $3C
	LDA.w #$000F
	MVN $8002C0>>16,$7FDF00>>16
	STY.b $3C
CODE_80EC78:
	LDA.b $38
	AND.w #$0003
	ASL
	TAY
	LDX.w DATA_80EC0F,y
	LDA.w !ContextDependentTable,x
CODE_80EC85:
	STA.b $B4
	STZ.b $1A
	PHX
	LDX.b $B8
	CMP.b $C8,x
	BEQ.b CODE_80EC97
	TXY
	LDX.w DATA_80EC0B,y
	JSR.w (!ContextDependentTable,x)
CODE_80EC97:
	PLX
	INX
	INX
	LDA.w !ContextDependentTable,x
	BNE.b CODE_80EC85
	LDA.w $0D28
	BNE.b CODE_80ECC5
	LDY.b $B8
	CPY.w $1EE4
	BNE.b CODE_80ECC5
	LDX.w DATA_80EDCA,y
	LDA.b $00,x
	AND.w #$00FF
	CMP.w #$0055
	BEQ.b CODE_80ECC5
	LDX.w DATA_80EDC6,y
	LDY.b $3C
	LDA.w #$000F
	MVN $8003F0>>16,$8002D0>>16
	STY.b $3C
CODE_80ECC5:
	LDX.w $0D28
	JMP.w (DATA_80ED47,x)

CODE_80ECCB:
	RTS

CODE_80ECCC:
	LDX.b $B6
	JMP.w (DATA_80ED57,x)

CODE_80ECD1:
	LDA.w #$0003
	BRA.b CODE_80ECE5

CODE_80ECD6:
	LDX.b $B8
	CPX.w $1EE4
	BEQ.b CODE_80ECDE
	RTS

CODE_80ECDE:
	LDA.b $38
	AND.w #$0002
	BRA.b CODE_80ECE8

CODE_80ECE5:
	AND.b $38
	ASL
CODE_80ECE8:
	TAX
	LDA.w DATA_80ED1D,x
	LDX.b $B8
	CLC
	ADC.w DATA_80ED19,x
	STA.b $B4
	LDX.w #DATA_80ED29
	JMP.w (!ContextDependentTable,x)

CODE_80ECFA:
	LDY.w $1EE4
CODE_80ECFD:
	LDA.w DATA_80ED1D,y
	BEQ.b CODE_80ED18
	LDX.b $B8
	CLC
	ADC.w DATA_80ED19,x
	STA.b $B4
	LDX.w #DATA_80ED29
	PHY
	JSR.w (!ContextDependentTable,x)
	PLY
	INY
	INY
	INY
	INY
	BRA.b CODE_80ECFD

CODE_80ED18:
	RTS

DATA_80ED19:
	dw $0000,$0040

DATA_80ED1D:
	dw $1800,$1880,$1900,$1980,$0000,$0000

DATA_80ED29:
	dw CODE_80ED65
	dw CODE_80C309 : dw DATA_80DD35,DATA_80EE0A,DATA_80EE1A,DATA_80EE1A,DATA_80EE22,DATA_80EE30,DATA_80EE36,DATA_80EE36
			 dw DATA_80EE3C,DATA_80EE3C,DATA_80EE3C,DATA_80EE3C,DATA_80EE3C

DATA_80ED47:
	dw CODE_80ECCB
	dw CODE_80ECCB
	dw CODE_80ECCB
	dw CODE_80ECCB
	dw CODE_80ECCB
	dw CODE_80ECCB
	dw CODE_80ECCC
	dw CODE_80ECCB

DATA_80ED57:
	dw CODE_80ECD6
	dw CODE_80ECD1
	dw CODE_80ECD1
	dw CODE_80ECFA
	dw CODE_80ECFA
	dw CODE_80ECFA
	dw CODE_80ECCB

CODE_80ED65:
	PHX
	LDX.b $B4
	LDA.b $1F,x
	BEQ.b CODE_80ED9A
	LDY.b $B8
	BNE.b CODE_80ED9C
	LDA.b $06,x
	CMP.w #$0300
	BCS.b CODE_80ED9A
	STA.b $18
	LDA.b $38,x
	LDY.b $2C,x
	BRA.b CODE_80ED7F

CODE_80ED7F:
	STA.b $1E
	ADC.w #$0120
	CMP.w #$00C0
	BCS.b CODE_80ED9A
	TYA
	STA.b $1C
	ADC.w #$0110
	CMP.w #$0120
	BCS.b CODE_80ED9A
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

CODE_80ED9A:
	PLX
	RTS

CODE_80ED9C:
	LDA.b $0E,x
	CMP.w #$0300
	BCS.b CODE_80EDC4
	STA.b $18
	LDA.b $3C,x
	LDY.b $3E,x
	STA.b $1E
	ADC.w #$00B0
	CMP.w #$00C0
	BCS.b CODE_80EDC4
	TYA
	STA.b $1C
	ADC.w #$0110
	CMP.w #$0120
	BCS.b CODE_80EDC4
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

CODE_80EDC4:
	PLX
	RTS

DATA_80EDC6:
	dw $03F0,$0610

DATA_80EDCA:
	dw $041F,$063F

DATA_80EDCE:
	dw CODE_80C973
	dw CODE_80C32C
	dw DATA_80EDDA

DATA_80EDD4:
	dw CODE_80C9E8
	dw CODE_80C325
	dw DATA_80EDDA

DATA_80EDDA:
	dw DATA_80EDF2
	dw DATA_80EDFA
	dw DATA_80EE02
	dw DATA_80EE0A
	dw DATA_80EE12
	dw DATA_80EE1A
	dw DATA_80EE22
	dw DATA_80EE2A
	dw DATA_80EE30
	dw DATA_80EE36
	dw DATA_80EE3C
	dw DATA_80EDF2

DATA_80EDF2:
	dw CODE_80BC8B : dw DATA_80EE58,DATA_80EE40,$0001

DATA_80EDFA:
	dw CODE_80BC8B : dw DATA_80EE68,DATA_80EE40,$0000

DATA_80EE02:
	dw CODE_80BC8B : dw DATA_80EE78,DATA_80EE40,$FFFF

DATA_80EE0A:
	dw CODE_80BC8B : dw DATA_80EE88,DATA_80EE48,$FFFF

DATA_80EE12:
	dw CODE_80BC8B : dw DATA_80EE98,DATA_80EE48,$FFFD

DATA_80EE1A:
	dw CODE_80BC8B : dw DATA_80EEA8,DATA_80EE50,$FFFE

DATA_80EE22:
	dw CODE_80BC8B : dw DATA_80EEA8,DATA_80EE50,$FFFF

DATA_80EE2A:
	dw CODE_80BD76 : dw $3AED,$0000

DATA_80EE30:
	dw CODE_80BD76 : dw $3AED,$0000

DATA_80EE36:
	dw CODE_80BD76 : dw $3AED,$0000

DATA_80EE3C:
	dw $C6E3,$C6E3

DATA_80EE40:
	dw $3AEB,$3AEC,$3AEC,$6AEB

DATA_80EE48:
	dw $3AEB,$3AEC,$6AEB,$6AEB

DATA_80EE50:
	dw $3AEB,$6AEB,$6AEB,$6AEB

DATA_80EE58:
	dw $FFF8,$FFF0,$FFF8,$FFF8,$FFF8,$0000,$FFF8,$0008

DATA_80EE68:
	dw $FFF8,$FFF2,$FFF8,$FFFA,$FFF8,$FFFE,$FFF8,$0006

DATA_80EE78:
	dw $FFF8,$FFF3,$FFF8,$FFFA,$FFF8,$FFFE,$FFF8,$0005

DATA_80EE88:
	dw $FFF8,$FFF4,$FFF8,$FFFC,$FFF8,$0004,$FFF8,$0004

DATA_80EE98:
	dw $FFF8,$FFF7,$FFF8,$FFFC,$FFF8,$0001,$FFF8,$0001

DATA_80EEA8:
	dw $FFF8,$FFF8,$FFF8,$0000,$FFF8,$0000,$FFF8,$0000
	dw $FFF8,$FFF9,$FFF8,$FFFF,$FFF8,$FFFF,$FFF8,$FFFF

DATA_80EEC8:
	dw CODE_80F346
	dw CODE_80F381
	dw CODE_80F381
	dw CODE_80F31F
	dw CODE_80F34C
	dw CODE_80F34C
	dw CODE_80F346
	dw CODE_80F340

DATA_80EED8:
	dw DATA_80F6E3
	dw DATA_80F6EB
	dw DATA_80F6F3
	dw DATA_80F6EB
	dw DATA_80F6DB
	dw DATA_80F6FB
	dw DATA_80F6FB
	dw DATA_80F6E3

DATA_80EEE8:
	dw CODE_80F461
	dw CODE_80F42E
	dw CODE_80F3FB
	dw CODE_80F42E
	dw CODE_80F461
	dw CODE_80F3DC
	dw CODE_80F480
	dw CODE_80F461

;--------------------------------------------------------------------

CODE_80EEF8:
	RTS

;--------------------------------------------------------------------

CODE_80EEF9:
	LDA.w $10E6
	CMP.w $11E6
	BCC.b CODE_80EF09
CODE_80EF01:
	LDX.w #$1100
	LDA.w #$0032
	BRA.b CODE_80EF0F

CODE_80EF09:
	LDX.w #$1000
	LDA.w #$002C
CODE_80EF0F:
	STX.b $B4
	STA.b $00
	LDA.b $10,x
	AND.w #$0020
	BNE.b CODE_80EF94
	LDA.w $1F06
	AND.w #$0004
	BNE.b CODE_80EF29
	LDA.b $C0,x
	CMP.w #$8100
	BCC.b CODE_80EF94
CODE_80EF29:
	LDA.w $0FEC
	BEQ.b CODE_80EF33
	DEC
	STA.w $0FEC
	RTS

CODE_80EF33:
	LDA.b $EA,x
	BEQ.b CODE_80EF4D
	LDA.b $E6,x
	BNE.b CODE_80EF3F
	LDY.b $94,x
	BRA.b CODE_80EF41

CODE_80EF3F:
	LDY.b $96,x
CODE_80EF41:
	BEQ.b CODE_80EF4D
	LDX.b $12,y
	CPX.w $0FEE
	BEQ.b CODE_80EF50
	STX.w $0FEE
CODE_80EF4D:
	JMP.w CODE_80F11A

CODE_80EF50:
	LDA.w $0FEA
	BEQ.b CODE_80EF59
	TAX
	JMP.w (DATA_80F047,x)

CODE_80EF59:
	LDA.w $0010,y
	AND.w #$2000
	BEQ.b CODE_80EF94
	LDA.w #$003C
	JSR.w CODE_80F121
	BCC.b CODE_80EF94
	LDA.w $1F06
	AND.w #$0004
	BEQ.b CODE_80EF76
	LDA.w DATA_80EFA5
	BRA.b CODE_80EF79

CODE_80EF76:
	LDA.w DATA_80EF95,x
CODE_80EF79:
	STA.b $00
	LDA.w DATA_80F007,x
	STA.b $02
	LDX.b $B4
	LDY.b $E6,x
	JSL.l CODE_81BB70
	AND.b ($00),y
	STA.w $0FE6
	BNE.b CODE_80EF94
	LDA.b ($02),y
	STA.w $0FEA
CODE_80EF94:
	RTS

DATA_80EF95:
	dw DATA_80EFA7
	dw DATA_80EFA7
	dw DATA_80EFD7
	dw DATA_80EFB7
	dw DATA_80EFC7
	dw DATA_80EFE7
	dw DATA_80EFB7
	dw DATA_80EFB7

DATA_80EFA5:
	dw DATA_80EFF7

DATA_80EFA7:
	dw $0000,$0000,$0003,$0003,$0003,$0003,$FFFF,$FFFF

DATA_80EFB7:
	dw $0000,$0000,$0003,$0003,$0003,$0003,$FFFF,$FFFF

DATA_80EFC7:
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0003,$0003

DATA_80EFD7:
	dw $0000,$0000,$0000,$0000,$0000,$0000,$FFFF,$FFFF

DATA_80EFE7:
	dw $0003,$0003,$0003,$0003,$0003,$0003,$FFFF,$FFFF

DATA_80EFF7:
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

DATA_80F007:
	dw DATA_80F017
	dw DATA_80F017
	dw DATA_80F037
	dw DATA_80F027
	dw DATA_80F037
	dw DATA_80F037
	dw DATA_80F027
	dw DATA_80F027

DATA_80F017:
	dw $000C,$0008,$0008,$0008,$0008,$0008,$0008,$0008

DATA_80F027:
	dw $000A,$0004,$0004,$0004,$0004,$0004,$0004,$0004

DATA_80F037:
	dw $000A,$0004,$0004,$0004,$0004,$0004,$0004,$0004

DATA_80F047:
	dw $0000
	dw CODE_80F07A
	dw CODE_80F07F
	dw CODE_80F075
	dw CODE_80F0B6
	dw CODE_80F055
	dw CODE_80F0A3

CODE_80F055:
	LDX.b $B4
	LDY.w #DATA_80F071
	LDA.b $90,x
	JSR.w CODE_80F0FE
	PHX
	LDY.b $94,x
	STY.b $B4
	LDY.w #$0005
	JSR.w CODE_80F17A
	PLA
	JSR.w CODE_80F0D7
	JMP.w CODE_80F135

DATA_80F071:
	dw $0090,$0030

CODE_80F075:
	LDY.w #DATA_80F09F
	BRA.b CODE_80F082

CODE_80F07A:
	LDY.w #DATA_80F097
	BRA.b CODE_80F082

CODE_80F07F:
	LDY.w #DATA_80F09B
CODE_80F082:
	LDX.b $B4
	LDA.b $92,x
	JSR.w CODE_80F0FE
	JSR.w CODE_80F10B
	STY.b $B4
	LDY.w #$0004
	JSR.w CODE_80F17A
	JMP.w CODE_80F135

DATA_80F097:
	dw $00C0,$0030

DATA_80F09B:
	dw $00C0,$0010

DATA_80F09F:
	dw $0070,$0008

CODE_80F0A3:
	LDX.b $B4
	LDY.w #DATA_80F0D3
	LDA.b $90,x
	JSR.w CODE_80F0FE
	LDY.b $94,x
	PHY
	JSR.w CODE_80F0D7
	PLY
	BRA.b CODE_80F0C2

CODE_80F0B6:
	LDX.b $B4
	LDY.w #DATA_80F0D3
	LDA.b $92,x
	JSR.w CODE_80F0FE
	LDY.b $96,x
CODE_80F0C2:
	LDX.w #$012C
	STX.b $86,y
	LDA.b $B4
	AND.w #$0100
	JSL.l CODE_84D963
	JMP.w CODE_80F135

DATA_80F0D3:
	dw $0040,$0020

CODE_80F0D7:
	LDX.w #$00B4
	STX.w $0FD0
	LDX.w #$0002
	LDY.w #$0000
	CMP.w #$1000
	BEQ.b CODE_80F0EB
	TXA
	TYX
	TAY
CODE_80F0EB:
	BIT.b $C8,x
	TYX
	BVC.b CODE_80F0FD
	LDA.w #$0080
	TSB.w $0FD1
	LDA.w #$0020
	ORA.b $AC,x
	STA.b $AC,x
CODE_80F0FD:
	RTS

CODE_80F0FE:
	CMP.w !ContextDependentTable,y
	BCS.b CODE_80F109
	CMP.w !ContextDependentTable+$02,y
	BCC.b CODE_80F109
	RTS

CODE_80F109:
	PLA
	RTS

CODE_80F10B:
	LDY.b $96,x
	LDA.b ($00),y
	CLC
	ADC.w #$0088
	CMP.w #$0010
	BCC.b CODE_80F119
	PLA
CODE_80F119:
	RTS

CODE_80F11A:
	STZ.w $0FE8
	STZ.w $0FEA
	RTS

CODE_80F121:
	CMP.w $0FE8
	BCS.b CODE_80F12B
	SEC
	STZ.w $0FE8
	RTS

CODE_80F12B:
	LDA.w #$0000
	ADC.w $0FE8
	STA.w $0FE8
	RTS

CODE_80F135:
	LDA.w #$00B4
	STA.w $0FEC
	STZ.w $0FE8
	STZ.w $0FEA
	RTS

DATA_80F142:
	dw DATA_80F174
	dw DATA_80F16A
	dw DATA_80F15C
	dw DATA_80F14A

DATA_80F14A:
	dw $1A00,$1A80,$1B00,$1538,$1438,$1538,$1638,$1738
	dw $0000

DATA_80F15C:
	dw $1A00,$1A80,$1B00,$1B80,$1438,$1538,$0000

DATA_80F16A:
	dw $1A00,$1A80,$1B00,$1B80,$0000

DATA_80F174:
	dw $1A00,$1A80,$0000

;--------------------------------------------------------------------

CODE_80F17A:
	LDA.w $0DFC
	BEQ.b CODE_80F180
	RTS

CODE_80F180:
	PHY
	LDY.w $0DFA
	LDX.w !ContextDependentTable,y
CODE_80F187:
	LDA.b $12,x
	BPL.b CODE_80F19C
	INY
	INY
	LDX.w !ContextDependentTable,y
	BNE.b CODE_80F187
	LDY.w #$0D00
	LDX.b $60,y
	PHX
	JSR.w CODE_80C703
	PLX
CODE_80F19C:
	LDA.b $B4
	STA.b $6A,x
	TAY
	LDA.w $0010,y
	BPL.b CODE_80F1AB
	LDA.w #$0000
	BRA.b CODE_80F1AE

CODE_80F1AB:
	LDA.w #$003C
CODE_80F1AE:
	STA.b $66,x
	PLY
	TYA
	ASL
	TAY
	STA.b $70,x
	LDA.w DATA_80EED8,y
	STA.b $6E,x
	LDA.w #$4000
	STA.b $4E,x
	LDA.w #$0008
	STA.b $5E,x
	LDA.w #$0000
	LDY.b $B8
	BEQ.b CODE_80F1D0
	STA.b $06,x
	BRA.b CODE_80F1D2

CODE_80F1D0:
	STA.b $0E,x
CODE_80F1D2:
	LDA.b $12,x
	BPL.b CODE_80F1DC
	PHX
	JSL.l CODE_80C2BE
	PLX
CODE_80F1DC:
	LDY.b $B4
	LDA.w #DATA_80F243
	STA.b $04,x
	JSR.w CODE_80C279
	LDA.w #DATA_80F261
	STA.b $0C,x
	JSR.w CODE_80C267
	LDY.w #$0D00
	JSR.w CODE_80C6F3
	LDA.w #$8000
	STA.b $12,x
	STZ.b $42,x
	LDA.w #$0005
	STA.b $6C,x
	RTS

;--------------------------------------------------------------------

CODE_80F201:
	LDY.b $B4
	LDA.w $001F,y
	BNE.b CODE_80F20B
	JMP.w CODE_80F930

CODE_80F20B:
	LDA.w #$0040
	STA.w $0068,y
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80F216:
	STX.b $02
	LDA.w !ContextDependentTable+$02,x
	STA.b $04
	LDY.w #$FFFE
	LDA.b $18
CODE_80F222:
	INY
	INY
	CMP.b ($04),y
	BCC.b CODE_80F222
	LDX.b $B4
	LDA.b $6C,x
	PHA
	TXA
	CLC
	ADC.b $B8
	TAX
	STY.b $78,x
	LDA.b $74,x
	ADC.b $02
	TAY
	PLA
	BNE.b CODE_80F242
	LDX.w !ContextDependentTable+$04,y
	JMP.w (!ContextDependentTable,x)

CODE_80F242:
	RTS

;--------------------------------------------------------------------

DATA_80F243:
	dw $0000
	dw CODE_80CCD2 : dw DATA_80F24B,DATA_80F25B

DATA_80F24B:
	dw CODE_80F3B6
	dw CODE_80C7F2
	dw CODE_80F201
	dw CODE_80F2E7
	dw CODE_80C836
	dw CODE_80C2FC
	dw CODE_80C2E5 : dw DATA_80F27F

DATA_80F25B:
	dw CODE_80F3B6
	dw CODE_80F201
	dw CODE_80C6E3

DATA_80F261:
	dw $0000
	dw CODE_80CCD2 : dw DATA_80F269,DATA_80F279

DATA_80F269:
	dw CODE_80F311
	dw CODE_80C7F2
	dw CODE_80F2FC
	dw CODE_80C2FC
	dw CODE_80CA32 : dw DATA_80F27D
	dw CODE_80C8B1
	dw CODE_80C6E3

DATA_80F279:
	dw CODE_80F311
	dw CODE_80C6E3

DATA_80F27D:
	dw CODE_80C9B2

DATA_80F27F:
	dw CODE_80F216 : dw DATA_80F2D7
	dw DATA_80F2A3,DATA_80F29F,DATA_80F29F,DATA_80F29F,DATA_80F29B,DATA_80F29B,DATA_80F29B,DATA_80F29B
	dw DATA_80F29B,DATA_80F29B,DATA_80F29B,DATA_80F29B

DATA_80F29B:
	dw CODE_80BD6E : dw $2D60

DATA_80F29F:
	dw CODE_80BD56 : dw $2D60

DATA_80F2A3:
	dw CODE_80BD66 : dw $2D60

DATA_80F2A7:
	dw $0040,$0000,$0040,$0080,$0040,$0100,$0040,$0180
	dw $0020,$0200,$0020,$0220,$0020,$0240,$0020,$0260
	dw $0020,$0260,$0020,$0260,$0020,$0260,$0020,$0260

DATA_80F2D7:
	dw $00E0,$00B8,$0090,$0070,$0050,$0040,$0020,$0000

;--------------------------------------------------------------------

CODE_80F2E7:
	TXY
	LDX.b $B4
	LDA.b $30,x
	CMP.w #$0140
	BNE.b CODE_80F2F6
	LDA.w #$0014
	STA.b $78,x
CODE_80F2F6:
	TYX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80F2FC:
	TXY
	LDX.b $B4
	LDA.b $36,x
	CMP.w #$0140
	BNE.b CODE_80F30B
	LDA.w #$0014
	STA.b $7A,x
CODE_80F30B:
	TYX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80F311:
	PHX
	LDY.b $B4
	LDX.b $70,y
	JSR.w (DATA_80EEC8,x)
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

CODE_80F31F:
	LDA.w #CODE_80D580
	TYX
	STA.b $7C,x
	STA.b $7E,x
	LDA.b $38
	AND.w #$0010
	BEQ.b CODE_80F331
	LDA.w #$4000
CODE_80F331:
	ORA.w #$0400
	STA.b $00
	LDA.b $14,x
	AND.w #$80FF
	ORA.b $00
	STA.b $14,x
	RTS

CODE_80F340:
	TYX
	LDA.w #$8500
	BRA.b CODE_80F35C

CODE_80F346:
	TYX
	LDA.w #$8000
	BRA.b CODE_80F35C

CODE_80F34C:
	LDX.b $6A,y
	LDA.b $12,x
	TYX
	TAY
	LDA.w DATA_81F371,y
	ORA.b $14,x
	STA.b $14,x
	LDA.w DATA_81F361,y
CODE_80F35C:
	STA.b $7C,x
	STA.b $7E,x
	RTS

DATA_81F361:
	dw $8780,$8780,$8A00,$8780,$8000,$8500,$8780,$8C80

DATA_81F371:
	dw $0600,$0600,$0000,$0600,$0000,$0000,$0600,$0600

CODE_80F381:							; Note: Something related to using an item.
	LDA.w #DATA_80F3AA
	STA.b $00
	TYX
	LDA.b $48,x
	INC
	CMP.w #$000C
	BCC.b CODE_80F392
	LDA.w #$0000
CODE_80F392:
	STA.b $48,x
	AND.w #$000C
	TAY
	LDA.b ($00),y
	INY
	INY
	STA.b $7C,x
	STA.b $7E,x
	LDA.b $14,x
	AND.w #$BFFF
	ORA.b ($00),y
	STA.b $14,x
	RTS

DATA_80F3AA:
	dw $8280,$0000,$8500,$0000,$8500,$4000

;--------------------------------------------------------------------

CODE_80F3B6:
	PHX
	LDX.b $B4
	LDA.b $6C,x
	BEQ.b CODE_80F3D6
	DEC
	STA.b $6C,x
	BEQ.b CODE_80F3D6
	LDY.b $6A,x
	LDA.w $0018,y
	STA.b $18,x
	LDA.w $001C,y
	STA.b $1C,x
	STZ.b $1F,x
	LDA.b $70,x
	TAX
	JSR.w (DATA_80EEE8,x)
CODE_80F3D6:
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80F3DC:
	SEP.b #$20
	LDA.b #$00
	LDX.b $B4
	STA.b $15,x
	REP.b #$20
	LDA.w $002A,y
	CLC
	ADC.w #$8000
	LDY.w #$0800
	JSL.l CODE_80FE52
	STZ.b $22,x
	STZ.b $24,x
	STZ.b $26,x
	RTS

;--------------------------------------------------------------------

CODE_80F3FB:
	LDA.b $2C
	BEQ.b CODE_80F40C
	LDA.w #$1000
	CPY.w #$1000
	BNE.b CODE_80F41F
	LDA.w #$1100
	BRA.b CODE_80F41F

CODE_80F40C:
	LDA.w $00E6,y
	DEC
	DEC
	BPL.b CODE_80F41B
	LDA.w $0096,y
	BNE.b CODE_80F41F
	LDA.w #$000C
CODE_80F41B:
	TAX
	LDA.w $010E,x
CODE_80F41F:
	LDX.b $B4
	STA.b $64,x
	LDA.w #$0008
	STA.b $40,x
	SEP.b #$20
	LDA.b #$06
	BRA.b CODE_80F434

CODE_80F42E:
	SEP.b #$20
	LDA.b #$00
	LDX.b $B4
CODE_80F434:
	STA.b $15,x
	REP.b #$20
	LDA.b $6C,x
	DEC
	BNE.b CODE_80F446
	LDA.b $6A,x
	AND.w #$0100
	JSL.l CODE_84D955
CODE_80F446:
	LDA.w $002A,y
	STA.b $2A,x
	STZ.b $26,x
	LDA.w #$0300
	CLC
	ADC.w $00EA,y
	CMP.w #$7800
	BCC.b CODE_80F45C
	LDA.w #$7800
CODE_80F45C:
	STA.b $72,x
	JMP.w CODE_80F8CF

;--------------------------------------------------------------------

CODE_80F461:
	SEP.b #$20
	LDA.b #$00
	LDX.b $B4
	STA.b $15,x
	REP.b #$20
	LDA.w $002A,y
	CLC
	ADC.w #$8000
	LDY.w #$0800
	JSL.l CODE_80FE52
	STZ.b $22,x
	STZ.b $24,x
	STZ.b $26,x
	RTS

;--------------------------------------------------------------------

CODE_80F480:
	SEP.b #$20
	LDA.b #$00
	LDX.b $B4
	STA.b $15,x
	REP.b #$20
	LDA.b $6C,x
	DEC
	BNE.b CODE_80F498
	LDA.b $6A,x
	AND.w #$0100
	JSL.l CODE_84D955
CODE_80F498:
	LDA.w $002A,y
	STA.b $2A,x
	LDA.w #$0140
	STA.b $26,x
	LDA.w #$0300
	CLC
	ADC.w $00EA,y
	CMP.w #$7800
	BCC.b CODE_80F4B1
	LDA.w #$7800
CODE_80F4B1:
	STA.b $72,x
	STZ.b $66,x
	JMP.w CODE_80F8CF

;--------------------------------------------------------------------

DATA_80F4B8:
	dw $0200,$0604,$EAE8,$EEEC

DATA_80F4C0:
	db $00,$00,$00,$04,$00,$00,$04

DATA_80F4C7:
	dw $0000,$0000,$FFFF,$0000

DATA_80F4CF:
	dw CODE_80F56C
	dw CODE_80F56D
	dw CODE_80F56C
	dw CODE_80F56C

CODE_80F4D7:
	LDA.w $0E50
	BEQ.b CODE_80F4EC
	LDA.w #$FFFF
	STA.w $015A
	STA.w $0DFC
	LDA.w #CODE_80F56C
	STA.w $0DFA
	RTS

CODE_80F4EC:
	LDX.b $2C
	BEQ.b CODE_80F500
	PHB
	STZ.w $1400
	LDX.w #$001400
	TXY
	INY
	LDA.w #$03FE
	MVN $001401>>16,$001400>>16
	PLB
CODE_80F500:
	LDX.b $2C
	LDA.w DATA_80F4C7,x
	STA.w $015A
	STA.w $0DFC
	BNE.b CODE_80F56C
	LDA.b $B6
	LSR
	TAX
	LDA.w DATA_80F4C0,x
	AND.w #$00FF
	STA.w $0DF8
	TAX
	LDY.w DATA_80F142,x
	STY.w $0DFA
	STZ.b $00
CODE_80F523:
	LDX.w !ContextDependentTable,y
	BEQ.b CODE_80F567
	PHY
	LDY.b $00
	LDA.w DATA_80F4B8,y
	AND.w #$00FF
	STA.b $14,x
	INC.b $00
	PLY
	LDA.w #$0D00
	STA.b $60,x
	STA.b $62,x
	STZ.b $12,x
	STZ.b $10,x
	STZ.b $22,x
	STZ.b $24,x
	STZ.b $26,x
	STZ.b $20,x
	STZ.b $1E,x
	STZ.b $5C,x
	STZ.b $5E,x
	LDA.w #DATA_80F6EB
	STA.b $6E,x
	LDA.w #$0014
	STA.b $74,x
	STA.b $76,x
	STA.b $78,x
	STA.b $7A,x
	STZ.b $7C,x
	STZ.b $7E,x
	INY
	INY
	BRA.b CODE_80F523

CODE_80F567:
	LDX.b $2C
	JMP.w (DATA_80F4CF,x)

CODE_80F56C:
	RTS

CODE_80F56D:						; Note: Something related to the 2-player match race.
	LDA.w !RAM_SMK_Race_CurrentRacetrack
	XBA
	LSR
	LSR
	ADC.w #DATA_85C800
	STA.b $08
	LDA.w #DATA_85C800>>16
	STA.b $0A
	LDY.w #$0020
CODE_80F580:
	LDA.b [$08],y
	BEQ.b CODE_80F592
	STA.b $0C
	PHY
	JSR.w CODE_80F593
	PLY
	INY
	INY
	CPY.w #$0030
	BNE.b CODE_80F580
CODE_80F592:
	RTS

CODE_80F593:
	LDY.w $0DFA
	LDX.w !ContextDependentTable,y
CODE_80F599:
	LDA.b $12,x
	BPL.b CODE_80F5A4
	INY
	INY
	LDX.w !ContextDependentTable,y
	BNE.b CODE_80F599
CODE_80F5A4:
	LDY.w #$0000
	BIT.b $0C
	BMI.b CODE_80F5BE
	LDY.w #$0006
	BVS.b CODE_80F5B7
	LDA.w #$0200
	STA.b $22,x
	BRA.b CODE_80F5C1

CODE_80F5B7:
	LDA.w #$0200
	STA.b $24,x
	BRA.b CODE_80F5C1

CODE_80F5BE:
	LDY.w #$0000
CODE_80F5C1:
	STY.b $70,x
	LDA.w DATA_80EED8,y
	STA.b $6E,x
	LDA.w #$1000
	STA.b $6A,x
	LDA.w #$4000
	STA.b $4E,x
	LDA.w #$8000
	STA.b $12,x
	STZ.b $6C,x
	LDY.w #$1000
	LDA.w #DATA_80F243
	STA.b $04,x
	JSR.w CODE_80C279
	LDA.w #DATA_80F261
	STA.b $0C,x
	JSR.w CODE_80C267
	LDY.w #$0D00
	JSR.w CODE_80C6F3
	LDA.b $0C
	PHA
	AND.w #$007F
	ASL
	ASL
	ASL
	ADC.w #$0004
	STA.b $18,x
	PLA
	AND.w #$3F80
	LSR
	LSR
	LSR
	LSR
	ADC.w #$0004
	STA.b $1C,x
	RTS

;--------------------------------------------------------------------

DATA_80F60E:
	dw $5600,$5620,$6600,$6620,$5640,$5660,$6640,$6660
	dw $5880,$58A0,$6880,$68A0,$58C0,$58E0,$68C0,$68E0

DATA_80F62E:
	dw $1A74,$1AF4,$1A76,$1AF6,$1B74,$1BF4,$1B76,$1BF6
	dw $14AC,$15AC,$14AE,$15AE,$16AC,$17AC,$16AE,$17AE

CODE_80F64E:
	LDA.w $0DFC
	BNE.b CODE_80F68C
	LDA.b $38
	AND.w #$0003
	ASL
	STA.b $02
	LDX.w $0DF8
CODE_80F65E:
	TXA
	ASL
	ASL
	ADC.b $02
	TAY
	PHX
	LDA.w DATA_80F60E,y
	STA.w $0DF0,x
	LDX.w DATA_80F62E,y
	LDA.b $04,x
	STA.b $00,x
	ASL
	ADC.w #DATA_80F2A7
	TAY
	LDA.b $08,x
	BEQ.b CODE_80F67E
	ADC.w !ContextDependentTable+$02,y
CODE_80F67E:
	PLX
	STA.w $0DE8,x
	LDA.w !ContextDependentTable,y
	STA.w $0DE0,x
	DEX
	DEX
	BPL.b CODE_80F65E
CODE_80F68C:
	RTS

;--------------------------------------------------------------------

CODE_80F68D:
	LDA.w $0DFC
	BNE.b CODE_80F6DA
	SEP.b #$10
	LDY.b #$80
	STY.w !REGISTER_VRAMAddressIncrementValue
	LDA.w #(!REGISTER_WriteToVRAMPortLo&$0000FF<<8)+$01
	STA.w DMA[$00].Parameters
	LDY.b #$7F
	STY.w DMA[$00].SourceBank
	STZ.w DMA[$00].SizeLo
	LDX.w $0DF8
CODE_80F6AA:
	LDA.w $0DE8,x
	BEQ.b CODE_80F6D4
	STA.w DMA[$00].SourceLo
	LDY.w $0DE0,x
	STY.w DMA[$00].SizeLo
	LDA.w $0DF0,x
	STA.w !REGISTER_VRAMAddressLo
	LDY.b #$01
	STY.w !REGISTER_DMAEnable
	ORA.w #$0100
	STA.w !REGISTER_VRAMAddressLo
	LDY.w $0DE0,x
	STY.w DMA[$00].SizeLo
	LDY.b #$01
	STY.w !REGISTER_DMAEnable
CODE_80F6D4:
	DEX
	DEX
	BPL.b CODE_80F6AA
	REP.b #$10
CODE_80F6DA:
	RTS

;--------------------------------------------------------------------

DATA_80F6DB:
	dw $F897,$F715,$F715,$F73D

DATA_80F6E3:
	dw $F897,$F713,$F713,$F73D

DATA_80F6EB:
	dw $F897,$F70F,$F70F,$F73D

DATA_80F6F3:
	dw $F897,$F709,$F703,$F73D

DATA_80F6FB:
	dw $F897,$F735,$F735,$F73D

;--------------------------------------------------------------------

DATA_80F703:
	dw $F851,$FE07,$C6E3,$F86C,$FE07,$C6E3,$FE07,$C6E3
	dw $F745,$F746,$F77A,$F729,$F729,$F72B,$F729,$F729
	dw $F729,$F729,$F731,$F745,$F78C,$FE07,$F745,$FE07
	dw $F7B0,$F7F1,$FE07,$FDBC,$F82D,$F7C9,$FE07,$FDBC
	dw $F7DE

;--------------------------------------------------------------------

CODE_80F703:
	RTS

;--------------------------------------------------------------------

CODE_80F746:
	TXY
	LDX.b $B4
	LDA.b $66,x
	BEQ.b CODE_80F774
	DEC
	BNE.b CODE_80F768
	STA.b $66,x
	STZ.b $1F,x
	LDA.w #$0005
	STA.b $5E,x
	LDA.b $18,x
	STA.b $44,x
	LDA.b $1C,x
	STA.b $46,x
	LDY.b $6A,x
	JSL.l CODE_84DA44
	RTS

CODE_80F768:
	STA.b $66,x
	LDA.w #$0005
	STA.b $5E,x
	LDY.b $6A,x
	JMP.w CODE_80FD9D

CODE_80F774:
	TYX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80F77A:
	STX.b $00
	LDY.b $B4
	LDX.b $6A,y
	LDA.b $12,x
	CLC
	ADC.b $00
	TAY
	LDX.w !ContextDependentTable+$02,y
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80F78C:
	PHX
	LDX.b $B4
	LDA.b $44,x
	STA.b $18,x
	LDA.b $46,x
	STA.b $1C,x
	LDY.w #$0600
	LDA.b $2A,x
	CLC
	ADC.w #$0400
	STA.b $2A,x
	STY.b $02
	STA.b $00
	JSL.l CODE_819C67
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80F7B0:
	LDX.b $B4
	LDA.b $20,x
	BPL.b CODE_80F7C0
	STZ.b $1F,x
	STZ.b $20,x
	LDA.w #$0040
	STA.b $26,x
	RTS

CODE_80F7C0:
	LDA.w #$FFF8
	CLC
	ADC.b $26,x
	STA.b $26,x
	RTS

;--------------------------------------------------------------------

CODE_80F7C9:
	PHX
	LDX.b $B4
	LDA.w #$8000
	ORA.b $14,x
	STA.b $14,x
	LDA.w #$000A
	STA.b $5E,x
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80F7DE:
	LDX.b $B4
	LDA.b $1F,x
	BNE.b CODE_80F7F0
	STZ.b $22,x
	STZ.b $24,x
	STZ.b $26,x
	STZ.b $42,x
	JSL.l CODE_80C2BE
CODE_80F7F0:
	RTS

;--------------------------------------------------------------------

CODE_80F7F1:
	PHX
	LDX.b $B4
	LDA.w #$0003
	STA.b $5E,x
	LDA.b $66,x
	BEQ.b CODE_80F827
	DEC
	BNE.b CODE_80F80F
	STA.b $66,x
	JSL.l CODE_84D629
	LDA.w #$0000
	JSL.l CODE_84DA5C
	BRA.b CODE_80F827

CODE_80F80F:
	STA.b $66,x
	LDA.w #$0005
	STA.b $5E,x
	LDY.b $6A,x
	JSR.w CODE_80FD9D
	PLA
	LDA.w $002A,y
	LDY.w #$0800
	JSL.l CODE_80FE52
	RTS

CODE_80F827:
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80F82D:
	LDX.b $B4
	LDA.b $1F,x
	BNE.b CODE_80F850
	STZ.b $22,x
	STZ.b $24,x
	STZ.b $26,x
	LDA.w #DATA_80F6E3
	LDY.b $70,x
	CPY.w #$000C
	BEQ.b CODE_80F846
	LDA.w #DATA_80F6DB
CODE_80F846:
	STA.b $6E,x
	LDA.b $18,x
	STA.b $44,x
	LDA.b $1C,x
	STA.b $46,x
CODE_80F850:
	RTS

;--------------------------------------------------------------------

CODE_80F851:
	TXY
	LDX.b $B4
	LDA.b $5A,x
	BPL.b CODE_80F866
	LDA.w #$8000
	STA.b $42,x
	LDA.w #$0100
	STA.b $26,x
	STZ.b $22,x
	STZ.b $24,x
CODE_80F866:
	TYX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80F86C:
	PHX
	LDX.b $B4
	JSL.l CODE_819EC2
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80F879:
	LDX.w $0DFC
	BNE.b CODE_80F896
	LDX.w $0DFA
	LDY.w $0000,x
CODE_80F884:
	STY.b $B4
	PHX
	LDX.b $6E,y
	BEQ.b CODE_80F88E
	JSR.w (!ContextDependentTable,x)
CODE_80F88E:
	PLX
	INX
	INX
	LDY.w !ContextDependentTable,x
	BNE.b CODE_80F884
CODE_80F896:
	RTS

;--------------------------------------------------------------------

CODE_80F897:
	TXY
	LDX.b $B4
	BIT.b $12,x
	BPL.b CODE_80F8CA
	BIT.b $42,x
	BMI.b CODE_80F8BA
	JSR.w CODE_80F90A
	LDA.b $68,x
	AND.w #$0020
	BNE.b CODE_80F8C0
	BCS.b CODE_80F8B4
	LDX.w !ContextDependentTable+$02,y
	JMP.w (!ContextDependentTable,x)

CODE_80F8B4:
	LDX.w !ContextDependentTable+$04,y
	JMP.w (!ContextDependentTable,x)

CODE_80F8BA:
	LDX.w !ContextDependentTable+$06,y
	JMP.w (!ContextDependentTable,x)

CODE_80F8C0:
	LDA.w #$8000
	STA.b $42,x
	LDA.w #$0080
	STA.b $26,x
CODE_80F8CA:
	RTS

;--------------------------------------------------------------------

CODE_80F8CB:
	JSR.w CODE_80F8CF
	RTL

CODE_80F8CF:
	PHA
	SEP.b #$20
	LDA.b #!DSP1_Command04_TrigonometricCalculation
	STA.w !REGISTER_DSP1_DataRegister
	REP.b #$21
	LDA.b $2A,x
	STA.w !REGISTER_DSP1_DataRegister
	PLA
	STA.w !REGISTER_DSP1_DataRegister
	CLC
CODE_80F8E3:
	LDA.l !REGISTER_DSP1_StatusRegister
	BPL.b CODE_80F8E3
	LDA.w !REGISTER_DSP1_DataRegister
	STA.b $22,x
	LDA.w !REGISTER_DSP1_DataRegister
	EOR.w #$FFFF
	INC
	STA.b $24,x
	RTS

;--------------------------------------------------------------------

CODE_80F8F8:
	LDY.w #$010E
	BRA.b CODE_80F906

CODE_80F8FD:
	LDA.b $68,x
	STA.b $AE,x
	JSR.w CODE_80F90A
	INY
	INY
CODE_80F906:
	LDX.b $00,y
	BNE.b CODE_80F8FD
CODE_80F90A:
	LDA.b $5A,x
	ASL
	BCS.b CODE_80F927
	LDA.b $5E,x
	BNE.b CODE_80F924
	LDA.b $5C,x
	BEQ.b CODE_80F91C
	DEC
	STA.b $5C,x
	BRA.b CODE_80F927

CODE_80F91C:
	LDA.b $10,x
	AND.w #$BFFF
	STA.b $10,x
	RTS

CODE_80F924:
	DEC
	STA.b $5E,x
CODE_80F927:
	LDA.b $10,x
	ORA.w #$4000
	STA.b $10,x
	SEC
	RTS

;--------------------------------------------------------------------

CODE_80F930:
	PHX
	LDX.b $B4
	BIT.b $5A,x
	BVS.b CODE_80F95F
	JSR.w CODE_80FA5A
	BCC.b CODE_80F955
	LDA.b $5A,x
	SEP.b #$20
	INC
	CMP.b #$08
	REP.b #$20
	BCC.b CODE_80F94A
	ORA.w #$4000
CODE_80F94A:
	ORA.w #$8000
	STA.b $5A,x
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

CODE_80F955:
	LDA.b $5A,x
	BMI.b CODE_80F99A
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

CODE_80F95F:
	JSR.w CODE_80FA5A
	BCC.b CODE_80F982
	LDA.b $2A,x
	ROL
	ROL
	ROL
	AND.w #$0003
	ASL
	TAY
	LDA.w DATA_80F98A,y
	STA.b $22,x
	LDA.w DATA_80F992,y
	STA.b $24,x
	STZ.b $52,x
	STZ.b $56,x
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

CODE_80F982:
	STZ.b $5A,x
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

DATA_80F98A:
	dw $0100,$0100,$FF00,$FF00

DATA_80F992:
	dw $FF00,$0100,$0100,$FF00

CODE_80F99A:
	STZ.b $5A,x
	LDA.w #$1000
	ORA.b $10,x
	STA.b $10,x
	LDA.b $12,x
	BMI.b CODE_80FA06
	LDA.b $22,x
	BPL.b CODE_80F9AF
	EOR.w #$FFFF
	INC
CODE_80F9AF:
	CMP.w #$00C0
	BCS.b CODE_80F9DF
	LDA.b $24,x
	BPL.b CODE_80F9BC
	EOR.w #$FFFF
	INC
CODE_80F9BC:
	CMP.w #$00C0
	BCS.b CODE_80F9DF
	LDA.w #$0100
	LDY.b $22,x
	BPL.b CODE_80F9CB
	LDA.w #$FF00
CODE_80F9CB:
	STA.b $22,x
	LDA.w #$0100
	LDY.b $24,x
	BPL.b CODE_80F9D7
	LDA.w #$FF00
CODE_80F9D7:
	STA.b $24,x
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

CODE_80F9DF:
	LDA.b $EA,x
	CMP.w #$0500
	BCS.b CODE_80FA33
	LDY.b $56,x
	LDA.w DATA_80FA4A,y
	TAY
	LDA.b $22,x
	JSR.w CODE_80FC74
	STA.b $22,x
	LDY.b $56,x
	LDA.w DATA_80FA52,y
	TAY
	LDA.b $24,x
	JSR.w CODE_80FC74
	STA.b $24,x
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

CODE_80FA06:
	LDY.w #$00E0
	LDA.b $22,x
	BPL.b CODE_80FA11
	EOR.w #$FFFF
	INC
CODE_80FA11:
	CMP.w #$0200
	BCC.b CODE_80FA1D
	LDA.b $22,x
	JSR.w CODE_80FC74
	STA.b $22,x
CODE_80FA1D:
	LDA.b $24,x
	BPL.b CODE_80FA25
	EOR.w #$FFFF
	INC
CODE_80FA25:
	CMP.w #$0200
	BCC.b CODE_80FA44
	LDA.b $24,x
	JSR.w CODE_80FC74
	STA.b $24,x
	BRA.b CODE_80FA44

CODE_80FA33:
	LDY.w #$0040
	LDA.b $22,x
	JSR.w CODE_80FC74
	STA.b $22,x
	LDA.b $24,x
	JSR.w CODE_80FC74
	STA.b $24,x
CODE_80FA44:
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

DATA_80FA4A:
	dw $0080,$0080,$00F0,$00F0

DATA_80FA52:
	dw $00F0,$00F0,$0080,$0080

;--------------------------------------------------------------------

CODE_80FA5A:
	LDA.b $20,x
	CMP.w #$0004
	BCS.b CODE_80FAA7
	TXY
	LDA.b $1C,x
	DEC
	CMP.w #$0400
	BCS.b CODE_80FAAE
	ASL
	ASL
	ASL
	ASL
	AND.w #$3F80
	STA.b $00
	LDA.b $18,x
	CMP.w #$0400
	BCS.b CODE_80FAAE
	LSR
	LSR
	LSR
	ORA.b $00
	TAX
	STX.b $02
	LDA.l $7F0000,x
	AND.w #$00FF
	TAX
	SEP.b #$21
	LDA.w $0B00,x
	BMI.b CODE_80FAC7
	TYX
	STA.b $68,x
	LDA.b #$FE
	AND.b $10,x
	STA.b $10,x
	REP.b #$21
	LDA.b $02
	STA.b $58,x
	RTS

CODE_80FAA1:
	REP.b #$20
	LDA.b $02
	STA.b $58,x
CODE_80FAA7:
	LDA.w #$0040
	STA.b $68,x
	CLC
	RTS

CODE_80FAAE:
	LDA.w #$0001
	ORA.b $10,x
	STA.b $10,x
	LDA.w $0B00
	AND.w #$00FF
	BIT.w #$0020
	BNE.b CODE_80FAC3
	LDA.w #$0026
CODE_80FAC3:
	STA.b $68,x
	CLC
	RTS

CODE_80FAC7:
	TYX
	REP.b #$20
	STA.b $68,x
	PHA
	CPX.w #$1000
	BNE.b CODE_80FAD9
	LDA.w $0FD6
	STA.l $7F6004
CODE_80FAD9:
	PLA
	STX.b $B4
	JSR.w CODE_80FBBC
	LDA.w #$0008
	STA.b $5C,x
	LDA.b $02
	TAY
	SEC
	SBC.b $58,x
	STY.b $58,x
	BPL.b CODE_80FAFC
	EOR.w #$FFFF
	SEC
	SBC.w #$0079
	BPL.b CODE_80FB03
	LDA.w #$0004
	BRA.b CODE_80FB03

CODE_80FAFC:
	DEC
	BEQ.b CODE_80FB03
	SEC
	SBC.w #$007D
CODE_80FB03:
	CMP.w #$0008
	BCS.b CODE_80FB0D
	ASL
	TAX
	JMP.w (DATA_80FB11,x)

CODE_80FB0D:
	LDX.b $B4
	SEC
	RTS

DATA_80FB11:
	dw CODE_80FB7D
	dw CODE_80FB49
	dw CODE_80FB9A
	dw CODE_80FB49
	dw CODE_80FB7D
	dw CODE_80FB49
	dw CODE_80FB9A
	dw CODE_80FB49

DATA_81FB21:
	dw CODE_80FB90
	dw CODE_80FB7D
	dw CODE_80FB9A
	dw CODE_80FB90

DATA_80FB29:
	dw $0000,$0001,$0000,$FFFF,$0000,$FFFF,$0000,$0001

DATA_80FB39:
	dw $0000,$FF80,$0000,$FF80,$0000,$0080,$0000,$0080

CODE_80FB49:
	TYA
	PHX
	ADC.w DATA_80FB29,x
	TAX
	LDY.w #$0000
	LDA.l $7F0000,x
	AND.w #$00FF
	TAX
	BIT.w $0AFF,x
	BPL.b CODE_80FB62
	LDY.w #$0004
CODE_80FB62:
	PLX
	CLC
	LDA.b $02
	ADC.w DATA_80FB39,x
	TAX
	LDA.l $7F0000,x
	AND.w #$00FF
	TAX
	BIT.w $0AFF,x
	BPL.b CODE_80FB79
	INY
	INY
CODE_80FB79:
	TYX
	JMP.w (DATA_81FB21,x)

CODE_80FB7D:
	LDX.b $B4
	LDY.w #$0000
	LDA.b $22,x
	EOR.w #$FFFF
	INC
	STA.b $22,x
	BPL.b CODE_80FBAB
	INY
	INY
	BRA.b CODE_80FBAB

CODE_80FB90:
	LDX.b $B4
	LDA.b $22,x
	EOR.w #$FFFF
	INC
	STA.b $22,x
CODE_80FB9A:
	LDX.b $B4
	LDY.w #$0004
	LDA.b $24,x
	EOR.w #$FFFF
	INC
	STA.b $24,x
	BPL.b CODE_80FBAB
	INY
	INY
CODE_80FBAB:
	STY.b $56,x
	LDA.w #$C007
	STA.b $52,x
	SEC
	RTS

;--------------------------------------------------------------------

CODE_80FBB4:
	LDA.w #$0000
	STA.l $7FDE30
	RTS

;--------------------------------------------------------------------

CODE_80FBBC:
	CMP.w #$0082
	BCS.b CODE_80FBCF
	BIT.b $12,x
	BPL.b CODE_80FBCA
	JSL.l CODE_84D73A
	RTS

CODE_80FBCA:
	JSL.l CODE_84D77A
	RTS

CODE_80FBCF:
	CMP.w #$0084
	BEQ.b CODE_80FBE0
	JSR.w CODE_80FBF3
	BIT.b $12,x
	BPL.b CODE_80FBDF
	JSL.l CODE_84D7FA
CODE_80FBDF:
	RTS

CODE_80FBE0:
	JSR.w CODE_80FBF3
	BIT.b $12,x
	BPL.b CODE_80FBEC
	JSL.l CODE_84D7BA
	RTS

CODE_80FBEC:
	LDA.b $86,x
	BEQ.b CODE_80FBF2
	PLA
	SEC
CODE_80FBF2:
	RTS

CODE_80FBF3:
	BIT.b $12,x
	BPL.b CODE_80FBFC
	LDY.w #$0000
	BRA.b CODE_80FBFE

CODE_80FBFC:
	LDY.b $86,x
CODE_80FBFE:
	LDA.l $7FDE30
	TAX
	LDA.l $7FDE02,x
	BNE.b CODE_80FC29
	TYA
	BEQ.b CODE_80FC0F
	LDA.w #$FFFD
CODE_80FC0F:
	CLC
	ADC.w #$0004
	STA.l $7FDE02,x
	LDA.b $02
	STA.l $7FDE00,x
	TXA
	CLC
	ADC.w #$0004
	AND.w #$001C
	STA.l $7FDE30
CODE_80FC29:
	LDX.b $B4
	RTS

;--------------------------------------------------------------------

CODE_80FC2C:
	LDA.l $7FDE32
	TAX
	CLC
	ADC.w #$0004
	AND.w #$001C
	STA.l $7FDE32
	LDA.l $7FDE02,x
	BEQ.b CODE_80FC6B
	STZ.w !REGISTER_VRAMAddressIncrementValue
	DEC
	STA.l $7FDE02,x
	TAY
	LDA.l $7FDE00,x
	TAX
	STA.w !REGISTER_VRAMAddressLo
	SEP.b #$20
	LDA.w !RAM_SMK_Global_RacetrackType
	BEQ.b CODE_80FC5F					; Note: !Define_SMK_RacetrackType_GhostValley
	LDA.w DATA_80FC6C,y
	BRA.b CODE_80FC62

CODE_80FC5F:
	LDA.w DATA_80FC70,y
CODE_80FC62:
	STA.w !REGISTER_WriteToVRAMPortLo
	STA.l $7F0000,x
	REP.b #$20
CODE_80FC6B:
	RTS

DATA_80FC6C:
	dw $7D08,$7B7C

DATA_80FC70:
	dw $2800,$2627

;--------------------------------------------------------------------

CODE_80FC74:
	PHY
	PHX
	SEP.b #$30
	SEP.b #$20
	STY.w !REGISTER_Multiplicand
	STA.w !REGISTER_Multiplier
	STY.b $00
	NOP
	LDY.w !REGISTER_ProductOrRemainderLo
	LDA.w !REGISTER_ProductOrRemainderHi
	XBA
	STA.w !REGISTER_Multiplier
	ASL
	LDA.b #$00
	BCC.b CODE_80FC94
	SBC.b $00
CODE_80FC94:
	XBA
	REP.b #$31
	ADC.w !REGISTER_ProductOrRemainderLo
	PLX
	PLY
	RTS

CODE_80FC9D:
	RTS

;--------------------------------------------------------------------

CODE_80FC9E:
	LDX.b $B4
	LDA.b $60,x
	BEQ.b CODE_80FC9D
	BPL.b CODE_80FCA9
	JMP.w CODE_80FD6C

CODE_80FCA9:
	LDY.w #$1CE0
	LDA.b $B8
	BEQ.b CODE_80FCB3
	LDY.w #$1CF0
CODE_80FCB3:
	LDA.w $000A,y
	BNE.b CODE_80FCE1
	LDA.w #$8000
	STA.w $0002,y
	LDA.w #$5000
	STA.w $0004,y
	LDX.w $1EE4
	LDA.l DATA_84E532,x
	STA.w $0006,y
	LDX.w $0E30
	LDA.l DATA_84E522,x
	STA.w $0008,y
	LDA.l DATA_84E512,x
	STA.w $000A,y
	LDX.b $B4
CODE_80FCE1:
	LDA.w $0002,y
	CLC
	ADC.w $0006,y
	STA.w $0002,y
	LDA.w $0004,y
	CLC
	ADC.w $0008,y
	STA.w $0004,y
	LDA.w #$0060
	CLC
	ADC.w $0008,y
	STA.w $0008,y
	SEP.b #$20
	LDA.w $0005,y
	CLC
	ADC.b $BB
	STA.b $1E
	LDA.w $0003,y
	STA.b $1C
	LDA.b #$FF
	STA.b $1F
	STA.b $1D
	REP.b #$20
	STZ.b $1A
	LDA.w $0008,y
	BMI.b CODE_80FD22
	LDA.w #$8000
	STA.b $1A
CODE_80FD22:
	LDA.w $000A,y
	DEC
	STA.w $000A,y
	BNE.b CODE_80FD45
	LDA.b $60,x
	STZ.b $60,x
	TAY
	LDA.w #$0000
	STA.w $0028,y
	LDA.w $0F98
	CPX.w #$1000
	BEQ.b CODE_80FD41
	LDA.w $0F9A
CODE_80FD41:
	STA.w $0004,y
	RTS

CODE_80FD45:
	LDA.w $0F9C
	TSB.b $1A
	LDX.w $0D28
	JMP.w (DATA_80FD50,x)

DATA_80FD50:
	dw CODE_80FD60
	dw CODE_80FD60
	dw CODE_80FD60
	dw CODE_80FD66
	dw CODE_80FD60
	dw CODE_80FD66
	dw CODE_80FD60
	dw CODE_80FD60

CODE_80FD60:
	LDX.w #DATA_80E3F4
	JMP.w CODE_80BC7E

CODE_80FD66:
	LDX.w #DATA_80E0F4
	JMP.w CODE_80BD66

CODE_80FD6C:
	STZ.b $1A
	LDA.b $B8
	ASL
	ASL
	ASL
	ADC.b $38
	AND.w #$003F
	TAX
	SEP.b #$21
	LDA.b #$FF
	STA.b $1F
	STA.b $1D
	LDA.l DATA_84E492,x
	ADC.b #$57
	CLC
	ADC.b $BB
	STA.b $1E
	LDA.l DATA_84E4D2,x
	CLC
	ADC.b #$80
	STA.b $1C
	REP.b #$20
	LDX.w #DATA_80E3F4
	JMP.w CODE_80BC7E

;--------------------------------------------------------------------

CODE_80FD9D:
	LDA.w $0018,y
	STA.b $18,x
	LDA.w $001C,y
	STA.b $1C,x
	LDA.w $0016,y
	STA.b $16,x
	LDA.w $001A,y
	STA.b $1A,x
	LDA.w $001E,y
	STA.b $1E,x
	LDA.w $0020,y
	STA.b $20,x
	RTS

;--------------------------------------------------------------------

CODE_80FDBC:
	PHX
	LDX.b $B4
	LDA.b $20,x
	BPL.b CODE_80FDED
	STZ.b $1F,x
	STZ.b $20,x
	BRA.b CODE_80FDED

CODE_80FDC9:
	PHX
	LDX.b $B4
	LDA.b $20,x
	BPL.b CODE_80FDED
	STZ.b $1F,x
	STZ.b $20,x
	SEP.b #$20
	LDA.b #!DSP1_Command00_16BitMultiplication
	STA.w !REGISTER_DSP1_DataRegister
	REP.b #$20
	LDA.b $26,x
	STA.w !REGISTER_DSP1_DataRegister
	LDA.w #$4000
	STA.w !REGISTER_DSP1_DataRegister
	LDA.w !REGISTER_DSP1_DataRegister
	STA.b $26,x
CODE_80FDED:
	LDA.w #$FFF8
	CLC
	ADC.b $26,x
	STA.b $26,x
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80FDFB:
	PLX
	INX
	STX.b $00
	LDX.w #$FFFE
CODE_80FE02:
	PHX
	LDX.b $B4
	BRA.b CODE_80FE20

CODE_80FE07:
	PHX
	LDX.b $B4
	LDY.w #$0000
	LDA.b $26,x
	BPL.b CODE_80FE12
	DEY
CODE_80FE12:
	CLC
	ADC.b $1F,x
	STA.b $1F,x
	SEP.b #$20
	TYA
	ADC.b $21,x
	STA.b $21,x
	REP.b #$20
CODE_80FE20:
	LDY.w #$0000
	LDA.b $22,x
	BPL.b CODE_80FE28
	DEY
CODE_80FE28:
	CLC
	ADC.b $17,x
	STA.b $17,x
	SEP.b #$20
	TYA
	ADC.b $19,x
	STA.b $19,x
	REP.b #$20
	LDY.w #$0000
	LDA.b $24,x
	BPL.b CODE_80FE3E
	DEY
CODE_80FE3E:
	CLC
	ADC.b $1B,x
	STA.b $1B,x
	SEP.b #$20
	TYA
	ADC.b $1D,x
	STA.b $1D,x
	REP.b #$20
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80FE52:
	PHA
	SEP.b #$20
	LDA.b #!DSP1_Command04_TrigonometricCalculation
	STA.w !REGISTER_DSP1_DataRegister
	REP.b #$21
	PLA
	STA.w !REGISTER_DSP1_DataRegister
	TYA
	STA.w !REGISTER_DSP1_DataRegister
CODE_80FE64:
	LDA.l !REGISTER_DSP1_StatusRegister
	BPL.b CODE_80FE64
	LDA.w !REGISTER_DSP1_DataRegister
	PHA
	LDA.w !REGISTER_DSP1_DataRegister
	EOR.w #$FFFF
	INC
	PHA
	LDY.w #$0000
	PLA
	BPL.b CODE_80FE7D
	DEY
CODE_80FE7D:
	ADC.b $1B,x
	STA.b $1B,x
	SEP.b #$20
	TYA
	ADC.b $1D,x
	STA.b $1D,x
	REP.b #$21
	LDY.w #$0000
	PLA
	BPL.b CODE_80FE91
	DEY
CODE_80FE91:
	ADC.b $17,x
	STA.b $17,x
	SEP.b #$20
	TYA
	ADC.b $19,x
	STA.b $19,x
	REP.b #$21
	RTL

;--------------------------------------------------------------------

CODE_80FE9F:
	PHX
	LDY.b $B8
	LDA.w $0FC0,y
	BEQ.b CODE_80FEAB
	JSL.l CODE_85E3D3
CODE_80FEAB:
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_80FEB1:
	BEQ.b CODE_80FEB7
	JSL.l CODE_85E3D3
CODE_80FEB7:
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

UNK_C0FEBD:
	db $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$00,$00,$00,$04,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00

;--------------------------------------------------------------------

CODE_80FF70:
	SEI
	REP.b #$09
	XCE
	SEP.b #$30
	LDA.b #$1FFF>>8
	XBA
	LDA.b #$1FFF
	TCS
	LDA.b #$01
	STA.w !REGISTER_EnableFastROM
	JML.l CODE_80803A

;--------------------------------------------------------------------

SMK_VBlankRoutine:
.Main:
	JSL.l CODE_808000
	RTI

;--------------------------------------------------------------------

SMK_IRQRoutine:
.Main:
	JSL.l CODE_80801F
	RTI

;--------------------------------------------------------------------

CODE_80FF8F:
	JML.l $09DD13				; Note: This jumps into the middle of an instruction.

;--------------------------------------------------------------------

%BeginROMMirroring($C0FF93, $00, !FastROMAddressOffset|!HiROMAddressOffset)

CODE_80FF93:
	PHB
	PHK
	PLB
	REP.b #$30
	PLB
	RTL

;--------------------------------------------------------------------

CODE_80FF9A:
	PHB
	PHK
	PLB
	PLB
	RTL

%EndROMMirroring()

;--------------------------------------------------------------------

	%FREE_BYTES(NULLROM, 1, $FF)
	%FREE_BYTES(NULLROM, 32, $00)
%BANK_END(<EndBank>)
endmacro

;#############################################################################################################
;#############################################################################################################

macro SMKBankC1Macros(StartBank, EndBank)
%BANK_START(<StartBank>)

SMK_GFX_Sprite_LakituAndSpriteHUD:
;$C10000
	incbin "Graphics/Compressed/GFX_Sprite_LakituAndSpriteHUD.lz5"

SMK_GFX_Sprite_ChocoIslandPiranhaPlants:
;$C10AA5
	incbin "Graphics/Compressed/GFX_Sprite_ChocoIslandPiranhaPlants.lz5"

SMK_GFX_Sprite_MarioCircuitPipes:
SMK_GFX_Sprite_VanillaLakePipes:
;$C10F9B
	incbin "Graphics/Compressed/GFX_Sprite_MarioCircuitPipes.lz5"

SMK_Tilemap_TimerAndItemBox:
;$C112F8
	incbin "Tilemaps/Tilemap_TimerAndItemBox.lz5"

SMK_GFX_Sprite_KoopaBeachCheepCheeps:
;$C11706
	incbin "Graphics/Compressed/GFX_Sprite_KoopaBeachCheepCheeps.lz5"

	%FREE_BYTES(NULLROM, 33, $FF)

SMK_GFX_Sprite_FlattenedDrivers:
;$C11C0E
	incbin "Graphics/Compressed/GFX_Sprite_FlattenedDrivers.lz5"

	%FREE_BYTES(NULLROM, 143, $FF)

DATA_C12000:
	incbin "Graphics/GFX_Bowser.bin"

;--------------------------------------------------------------------

%HiROMBankSplit()

DATA_818000:
	dw $0390,$0390,$03B0,$0370,$03B0,$0360,$0360,$0370

DATA_818010:
	dw DATA_818020,DATA_818020,DATA_818050,DATA_818030,DATA_818050,DATA_818040,DATA_818040,DATA_818030

DATA_818020:
	db $20,$60,$40,$80,$C0,$C0,$C0,$80,$80,$40,$20,$18,$10,$08,$04,$04

DATA_818030:
	db $40,$C0,$FF,$FF,$C0,$C0,$C0,$80,$80,$40,$40,$20,$08,$04,$02,$02

DATA_818040:
	db $40,$40,$60,$80,$80,$C0,$C0,$80,$80,$40,$20,$18,$10,$08,$04,$08

DATA_818050:
	db $20,$20,$20,$20,$40,$40,$60,$60,$80,$80,$A0,$A0,$10,$08,$08,$08

DATA_818060:
	dw DATA_818070,DATA_818070,DATA_818076,DATA_81807C,DATA_818076,DATA_818082,DATA_818082,DATA_81807C

DATA_818070:
	db $25,$12,$22,$24,$24,$29

DATA_818076:
	db $26,$14,$21,$23,$27,$2A

DATA_81807C:
	db $27,$13,$1F,$26,$26,$2B

DATA_818082:
	db $28,$15,$20,$25,$25,$2C

DATA_818088:
	dw DATA_818098,DATA_818098,DATA_8180C5,DATA_8180A7,DATA_8180C5,DATA_8180B6,DATA_8180B6,DATA_8180A7

DATA_818098:
	db $95,$09,$98,$68,$70,$80,$0A,$A0,$78,$80,$00,$0B,$B0,$88,$90

DATA_8180A7:
	db $95,$09,$98,$58,$80,$80,$0A,$A0,$68,$70,$00,$0B,$B0,$70,$80

DATA_8180B6:
	db $00,$09,$A0,$70,$90,$40,$0A,$B0,$80,$A0,$C0,$0A,$A0,$90,$C0

DATA_8180C5:
	db $00,$09,$80,$58,$88,$40,$0A,$90,$68,$98,$C0,$0A,$A0,$78,$A8

;--------------------------------------------------------------------

DATA_8180D4:
	dw $01B0,$0400,$1C0C
	dw $0120,$0400,$060C
	dw $0240,$06F5,$100B
	dw $0160,$0400,$0C0C
	dw $01F0,$072C,$0814
	dw $01B0,$0600,$060A
	dw $0120,$03E6,$061A
	dw $0230,$0830,$0810
	dw $0120,$0400,$060C
	dw $0130,$0434,$060C
	dw $0290,$0940,$080B
	dw $0210,$0680,$1010
	dw $0210,$0700,$0820
	dw $0100,$0100,$141C
	dw $0230,$0835,$060B
	dw $01A0,$05F0,$0610
	dw $0240,$0838,$0808
	dw $0290,$09B4,$060C
	dw $0230,$07E8,$0618
	dw $0200,$0700,$080F
	dw $0100,$0040,$0126
	dw $027D,$0202,$02E1
	dw $01A6,$0361

;--------------------------------------------------------------------

DATA_81815C:
	dw CODE_8181C4
	dw CODE_8181C9

CODE_818160:
	JSR.w (DATA_81815C,x)
	JSR.w CODE_818200
	JSR.w CODE_818179
	LDX.b $CE
	LDA.w #$5555
	STA.w $0202,x
	SEP.b #$20
	STA.w $021F,x
	REP.b #$20
	RTS

CODE_818179:
	LDX.b $B8
	LDA.w $1EF0,x
	SEC
	SBC.b $3C
	BMI.b CODE_8181A0
	BEQ.b CODE_8181A0
	LSR
	LSR
	LSR
	LSR
	TAY
	LDX.b $3C
	CLC
CODE_81818D:
	LDA.w #$E0E0
	STA.b $00,x
	STA.b $04,x
	STA.b $08,x
	STA.b $0C,x
	TXA
	ADC.w #$0010
	TAX
	DEY
	BNE.b CODE_81818D
CODE_8181A0:
	LDX.b $B8
	LDA.b $3C
	STA.w $1EF0,x
	RTS

;--------------------------------------------------------------------

DATA_8181A8:
	dw $0000,$0200,$03E0,$0000,$FC00,$1C00,CODE_81F586

DATA_8181B6:
	dw $0002,$0420,$05DE,$7000,$FD00,$1C80,CODE_81F595

CODE_8181C4:
	LDY.w #DATA_8181A8
	BRA.b CODE_8181CC

CODE_8181C9:
	LDY.w #DATA_8181B6
CODE_8181CC:
	LDX.w $0000,y
	STX.b $B8
	STZ.w $1EF8,x
	LDA.b $C8,x
	STA.w $0FE0
	LDX.w $0002,y
	STX.b $CE
	LDX.w $0004,y
	STX.b $CC
	LDX.w $0006,y
	STX.b $BA
	LDA.w $0008,y
	STA.w $0FE2
	LDA.w $000A,y
	STA.w $0FE4
	LDA.w $000C,y
	STA.w $0FDC
	RTS

;--------------------------------------------------------------------

CODE_8181FB:
	LDA.w #$0000
	BRA.b CODE_818203

CODE_818200:
	LDA.w #$0070
CODE_818203:
	CLC
	ADC.b $CE
	STA.b $3C
	LDA.b $3C
	LSR
	LSR
	LSR
	LSR
	ADC.b $CC
	TAX
	EOR.w #$FFFF
	SEC
	ADC.b $CE
	CLC
	ADC.w #$021C
	STZ.b $00,x
	TXY
	INY
	PHB
	MVN $800628>>16,$800627>>16
	PLB
	RTS

;--------------------------------------------------------------------

CODE_818225:
	LDA.w $0D28
	BEQ.b CODE_818232
	JSR.w CODE_8182E1
	JSL.l CODE_80BAD7
	RTS

CODE_818232:
	JSL.l CODE_80BA97
	RTS

;--------------------------------------------------------------------

CODE_818237:
	JSL.l CODE_80BA97
	RTS

;--------------------------------------------------------------------

CODE_81823C:
	JSL.l CODE_80BB2C
	RTS

;--------------------------------------------------------------------

DATA_818241:
	db $1F,$1F,$1F,$1F,$1F,$1F,$1F

CODE_818248:
	JSR.w CODE_81A110
	SEP.b #$30
	TAY
	LDA.w DATA_818241,y
	STA.w $1EFC
	REP.b #$30
	JSL.l CODE_80BB2C
	RTS

CODE_81825B:
	LDA.w $0FBE
	BEQ.b CODE_818269
	DEC
	STA.w $0FBE
	STZ.w $017E
	BRA.b CODE_818277

CODE_818269:
	LDA.w $0FBC
	LDX.w $017E
	BEQ.b CODE_81827A
	LDA.w #$001E
	STA.w $0FBE
CODE_818277:
	LDA.w #$0008
CODE_81827A:
	STA.w $1EFC
	BRA.b CODE_8182AD

CODE_81827F:
	JSR.w CODE_81828C
	BRA.b CODE_8182AD

CODE_818284:
	JSR.w CODE_81828C
	JSL.l CODE_80BB2C
	RTS

CODE_81828C:
	LDX.w #$000A
	BIT.w $1A12
	BPL.b CODE_818295
	DEX
CODE_818295:
	BIT.w $1A92
	BPL.b CODE_81829B
	DEX
CODE_81829B:
	STX.w $1EFC
	RTS

CODE_81829F:
	JSR.w CODE_81A110
	SEP.b #$30
	TAY
	LDA.w DATA_818241,y
	STA.w $1EFC
	REP.b #$30
CODE_8182AD:
	LDA.w $0D28
	BEQ.b CODE_8182BA
	JSR.w CODE_8182CF
	JSL.l CODE_80BB6C
	RTS

CODE_8182BA:
	JSL.l CODE_80BB2C
	RTS

;--------------------------------------------------------------------

CODE_8182BF:
	LDY.b $02,x
	CPY.w #$00B0
	BEQ.b CODE_818317
	LDA.b $2E,x
	TYX
	CMP.b $2E,x
	BCS.b CODE_8182BF
	BRA.b CODE_818300

CODE_8182CF:
	LDX.b $C6
CODE_8182D1:
	LDY.b $02,x
	CPY.w #$00C4
	BEQ.b CODE_818317
	LDA.b $0E,x
	TYX
	CMP.b $0E,x
	BCS.b CODE_8182D1
	BRA.b CODE_818300

CODE_8182E1:
	LDY.w #$00C0
	LDX.b $C2
	BRA.b CODE_8182F1

CODE_8182E8:
	LDY.w #$00B0
	LDX.b $B2
	BIT.b $C8
	BVS.b CODE_8182BF
CODE_8182F1:
	STY.b $00
CODE_8182F3:
	LDY.b $02,x
	CPY.b $00
	BEQ.b CODE_818317
	LDA.b $06,x
	TYX
	CMP.b $06,x
	BCS.b CODE_8182F3
CODE_818300:
	LDY.b $02,x
	LDA.b $00,x
	TAX
	STX.b $00,y
	LDA.b $02,x
	STY.b $02,x
	TAY
	STX.b $02,y
	LDA.b $00,x
	STY.b $00,x
	TAX
	STX.b $00,y
	STY.b $02,x
CODE_818317:
	RTS

;--------------------------------------------------------------------

CODE_818318:
	LDY.b $0A,x
	CPY.w #$00B4
	BEQ.b CODE_818353
	LDA.b $34,x
	TYX
	CMP.b $34,x
	BCS.b CODE_818318
	BRA.b CODE_81833C

CODE_818328:
	LDX.b $BE
	BIT.b $CA
	BVS.b CODE_818318
CODE_81832E:
	LDY.b $0A,x
	CPY.w #$00B4
	BEQ.b CODE_818353
	LDA.b $0E,x
	TYX
	CMP.b $0E,x
	BCS.b CODE_81832E
CODE_81833C:
	LDY.b $0A,x
	LDA.b $08,x
	TAX
	STX.b $08,y
	LDA.b $0A,x
	STY.b $0A,x
	TAY
	STX.b $0A,y
	LDA.b $08,x
	STY.b $08,x
	TAX
	STX.b $08,y
	STY.b $0A,x
CODE_818353:
	RTS

;--------------------------------------------------------------------

CODE_818354:
	PHB
	PHK
	PLB
	JSR.w CODE_81843A
	LDX.w #$043E
CODE_81835D:
	LDA.w #$E0E0
	STA.w $0200,x
	DEX
	DEX
	BPL.b CODE_81835D
	LDX.w #$001E
CODE_81836A:
	STZ.w $0400,x
	STZ.w $0620,x
	DEX
	DEX
	BPL.b CODE_81836A
	LDX.w #$01FE
CODE_818377:
	STZ.w $1A00,x
	DEX
	DEX
	BPL.b CODE_818377
	LDX.w #CODE_80C227
	JSL.l CODE_80BA28
	JSR.w CODE_818E45
	LDX.w #CODE_80EB98
	JSL.l CODE_80BA28
	LDA.w #$FFFF
	STA.w $1EA4
	PLB
	RTL

;--------------------------------------------------------------------

CODE_818397:
	PHB
	PHK
	PLB
	JSR.w CODE_81843A
	LDA.b $B6
	LDX.w #DATA_8183A7
	JSR.w CODE_81BB9C
	PLB
	RTL

DATA_8183A7:
	dw DATA_8183B5
	dw DATA_8183BF
	dw DATA_8183C9
	dw DATA_8183D3
	dw DATA_8183DD
	dw DATA_8183E7
	dw DATA_8183F1

DATA_8183B5:
	dw CODE_81845A
	dw CODE_8183FF
	dw CODE_81850B
	dw CODE_818476
	dw CODE_81BBAB

DATA_8183BF:
	dw CODE_81845A
	dw CODE_8183FF
	dw CODE_818504
	dw CODE_818476
	dw CODE_81BBAB

DATA_8183C9:
	dw CODE_81845A
	dw CODE_8183FF
	dw CODE_818504
	dw CODE_818476
	dw CODE_81BBAB

DATA_8183D3:
	dw CODE_81845A
	dw CODE_8183FF
	dw CODE_818503
	dw CODE_818476
	dw CODE_81BBAB

DATA_8183DD:
	dw CODE_81845A
	dw CODE_81840C
	dw CODE_818504
	dw CODE_818476
	dw CODE_81BBAB

DATA_8183E7:
	dw CODE_81845A
	dw CODE_8183FF
	dw CODE_818504
	dw CODE_818476
	dw CODE_81BBAB

DATA_8183F1:
	dw CODE_81845A
	dw CODE_8183FF
	dw CODE_8184F3
	dw CODE_81BE34
	dw CODE_81BEBF
	dw CODE_818476
	dw CODE_81BBAB

CODE_8183FF:
	STZ.w $1F24
	STZ.w $1F20
	LDA.w #$0000
	STA.w $1F20
	RTS

CODE_81840C:
	LDA.w #$0001
	STA.w $0FD6
	LDA.w #$0002
	TRB.w $1F24
	LDA.w $1F24
	AND.w #$BFFF
	BPL.b CODE_81842D
	ORA.w #$4001
	STA.w $1F24
	LDX.w #$0002
	STX.w $1F20
	RTS

CODE_81842D:
	ORA.w #$0001
	STA.w $1F24
	LDX.w #$0001
	STX.w $1F20
	RTS

CODE_81843A:
	SEP.b #$30
	LDA.b $2E	
	ASL
	ASL
	ORA.b $2C
	LSR
	TAX
	LDA.w DATA_81844E,x
	STA.b $B6
	STZ.b $B7
	REP.b #$30
	RTS

DATA_81844E:
	db $00,$06,$00,$0C,$02,$00,$08,$00
	db $04,$00,$0A,$00

CODE_81845A:
	LDA.w #$0000
	STA.l $7FFF00
	STA.l $7FFF02
	LDX.w #CODE_80B93E
	JSL.l CODE_80BA28
	LDX.w #CODE_80B943
	JSL.l CODE_80BA28
	JMP.w CODE_81853C

CODE_818476:
	LDX.w #CODE_80C227
	JSL.l CODE_80BA28
	JSR.w CODE_818E45
	LDX.w #CODE_80F4D7
	JSL.l CODE_80BA28
	JSL.l CODE_84E5A7
	JSL.l CODE_84DA90
	JSL.l CODE_85E168
	LDX.w #CODE_80EB98
	JSL.l CODE_80BA28
	JSR.w CODE_81D5FA
	JSR.w CODE_81DF26
	JSR.w CODE_81B9DF
	JSR.w CODE_81934B
	JSR.w CODE_81BBAE
	LDA.w #$0000
	STA.l $7FDE30
	LDA.w #$FFFF
	STA.w $1EA4
	LDX.b $2E
	LDA.w DATA_8184DF,x
	STA.w $0FAA
	LDA.w DATA_8184E5,x
	STA.w $0FAD
	SEP.b #$20
	LDA.b #CODE_81F586>>16
	STA.w $0FAC
	STA.w $0FAF
	REP.b #$20
	LDA.w #$000A
	STA.w $0FBC
	LDX.b $2C
	LDA.w DATA_8184EB,x
	STA.w $0FBA
	RTS

DATA_8184DF:
	dw CODE_81F586,CODE_81F586,CODE_81F595

DATA_8184E5:
	dw CODE_81F595,CODE_81F586,CODE_81F595

DATA_8184EB:
	dw $0200,$0200,$0200,$0400

CODE_8184F3:
	LDX.w #$010E
	LDA.w #$1100
	STA.b $00,x
	LDA.w #$1000
	STA.b $02,x
	STZ.b $04,x
	RTS

CODE_818503:
	RTS

CODE_818504:
	LDA.w #$0006
	STA.w $0174
	RTS

CODE_81850B:
	LDX.w #$0002
CODE_81850E:
	LDA.w $0154,x
	BNE.b CODE_818519
	LDA.w #$8000
	STA.w $1E96,x
CODE_818519:
	DEX
	DEX
	BPL.b CODE_81850E
	RTS

DATA_81851E:
	dw $0000

DATA_818520:
	dw $001F

CODE_818522:
	LDX.w #$1F00
	STZ.b $00,x
	TXY
	INY
	LDA.w #$002A
	PHB
	MVN $001F01>>16,$001F00>>16
	PLB
	LDA.w #$00E0
	STA.w $1F14
	JSL.l CODE_819699
	RTL

CODE_81853C:
	STZ.b $B8
	STZ.b $CE
	STZ.b $CC
	STZ.b $BA
	STZ.w $010A
	STZ.w $010C
	LDX.b $B6
	LDA.w DATA_81855F,x
	STA.w $1EFE
	LDA.w #CODE_80BA60
	STA.w $1EF6
	LDA.w DATA_818520
	STA.w $1EFC
	RTS

DATA_81855F:
	dw DATA_81896D,DATA_81891B,DATA_818955,DATA_8189BF,DATA_818A0C,DATA_818A3A,DATA_8189E5

;--------------------------------------------------------------------

CODE_81856D:
	PHB
	PHK
	PLB
	JSR.w CODE_8188BC
	JSR.w CODE_818902
	LDA.w $0E50
	BPL.b CODE_818580
	JSR.w CODE_818605
	BRA.b CODE_818585

CODE_818580:
	LDX.b $B6
	JSR.w (DATA_8185B3,x)
CODE_818585:
	PLB
	RTL

CODE_818587:
	PHB
	PHK
	PLB
	LDA.w $0FA6
	BEQ.b CODE_818592
CODE_81858F:
	DEC
	BNE.b CODE_81858F
CODE_818592:
	JSR.w CODE_818902
	LDA.w $0E50
	BPL.b CODE_81859F
	JSR.w CODE_8185CF
	BRA.b CODE_8185A8

CODE_81859F:
	LDX.b $B6
	JSR.w (DATA_8185C1,x)
	JSL.l CODE_8196B5
CODE_8185A8:
	STZ.w $1EF4
	LDX.w $1EFE
	JSR.w CODE_8187F0
	PLB
	RTL

DATA_8185B3:
	dw CODE_8186C1
	dw CODE_8186A0
	dw CODE_8186B8
	dw CODE_8186B2
	dw CODE_81863F
	dw CODE_8186A9
	dw CODE_8186AC

DATA_8185C1:
	dw CODE_818783
	dw CODE_81875B
	dw CODE_818735
	dw CODE_818720
	dw CODE_81870E
	dw CODE_8186F9
	dw CODE_8186E9

CODE_8185CF:
	LDA.w #CODE_80BA8E
	STA.w $1EF6
	LDA.w $0E52
	AND.w #$0002
	BNE.b CODE_8185F9
	JSR.w CODE_8181C4
	JSL.l CODE_81DF5A
	JSR.w CODE_8182E8
	JSR.w CODE_818200
	LDX.w $1EFE
	JSR.w CODE_818237
	JSR.w CODE_818179
	LDX.w $1EFE
	JSR.w (!ContextDependentTable+$04,x)
CODE_8185F9:
	LDX.w #CODE_80F8F8
	JSL.l CODE_80BA28
	JSL.l CODE_83F2FA
	RTS

;--------------------------------------------------------------------

CODE_818605:
	LDA.w $0E52
	AND.w #$000F
	TAX
	LDA.w DATA_81862F,x
	STA.b $A8
	STA.b $AA
	LDA.w $0E52
	AND.w #$0002
	BEQ.b CODE_81862E
	JSR.w CODE_8181C9
	JSL.l CODE_81DF5A
	JSR.w CODE_818328
	JSR.w CODE_818200
	JSR.w CODE_81823C
	JMP.w CODE_818179

CODE_81862E:
	RTS

DATA_81862F:
	dw $1400,$1600,$1500,$1200,$1700,$1100,$1300,$1000

;--------------------------------------------------------------------

CODE_81863F:
	JSL.l CODE_84E9AD
	LDA.w $0E60
	BPL.b CODE_81868C
	LDX.w #$1100
	LDA.w $0104
	BNE.b CODE_81865E
	LDA.b $38
	CMP.w #$0004
	BCS.b CODE_81865E
	LDA.w $1034
	DEC
	STA.w $1134
CODE_81865E:
	LDA.w $1DCE
	AND.w #$000F
	CMP.w #$0002
	BEQ.b CODE_81868C
	LDA.b $10,x
	AND.w #$0020
	BNE.b CODE_81868C
	LDA.w $0FB6
	BNE.b CODE_81868C
	LDA.b $5A,x
	BMI.b CODE_818680
	LDA.b $A0,x
	CMP.w #$0004
	BCC.b CODE_81868C
CODE_818680:
	STZ.b $10,x
	JSL.l CODE_80C2BE
	STZ.w $0E60
	STZ.w $1F2A
CODE_81868C:
	LDA.w #$0005
	STA.w $1182
	STA.w $1282
	REP.b #$20
	JSR.w CODE_8186CD
	JSR.w CODE_818882
	JMP.w CODE_81884E

CODE_8186A0:
	JSR.w CODE_8186CD
	JSR.w CODE_818882
	JMP.w CODE_81884E

;--------------------------------------------------------------------

CODE_8186A9:
	JMP.w CODE_8186CD

CODE_8186AC:
	JSR.w CODE_8186CD
	JMP.w CODE_81BE41

CODE_8186B2:
	JSR.w CODE_8186CD
	JMP.w CODE_81BAC9

CODE_8186B8:
	JSR.w CODE_8186CD
	JSR.w CODE_818A52
	JMP.w CODE_81BAC9

CODE_8186C1:
	JSR.w CODE_8186CD
	LDA.w $1EE4
	BEQ.b CODE_8186CC
	JMP.w CODE_81BAC9

CODE_8186CC:
	RTS

CODE_8186CD:
	JSR.w CODE_81B9D0
	JSR.w CODE_81BBAF
	JSL.l CODE_84DAB9
	JSR.w CODE_8181C9
	JSR.w CODE_818328
	JSR.w CODE_818200
	LDX.w $1EFE
	JSR.w (!ContextDependentTable+$02,x)
	JMP.w CODE_818179

CODE_8186E9:
	JSR.w CODE_8187AC
	JSR.w CODE_8187B4
	JSR.w CODE_81BE3E
	JSR.w CODE_818902
	JSR.w CODE_8187D5
	RTS

CODE_8186F9:
	JSR.w CODE_8187AC
	JSR.w CODE_81B96A
	JSR.w CODE_8187B4
	JSR.w CODE_818882
	JSR.w CODE_818902
	JSR.w CODE_8187D5
	JMP.w CODE_81884E

CODE_81870E:
	JSR.w CODE_8187AC
	JSR.w CODE_81B964
	JSR.w CODE_8187B4
	JSR.w CODE_818902
	JSR.w CODE_8187D5
	JMP.w CODE_81BAC9

CODE_818720:
	JSR.w CODE_8187AC
	JSR.w CODE_81B952
	JSR.w CODE_8187B4
	JSR.w CODE_818902
	JSR.w CODE_8187D5
	JSR.w CODE_81BAC9
	JMP.w CODE_8188A7

CODE_818735:
	JSR.w CODE_81BDA7
	JSR.w CODE_8187AC
	JSR.w CODE_81B96A
	JSR.w CODE_8187B4
	JSR.w CODE_818882
	JSR.w CODE_818902
	JSR.w CODE_8187D5
	JSR.w CODE_81BAC9
	JSL.l CODE_81B15A
	LDX.w #CODE_80EF01
	JSL.l CODE_80BA28
	JMP.w CODE_81884E

CODE_81875B:
	JSR.w CODE_81BDA7
	JSR.w CODE_8187AC
	JSR.w CODE_81B964
	JSR.w CODE_8187B4
	JSR.w CODE_818902
	JSR.w CODE_8187D5
	JSR.w CODE_81BAC9
	JSL.l CODE_81B140
	JSR.w CODE_818A52
	LDX.w #CODE_80EF09
	JSL.l CODE_80BA28
	RTS

DATA_81877F:
	dw CODE_81B964
	dw CODE_81B96A

CODE_818783:
	JSR.w CODE_81BDA7
	JSR.w CODE_8187AC
	LDX.w $1EE4
	JSR.w (DATA_81877F,x)
	JSR.w CODE_8187B4
	JSR.w CODE_818902
	JSR.w CODE_8187D5
	LDA.w $1EE4
	BNE.b CODE_8187A0
	JSR.w CODE_81BAC9
CODE_8187A0:
	JSL.l CODE_81B16A
	LDX.w #CODE_80EEF9
	JSL.l CODE_80BA28
	RTS

;--------------------------------------------------------------------

CODE_8187AC:
	LDX.w #CODE_80F64E
	JSL.l CODE_80BA28
	RTS

;--------------------------------------------------------------------

CODE_8187B4:
	LDX.w $1EFE
	LDA.w !ContextDependentTable+$06,x
	STA.w $1EF6
	JSR.w CODE_8181C4
	JSR.w CODE_8182E8
	JSR.w CODE_818200
	LDX.w $1EFE
	JSR.w (!ContextDependentTable,x)
	JSR.w CODE_818179
	LDX.w $1EFE
	JMP.w (!ContextDependentTable+$04,x)

;--------------------------------------------------------------------

CODE_8187D5:
	JSL.l CODE_83F2FA
	JSL.l CODE_81B73D
	LDX.w #CODE_80F879
	JSL.l CODE_80BA28
	LDX.w #CODE_80F8F8
	JSL.l CODE_80BA28
	RTS

;--------------------------------------------------------------------

DATA_8187EC:
	dw $0200,$0420

;--------------------------------------------------------------------

CODE_8187F0:
	CLC
CODE_8187F1:
	JSR.w (!ContextDependentTable+$08,x)
	INX
	INX
	INX
	INX
	BCC.b CODE_8187F1
	LDA.w !ContextDependentTable+$06,x
	STA.w $1EFE
CODE_818800:
	RTS

;--------------------------------------------------------------------

CODE_818801:
	PLA
	RTS

;--------------------------------------------------------------------

CODE_818803:
	LDA.w $1F06
	AND.w #$0008
	BEQ.b CODE_818800
	SEC
	RTS

;--------------------------------------------------------------------

CODE_81880D:
	LDA.w $1F06
	AND.w #$0008
	BNE.b CODE_818800
	SEC
	RTS

;--------------------------------------------------------------------

CODE_818817:
	LDA.w $0D4C
	BEQ.b CODE_818849
	BNE.b CODE_818800				; Note: This will always branch.

CODE_81881E:
	LDA.w $0D4E
	BEQ.b CODE_818849
	BNE.b CODE_818800				; Note: This will always branch.

CODE_818825:
	LDA.w $1110
	AND.w #$0020
	BEQ.b CODE_818800
	BNE.b CODE_818849				; Note: This will always branch.

CODE_81882F:
	LDA.w $1010
	AND.w #$0020
	BEQ.b CODE_818800
	LDA.w $010E
	CMP.w #$1000
	BEQ.b CODE_818849
	BNE.b CODE_818800				; Note: This will always branch.

CODE_818841:
	LDA.w $1010
	AND.w #$0020
	BEQ.b CODE_818800
CODE_818849:
	SEC
	INC.w $1EF4
	RTS

;--------------------------------------------------------------------

CODE_81884E:
	LDX.b $B8
	LDA.b $A4,x
	CMP.w #$0002
	BNE.b CODE_818879
	TXA
	EOR.w #$0002
	TAY
	LDX.b $C8,y
	LDA.b $12,x
	CMP.w #$0008
	BNE.b CODE_81886F
	TXA
	CLC
	ADC.b $B8
	TAX
	LDA.w #$8002
	STA.b $6C,x
CODE_81886F:
	LDX.b $B8
	LDA.w #$8000
	STA.w $1E92,x
	BRA.b CODE_81887F

CODE_818879:
	STZ.w $1E92,x
	LDA.w #$C000
CODE_81887F:
	STA.b $C8,x
	RTS

;--------------------------------------------------------------------

CODE_818882:
	LDX.b $B8
	BIT.b $C8,x
	BVC.b CODE_8188A6
	LDA.w $1DF0
	BNE.b CODE_8188A6
	LDA.w $1F06
	AND.w #$0008
	BNE.b CODE_8188A6
	LDY.b $CE
	LDA.w #$AAAA
	STA.w $0207,y
	STA.w $0209,y
	STA.w $020B,y
	STA.w $020D,y
CODE_8188A6:
	RTS

;--------------------------------------------------------------------

CODE_8188A7:
	RTS

;--------------------------------------------------------------------

CODE_8188A8:
	LDX.w $010E
	LDA.b $C0,x
	AND.w #$00FF
	BNE.b CODE_8188BB
	INC
	STA.b $E6,x
	LDX.w $0110
	INC
	STA.b $E6,x
CODE_8188BB:
	RTS

;--------------------------------------------------------------------

CODE_8188BC:
	LDA.w $1F06
	AND.w #$0004
	BEQ.b CODE_8188E8
	LDA.b $28
	ORA.b $2A
	AND.w #$0020
	BEQ.b CODE_8188E8
	LDA.w #$8400
	STA.w $10C0
	STA.w $11C0
	STA.w $12C0
	STA.w $13C0
	STA.w $14C0
	STA.w $15C0
	STA.w $16C0
	STA.w $17C0
CODE_8188E8:
	LDA.b $38
	AND.w #$0001
	ASL
	STA.w $1EE4
	LDA.w $1EE6
	INC
	INC
	CMP.w #$0018
	BCC.b CODE_8188FE
	LDA.w #$0000
CODE_8188FE:
	STA.w $1EE6
	RTS

;--------------------------------------------------------------------

CODE_818902:
	SEP.b #$30
	BIT.w $1F06
	BPL.b CODE_818918
	LDA.b #!ScreenDisplayRegister_Brightness08
	STA.w !REGISTER_ScreenDisplayRegister
	LDX.b #$10
CODE_818910:
	DEX
	BNE.b CODE_818910
	LDA.b #!ScreenDisplayRegister_MaxBrightness0F
	STA.w !REGISTER_ScreenDisplayRegister
CODE_818918:
	REP.b #$30
	RTS

;--------------------------------------------------------------------

DATA_81891B:
	dw CODE_818225
	dw CODE_81827F
	dw CODE_8196BF : dw $BA71
	dw CODE_818803
	dw DATA_818937
	dw CODE_818841
	dw DATA_81892D
	dw CODE_818801

DATA_81892D:
	dw CODE_81CC34
	dw CODE_81CC5E
	dw CODE_8196BF : dw $BA67
	dw CODE_818801

DATA_818937:
	dw CODE_818232
	dw CODE_818949
	dw CODE_8196BF : dw $BA6D
	dw CODE_81880D
	dw DATA_81891B
	dw CODE_818841
	dw DATA_81892D
	dw CODE_818801

CODE_818949:
	JSL.l $0888D8
	LDX.w #CODE_80D7A3
	JSL.l CODE_80BA28
	RTS

DATA_818955:
	dw CODE_818225
	dw CODE_81829F
	dw CODE_8196C5 : dw $BA71
	dw CODE_818825
	dw DATA_818963
	dw CODE_818801

DATA_818963:
	dw CODE_81CC5E
	dw CODE_81CC34
	dw CODE_8196C5 : dw $BA67
	dw CODE_818801

DATA_81896D:
	dw CODE_818225
	dw CODE_81825B
	dw CODE_8196CB : dw $BA71
	dw CODE_818803
	dw DATA_8189A9
	dw CODE_818841
	dw DATA_818983
	dw CODE_818825
	dw DATA_818991
	dw CODE_818801

DATA_818983:
	dw CODE_81CC34
	dw CODE_81825B
	dw CODE_8196CB : dw $BA67
	dw CODE_818825
	dw DATA_81899F
	dw CODE_818801

DATA_818991:
	dw CODE_818225
	dw CODE_81CC34
	dw CODE_8196CB : dw $BA67
	dw CODE_818841
	dw DATA_81899F
	dw CODE_818801

DATA_81899F:
	dw CODE_81CC34
	dw CODE_81CC34
	dw CODE_8196CB : dw $BA67
	dw CODE_818801

DATA_8189A9:
	dw CODE_818232
	dw CODE_818949
	dw CODE_8196CB : dw $BA6D
	dw CODE_81880D
	dw DATA_81896D
	dw CODE_818841
	dw DATA_818983
	dw CODE_818825
	dw DATA_818991
	dw CODE_818801

DATA_8189BF:
	dw CODE_818225
	dw CODE_81829F
	dw CODE_8196CB : dw $BA71
	dw CODE_81882F
	dw DATA_8189D1
	dw CODE_818825
	dw DATA_8189DB
	dw CODE_818801

DATA_8189D1:
	dw CODE_81CC87
	dw CODE_81CC97
	dw CODE_818A0B : dw $BA67
	dw CODE_818801

DATA_8189DB:
	dw CODE_81CC97
	dw CODE_81CC87
	dw CODE_818A0B : dw $BA67
	dw CODE_818801

DATA_8189E5:
	dw CODE_818232
	dw CODE_818248
	dw CODE_819719 : dw $BA61
	dw CODE_818817
	dw DATA_8189F7
	dw CODE_81881E
	dw DATA_818A01
	dw CODE_818801

DATA_8189F7:
	dw CODE_81CCC1
	dw CODE_81CCB1
	dw CODE_818A0B : dw $BA67
	dw CODE_818801

DATA_818A01:
	dw CODE_81CCB1
	dw CODE_81CCC1
	dw CODE_818A0B : dw $BA67
	dw CODE_818801

CODE_818A0B:
	RTS

DATA_818A0C:
	dw CODE_818225
	dw CODE_81829F
	dw CODE_8196E3 : dw $BA71
	dw CODE_818841
	dw DATA_818A1E
	dw CODE_818803
	dw DATA_818A28
	dw CODE_818801

DATA_818A1E:
	dw CODE_81CC63
	dw CODE_81CC7D
	dw CODE_8196E3 : dw $BA67
	dw CODE_818801

DATA_818A28:
	dw CODE_818225
	dw CODE_818949
	dw CODE_8196E3 : dw $BA6D
	dw CODE_818841
	dw DATA_818A1E
	dw CODE_81880D
	dw DATA_818A0C
	dw CODE_818801

DATA_818A3A:
	dw CODE_818225
	dw CODE_81829F
	dw CODE_8196D8 : dw $BA71
	dw CODE_818825
	dw DATA_818A48
	dw CODE_818801

DATA_818A48:
	dw CODE_81CC7D
	dw CODE_81CC63
	dw CODE_8196D8 : dw $BA67
	dw CODE_818801

;--------------------------------------------------------------------

CODE_818A52:
	LDA.b $B8
	TAY
	EOR.w #$0002
	TAX
	SEP.b #$20
	LDA.w $0FD0
	BEQ.b CODE_818A76
	DEC
	STA.w $0FD0
	BNE.b CODE_818A76
	BIT.b $C9,x
	BVS.b CODE_818A76
	LDA.w $0FD1
	BPL.b CODE_818A76
	TYX
	LDA.b #$20
	ORA.b $AC,x
	STA.b $AC,x
CODE_818A76:
	REP.b #$20
	RTS

;--------------------------------------------------------------------

DATA_818A79:
	dw DATA_818B1B,DATA_818AFB,DATA_818AE3,DATA_818AEB,DATA_818B23,DATA_818B33,DATA_818B2B,DATA_818ACB
	dw DATA_818B3B,DATA_818B13,DATA_818ADB,DATA_818B0B,DATA_818B03,DATA_818AD3,DATA_818B43,DATA_818AF3
	dw DATA_818ABB,DATA_818AC3,DATA_818AB3,DATA_818AAB,DATA_818B4B,DATA_818B53,DATA_818B5B,DATA_818B63
	dw DATA_818B6B

DATA_818AAB:
	dw DATA_818C11,DATA_818DA3,DATA_818D17,$0000

DATA_818AB3:
	dw DATA_818C19,DATA_818DA3,DATA_818CC3,$0000

DATA_818ABB:
	dw DATA_818C21,DATA_818DA3,DATA_818CD1,$0000

DATA_818AC3:
	dw DATA_818C29,DATA_818DA3,DATA_818CDF,$0000

DATA_818ACB:
	dw DATA_818C31,DATA_818DA3,DATA_818D17,$0000

DATA_818AD3:
	dw DATA_818C39,DATA_818DA3,DATA_818D09,$0000

DATA_818ADB:
	dw DATA_818C41,DATA_818DA3,DATA_818CC3,$0000

DATA_818AE3:
	dw DATA_818C49,DATA_818DA3,DATA_818CB5,$0000

DATA_818AEB:
	dw DATA_818C51,DATA_818DA3,DATA_818CDF,$0000

DATA_818AF3:
	dw DATA_818C59,DATA_818DA3,DATA_818D17,$0000

DATA_818AFB:
	dw DATA_818C61,DATA_818DA3,DATA_818CD1,$0000

DATA_818B03:
	dw DATA_818C69,DATA_818DA3,DATA_818CFB,$0000

DATA_818B0B:
	dw DATA_818C71,DATA_818DA3,DATA_818CB5,$0000

DATA_818B13:
	dw DATA_818C79,DATA_818DA3,DATA_818CDF,$0000

DATA_818B1B:
	dw DATA_818C81,DATA_818DA3,DATA_818D17,$0000

DATA_818B23:
	dw DATA_818C89,DATA_818DA3,DATA_818CFB,$0000

DATA_818B2B:
	dw DATA_818C91,DATA_818DA3,DATA_818D09,$0000

DATA_818B33:
	dw DATA_818CA9,DATA_818DA3,DATA_818CED,$0000

DATA_818B3B:
	dw DATA_818C99,DATA_818DA3,DATA_818CD1,$0000

DATA_818B43:
	dw DATA_818CA1,DATA_818DA3,DATA_818D17,$0000

DATA_818B4B:
	dw DATA_818C07,DATA_818DA3,DATA_818D25,$0000

DATA_818B53:
	dw DATA_818BFD,DATA_818DA3,DATA_818D25,$0000

DATA_818B5B:
	dw DATA_818BFD,DATA_818DA3,DATA_818D25,$0000

DATA_818B63:
	dw DATA_818BFD,DATA_818DA3,DATA_818D25,$0000

DATA_818B6B:
	dw DATA_818BFD,DATA_818DA3,DATA_818D25,$0000

DATA_818B73:
	db $02,$00,$04,$0C,$08,$0C,$0A,$02
	db $00,$0C,$06,$04,$08,$0A,$02,$02
	db $00,$0C,$06,$04,$0E,$0E,$0E,$0E
	db $0E

DATA_818B8C:
	db $04,$02,$02,$02,$02,$06,$02,$00
	db $04,$04,$02,$04,$00,$02,$06,$02
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00

DATA_818BA5:
	db $00,$00,$00,$06,$00,$00,$00,$00
	db $00,$06,$00,$00,$00,$00,$00,$00
	db $00,$06,$00,$04,$00,$00,$00,$00

DATA_818BBD:
	db $05,$01,$01,$10,$08,$17,$04,$09

DATA_818BC5:
	db $00,$08,$08,$08,$08,$08,$08,$09

DATA_818BCD:
	dw $0000,$0000,$0001,$0000,$0000,$0000,$0000,$0000

DATA_818BDD:
	dw $0100,$0100,$1000,$0100,$0100,$1000,$0400,$0100

DATA_818BED:
	db $04,$04,$0A,$04,$04,$04,$04,$04

DATA_818BF5:
	db $00,$00,$00,$00,$02,$04,$00,$00

DATA_818BFD:
	dw CODE_819016 : dw $0200,$0188,$0200,$0278

DATA_818C07:
	dw CODE_819016 : dw $0200,$018A,$0200,$0278

DATA_818C11:
	dw CODE_818F79 : dw $0090,$021C,$FFE0

DATA_818C19:
	dw CODE_818F79 : dw $0370,$024C,$0020

DATA_818C21:
	dw CODE_818F79 : dw $03B8,$0260,$0020

DATA_818C29:
	dw CODE_818F79 : dw $0390,$02AC,$0020

DATA_818C31:
	dw CODE_818F79 : dw $0398,$024C,$0020

DATA_818C39:
	dw CODE_818F79 : dw $00B8,$0120,$FFE0

DATA_818C41:
	dw CODE_818F79 : dw $006C,$02AC,$FFE8

DATA_818C49:
	dw CODE_818F79 : dw $0390,$0260,$0020

DATA_818C51:
	dw CODE_818F79 : dw $0050,$0180,$FFE0

DATA_818C59:
	dw CODE_818F79 : dw $0388,$01C4,$0020

DATA_818C61:
	dw CODE_818F79 : dw $0068,$0140,$FFE0

DATA_818C69:
	dw CODE_818F79 : dw $00C0,$022C,$FFE0

DATA_818C71:
	dw CODE_818F79 : dw $0070,$0230,$0028

DATA_818C79:
	dw CODE_818F79 : dw $0390,$0150,$0020

DATA_818C81:
	dw CODE_818F79 : dw $0060,$01CC,$FFE0

DATA_818C89:
	dw CODE_818F79 : dw $0368,$0214,$0020

DATA_818C91:
	dw CODE_818F79 : dw $02B8,$0148,$0020

DATA_818C99:
	dw CODE_818F79 : dw $0068,$0140,$FFE0

DATA_818CA1:
	dw CODE_818F79 : dw $0398,$024C,$0020

DATA_818CA9:
	dw CODE_818F79 : dw $004C,$01D0,$FFE8

DATA_818CB1:
	dw CODE_81910D : dw $0000

DATA_818CB5:
	dw CODE_8190F6 : dw DATA_818CB9

DATA_818CB9:
	dw CODE_819136 : dw $0404
	dw CODE_8191E4 : dw DATA_80E36B,DATA_80E37B

DATA_818CC3:
	dw CODE_8190F6 : dw DATA_818CC7

DATA_818CC7:
	dw CODE_819136 : dw $0404
	dw CODE_8191D0 : dw DATA_80E06E,DATA_80E07A

DATA_818CD1:
	dw CODE_8190F6 : dw DATA_818CD5

DATA_818CD5:
	dw CODE_819136 : dw $0404
	dw CODE_8191D0 : dw DATA_80E6FE,DATA_80E708

DATA_818CDF:
	dw CODE_8190F6 : dw DATA_818CE3

DATA_818CE3:
	dw CODE_819136 : dw $0404
	dw CODE_8191D0 : dw DATA_80E18B,DATA_80E19D

DATA_818CED:
	dw CODE_8190F6 : dw DATA_818CF1

DATA_818CF1:
	dw CODE_819136 : dw $0404
	dw CODE_8191D0 : dw DATA_80E144,DATA_80E156

DATA_818CFB:
	dw CODE_8190F6 : dw DATA_818CFF

DATA_818CFF:
	dw CODE_819136 : dw $0404
	dw CODE_8191D0 : dw DATA_80E4E7,DATA_80E4F7

DATA_818D09:
	dw CODE_8190F6 : dw DATA_818D0D

DATA_818D0D:
	dw CODE_819136 : dw $0404
	dw CODE_8191C0 : dw DATA_80DF7E,DATA_80DF8E

DATA_818D17:
	dw CODE_8190F6 : dw DATA_818D1B

DATA_818D1B:
	dw CODE_819136 : dw $0404
	dw CODE_8191D0 : dw DATA_80E4E7,DATA_80E4F7

DATA_818D25:
	dw CODE_8190F6 : dw DATA_818D2D,DATA_818D2D,DATA_818D2D

DATA_818D2D:
	dw CODE_81910D : dw CODE_818D87
	dw $1800,$A000,$0000,$1000,$0000,$E616,$E626
	dw $1880,$A000,$0000,$1000,$5000,$E616,$E626
	dw $1900,$A000,$0000,$1000,$A000,$E616,$E626
	dw $1980,$A000,$0E00,$1100,$0000,$E616,$E626
	dw $1238,$A000,$0E00,$1100,$5000,$E616,$E626
	dw $1338,$A000,$0E00,$1100,$A000,$E616,$E626
	dw $0000

CODE_818D87:
	TAX
	LDA.w !ContextDependentTable+$02,y
	STA.b $12,x
	LDA.w !ContextDependentTable+$04,y
	STA.b $14,x
	LDA.w !ContextDependentTable+$06,y
	STA.b $70,x
	LDA.w !ContextDependentTable+$08,y
	STA.b $72,x
	TYA
	CLC
	ADC.w #$0008
	TAY
	RTS

DATA_818DA3:
	dw CODE_81908D : dw $00B6,DATA_818DD1,DATA_818DB9,DATA_818DC5,DATA_818DD1,DATA_818DB9

DATA_818DB1:
	dw DATA_818DC5,DATA_818DD1,DATA_818DDD,DATA_818DDD

DATA_818DB9:
	dw DATA_80CC27,DATA_80CC43,DATA_80CBB9,DATA_80CBFD,DATA_80CBB9,DATA_80CBFD

DATA_818DC5:
	dw DATA_80CBB9,DATA_80CBFD,DATA_80CC3B,DATA_80CC31,DATA_80CBB9,DATA_80CBFD

DATA_818DD1:
	dw DATA_80CC27,DATA_80CBFD,DATA_80CB87,DATA_80CC31,DATA_80CBB9,DATA_80CBFD

DATA_818DDD:
	dw DATA_80CAB2,DATA_80CAC6,DATA_80CAB2,DATA_80CAC6,DATA_80CAB2,DATA_80CAC6

DATA_818DE9:
	dw $0005,$0001,$0001,$0003,$0003,$0003,$0003,$0006
	dw $0002,$0002,$0004,$0004,$0004,$0004

DATA_818E05:
	db $FF,$FF,$FF,$FF,$00,$FF,$00

DATA_818E0C:
	db $FF,$FF,$FF,$00,$FF,$00,$FF

DATA_818E13:
	dw $1000,$1000,$C000,$1000,$1000,$1000

DATA_818E1F:
	dw $1100,$C000,$1100,$1100,$1100,$1100

DATA_818E2B:
	dw $0000,$0001,$0001,$0000,$0000,$0000

DATA_818E37:
	dw $0000,$0001,$0002,$0000,$0001,$0002,$0000

CODE_818E45:
	LDA.w #DATA_80D1CE
	STA.w $0FA0
	LDX.b $B6
	LDA.w DATA_818E37,x
	STA.w $1E90
	LDX.b $2E
	LDA.w DATA_818E13,x
	STA.b $C8
	LDA.w DATA_818E1F,x
	STA.b $CA
	LDA.w DATA_818E2B,x
	STA.w $1DCE
	STZ.w $1EC4
	SEP.b #$20
	LDA.w DATA_818E05,y
	STA.b $1D
	LDA.w DATA_818E0C,y
	STA.b $1F
	LDA.b #CODE_81F586>>16
	STA.w $0FDE
	SEP.b #$30
	LDY.w !RAM_SMK_Race_CurrentRacetrack
	LDA.w DATA_818B8C,y
	STA.w $0D2C
	STZ.w $0D2D
	LDA.w DATA_818BA5,y
	STA.w $0F9D
	LDA.w DATA_818B73,y
	STA.w $0D28
	STZ.w $0D29
	LDA.w !RAM_SMK_Global_RacetrackType
	STA.w $0FB4
	LDA.w !RAM_SMK_Race_CurrentRacetrack
	CMP.b #!Define_SMK_RacetrackID_RainbowRoad
	BNE.b CODE_818EA6
	STZ.w $0FB4
CODE_818EA6:
	LDA.w !RAM_SMK_Global_RacetrackType
	LSR
	TAY
	LDA.w DATA_818F5C,y
	STA.w $1EE8
	LDA.w DATA_818BBD,y
	STA.w $0D2A
	LDA.w DATA_818BC5,y
	STA.w $0D2E
	LDA.w DATA_818BED,y
	STA.w $0FC6
	STZ.w $0FC7
	LDA.w DATA_818BF5,y
	STA.w $0D6E
	STZ.w $0D6F
	REP.b #$30
	LDY.w #$0002
	LDA.w !RAM_SMK_Race_CurrentRacetrack
	CMP.w #!Define_SMK_RacetrackID_DonutPlains1
	BEQ.b CODE_818EDF
	LDY.w $0D28
CODE_818EDF:
	LDA.w DATA_818BCD,y
	STA.w $0FFC
	LDA.w DATA_818BDD,y
	STA.w $0FFE
	LDY.w #DATA_85EE00
	LDA.w #DATA_85EE00>>16
	LDX.w #$7E2000
	JSL.l CODE_84DF38
	LDA.w #$F000
	STA.l $7E2D73
	LDA.w #$0000
	STA.l $7E2D96
	SEP.b #$20
	LDA.b #$00
	STA.l $7E2DBD
	STA.l $7E2DAA
	REP.b #$20
	LDA.w !RAM_SMK_Race_CurrentRacetrack
	ASL
	TAX
	LDY.w DATA_818A79,x
CODE_818F1C:
	LDX.w !ContextDependentTable,y
	BEQ.b CODE_818F2A
	PHY
	JSR.w (!ContextDependentTable,x)
	PLY
	INY
	INY
	BRA.b CODE_818F1C

CODE_818F2A:
	LDX.b $B6
	JMP.w (DATA_818F2F,x)

DATA_818F2F:
	dw CODE_818F3D
	dw CODE_818F3D
	dw CODE_818F3D
	dw CODE_818F3D
	dw CODE_818F3D
	dw CODE_818F3D
	dw CODE_818F3D

CODE_818F3D:
	RTS

;--------------------------------------------------------------------

CODE_818F3E:
	STZ.b $12,x
	STZ.b $26,x
	STZ.b $1E,x
	STZ.b $20,x
	INY
	INY
	LDX.w !ContextDependentTable,y
	BNE.b CODE_818F3E
	RTS

;--------------------------------------------------------------------

CODE_818F4E:
	LDX.w !ContextDependentTable,y
CODE_818F51:
	INY
	INY
	LDA.w !ContextDependentTable,y
	STA.b $00,x
	TAX
	BNE.b CODE_818F51
	RTS

;--------------------------------------------------------------------

DATA_818F5C:
	db $FF,$00,$FF,$FF,$FF,$FF,$00,$00

;--------------------------------------------------------------------

DATA_818F64:
	db $00,$00,$10,$00,$11,$00,$00

DATA_818F6B:
	dw CODE_81903C
	dw CODE_81903C
	dw CODE_81903C
	dw CODE_818FDB
	dw CODE_818F7F
	dw CODE_818F7F
	dw CODE_818FDB

CODE_818F79:
	TXA
	LDX.b $B6
	JMP.w (DATA_818F6B,x)

CODE_818F7F:
	JSR.w CODE_81903C
	LDA.b $10
	CMP.w #$8000
	ROR
	CMP.w #$8000
	ROR
	STA.b $10
	LDY.w #$010E
	LDA.w #$FFF0
	JSR.w CODE_819003
	LDA.b $2E
	CMP.w #$0002
	BNE.b CODE_818FCF
	BIT.w $0E60
	BPL.b CODE_818FD0
	BIT.w $0E66
	BPL.b CODE_818FBD
	LDA.w #$FFD8
	JSR.w CODE_818FF9
	LDY.w $0112
	BEQ.b CODE_818FBD
	LDA.b $1C,x
	STA.w $001C,y
	LDA.b $18,x
	STA.w $0018,y
CODE_818FBD:
	LDY.w $0110
	BEQ.b CODE_818FCF
	LDX.w $010E
	LDA.b $1C,x
	STA.w $001C,y
	LDA.b $18,x
	STA.w $0018,y
CODE_818FCF:
	RTS

CODE_818FD0:
	BIT.w $0E66
	BPL.b CODE_818FCF
	LDA.w #$FFD8
	JMP.w CODE_818FF9

CODE_818FDB:
	JSR.w CODE_81903C
	LDA.b $08
	CMP.w #$8000
	ROR
	CMP.w #$8000
	ROR
	STA.b $10
	LDY.w #$010E
	LDA.w #$FFF0
	JSR.w CODE_819003
	LDA.w #$FFD8
	JMP.w CODE_818FF9

CODE_818FF9:
	PHA
	LDA.b $10
	EOR.w #$FFFF
	INC
	STA.b $10
	PLA
CODE_819003:
	LDX.b $00,y
	BEQ.b CODE_819015
	CLC
	ADC.b $1C,x
	STA.b $1C,x
	LDA.b $18,x
	CLC
	ADC.b $10
	STA.b $18,x
	INY
	INY
CODE_819015:
	RTS

;--------------------------------------------------------------------

CODE_819016:
	INX
	INX
	STX.b $00
	LDY.w #$010E
CODE_81901D:
	LDX.b $00,y
	BEQ.b CODE_81903B
	PHY
	LDY.b $00
	LDA.w !ContextDependentTable,y
	STA.b $18,x
	LDA.w !ContextDependentTable+$02,y
	STA.b $1C,x
	STZ.b $20,x
	INY
	INY
	INY
	INY
	STY.b $00
	PLY
	INY
	INY
	BRA.b CODE_81901D

CODE_81903B:
	RTS

;--------------------------------------------------------------------

CODE_81903C:
	TAX
	LDY.w #$010E
	INX
	INX
	LDA.w !ContextDependentTable,x
	STA.b $06
	LDA.w !ContextDependentTable+$04,x
	STA.b $08
	STA.b $10
	LDA.w !ContextDependentTable+$02,x
	STA.b $0A
	LDA.w #$0018
	STA.b $0C
CODE_819058:
	LDX.w !ContextDependentTable,y
	BEQ.b CODE_81908C
	LDA.w #$1000
	CPX.w #$1000
	BNE.b CODE_819068
	LDA.w #$1100
CODE_819068:
	LDA.b $06
	STA.b $18,x
	CLC
	ADC.b $08
	STA.b $06
	LDA.b $08
	EOR.w #$FFFF
	INC
	STA.b $08
	LDA.b $0A
	STA.b $1C,x
	CLC
	ADC.b $0C
	STA.b $0A
	LDA.l DATA_81851E
	STA.b $20,x
	INY
	INY
	BRA.b CODE_819058

CODE_81908C:
	RTS

;--------------------------------------------------------------------

CODE_81908D:
	STX.b $00
	LDY.w !ContextDependentTable+$02,x
	LDA.w $0E50
	BEQ.b CODE_81909C
	LDA.w #$0010
	BRA.b CODE_81909F

CODE_81909C:
	LDA.w !ContextDependentTable,y
CODE_81909F:
	CLC
	ADC.w #$0004
	ADC.b $00
	TAX
	LDY.w !ContextDependentTable,x
	STY.b $0E
	LDY.w #$010E
CODE_8190AE:
	LDX.b $00,y
	BEQ.b CODE_8190D5
	PHY
	LDY.b $0E
	JSR.w CODE_81922D
	CPX.w #$1000
	BEQ.b CODE_8190D6
	CPX.w #$1100
	BEQ.b CODE_8190E6
	LDA.w !ContextDependentTable+$08,y
	JSL.l CODE_80C25A
	LDA.w !ContextDependentTable+$0A,y
CODE_8190CC:
	JSL.l CODE_80C24D
CODE_8190D0:
	PLY
	INY
	INY
	BRA.b CODE_8190AE

CODE_8190D5:
	RTS

CODE_8190D6:
	LDA.b $10,x
	BEQ.b CODE_8190D0
	LDA.w !ContextDependentTable,y
	JSL.l CODE_80C25A
	LDA.w !ContextDependentTable+$02,y
	BRA.b CODE_8190CC

CODE_8190E6:
	LDA.b $10,x
	BEQ.b CODE_8190D0
	LDA.w !ContextDependentTable+$04,y
	JSL.l CODE_80C25A
	LDA.w !ContextDependentTable+$06,y
	BRA.b CODE_8190CC

;--------------------------------------------------------------------

CODE_8190F6:
	STX.b $00
	LDA.w #$0002
	CLC
	ADC.b $00
	TAX
	LDY.w !ContextDependentTable,x
	TYX
	INY
	INY
	JMP.w (!ContextDependentTable,x)

;--------------------------------------------------------------------

CODE_819108:
	LDY.w !ContextDependentTable+$02,x
	BEQ.b CODE_819135
CODE_81910D:
	LDA.w !ContextDependentTable,y
	BEQ.b CODE_819135
	STA.b $02
CODE_819114:
	LDA.w !ContextDependentTable+$02,y
	BEQ.b CODE_819135
	INY
	INY
	LDX.w #$0000
	JSR.w (!ContextDependentTable+$02,x)
	LDA.w !ContextDependentTable+$02,y
	JSL.l CODE_80C25A
	INY
	INY
	LDA.w !ContextDependentTable+$02,y
	JSL.l CODE_80C24D
	INY
	INY
	BRA.b CODE_819114

CODE_819135:
	RTS

;--------------------------------------------------------------------

CODE_819136:
	LDA.w #$0004
	LDX.b $B6
	BNE.b CODE_81913F
	DEC
	DEC
CODE_81913F:
	STA.b $10
	LDA.w !ContextDependentTable+$02,y
	STA.b $06
	LDA.w !ContextDependentTable+$04,y
	STA.w $0F98
	STA.b $08
	LDA.w !ContextDependentTable+$06,y
	STA.w $0F9A
	STA.b $0A
	LDX.w #$0000
CODE_819159:
	LDA.w DATA_819194,x
	STA.w $1DA0,x
	PHX
	TAX
	LDA.b $08
	STA.b $04,x
	LDY.b $C2
	JSL.l CODE_80C29B
	JSR.w CODE_8192CA
	STZ.b $20,x
	STZ.b $14,x
	TXA
	CLC
	ADC.w #$0040
	TAX
	LDA.b $0A
	STA.b $04,x
	LDY.b $C6
	JSL.l CODE_80C29B
	JSR.w CODE_8192CA
	STZ.b $20,x
	STZ.b $14,x
	PLX
	INX
	INX
	DEC.b $10
	BNE.b CODE_819159
	STZ.w $1DA0,x
	RTS

DATA_819194:
	dw $1800,$1880,$1900,$1980,$0000

;--------------------------------------------------------------------

CODE_81919E:
	LDA.w !ContextDependentTable,y
	LDX.b $2C
	CPX.w #$0002
	BNE.b CODE_8191A9
	XBA
CODE_8191A9:
	AND.w #$00FF
	STA.b $10
	INY
	INY
	LDA.w !ContextDependentTable,y
	STA.b $06
	LDA.w !ContextDependentTable+$02,y
	STA.b $08
	LDA.w !ContextDependentTable+$04,y
	STA.b $0A
	RTS


;--------------------------------------------------------------------

CODE_8191C0:
	JSR.w CODE_8191D0
	LDA.b $18,x
	STA.b $28,x
	STA.b $68,x
	LDA.b $1C,x
	STA.b $2A,x
	STA.b $6A,x
	RTS

;--------------------------------------------------------------------

CODE_8191D0:
	TAX
	LDA.w #$C000
	STA.b $12,x
	STZ.b $28,x
	STZ.b $68,x
	STZ.b $2A,x
	STZ.b $6A,x
	LDA.w #$0404
	JMP.w CODE_8191FA

CODE_8191E4:
	TAX
	LDA.w #$C000
	STA.b $12,x
	STZ.b $28,x
	STZ.b $68,x
	STZ.b $2A,x
	STZ.b $6A,x
	STZ.b $5A,x
	LDA.w #$0A0A
	JMP.w CODE_8191FA

CODE_8191FA:
	SEP.b #$20
	STA.b $12
	STZ.b $13
	XBA
	STA.b $14
	STZ.b $15
	REP.b #$20
	LDA.b [$0C],y
	PHA
	AND.w #$007F
	ASL
	ASL
	ASL
	ADC.b $12
	STA.b $18,x
	PLA
	AND.w #$3F80
	LSR
	LSR
	LSR
	LSR
	ADC.b $14
	STA.b $1C,x
	STZ.b $20,x
	STZ.b $1E,x
	STZ.b $14,x
	INY
	INY
	JMP.w CODE_8192CA

CODE_81922B:
	PLA
	RTS

CODE_81922D:
	PHY
	PHX
	LDY.w #$0030
CODE_819232:
	STZ.b $40,x
	INX
	INX
	DEY
	BNE.b CODE_819232
	PLX
	LDY.b $12,x
	LDA.w DATA_819277,y
	STA.b $4E,x
	STZ.b $9E,x
	LDA.b $E6,x
	STA.b $40,x
	LDA.w #$0140
	STA.b $30,x
	STA.b $36,x
	STZ.w $1E44
	STZ.w $1E64
	STZ.w $1E42
	STZ.w $1E62
	LDA.b $E2,x
	AND.w #$4000
	BEQ.b CODE_81926D
	LDA.w #$FFFF
	STA.b $84,x
	LDA.b $4E,x
	AND.w #$FFEF
	STA.b $4E,x
CODE_81926D:
	SEP.b #$20
	STZ.b $21,x
	REP.b #$20
	PLY
	JMP.w CODE_8192CA

DATA_819277:
	dw $001A,$001A,$001B,$0019,$001B,$0019,$0019,$0019

CODE_819287:
	TAX
	LDA.w #$C000
	STA.b $12,x
	LDA.w !ContextDependentTable+$02,y
	INY
	INY
	STA.b $46,x
	STZ.b $40,x
	STZ.b $5A,x
	JSR.w CODE_8192A0
	STZ.b $20,x
	STZ.b $1E,x
	RTS

CODE_8192A0:
	LDA.w !ContextDependentTable+$02,y
	STA.b $18,x
	LDA.w !ContextDependentTable+$04,y
	STA.b $1C,x
	LDA.w !ContextDependentTable+$06,y
	STA.b $20,x
	LDA.w !ContextDependentTable+$08,y
	STA.b $14,x
	LDA.w !ContextDependentTable+$0A,y
	STA.b $7C,x
	STA.b $7E,x
	TYA
	CLC
	ADC.w #$000A
	TAY
	JMP.w CODE_8192CA

CODE_8192C4:
	STZ.b $18,x
	STZ.b $1C,x
	STZ.b $20,x
CODE_8192CA:
	STZ.b $16,x
	STZ.b $1A,x
	STZ.b $1E,x
	STZ.b $22,x
	STZ.b $24,x
	STZ.b $26,x
	RTS

;--------------------------------------------------------------------

CODE_8192D7:
	PHB
	PHK
	PLB
	LDX.w #DATA_8192ED
	JSL.l CODE_8194F4
	PLB
	RTL

UNK_C192E3:
	db $80 : dw $5800,(!REGISTER_WriteToVRAMPortLo&$0000FF<<8)+$01 : dl $7FA000 : dw $0200

DATA_8192ED:
	db $80 : dw $6800,(!REGISTER_WriteToVRAMPortLo&$0000FF<<8)+$01 : dl $7FA000 : dw $0200
	db $80 : dw $4800,(!REGISTER_WriteToVRAMPortLo&$0000FF<<8)+$01 : dl $7FA000 : dw $0800

DATA_819301:
	db $80 : dw $5200,(!REGISTER_WriteToVRAMPortLo&$0000FF<<8)+$01 : dl $7FB600 : dw $0800

DATA_81930B:
	db $80 : dw $6200,(!REGISTER_WriteToVRAMPortLo&$0000FF<<8)+$01 : dl $7FB600 : dw $0800

;--------------------------------------------------------------------

DATA_819315:
	db $4C,$50,$6A,$48,$74,$E5,$18,$1D
	db $12,$1E,$68,$69,$15,$1B,$1C,$0C
	db $4D,$51,$6B,$49,$75,$11,$0A,$17
	db $10,$0E,$0D,$22,$1F,$5E,$5F,$19
	db $00

DATA_819336:
	db $6C,$6D,$5C,$5D,$5A,$5B,$56,$57
	db $5C,$5D,$64,$65,$66,$67,$9C,$78
	db $00

DATA_819347:
	db $79,$20,$15,$00

CODE_81934B:
	JSR.w CODE_81BBB0
	LDY.w #DATA_819315
	LDX.w #$7FBC00
	JSR.w CODE_8193C5
	LDY.w #DATA_819336
	LDX.w #$7FB700
	JSR.w CODE_8193C5
	LDY.w #DATA_819347
	LDX.w #$7FBB80
	JSR.w CODE_8193C5
	LDA.b $2C
	CMP.w #$0002
	BNE.b CODE_81937E
	LDX.w #DATA_819301
	JSL.l CODE_8194F4
	LDX.w #DATA_81930B
	JSL.l CODE_8194F4
CODE_81937E:
	LDX.w #$0000
	LDA.w #$56E0
	JSR.w CODE_81944B
	LDX.w #$0000
	LDA.w #$66E0
	JSR.w CODE_81944B
	LDX.w #$0000
	LDA.w $1E96,x
	BPL.b CODE_81939B
	JSR.w CODE_8193A7
CODE_81939B:
	LDX.w #$0002
	LDA.w $1E96,x
	BPL.b CODE_8193A6
	JSR.w CODE_8193A7
CODE_8193A6:
	RTS

CODE_8193A7:
	STX.b $B8
	LDA.w #$FFFF
	STA.w $0FCA,x
	LDA.w #$0001
	STA.w $1DCE
	JSL.l CODE_81AF50
	JSL.l CODE_81AFA0
	LDX.w #CODE_80B971
	JSL.l CODE_80BA28
	RTS

CODE_8193C5:
	LDA.w #$7FA000>>16
	STA.b $04
	LDA.w #$7FA000
	STA.b $02
CODE_8193CF:
	LDA.w !ContextDependentTable,y
	AND.w #$00FF
	BEQ.b CODE_8193E5
	ASL
	ASL
	ASL
	ASL
	ASL
	PHY
	TAY
	JSR.w CODE_8193E6
	PLY
	INY
	BRA.b CODE_8193CF

CODE_8193E5:
	RTS

CODE_8193E6:
	LDA.w #$0010
	STA.b $08
CODE_8193EB:
	LDA.b [$02],y
	STA.l $7F0000,x
	INY
	INY
	INX
	INX
	DEC.b $08
	BNE.b CODE_8193EB
	RTS

;--------------------------------------------------------------------

CODE_8193FA:
	LDY.w #$0080
	STY.w !REGISTER_VRAMAddressIncrementValue
	PHA
	JSR.w CODE_819409
	PLA
	CLC
	ADC.w #$0100
CODE_819409:
	STA.w !REGISTER_VRAMAddressLo
	LDY.w #$0020
CODE_81940F:
	LDA.l $7F0000,x
	STA.w !REGISTER_WriteToVRAMPortLo
	INX
	INX
	DEY
	BNE.b CODE_81940F
	RTS

;--------------------------------------------------------------------

CODE_81941C:
	LDA.w $0E68
	BEQ.b CODE_819436
	LDA.w !RAM_SMK_Race_CurrentRacetrack
	XBA
	LSR
	ADC.w #$307000
	TAX
	LDY.w #$7FDF80
	LDA.w #$007F
	PHB
	MVN $7FDF80>>16,$307000>>16
	PLB
	RTL

CODE_819436:
	LDA.w !RAM_SMK_Race_CurrentRacetrack
	XBA
	LSR
	ADC.w #DATA_85D000
	TAX
	LDY.w #$7FDF80
	LDA.w #$007F
	PHB
	MVN $7FDF80>>16,DATA_85D000>>16
	PLB
	RTL

;--------------------------------------------------------------------

CODE_81944B:
	JSR.w CODE_81945D
	ADC.w #$0010
	JSR.w CODE_81945D
	ADC.w #$00F0
	JSR.w CODE_81945D
	ADC.w #$0010
CODE_81945D:
	PHA
	LDY.w #$0080
	STY.w !REGISTER_VRAMAddressIncrementValue
	STA.w !REGISTER_VRAMAddressLo
	LDY.w #$0008
	LDA.w DATA_819482,x
CODE_81946D:
	STA.w !REGISTER_WriteToVRAMPortLo
	DEY
	BNE.b CODE_81946D
	LDY.w #$0008
	LDA.w DATA_819482+$02,x
CODE_819479:
	STA.w !REGISTER_WriteToVRAMPortLo
	DEY
	BNE.b CODE_819479
	PLA
	CLC
	RTS

DATA_819482:
	dw $0000,$0000,$00FF,$0000,$FF00,$0000,$FFFF,$0000
	dw $0000,$00FF,$00FF,$00FF,$FF00,$00FF,$FFFF,$00FF
	dw $0000,$FF00,$00FF,$FF00,$FF00,$FF00,$FFFF,$FF00
	dw $0000,$FFFF,$00FF,$FFFF,$FF00,$FFFF,$FFFF,$FFFF

;--------------------------------------------------------------------

CODE_8194C2:
	PHB
	PHK
	PLB
	LDX.w #DATA_8194CE
	JSL.l CODE_819578
	PLB
	RTL

DATA_8194CE:
	dw DATA_8194D8
	dw DATA_8194DF
	dw DATA_8194E6
	dw DATA_8194ED
	dw $0000

DATA_8194D8:
	dw $E080 : dl $000200 : dw $0200

DATA_8194DF:
	dw $0000 : dl $000400 : dw $0020

DATA_8194E6:
	dw $E080 : dl $000420 : dw $0200

DATA_8194ED:
	dw $0000 : dl $000620 : dw $0020

;--------------------------------------------------------------------

CODE_8194F4:
	LDA.w !ContextDependentTable+$03,x
	STA.w DMA[$00].Parameters
	LDA.w !ContextDependentTable+$05,x
	STA.w DMA[$00].SourceLo
	LDA.w !ContextDependentTable+$07,x
	STA.w DMA[$00].SourceBank
	LDA.w !ContextDependentTable+$08,x
	STA.w DMA[$00].SizeLo
	LDA.w !ContextDependentTable,x
	STA.w !REGISTER_VRAMAddressIncrementValue
	LDA.w !ContextDependentTable+$01,x
	STA.w !REGISTER_VRAMAddressLo
	SEP.b #$30
	LDA.b #$01
	STA.w !REGISTER_DMAEnable
	REP.b #$30
	RTL

;--------------------------------------------------------------------

CODE_819522:
	STA.w DMA[$00].SourceLo
	LDA.w !ContextDependentTable+$03,x
	STA.w DMA[$00].Parameters
	LDA.w !ContextDependentTable+$06,x
	STA.w DMA[$00].SizeLo
	LDA.w !ContextDependentTable,x
	STA.w !REGISTER_VRAMAddressIncrementValue
	LDA.w !ContextDependentTable+$01,x
	STA.w !REGISTER_VRAMAddressLo
	SEP.b #$20
	LDA.w !ContextDependentTable+$05,x
	STA.w DMA[$00].SourceBank
	LDA.b #$01
	STA.w !REGISTER_DMAEnable
	REP.b #$20
	RTL

;--------------------------------------------------------------------

CODE_81954D:
	PHA
	STX.w DMA[$00].SourceLo
	AND.w #$00FF
	ASL
	ASL
	ASL
	ASL
	STA.w DMA[$00].SizeLo
	PLA
	SEP.b #$20
	XBA
	STA.w DMA[$00].SourceBank
	LDX.w #(!REGISTER_WriteToVRAMPortLo&$0000FF<<8)+$01
	STX.w DMA[$00].Parameters
	LDA.b #$80
	STA.w !REGISTER_VRAMAddressIncrementValue
	STY.w !REGISTER_VRAMAddressLo
	LDA.b #$01
	STA.w !REGISTER_DMAEnable
	REP.b #$20
	RTL

;--------------------------------------------------------------------

CODE_819578:
	TXY
CODE_819579:
	LDX.w !ContextDependentTable,y
	BEQ.b CODE_819586
	JSL.l CODE_819587
	INY
	INY
	BRA.b CODE_819579

CODE_819586:
	RTL

CODE_819587:
	PHY
	SEP.b #$20
	LDA.w !ContextDependentTable,x
	STA.w !REGISTER_Mode7MatrixParameterA
	LDA.w !ContextDependentTable+$01,x
	STA.w !REGISTER_Mode7MatrixParameterA
	LDA.b #$01
	STA.w !REGISTER_Mode7MatrixParameterB
	STA.w !REGISTER_Mode7MatrixParameterB
	LDY.w #(!REGISTER_PPUMultiplicationProductLo&$0000FF<<8)+$81
	STY.w DMA[$00].Parameters
	LDY.w !ContextDependentTable+$02,x
	STY.w DMA[$00].SourceLo
	LDA.w !ContextDependentTable+$04,x
	STA.w DMA[$00].SourceBank
	LDY.w !ContextDependentTable+$05,x
	STY.w DMA[$00].SizeLo
	LDA.b #$01
	STA.w !REGISTER_DMAEnable
	REP.b #$20
	PLY
	RTL

;--------------------------------------------------------------------

CODE_8195BF:
	PHY
	LDY.w !ContextDependentTable+$04,x
	JSR.w CODE_8195D5
	BRA.b CODE_8195D3

CODE_8195C8:
	PHY
	LDY.w !ContextDependentTable+$04,x
	JSR.w CODE_8195D5
	INX
	JSR.w CODE_8195E3
CODE_8195D3:
	PLY
	RTL

CODE_8195D5:
	LDA.w !ContextDependentTable+$02,x
	STZ.w !REGISTER_VRAMAddressIncrementValue
	STA.w !REGISTER_VRAMAddressLo
	LDA.w #(!REGISTER_WriteToVRAMPortLo&$0000FF<<8)+$08
	BRA.b CODE_8195F4

CODE_8195E3:
	LDA.w #$0080
	STA.w !REGISTER_VRAMAddressIncrementValue
	LDA.w !ContextDependentTable+$01,x
	STA.w !REGISTER_VRAMAddressLo
	LDA.w #(!REGISTER_WriteToVRAMPortHi&$0000FF<<8)+$08
	BRA.b CODE_8195F4

CODE_8195F4:
	STA.w DMA[$00].Parameters
	STX.w DMA[$00].SourceLo
	STY.w DMA[$00].SizeLo
	SEP.b #$20
	PHB
	PLA
	STA.w DMA[$00].SourceBank
	LDA.b #$01
	STA.w !REGISTER_DMAEnable
	REP.b #$20
	RTS

CODE_81960C:
	LDY.w !ContextDependentTable,x
	BEQ.b CODE_819637
	LDA.w !ContextDependentTable+$02,x
	STA.b $00
	LDA.w !ContextDependentTable+$04,x
	STA.b $02
	LDA.w !ContextDependentTable+$05,x
	STA.b $04
	LDA.w !ContextDependentTable+$07,x
	STA.b $06
	DEY
	DEY
CODE_819627:
	LDA.b [$00],y
	STA.b [$04],y
	DEY
	DEY
	BPL.b CODE_819627
	TXA
	CLC
	ADC.w #$0008
	TAX
	BRA.b CODE_81960C

CODE_819637:
	RTS

;--------------------------------------------------------------------

CODE_819638:
	PHB
	PHA
	TXA
	TYX
	TAY
	PLA
	SEP.b #$20
	STA.b $0C
	XBA
	STA.b $12
	LDA.b #$7F
	PHA
	PLB
CODE_819649:
	LDA.b #$08
	STA.b $10
CODE_81964D:
	LDA.b #$08
	STA.b $0E
	LDA.w $7F0000,y
	STA.b $02
	LDA.w $7F0001,y
	STA.b $04
	LDA.w $7F0010,y
	STA.b $06
	LDA.w $7F0011,y
	STA.b $08
CODE_819665:
	LDA.b $12
	ASL.b $08
	ROL
	ASL.b $06
	ROL
	ASL.b $04
	ROL
	ASL.b $02
	ROL
	BIT.b #$0F
	BNE.b CODE_819679
	LDA.b #$00
CODE_819679:
	STA.l $7F0000,x
	INX
	DEC.b $0E
	BNE.b CODE_819665
	INY
	INY
	DEC.b $10
	BNE.b CODE_81964D
	REP.b #$21
	TYA
	ADC.w #$0010
	TAY
	SEP.b #$20
	DEC.b $0C
	BNE.b CODE_819649
	REP.b #$20
	PLB
	RTL

;--------------------------------------------------------------------

CODE_819699:
	STZ.w $1F09
	SEP.b #$20
	STZ.w $1F02
	STZ.w $1F03
	STZ.w $1F04
	STZ.w $1F00
	LDA.b #$05
	STA.w $1F01
	STZ.w $1F06
	REP.b #$20
	RTL

;--------------------------------------------------------------------

CODE_8196B5:
	LDA.w $0E68
	BEQ.b CODE_8196BE
	JSL.l $088554					; Glitch: This jumps into the middle of an instruction!
CODE_8196BE:
	RTL

;--------------------------------------------------------------------

CODE_8196BF:
	JSR.w CODE_8196E3
	JMP.w CODE_819751

CODE_8196C5:
	JSR.w CODE_8196D8
	JMP.w CODE_819777

CODE_8196CB:
	JSR.w CODE_8196E3
	JSR.w CODE_8196D8
	JSR.w CODE_819751
	JSR.w CODE_819777
	RTS

CODE_8196D8:
	LDX.w #$1100
	LDY.w #$000E
	LDA.w #$0040
	BRA.b CODE_8196EC

CODE_8196E3:
	LDX.w #$1000
	LDY.w #$0006
	LDA.w #$0000
CODE_8196EC:
	STA.b $04
	STX.b $0E
	STY.b $0C
	LDA.w $0D28
	BEQ.b CODE_819718
	LDX.w #$1DA0
	BRA.b CODE_819714

CODE_8196FC:
	CLC
	ADC.b $04
	TAY
	LDA.b ($0C),y
	SEC
	SBC.w #$00E0
	CMP.w #$0040
	BCS.b CODE_819712
	PHX
	LDX.b $0E
	JSR.w CODE_81979D
	PLX
CODE_819712:
	INX
	INX
CODE_819714:
	LDA.b $00,x
	BNE.b CODE_8196FC
CODE_819718:
	RTS

CODE_819719:
	LDX.b $B2
	BRA.b CODE_81973E

CODE_81971D:
	LDA.b $12,x
	BIT.w #$3000
	BNE.b CODE_81973D
CODE_819724:
	LDA.w $0012,y
	BIT.w #$3000
	BEQ.b CODE_819731
	JSR.w CODE_819746
	BRA.b CODE_819724

CODE_819731:
	ORA.b $12,x
	BMI.b CODE_81973A
	JSR.w CODE_8197E1
	BRA.b CODE_81973D

CODE_81973A:
	JSR.w CODE_81982A
CODE_81973D:
	TYX
CODE_81973E:
	LDY.b $02,x
	CPY.w #$00B0
	BNE.b CODE_81971D
	RTS

CODE_819746:
	LDA.w !ContextDependentTable+$02,y
	CMP.w #$00B0
	BNE.b CODE_81974F
	PLA
CODE_81974F:
	TAY
	RTS

CODE_819751:
	LDX.b $B2
	BRA.b CODE_81976A

CODE_819755:
	LDA.b $12,x
	ORA.w $0012,y
	BMI.b CODE_819772
	LDA.w !ContextDependentTable+$06,y
	BMI.b CODE_819769
	CMP.w $1F14
	BCC.b CODE_819769
	JSR.w CODE_8197E1
CODE_819769:
	TYX
CODE_81976A:
	LDY.b $02,x
	CPY.w #$00B0
	BNE.b CODE_819755
	RTS

CODE_819772:
	JSR.w CODE_81982A
	BRA.b CODE_819769

CODE_819777:
	LDX.b $BE
	BRA.b CODE_819790

CODE_81977B:
	LDA.b $12,x
	ORA.w $0012,y
	BMI.b CODE_819798
	LDA.w $000E,y
	BMI.b CODE_81978F
	CMP.w $1F14
	BCC.b CODE_81978F
	JSR.w CODE_8197E1
CODE_81978F:
	TYX
CODE_819790:
	LDY.b $0A,x
	CPY.w #$00B4
	BNE.b CODE_81977B
	RTS

CODE_819798:
	JSR.w CODE_81982A
	BRA.b CODE_81978F

CODE_81979D:
	LDA.w $0018,y
	SEC
	SBC.b $18,x
	CLC
	ADC.w #$0004
	CMP.w #$0008
	BCS.b CODE_8197E0
	LDA.w $001C,y
	SEC
	SBC.b $1C,x
	CLC
	ADC.w #$0004
	CMP.w #$0008
	BCS.b CODE_8197E0
	LDA.b $60,x
	BNE.b CODE_8197E0
	LDA.b $5A,x
	BNE.b CODE_8197E0
	LDA.b $20,x
	CMP.w #$0004
	BCS.b CODE_8197E0
	LDA.w $001F,y
	SEC
	SBC.w $0FFC
	CMP.w $0FFE
	BCS.b CODE_8197E0
	LDA.w $0FD6
	STA.l $7F6004
	JMP.w CODE_819D7C

CODE_8197E0:
	RTS

CODE_8197E1:
	LDA.w $0018,y
	SEC
	SBC.b $18,x
	CLC
	ADC.w #$0004
	CMP.w #$0008
	BCS.b CODE_819829
	LDA.w $001C,y
	SEC
	SBC.b $1C,x
	CLC
	ADC.w #$0004
	CMP.w #$0008
	BCS.b CODE_819829
	LDA.w $005E,y
	ORA.b $5E,x
	STA.b $1C
	DEC
	DEC
	BPL.b CODE_819829
	LDA.b $5A,x
	ORA.w $005A,y
	BNE.b CODE_819829
	LDA.w #$0002
	CMP.b $A0,x
	BCC.b CODE_819829
	CMP.w $00A0,y
	BCC.b CODE_819829
	LDA.w #$0004
	CMP.b $20,x
	BCC.b CODE_819829
	CMP.w $0020,y
	BCS.b CODE_819867
CODE_819829:
	RTS

CODE_81982A:
	LDA.w $0018,y
	SEC
	SBC.b $18,x
	CLC
	ADC.w #$0004
	CMP.w #$0008
	BCS.b CODE_819866
	LDA.w $001C,y
	SEC
	SBC.b $1C,x
	CLC
	ADC.w #$0004
	CMP.w #$0008
	BCS.b CODE_819866
	LDA.w $005E,y
	ORA.b $5E,x
	STA.b $1C
	DEC
	DEC
	BPL.b CODE_819866
	LDA.b $5A,x
	ORA.w $005A,y
	BNE.b CODE_819866
	LDA.w #$0420
	CMP.b $1F,x
	BCC.b CODE_819866
	CMP.w $001F,y
	BCS.b CODE_819867
CODE_819866:
	RTS

CODE_819867:
	PHX
	PHY
	JSR.w CODE_81988C
	LDA.b $4E,x
	CMP.w $004E,y
	BCS.b CODE_819876
	TYA
	TXY
	TAX
CODE_819876:
	STX.b $08
	STY.b $0A
	LDA.b $4E,x
	AND.w #$C000
	BEQ.b CODE_819886
	JSR.w CODE_8198B1
	BRA.b CODE_819889

CODE_819886:
	JSR.w CODE_819B06
CODE_819889:
	PLY
	PLX
	RTS

CODE_81988C:
	STX.b $50,y
	STY.b $50,x
	LDA.w #$8007
	STA.b $52,x
	STA.w $0052,y
	LDA.w #$1000
	ORA.b $10,x
	STA.b $10,x
	LDA.w #$1000
	ORA.w $0010,y
	STA.w $0010,y
	LDA.w #$0008
	STA.b $5E,x
	STA.w $005E,y
	RTS

CODE_8198B1:
	BMI.b CODE_8198CB
	JSR.w CODE_819A53
	LDA.w $0012,y
	BMI.b CODE_8198C1
	LDA.b $70,x
	TAX
	JMP.w (DATA_8198FB,x)

CODE_8198C1:
	JSR.w CODE_819A4F
	JSL.l CODE_84D8ED
	JMP.w CODE_819B7F

CODE_8198CB:
	LDA.w $004E,y
	BMI.b CODE_8198F1
	ASL
	BMI.b CODE_8198E9
	LDA.w $0010,y
	BMI.b CODE_8198DC
	JSL.l CODE_84D8CC
CODE_8198DC:
	LDA.w #$4000
	ORA.b $8C,x
	STA.b $8C,x
	JSR.w CODE_819ACE
	JMP.w CODE_819BD5

CODE_8198E9:
	JSR.w CODE_819A4F
	JSL.l CODE_84D8ED
	RTS

CODE_8198F1:
	LDA.w #$4000
	ORA.b $8C,x
	STA.b $8C,x
	JMP.w CODE_819B7F

DATA_8198FB:
	dw CODE_819967
	dw CODE_8199E0
	dw CODE_8199C4
	dw CODE_8199C4
	dw CODE_81990B
	dw CODE_81990B
	dw CODE_819967
	dw CODE_81999C

CODE_81990B:
	LDX.b $08
	LDY.b $6A,x
	LDX.b $12,y
	JMP.w (DATA_819914,x)

DATA_819914:
	dw CODE_819924
	dw CODE_819924
	dw CODE_81999C
	dw CODE_819924
	dw CODE_819967
	dw CODE_81999C
	dw CODE_819924
	dw CODE_81999C

CODE_819924:
	LDX.b $08
	LDY.b $0A
	LDA.w $0084,y
	BEQ.b CODE_819937
	CMP.w #$0060
	BCC.b CODE_819955
	LDA.w #$0040
	BRA.b CODE_81993A

CODE_819937:
	LDA.w #$0440
CODE_81993A:
	STA.w $0084,y
	BRA.b CODE_81993F

CODE_81993F:
	LDA.w $0010,y
	BMI.b CODE_81994A
	JSL.l CODE_84D8CC
	BRA.b CODE_819955

CODE_81994A:
	LDA.w #$8000
	CPY.w #$1000
	BEQ.b CODE_819953
	LSR
CODE_819953:
	TSB.b $D2
CODE_819955:
	TYX
	LDA.b $22,x
	CMP.w #$8000
	ROR
	STA.b $22,x
	LDA.b $24,x
	CMP.w #$8000
	ROR
	STA.b $24,x
	RTS

CODE_819967:
	LDX.b $08
	LDY.b $0A
	LDA.w $0010,y
	AND.w #$2000
	BNE.b CODE_81997B
	LDA.w #$0003
	STA.w $005E,y
	BRA.b CODE_819982

CODE_81997B:
	JSL.l CODE_84D8CC
	JMP.w CODE_8199B1

CODE_819982:
	LDA.w #$1000
	ORA.w $00E2,y
	STA.w $00E2,y
	LDA.w $008C,y
	ORA.w #$0003
	STA.w $008C,y
	LDA.w #$0040
	STA.b $22,x
	STA.b $24,x
	RTS

CODE_81999C:
	LDX.b $08
	LDY.b $0A
	LDA.w $0010,y
	BPL.b CODE_8199AD
	LDA.w #$0003
	STA.w $005E,y
	BRA.b CODE_8199B1

CODE_8199AD:
	JSL.l CODE_84D8CC
CODE_8199B1:
	JSR.w CODE_819ACE
	JSR.w CODE_819B7F
	LDA.w #$0040
	STA.b $22,x
	STA.b $24,x
	TYX
	STZ.b $22,x
	STZ.b $24,x
	RTS

CODE_8199C4:
	LDX.b $08
	LDA.w $0010,y
	AND.w #$2000
	BNE.b CODE_8199D6
	LDA.w #$0010
	STA.w $005E,y
	BRA.b CODE_8199DA

CODE_8199D6:
	JSL.l CODE_84D8B9
CODE_8199DA:
	JSR.w CODE_819ACE
	JMP.w CODE_819B7F

CODE_8199E0:
	LDX.b $08
	LDA.w $0010,y
	AND.w #$2000
	BNE.b CODE_8199F2
	LDA.w #$0010
	STA.w $005E,y
	BRA.b CODE_8199F6

CODE_8199F2:
	JSL.l CODE_84D8B9
CODE_8199F6:
	JSR.w CODE_819ACE
	JMP.w CODE_819A0D

;--------------------------------------------------------------------

CODE_8199FC:
	LDA.b $22,x
	CMP.w #$8000
	ROR
	STA.b $22,x
	LDA.b $24,x
	CMP.w #$8000
	ROR
	STA.b $24,x
	RTS

CODE_819A0D:
	LDA.w $0022,y
	PHA
	LDA.w $0024,y
	PHA
	LDA.w $1EE4
	BNE.b CODE_819A32
	LDA.b $22,x
	CMP.w #$8000
	ROR
	STA.w $0024,y
	LDA.b $24,x
	EOR.w #$FFFF
	INC
	CMP.w #$8000
	ROR
	STA.w $0022,y
	BRA.b CODE_819A48

CODE_819A32:
	LDA.b $22,x
	EOR.w #$FFFF
	INC
	CMP.w #$8000
	ROR
	STA.w $0024,y
	LDA.b $24,x
	CMP.w #$8000
	ROR
	STA.w $0022,y
CODE_819A48:
	PLA
	STA.b $24,x
	PLA
	STA.b $22,x
	RTS

;--------------------------------------------------------------------

CODE_819A4F:
	LDX.b $0A
	BRA.b CODE_819A9D

CODE_819A53:
	LDA.w $0012,y
	BMI.b CODE_819A9B
	LDA.w $0010,y
	AND.w #$2000
	BEQ.b CODE_819A9B
	LDA.b $6A,x
	TAX
	LDA.b $10,x
	AND.w #$2000
	BEQ.b CODE_819A77
	LDA.b $DA,x
	LDX.w #DATA_819ACC
	TAY
	BNE.b CODE_819A80
	LDX.w #DATA_819ACC+$01
	BRA.b CODE_819A80

CODE_819A77:
	LDA.b $E6,x
	LSR
	LDX.b $12,y
	ADC.w DATA_819AAC,x
	TAX
CODE_819A80:
	SEP.b #$20
	LDA.b $38
	AND.b #$1F
	CMP.w !ContextDependentTable,x
	REP.b #$20
CODE_819A8A:
	BCS.b CODE_819A9B
	LDX.b $0A
	LDA.w #$4000
	STA.b $E0,x
	LDA.w #$0000
	STA.b $5E,x
	PLA
	RTS

CODE_819A9B:
	LDX.b $08
CODE_819A9D:
	LDA.w #$8000
	STA.b $42,x
	LDA.w #$0100
	STA.b $26,x
	LDX.b $08
	LDY.b $0A
	RTS

DATA_819AAC:
	dw DATA_819ABC,DATA_819ABC,DATA_819AC4,DATA_819ABC,DATA_819AC4,DATA_819ABC,DATA_819ABC,DATA_819ABC

DATA_819ABC:
	db $04,$04,$02,$02,$02,$02,$00,$00

DATA_819AC4:
	db $02,$02,$02,$02,$02,$02,$00,$00

DATA_819ACC:
	db $1E,$10

;--------------------------------------------------------------------

CODE_819ACE:
	TYX
	LDA.b $38
	LSR
	LDA.w #$0200
	BCC.b CODE_819ADA
	LDA.w #$0300
CODE_819ADA:
	ORA.b $E2,x
	STA.b $E2,x
	LDA.w #$2000
	BIT.b $10,x
	BPL.b CODE_819AE8
	LDA.w #$1000
CODE_819AE8:
	STA.b $E4,x
	LDA.b $8C,x
	ORA.w #$0003
	STA.b $8C,x
	TXY
	LDX.b $08
	RTS

CODE_819AF5:
	LDA.w #$0800
	ORA.b $E2,x
	STA.b $E2,x
CODE_819AFC:
	LDA.w #$0800
	ORA.w $00E2,y
	STA.w $00E2,y
	RTS

;--------------------------------------------------------------------

CODE_819B06:
	LDA.b $1C
	BEQ.b CODE_819B0D
	JMP.w CODE_819C93

CODE_819B0D:
	LDA.w #$4004
	ORA.w $008C,y
	STA.w $008C,y
	LDA.w #$4004
	ORA.b $8C,x
	STA.b $8C,x
	LDA.b $4E,x
	SEC
	SBC.w $004E,y
	BEQ.b CODE_819B75
	DEC
	BEQ.b CODE_819B5B
	DEC
	BEQ.b CODE_819B68
	LDA.w $004E,y
	AND.w #$0010
	BNE.b CODE_819B4D
	LDA.b $4E,x
	AND.w #$0010
	BEQ.b CODE_819B4D
	LDA.w $0010,y
	BPL.b CODE_819B43
	TYX
	JMP.w CODE_819E13

CODE_819B43:
	JSL.l CODE_84D8CC
	JSR.w CODE_819ACE
	JMP.w CODE_819BD5

CODE_819B4D:
	LDA.w $004E,y
	AND.w #$0008
	BNE.b CODE_819B58
	JSR.w CODE_819AFC
CODE_819B58:
	JMP.w CODE_819BD5

CODE_819B5B:
	LDA.b $4E,x
	AND.w #$0008
	BNE.b CODE_819B65
	JSR.w CODE_819AF5
CODE_819B65:
	JMP.w CODE_819BCA

CODE_819B68:
	LDA.b $4E,x
	AND.w #$0008
	BNE.b CODE_819B72
	JSR.w CODE_819AF5
CODE_819B72:
	JMP.w CODE_819BD5

CODE_819B75:
	LDA.b $4E,x
	AND.w #$0008
	BNE.b CODE_819B7F
	JSR.w CODE_819AF5
CODE_819B7F:
	LDA.b $22,x
	STA.b $14
	LDA.w $0022,y
	STA.b $16
	LDA.b $24,x
	STA.b $18
	LDA.w $0024,y
	STA.b $1A
	JSR.w CODE_819CB8
	LDA.b $14
	BPL.b CODE_819B9E
	LDA.b $16
	BPL.b CODE_819BB3
	BRA.b CODE_819BA2

CODE_819B9E:
	LDA.b $16
	BMI.b CODE_819BB3
CODE_819BA2:
	LDA.b $18
	BPL.b CODE_819BAC
	LDA.b $1A
	BPL.b CODE_819BB3
	BRA.b CODE_819BB0

CODE_819BAC:
	LDA.b $1A
	BMI.b CODE_819BB3
CODE_819BB0:
	JSR.w CODE_819CC9
CODE_819BB3:
	LDX.b $08
	LDY.b $0A
	LDA.b $14
	STA.b $22,x
	LDA.b $16
	STA.w $0022,y
	LDA.b $18
	STA.b $24,x
	LDA.b $1A
	STA.w $0024,y
	RTS

CODE_819BCA:
	LDA.b $EA,x
	SEC
	SBC.w $00EA,y
	BCS.b CODE_819C0D
	JMP.w CODE_819B7F

CODE_819BD5:
	LDA.b $EA,x
	SEC
	SBC.w $00EA,y
	BCS.b CODE_819C0D
	LDA.b $EA,x
	CMP.w #$0100
	BCC.b CODE_819BF4
	LSR
	LSR
	STA.b $02
	LDA.b $A2,x
	CLC
	ADC.w #$1000
	STA.b $00
	TYX
	JMP.w CODE_819C6B

CODE_819BF4:
	TYX
	LDA.b $A2,x
	CLC
	ADC.w #$6000
	STA.b $00
	LDA.b $EA,x
	CMP.w #$0100
	BCS.b CODE_819C07
	LDA.w #$0200
CODE_819C07:
	LSR
	STA.b $02
	JMP.w CODE_819C6B

CODE_819C0D:
	LSR
	EOR.w #$FFFF
	SEC
	ADC.b $EA,x
	STA.b $02
	LDA.b $A2,x
	STA.b $00
	JSR.w CODE_819C6B
	LDA.b $10,x
	BMI.b CODE_819C31
	LDA.w #$F200
	STA.b $00
	LDA.b $2C,x
	CPX.w #$1000
	BEQ.b CODE_819C4B
	LDA.b $32,x
	BRA.b CODE_819C4B

CODE_819C31:
	LDA.w $0010,y
	BMI.b CODE_819C3B
	LDA.w #$1800
	BRA.b CODE_819C3E

CODE_819C3B:
	LDA.w #$0E00
CODE_819C3E:
	STA.b $00
	LDA.w $002C,y
	CPX.w #$1000
	BEQ.b CODE_819C4B
	LDA.w $0032,y
CODE_819C4B:
	CLC
	ADC.w #$0080
	ASL
	LDA.b $00
	BCC.b CODE_819C58
	EOR.w #$FFFF
	SEC
CODE_819C58:
	ADC.b $A2,x
	STA.b $00
	LDA.b $EA,x
	ADC.w #$0020
	STA.b $02
	TYX
	JMP.w CODE_819C6B

;--------------------------------------------------------------------

CODE_819C67:
	JSR.w CODE_819C6B
	RTL

CODE_819C6B:
	SEP.b #$20
	LDA.b #!DSP1_Command04_TrigonometricCalculation
	STA.w !REGISTER_DSP1_DataRegister
	REP.b #$20
	LDA.b $00
	STA.w !REGISTER_DSP1_DataRegister
	LDA.b $02
	STA.w !REGISTER_DSP1_DataRegister
CODE_819C7E:
	LDA.l !REGISTER_DSP1_StatusRegister
	BPL.b CODE_819C7E
	LDA.w !REGISTER_DSP1_DataRegister
	STA.b $22,x
	LDA.w !REGISTER_DSP1_DataRegister
	EOR.w #$FFFF
	INC
	STA.b $24,x
	RTS

;--------------------------------------------------------------------

CODE_819C93:
	LDA.b $EA,x
	ORA.w $00EA,y
	BNE.b CODE_819CA6
	LDA.b $2A,x
CODE_819C9C:
	STA.b $00
	LDA.w #$0180
	STA.b $02
	JMP.w CODE_819C6B

CODE_819CA6:
	LDA.b $EA,x
	CMP.w $00EA,y
	BCS.b CODE_819CB0
	LDA.w $00EA,y
CODE_819CB0:
	CMP.w #$00C0
	LDA.b $A2,x
	BCC.b CODE_819C9C
	RTS

;--------------------------------------------------------------------

CODE_819CB8:
	LDX.b $16
	LDY.b $14
	STY.b $16
	STX.b $14
	LDX.b $1A
	LDY.b $18
	STY.b $1A
	STX.b $18
	RTS

;--------------------------------------------------------------------

CODE_819CC9:
	LDX.w #$0000
	JSR.w CODE_819CD2
	LDX.w #$0002
CODE_819CD2:
	LDA.b $14,x
	BMI.b CODE_819CEC
	LDA.b $14,x
	CMP.b $16,x
	BCS.b CODE_819CE3
	SEC
	SBC.w #$0080
	STA.b $14,x
	RTS

CODE_819CE3:
	LDA.b $16,x
	SEC
	SBC.w #$0080
	STA.b $16,x
	RTS

CODE_819CEC:
	LDA.b $14,x
	CMP.b $16,x
	BCC.b CODE_819CF9
	CLC
	ADC.w #$0080
	STA.b $14,x
	RTS

CODE_819CF9:
	LDA.b $16,x
	CLC
	ADC.w #$0080
	STA.b $16,x
	RTS

;--------------------------------------------------------------------

CODE_819D02:
	LDA.b $22,x
	JSR.w CODE_819D11
	STA.b $22,x
	LDA.b $24,x
	JSR.w CODE_819D11
	STA.b $24,x
	RTS

CODE_819D11:
	EOR.w #$FFFF
	INC
	BPL.b CODE_819D27
	CMP.w #$FF80
	BCC.b CODE_819D20
	LDA.w #$FF80
	RTS

CODE_819D20:
	CMP.w #$FE00
	BCS.b CODE_819D39
	BCC.b CODE_819D35				; Note: This will always branch.

CODE_819D27:
	CMP.w #$0080
	BCC.b CODE_819D30
	LDA.w #$0080
	RTS

CODE_819D30:
	CMP.w #$0200
	BCC.b CODE_819D39
CODE_819D35:
	CMP.w #$8000
	ROR
CODE_819D39:
	RTS

;--------------------------------------------------------------------

CODE_819D3A:
	LDA.b $EA,x
	BNE.b CODE_819D66
	SEP.b #$20
	LDA.b #!DSP1_Command04_TrigonometricCalculation
	STA.w !REGISTER_DSP1_DataRegister
	REP.b #$21
	LDA.b $2A,x
	STA.w !REGISTER_DSP1_DataRegister
	LDA.w #$0100
	STA.w !REGISTER_DSP1_DataRegister
CODE_819D52:
	LDA.l !REGISTER_DSP1_StatusRegister
	BPL.b CODE_819D52
	LDA.w !REGISTER_DSP1_DataRegister
	STA.b $22,x
	LDA.w !REGISTER_DSP1_DataRegister
	EOR.w #$FFFF
	INC
	STA.b $24,x
CODE_819D66:
	RTS

;--------------------------------------------------------------------

CODE_819D67:
	SEP.b #$20
	LDA.b #!ScreenDisplayRegister_Brightness0A
	STA.w !REGISTER_ScreenDisplayRegister
	REP.b #$20
	RTS

;--------------------------------------------------------------------

CODE_819D71:
	SEP.b #$20
	LDA.b #!ScreenDisplayRegister_MaxBrightness0F
	STA.w !REGISTER_ScreenDisplayRegister
	REP.b #$20
	RTS

;--------------------------------------------------------------------

CODE_819D7B:
	RTS

;--------------------------------------------------------------------

CODE_819D7C:
	LDA.w $0008,y
	BMI.b CODE_819D7B
	LDA.b $A0,x
	CMP.w #$0008
	BEQ.b CODE_819D7B
	CMP.w #$0006
	BEQ.b CODE_819D7B
	LDA.b $86,x
	BEQ.b CODE_819DA0
	LDA.b $60,x
	BNE.b CODE_819D9D
	STY.b $60,x
	LDA.w #$8000
	STA.w $0008,y
CODE_819D9D:
	JMP.w CODE_8199FC

CODE_819DA0:
	LDA.b $5E,x
	DEC
	DEC
	BPL.b CODE_819DC5
	PHA
	STY.b $50,x
	LDA.w #$8007
	STA.b $52,x
	LDA.w #$1000
	ORA.b $10,x
	STA.b $10,x
	LDA.w #$0008
	STA.b $5E,x
	PLA
	INC
	BEQ.b CODE_819DC6
	TXA
	LDX.w $0E30
	JMP.w (DATA_819DE2,x)

CODE_819DC5:
	RTS

CODE_819DC6:
	LDA.b $EA,x
	BEQ.b CODE_819DDA
	CMP.w #$0040
	BCS.b CODE_819DD9
	LDA.b $22,x
	ASL
	LDA.b $22,x
	LDA.b $24,x
	ASL
	STA.b $24,x
CODE_819DD9:
	RTS

CODE_819DDA:
	LDA.w #$0100
	STA.b $22,x
	STA.b $24,x
	RTS

DATA_819DE2:
	dw CODE_819E38
	dw CODE_819E38
	dw CODE_819E78
	dw CODE_819E8C
	dw CODE_819E38
	dw CODE_819E8C
	dw CODE_819DF2
	dw CODE_819DF2

CODE_819DF2:
	TAX
	AND.w #$0100
	JSL.l CODE_84D72C
	JSR.w CODE_819D02
	LDA.w $001F,y
	BEQ.b CODE_819E2B
	CPX.w #$1000
	BNE.b CODE_819E0E
	LDA.w $0066,y
	BPL.b CODE_819E2B
	BMI.b CODE_819E13				; Note: This will always branch.

CODE_819E0E:
	LDA.w $0026,y
	BPL.b CODE_819E2B
CODE_819E13:
	LDA.b $8C,x
	ORA.w #$0008
	STA.b $8C,x
	STZ.b $B2,x
	STZ.b $22,x
	STZ.b $24,x
	LDA.w #$7000
	STA.b $5E,x
	LDA.w #$0002
	STA.b $70,x
	RTS

CODE_819E2B:
	LDA.w !RAM_SMK_Race_CurrentRacetrack
	CMP.w #!Define_SMK_RacetrackID_RainbowRoad
	BNE.b CODE_819E37
	TXY
	JSR.w CODE_819ACE
CODE_819E37:
	RTS

CODE_819E38:
	TAX
	AND.w #$0100
	JSL.l CODE_84D72C
	LDA.w $002C,y
	CPX.w #$1000
	BEQ.b CODE_819E4B
	LDA.w $0032,y
CODE_819E4B:
	CLC
	ADC.w #$0080
	BPL.b CODE_819E5B
	CMP.w #$FFFA
	BCS.b CODE_819E75
	LDA.w #$1000
	BRA.b CODE_819E63

CODE_819E5B:
	CMP.w #$0006
	BCC.b CODE_819E75
	LDA.w #$F000
CODE_819E63:
	CLC
	ADC.b $A2,x
	STA.b $00
	LDA.b $EA,x
	CMP.w #$0100
	BCC.b CODE_819E70
	LSR
CODE_819E70:
	STA.b $02
	JMP.w CODE_819C6B

CODE_819E75:
	JMP.w CODE_819D02

CODE_819E78:
	TAX
	STZ.b $22,x
	STZ.b $24,x
	TYA
	ORA.w #$8000
	STA.b $60,x
	TYX
	LDA.w #$8000
	ORA.b $08,x
	STA.b $08,x
	RTS

CODE_819E8C:
	TAX
	LDA.w $002C,y
	CPX.w #$1000
	BNE.b CODE_819E98
	LDA.w $0032,y
CODE_819E98:
	CLC
	ADC.w #$0080
	BPL.b CODE_819EA3
	LDA.w #$2000
	BRA.b CODE_819EA6

CODE_819EA3:
	LDA.w #$E000
CODE_819EA6:
	CLC
	ADC.b $A2,x
	STA.b $00
	LDA.b $EA,x
	CMP.w #$0180
	BCS.b CODE_819EB5
	LDA.w #$0180
CODE_819EB5:
	STA.b $02
	JSR.w CODE_819C6B
	LDA.w #$0800
	ORA.b $E2,x
	STA.b $E2,x
	RTS

;--------------------------------------------------------------------

CODE_819EC2:
	PHB
	PHK
CODE_819EC4:
	PLB
	LDA.b $18,x
	PHA
	LDY.b $1C,x
	LDA.b $64,x
	PLX
	JSR.w CODE_819F5C
	PHA
	LDX.b $B4
	LDA.b $40,x
	BEQ.b CODE_819EDC
	DEC
	STA.b $40,x
	BRA.b CODE_819EF3

CODE_819EDC:
	LDY.b $64,x
	LDA.w $001F,y
	BNE.b CODE_819EF3
	LDY.w #$00C0
	CPY.b $08
	BCC.b CODE_819EF3
	CPY.b $0A
	BCC.b CODE_819EF3
	PLA
	STA.b $2A,x
	BRA.b CODE_819EFA

CODE_819EF3:
	PLA
	LDY.w #DATA_819F02
	JSR.w CODE_819F0A
CODE_819EFA:
	LDA.b $72,x
	JSL.l CODE_80F8CB
	PLB
	RTL

DATA_819F02:
	dw $0800,$F800,$0400,$FC00

;--------------------------------------------------------------------

CODE_819F0A:
	STA.b $00
	SBC.b $2A,x
	BPL.b CODE_819F19
	INY
	INY
	CMP.w !ContextDependentTable,y
	BPL.b CODE_819F2B
	BRA.b CODE_819F1E

CODE_819F19:
	CMP.w !ContextDependentTable,y
	BMI.b CODE_819F2B
CODE_819F1E:
	INY
	INY
	INY
	INY
	CLC
	LDA.w !ContextDependentTable,y
	ADC.b $2A,x
	STA.b $2A,x
	RTS

CODE_819F2B:
	LDA.b $00
	STA.b $2A,x
	RTS

;--------------------------------------------------------------------

CODE_819F30:
	STA.b $00
	SBC.b $00,x
	BPL.b CODE_819F45
	CMP.w $0006,y
	BPL.b CODE_819F56
	CMP.w $0008,y
	BMI.b CODE_819F57
	LDA.w $000A,y
	BRA.b CODE_819F52

CODE_819F45:
	CMP.w $0000,y
	BMI.b CODE_819F56
	CMP.w $0002,y
	BPL.b CODE_819F57
	LDA.w $0004,y
CODE_819F52:
	ADC.b $00,x
	STA.b $00,x
CODE_819F56:
	RTS

CODE_819F57:
	LDA.b $00
	STA.b $00,x
	RTS

;--------------------------------------------------------------------

CODE_819F5C:
	STX.b $00
	STY.b $02
	TAX
	LDA.b $18,x
	STA.b $04
	LDA.b $1C,x
	STA.b $06
	LDY.w #$0000
	SEC
	LDA.b $00
	SBC.b $04
	BPL.b CODE_819F7A
	LDY.w #$0002
	EOR.w #$FFFF
	INC
CODE_819F7A:
	ASL
	ASL
	ASL
	ASL
	STA.b $08
	SEC
	LDA.b $02
	SBC.b $06
	BPL.b CODE_819F8C
	INY
	EOR.w #$FFFF
	INC
CODE_819F8C:
	ASL
	ASL
	ASL
	ASL
	STA.b $0A
	STY.b $0C
	CMP.b $08
	BMI.b CODE_819FC7
	LDY.b $08
	LDA.b $0A
	XBA
	JSR.w CODE_819FF8
	BIT.w #$FF00
	BEQ.b CODE_819FA8
	LDA.w #$00FF
CODE_819FA8:
	AND.w #$00FF
	TAY
	SEP.b #$20
	LDA.w DATA_81A010,y
	LDY.b $0C
	DEY
	BEQ.b CODE_819FBC
	DEY
	BEQ.b CODE_819FBC
	EOR.b #$FF
	INC
CODE_819FBC:
	LSR.b $0C
	BCC.b CODE_819FC3
	CLC
	ADC.b #$80
CODE_819FC3:
	REP.b #$20
	XBA
	RTS

CODE_819FC7:
	LDY.b $0A
	LDA.b $08
	XBA
	JSR.w CODE_819FF8
	BIT.w #$FF00
	BEQ.b CODE_819FD7
	LDA.w #$00FF
CODE_819FD7:
	AND.w #$00FF
	TAY
	SEP.b #$20
	LDA.w DATA_81A010,y
	LDY.b $0C
	BEQ.b CODE_819FEC
	CPY.w #$0003
	BEQ.b CODE_819FEC
	EOR.b #$FF
	INC
CODE_819FEC:
	LSR.b $0C
	LDY.b $0C
	CLC
	ADC.w DATA_81A00E,y
	REP.b #$20
	XBA
	RTS

CODE_819FF8:
	SEP.b #$20
	STY.w !REGISTER_DividendLo
	STA.w !REGISTER_Divisor
	NOP #8
	REP.b #$20
	LDA.w !REGISTER_QuotientLo
	RTS

DATA_81A00E:
	db $C0,$40

DATA_81A010:
	db $00,$00,$00,$00,$01,$01,$01,$01,$01,$01,$02,$02,$02,$02,$02,$02
	db $03,$03,$03,$03,$03,$03,$03,$04,$04,$04,$04,$04,$04,$05,$05,$05
	db $05,$05,$05,$06,$06,$06,$06,$06,$06,$06,$07,$07,$07,$07,$07,$07
	db $08,$08,$08,$08,$08,$08,$08,$09,$09,$09,$09,$09,$09,$0A,$0A,$0A
	db $0A,$0A,$0A,$0A,$0B,$0B,$0B,$0B,$0B,$0B,$0B,$0C,$0C,$0C,$0C,$0C
	db $0C,$0C,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$0E,$0E,$0E,$0E,$0E,$0E,$0E
	db $0F,$0F,$0F,$0F,$0F,$0F,$0F,$10,$10,$10,$10,$10,$10,$10,$11,$11
	db $11,$11,$11,$11,$11,$11,$12,$12,$12,$12,$12,$12,$12,$13,$13,$13
	db $13,$13,$13,$13,$13,$14,$14,$14,$14,$14,$14,$14,$14,$15,$15,$15
	db $15,$15,$15,$15,$15,$15,$16,$16,$16,$16,$16,$16,$16,$16,$17,$17
	db $17,$17,$17,$17,$17,$17,$17,$18,$18,$18,$18,$18,$18,$18,$18,$18
	db $19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$1A,$1A,$1A,$1A,$1A,$1A
	db $1A,$1A,$1A,$1B,$1B,$1B,$1B,$1B,$1B,$1B,$1B,$1B,$1B,$1C,$1C,$1C
	db $1C,$1C,$1C,$1C,$1C,$1C,$1C,$1C,$1D,$1D,$1D,$1D,$1D,$1D,$1D,$1D
	db $1D,$1D,$1D,$1E,$1E,$1E,$1E,$1E,$1E,$1E,$1E,$1E,$1E,$1E,$1F,$1F
	db $1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$20,$20,$20,$20,$20,$20

;--------------------------------------------------------------------

CODE_81A110:
	STZ.b $00
	LDX.w $0DFA
	BEQ.b CODE_81A129
	BRA.b CODE_81A122

CODE_81A119:
	LDA.w $0012,y
	BPL.b CODE_81A120
	INC.b $00
CODE_81A120:
	INX
	INX
CODE_81A122:
	LDA.l $800000,x
	TAY
	BNE.b CODE_81A119
CODE_81A129:
	LDA.b $00
	RTS

;--------------------------------------------------------------------

CODE_81A12C:
	LDX.w $0DFA
	BEQ.b CODE_81A157
	BRA.b CODE_81A150

CODE_81A133:
	LDA.w $0012,y
	BPL.b CODE_81A14E
	LDA.w $0042,y
	BMI.b CODE_81A14E
	LDA.w #$8000
	STA.w $0042,y
	LDA.w $0026,y
	BMI.b CODE_81A14E
	LDA.w #$0080
	STA.w $0026,y
CODE_81A14E:
	INX
	INX
CODE_81A150:
	LDA.l $800000,x
	TAY
	BNE.b CODE_81A133
CODE_81A157:
	RTL

;--------------------------------------------------------------------

CODE_81A158:
	PHB
	PHK
	PLB
	LDX.b $B4
	LDA.b $18,x
	LDY.b $1C,x
	TAX
	LDA.w #$1000
	LDA.w $102A
	PLB
	RTL

;--------------------------------------------------------------------

DATA_81A16A:
	dw CODE_8181C4
	dw CODE_8181C9

CODE_81A16E:
	LDX.b $B6
	LDA.w #$2000
	BIT.w $0162
	BVS.b CODE_81A17D
	BNE.b CODE_81A1A8
	BMI.b CODE_81A1A4
	RTL

CODE_81A17D:
	JSR.w (DATA_81A1AC,x)
	BIT.w $1F2A
	BPL.b CODE_81A18E
	LDX.w #$1100
	STZ.b $10,x
	JSL.l CODE_80C2BE
CODE_81A18E:
	LDA.w #$FFFF
	STA.w $0FB6
	BIT.w $1F24
	BMI.b CODE_81A1A3
	LDA.w #$0000
	STA.l $7FFF00
	STZ.w $1F24
CODE_81A1A3:
	RTL

CODE_81A1A4:
	JSR.w (DATA_81A1BA,x)
	RTL

CODE_81A1A8:
	JSR.w (DATA_81A1C8,x)
	RTL

DATA_81A1AC:
	dw CODE_81A1D6
	dw CODE_81A1D6
	dw CODE_81A1D6
	dw CODE_81A1D6
	dw CODE_81A1D6
	dw CODE_81A1D6
	dw CODE_81A1D6

DATA_81A1BA:
	dw CODE_81A1EE
	dw CODE_81A1F4
	dw CODE_81A1F4
	dw CODE_81A1F4
	dw CODE_81A1F4
	dw CODE_81A1F4
	dw CODE_81A1F4

DATA_81A1C8:
	dw CODE_81A602
	dw CODE_81A4C4
	dw CODE_81A4C4
	dw CODE_81A30E
	dw CODE_81A477
	dw CODE_81A477
	dw CODE_81A35C

CODE_81A1D6:
	LDA.w #$500F
	TRB.w $0162
	LDX.w #$0000
	JSR.w CODE_81A96E
	LDA.w #$0001
	STA.w $1DCA
	LDA.w #$0000
	JMP.w CODE_81A98A

CODE_81A1EE:
	JSR.w CODE_81B964
	JSR.w CODE_81B96A
CODE_81A1F4:
	BIT.w $1F24
	BMI.b CODE_81A277
	LDA.w $0164
	BNE.b CODE_81A218
	SEP.b #$20
	LDA.w $1F06
	AND.b #$08
	BEQ.b CODE_81A218
	LDA.b #$20
	TSB.w $1F06
	REP.b #$20
	JSR.w CODE_8181C9
	JSR.w CODE_818200
	JSL.l $0888D8
CODE_81A218:
	REP.b #$20
	JSL.l CODE_8196B5
	SEP.b #$20
	LDA.b #$20
	TRB.w $1F06
	REP.b #$20
	LDX.w $0164
	JSR.w (DATA_81A16A,x)
	JSR.w CODE_818200
	JSR.w CODE_81A27E
	JSL.l CODE_81DA72
	JSR.w CODE_818179
	LDX.w $0164
	LDA.b $28,x
	AND.w #$9000
	BEQ.b CODE_81A27D
	LDA.w #$0010
	STA.w $0E5E
	LDA.w $1DCA
	BNE.b CODE_81A25E
	LDA.b $2C
	BEQ.b CODE_81A258
	CMP.w #$0004
	BNE.b CODE_81A25E
CODE_81A258:
	JSL.l CODE_84D978
	BRA.b CODE_81A277

CODE_81A25E:
	LDA.w #$8000
	STA.w $0D6A
	LDA.w $1DCA
	BNE.b CODE_81A277
	SEP.b #$20
	LDA.b #$3F
	STA.b $41
	LDA.b #$00
	STA.b $42
	STA.b $43
	REP.b #$20
CODE_81A277:
	LDA.w #$2000
	TSB.w $0162
CODE_81A27D:
	RTS

CODE_81A27E:
	LDA.w #$0029
	CLC
	ADC.w $0164
	TAY
	LDA.w #$0100
	LDX.w #$1DCA
	JSR.w CODE_81C8E5
	LDA.w #$2060
	LDY.w #DATA_81AD03
	JSR.w CODE_81AA6C
	LDA.w #$4068
	LDX.w $1DCA
	BEQ.b CODE_81A2A3
	LDA.w #$5068
CODE_81A2A3:
	LDY.w #DATA_81AD2F
	JMP.w CODE_81AA63

CODE_81A2A9:
	BIT.w $1F24
	BMI.b CODE_81A2B5
	LDA.w $1DCA
	BNE.b CODE_81A2C0
	BEQ.b CODE_81A2B8				; Note: This will always branch.

CODE_81A2B5:
	STZ.w $1DCA
CODE_81A2B8:
	INC.w $0162
	JSL.l CODE_81F4D1
	RTS

CODE_81A2C0:
	LDA.w #$1000
	TRB.w $0162
	BNE.b CODE_81A2E2
	LDY.w $0D6C
	BNE.b CODE_81A2E2
	TSB.w $0162
	LDA.w #$0005
	STA.w $0D6C
	LDX.w #$0002
	JSR.w CODE_81A96E
	LDA.w #$0000
	JMP.w CODE_81A98A

CODE_81A2E2:
	LDA.w $0D6C
	DEC
	BNE.b CODE_81A2F8
	LDA.w $0D6A
	BEQ.b CODE_81A2F1
	JSL.l CODE_809FA6
CODE_81A2F1:
	STZ.w $0D6C
	STZ.w $0162
	RTS

CODE_81A2F8:
	STA.w $0D6C
	RTS

CODE_81A2FC:
	TYA
	EOR.w #$0002
	TAY
	LDX.b $C8,y
	LDA.b $12,x
	LSR
	ADC.w #$000C
	JSL.l CODE_80985B
	RTS

CODE_81A30E:
	LDA.w $0162
	AND.w #$00FF
	ASL
	TAX
	JMP.w (DATA_81A319,x)

DATA_81A319:
	dw CODE_81A2A9
	dw CODE_81A31F
	dw CODE_81A2E2

CODE_81A31F:
	JSR.w CODE_81A336
	LDA.w #DATA_8189DB
	LDY.w $0164
	BEQ.b CODE_81A32D
	LDA.w #DATA_8189D1
CODE_81A32D:
	STA.w $1EFE
	JSR.w CODE_81A2FC
	JMP.w CODE_81A2C0

CODE_81A336:
	STZ.w $0D70
	STZ.w $0D72
	LDX.w #$1000
	JSR.w CODE_81A345
	LDX.w #$1100
CODE_81A345:
	STZ.b $22,x
	STZ.b $24,x
	STZ.b $86,x
	STZ.b $82,x
	LDA.w #$4000
	AND.b $E2,x
	STA.b $E2,x
	LDA.w #$0060
	ORA.b $10,x
	STA.b $10,x
	RTS

CODE_81A35C:
	LDA.w $0162
	AND.w #$00FF
	ASL
	TAX
	JMP.w (DATA_81A367,x)

DATA_81A367:
	dw CODE_81A2A9
	dw CODE_81A36D
	dw CODE_81A2E2

CODE_81A36D:
	LDA.w #DATA_8189F7
	LDY.w $0164
	BEQ.b CODE_81A378
	LDA.w #DATA_818A01
CODE_81A378:
	STA.w $1EFE
	JSR.w CODE_81A336
	JMP.w CODE_81A2C0

CODE_81A381:
	RTS

CODE_81A382:
	LDA.w $0162
	AND.w #$00FF
	ASL
	TAX
	JMP.w (DATA_81A38D,x)

DATA_81A38D:
	dw CODE_81A2A9
	dw CODE_81A397
	dw CODE_81A3AA
	dw CODE_81A3B3
	dw CODE_81A7D5

CODE_81A397:
	LDX.w $0164
	LDA.w #$0004
	STA.w $1E88,x
	LDA.w #$0078
	STA.w $1D88
	INC.w $0162
	RTS

CODE_81A3AA:
	DEC.w $1D88
	BNE.b CODE_81A3B2
	INC.w $0162
CODE_81A3B2:
	RTS

CODE_81A3B3:
	JSL.l CODE_84E8E0
	LDA.w $0FB2
	BNE.b CODE_81A3DF
	LDX.w $0FB0
	BEQ.b CODE_81A3EE
	LDA.b $20
	AND.w #$4030
	CMP.w #$4030
	BNE.b CODE_81A3EE
	LDA.b $28
	AND.w #$0040
	BEQ.b CODE_81A3EE
	LDA.w #$0020
	JSL.l CODE_81F5A7
	LDA.w #$001E
	STA.w $0FB2
CODE_81A3DF:
	CMP.w #$001D
	BNE.b CODE_81A3EB
	LDX.w $0FB0
	JSL.l CODE_84E881
CODE_81A3EB:
	DEC.w $0FB2
CODE_81A3EE:
	LDA.w #$0000
	JSR.w CODE_81A98A
	JSL.l CODE_80B9DF
	LDA.w #$0D13
	CLC
	ADC.w $0164
	TAY
	LDA.w $1F24
	LSR
	LDA.w #$0400
	BCS.b CODE_81A40C
	LDA.w #$0300
CODE_81A40C:
	LDX.w #$1DCA
	JSR.w CODE_81C8E5
	JSR.w CODE_81A858
	JSR.w CODE_81A8F0
	CLC
	BEQ.b CODE_81A44E
	JSL.l CODE_84D978
	INC.w $0162
	LDA.w $1DCA
	ASL
	TAX
	LDA.w #$8000
	TRB.w $1F24
	LDA.w #$8000
	TRB.w $1F10
	CPX.w #$0008
	BEQ.b CODE_81A44A
	LDA.b $B6
	CMP.w #$0008
	BNE.b CODE_81A44A
	BIT.w $1F2A
	BVC.b CODE_81A44A
	LDA.w #$FFFF
	STA.w $0E60
CODE_81A44A:
	JSR.w (DATA_81A454,x)
	SEC
CODE_81A44E:
	RTS

DATA_81A44F:
	db $24,$32,$40,$4E,$5C

DATA_81A454:
	dw CODE_81A915
	dw CODE_81A467
	dw CODE_81A921
	dw CODE_81A909
	dw CODE_81A45E

CODE_81A45E:
	LDA.w #$8000
	TSB.w $1F24
	JMP.w CODE_81A8F9

CODE_81A467:
	LDA.b $2C
	CMP.w #$0004
	BNE.b CODE_81A474
	LDA.w #$8000
	TSB.w $1F10
CODE_81A474:
	JMP.w CODE_81A8F9

CODE_81A477:
	LDA.w $0162
	AND.w #$00FF
	ASL
	TAX
	JMP.w (DATA_81A482,x)

DATA_81A482:
	dw CODE_81A2A9
	dw CODE_81A48C
	dw CODE_81A4BB
	dw CODE_81A3B3
	dw CODE_81A7D5

CODE_81A48C:
	INC.w $0162
	LDX.w $0164
	LDA.w #$0004
	STA.w $1E88,x
	LDA.w #$0060
	STA.w $1D88
	JSL.l CODE_84D706
	JSL.l CODE_81F4C9
	LDA.w #$0040
	ORA.w $1010
	STA.w $1010
	BIT.w $1F10
	BPL.b CODE_81A4BA
	LDA.w #$0001
	STA.w $1DCA
CODE_81A4BA:
	RTS

CODE_81A4BB:
	DEC.w $1D88
	BNE.b CODE_81A4C3
	INC.w $0162
CODE_81A4C3:
	RTS

CODE_81A4C4:
	LDA.w $0162
	AND.w #$00FF
	ASL
	TAX
	JMP.w (DATA_81A4CF,x)

DATA_81A4CF:
	dw CODE_81A2A9
	dw CODE_81A4E5
	dw CODE_81A501
	dw CODE_81A513
	dw CODE_81A533
	dw CODE_81A53C
	dw CODE_81A55A
	dw CODE_81A55B
	dw CODE_81A56C
	dw CODE_81A827
	dw CODE_81A7D5

CODE_81A4E5:
	JSL.l CODE_84D706
	JSR.w CODE_81A594
	JSR.w CODE_81A5AB
	JSR.w CODE_81A98E
	JSR.w CODE_81A9AD
	LDX.w #$0004
	JSR.w CODE_81A95D
	LDA.w #$0078
	JMP.w CODE_81A587

CODE_81A501:
	JSR.w CODE_81A849
	JSR.w CODE_81A594
	JSR.w CODE_81A98E
	JSR.w CODE_81A9C6
	JSR.w CODE_81A5B2
	JMP.w CODE_81A581

CODE_81A513:
	JSR.w CODE_81A594
	LDA.w $0154,x
	CMP.w #$0002
	BCC.b CODE_81A525
	TXY
	JSR.w CODE_81A5D8
	JMP.w CODE_81A587

CODE_81A525:
	TXY
	JSR.w CODE_81A5D8
	LDA.w $0162
	CLC
	ADC.w #$0004
	JMP.w CODE_81A579

CODE_81A533:
	JSR.w CODE_81A594
	JSR.w CODE_81A98E
	JMP.w CODE_81A775

CODE_81A53C:
	JSR.w CODE_81A594
	JSR.w CODE_81A98E
	JSR.w CODE_81A883
	JSR.w CODE_81A581
	BCC.b CODE_81A552
	LDA.w $1DCA
	ASL
	TAX
	JSR.w (DATA_81A556,x)

CODE_81A552:
	JSR.w CODE_81BAC9
	RTS

DATA_81A556:
	dw CODE_81A8F9
	dw CODE_81A909

CODE_81A55A:
	RTS

CODE_81A55B:
	JSR.w CODE_81A594
	JSL.l CODE_81AF50
	JSL.l CODE_81AF8D
	LDA.w #$0100
	JMP.w CODE_81A587

CODE_81A56C:
	JSR.w CODE_81A594
	JSR.w CODE_81A98E
	JSL.l CODE_81AFB4
	JMP.w CODE_81A581

CODE_81A579:
	SEP.b #$20
	STA.w $0162
	REP.b #$20
	RTS

CODE_81A581:
	CLC
	DEC.w $1D88
	BNE.b CODE_81A58E
CODE_81A587:
	STA.w $1D88
	INC.w $0162
	SEC
CODE_81A58E:
	RTS

CODE_81A58F:
	LDA.w #$0002
	BRA.b CODE_81A597

CODE_81A594:
	LDA.w #$0000
CODE_81A597:
	EOR.w $0164
	TAX
	LDA.b $C8,x
	STA.b $B4
	STX.b $B8
	LDA.w DATA_81A5A7,x
	STA.b $BA
	RTS

DATA_81A5A7:
	dw $0000,$7000

CODE_81A5AB:
	LDA.w #$0004
	STA.w $1E88,x
	RTS

CODE_81A5B2:
	JSL.l CODE_81DA72
	LDX.w $0164
	LDA.b $3C
	STA.w $1EF0,x
	RTS

CODE_81A5BF:
	JSL.l CODE_81DA72
	LDA.w $0164
	EOR.w #$0002
	TAX
	LDA.b $3C
	STA.w $1EF0,x
	RTS

DATA_81A5D0:
	dw $0490,$0270

DATA_81A5D4:
	dw $0080,$0084

CODE_81A5D8:
	LDX.w DATA_81A5D0,y
	LDA.w DATA_81A5D4,y
	STA.b $00
	LDY.w #$0020
	SEP.b #$20
CODE_81A5E5:
	LDA.b $02,x
	CMP.b $00
	BEQ.b CODE_81A5F5
	INX
	INX
	INX
	INX
	DEY
	BNE.b CODE_81A5E5
	REP.b #$20
	RTS

CODE_81A5F5:
	LDA.b #$E0
	STA.b $01,x
	STA.b $05,x
	STA.b $09,x
	STA.b $0D,x
	REP.b #$20
	RTS

CODE_81A602:
	LDA.w $0162
	AND.w #$00FF
	ASL
	TAX
	JMP.w (DATA_81A60D,x)

DATA_81A60D:
	dw CODE_81A2A9
	dw CODE_81A661
	dw CODE_81A6D7
	dw CODE_81A70D
	dw CODE_81A7F1
	dw CODE_81A80D
	dw CODE_81A76F
	dw CODE_81A7B7
	dw CODE_81A7D5
	dw CODE_81A7D6
	dw CODE_81A7D5
	dw CODE_81A75C
	dw CODE_81A7A4
	dw CODE_81A7D5
	dw CODE_81A7F6
	dw CODE_81A7F1
	dw CODE_81A807
	dw CODE_81A827
	dw CODE_81A7D5
	dw CODE_81A7F6
	dw CODE_81A816
	dw CODE_81A7D6
	dw CODE_81A7D5
	dw CODE_81A7F6
	dw CODE_81A816
	dw CODE_81A837
	dw CODE_81A76F
	dw CODE_81A7B7
	dw CODE_81A7D5
	dw CODE_81A4E5
	dw CODE_81A501
	dw CODE_81A513
	dw CODE_81A533
	dw CODE_81A53C
	dw CODE_81A55A
	dw CODE_81A55B
	dw CODE_81A56C
	dw CODE_81A827
	dw CODE_81A7D5

CODE_81A65B:
	LDA.w #$001D
	JMP.w CODE_81A579

CODE_81A661:
	JSL.l CODE_84D706
	LDA.w $0154
	BEQ.b CODE_81A65B
	LDA.w $0156
	BEQ.b CODE_81A65B
	LDX.w #$0000
	JSR.w CODE_81A6A2
	JSR.w CODE_81A687
	LDX.w #$0002
	JSR.w CODE_81A6A2
	JSR.w CODE_81A687
	LDA.w #$0078
	JMP.w CODE_81A587

CODE_81A687:
	LDY.b $C8,x
	STY.b $B4
	LDA.w $1DCE
	AND.w #$3000
	BEQ.b CODE_81A698
	CPX.w $0164
	BNE.b CODE_81A6A1
CODE_81A698:
	JSR.w CODE_81A9AD
	LDX.w #$0004
	JSR.w CODE_81A95D
CODE_81A6A1:
	RTS

CODE_81A6A2:
	LDY.b $C8,x
	LDA.w $0010,y
	AND.w #$0020
	BEQ.b CODE_81A6BD
	LDA.w $00E6,y
	CMP.w #$0008
	BCS.b CODE_81A6C8
	TXA
	ORA.w #$8000
	STA.w $1E8C
	BRA.b CODE_81A6D6

CODE_81A6BD:
	LDA.w $00C0,y
	BEQ.b CODE_81A6C8
	LDA.w #$0001
	STA.w $00C0,y
CODE_81A6C8:
	LDA.w $1E88,x
	CMP.w #$0014
	BEQ.b CODE_81A6D6
	LDA.w #$0004
	STA.w $1E88,x
CODE_81A6D6:
	RTS

CODE_81A6D7:
	LDX.w #$0000
	JSR.w CODE_81A6E6
	LDX.w #$0002
	JSR.w CODE_81A6E6
	JMP.w CODE_81A581

CODE_81A6E6:
	STX.w $0FC8
	LDY.b $C8,x
	STY.b $B4
	LDA.w $1DCE
	AND.w #$3000
	BEQ.b CODE_81A6FA
	CPX.w $0164
	BNE.b CODE_81A70C
CODE_81A6FA:
	JSR.w CODE_81A98E
	JSR.w CODE_81A9C6
	JSL.l CODE_81DA72
	LDX.w $0FC8
	LDA.b $3C
	STA.w $1EF0,x
CODE_81A70C:
	RTS

CODE_81A70D:
	JSR.w CODE_81A849
	LDA.w $0164
	TAX
	EOR.w #$0002
	TAY
	LDA.w #$0001
	CMP.w $0154,x
	BCS.b CODE_81A72C
	BIT.w $1E8C
	BMI.b CODE_81A73E
	CMP.w $0154,y
	BCS.b CODE_81A738
	BCC.b CODE_81A744					; Note: This will always branch

CODE_81A72C:
	BIT.w $1E8C
	BMI.b CODE_81A750
	CMP.w $0154,y
	BCS.b CODE_81A74A
	BCC.b CODE_81A756					; Note: This will always branch

CODE_81A738:
	LDA.w #$0004
	JMP.w CODE_81A579

CODE_81A73E:
	LDA.w #$0009
	JMP.w CODE_81A579

CODE_81A744:
	LDA.w #$000B
	JMP.w CODE_81A579

CODE_81A74A:
	LDA.w #$000E
	JMP.w CODE_81A579

CODE_81A750:
	LDA.w #$0013
	JMP.w CODE_81A579

CODE_81A756:
	LDA.w #$0017
	JMP.w CODE_81A579

CODE_81A75C:
	LDA.w #$0002
	JSR.w CODE_81A98A
	LDA.w #$0002
	EOR.w $0164
	TAX
	JSR.w CODE_81A8B4
	JSR.w CODE_81A5BF
CODE_81A76F:
	LDA.w #$0000
	JSR.w CODE_81A98A
CODE_81A775:
	JSR.w CODE_81A8A3
	JSR.w CODE_81A883
	JSR.w CODE_81A5B2
	JSR.w CODE_81A8F0
	CLC
	BEQ.b CODE_81A7A3
	JSR.w CODE_81A92D
	JSL.l CODE_84D978
	LDA.w #$0046
	LDY.w $1DCA
	BEQ.b CODE_81A79C
	LDA.w #$000A
	STZ.w $0154
	STZ.w $0156
CODE_81A79C:
	LDA.w #$0046
	JSR.w CODE_81A587
	SEC
CODE_81A7A3:
	RTS

CODE_81A7A4:
	LDA.w #$0002
	JSR.w CODE_81A98A
	LDA.w #$0002
	EOR.w $0164
	TAX
	JSR.w CODE_81A8B4
	JSR.w CODE_81BAC9
CODE_81A7B7:
	JSR.w CODE_81A594
	JSR.w CODE_81A98E
	JSR.w CODE_81A883
	JSR.w CODE_81A581
	BCC.b CODE_81A7CD
	LDA.w $1DCA
	ASL
	TAX
	JSR.w (DATA_81A7D1,x)
CODE_81A7CD:
	JSR.w CODE_81BAC9
	RTS

DATA_81A7D1:
	dw CODE_81A8F9
	dw CODE_81A909

CODE_81A7D5:
	RTS

CODE_81A7D6:
	LDY.w $0164
	LDX.b $C8,y
	LDA.b $C0,x
	BEQ.b CODE_81A7E4
	LDA.w #$0001
	STA.b $C0,x
CODE_81A7E4:
	JSL.l CODE_81F4C9
	JSR.w CODE_81A92D
	JSR.w CODE_81D53D
	JMP.w CODE_81A587

CODE_81A7F1:
	JSR.w CODE_81A58F
	BRA.b CODE_81A7F9

CODE_81A7F6:
	JSR.w CODE_81A594
CODE_81A7F9:
	JSL.l CODE_81AF50
	JSL.l CODE_81AF8D
	LDA.w #$0100
	JMP.w CODE_81A587

CODE_81A807:
	JSR.w CODE_81A594
	JSR.w CODE_81A81F
CODE_81A80D:
	JSR.w CODE_81A58F
	JSR.w CODE_81A81F
	JMP.w CODE_81A581

CODE_81A816:
	JSR.w CODE_81A594
	JSR.w CODE_81A81F
	JMP.w CODE_81A581

CODE_81A81F:
	JSR.w CODE_81A98E
	JSL.l CODE_81AFB4
	RTS

CODE_81A827:
	LDA.b $28
	ORA.b $2A
	AND.w #$9000
	BEQ.b CODE_81A836
	JSR.w CODE_81A909
	JMP.w CODE_81A587

CODE_81A836:
	RTS

CODE_81A837:
	LDA.w $0164
	EOR.w #$0002
	STA.w $0164
	LDX.w #$0000
	JSR.w CODE_81A96E
	JMP.w CODE_81A587

CODE_81A849:
	LDY.w $0164
	LDX.b $C8,y
	LDA.b $C0,x
	BEQ.b CODE_81A857
	LDA.w #$0001
	STA.b $C0,x
CODE_81A857:
	RTS

CODE_81A858:
	LDA.w #$2450
	LDY.w #DATA_81AD46
	JSR.w CODE_81AA6C
	LDA.w $1F24
	LSR
	BCC.b CODE_81A870
	LDA.w #$5C50
	LDY.w #DATA_81AD7F
	JSR.w CODE_81AA6C
CODE_81A870:
	LDX.w $1DCA
	LDA.w DATA_81A44F-$01,x
	AND.w #$FF00
	CLC
	ADC.w #$0040
	LDY.w #DATA_81AD2F
	JMP.w CODE_81AA63

CODE_81A883:
	LDA.w #$3070
	LDY.w #DATA_81AD35
	JSR.w CODE_81AA6C
	LDA.w #$3060
	LDX.w $1DCA
	BEQ.b CODE_81A897
	LDA.w #$4060
CODE_81A897:
	LDY.w #DATA_81AD2F
	JSR.w CODE_81AA63
	LDX.w $0164
	JMP.w CODE_81A8B4

CODE_81A8A3:
	LDA.w #$0029
	CLC
	ADC.w $0164
	TAY
	LDA.w #$0100
	LDX.w #$1DCA
	JMP.w CODE_81C8E5

CODE_81A8B4:
	LDA.w $0154,x
	BEQ.b CODE_81A8DF
	DEC
	BEQ.b CODE_81A8DF
	CMP.w #$0004
	BCC.b CODE_81A8C4
	LDA.w #$0004
CODE_81A8C4:
	STA.b $00
	LDY.b $C8,x
	LDX.b $12,y
	LDY.w DATA_81A8E0,x
	LDA.w #$2C9C
CODE_81A8D0:
	PHA
	PHY
	JSR.w CODE_81AA33
	PLY
	PLA
	CLC
	ADC.w #$0011
	DEC.b $00
	BNE.b CODE_81A8D0
CODE_81A8DF:
	RTS

DATA_81A8E0:
	dw $2320,$2522,$2124,$2726,$2728,$252A,$232C,$212E

CODE_81A8F0:
	LDX.w $0164
	LDA.b $28,x
	AND.w #$9000
	RTS

CODE_81A8F9:
	LDX.w $0164
	STX.b $B8
	LDY.w $1E8C
	BNE.b CODE_81A906
	JMP.w CODE_81D553

CODE_81A906:
	JMP.w CODE_81D53D

CODE_81A909:
	LDX.w #CODE_8085FD
	JSL.l CODE_80BA28
	JSL.l CODE_84D706
	RTS

CODE_81A915:
	LDX.w #CODE_80860D
	JSL.l CODE_80BA28
	JSL.l CODE_84D706
	RTS

CODE_81A921:
	LDX.w #CODE_808606
	JSL.l CODE_80BA28
	JSL.l CODE_84D706
	RTS

CODE_81A92D:
	LDX.w $0164
	LDA.w $0154,x
	BEQ.b CODE_81A938
	DEC.w $0154,x
CODE_81A938:
	TXA
	EOR.w #$0002
	TAX
	BIT.w $1E8C
	BMI.b CODE_81A94A
	LDA.w $0154,x
	BEQ.b CODE_81A94A
	DEC.w $0154,x
CODE_81A94A:
	RTS

DATA_81A94B:
	dw $5000,$6000,$5000,$6000,$4000

DATA_81A955:
	dw $7FBC00,$7F6C00

DATA_81A959:
	dw $7FBC00>>16,$7FBC00>>16

CODE_81A95D:
	LDA.w #$7FC800
	STA.w $1D82
	LDA.w #$7FC800>>16
	STA.w $1D84
	LDA.w DATA_81A94B+$04,x
	BRA.b CODE_81A980

CODE_81A96E:
	LDY.w $0164
CODE_81A971:
	LDA.w DATA_81A955,x
	STA.w $1D82
	LDA.w DATA_81A959,x
	STA.w $1D84
	LDA.w DATA_81A94B,y
CODE_81A980:
	STA.w $1D86
	LDA.w #$0400
	STA.w $1D80
	RTS

CODE_81A98A:
	EOR.w $0164
	TAX
CODE_81A98E:
	JMP.w CODE_818160

CODE_81A991:
	LDY.b $B8
	LDX.w #$0000
	JMP.w CODE_81A971

CODE_81A999:
	LDA.b $B8
	STA.w $0164
	LDX.b $2C
	JMP.w CODE_81A3B3

CODE_81A9A3:
	LDA.b $B8
	STA.w $0164
	LDX.b $2C
	JMP.w CODE_81A76F

CODE_81A9AD:						; Note: Something related to giving up in Mario kart GP mode.
	LDX.b $B4
	LDA.w #DATA_81AB21
	STA.b $46,x
	LDA.w #$0040
	ORA.b $10,x
	STA.b $10,x
	STZ.b $48,x
	STZ.b $4A,x
	STZ.b $4C,x
	JSL.l CODE_81F4D1
	RTS

CODE_81A9C6:
	LDX.b $B4
	LDA.b $4A,x
	BNE.b CODE_81AA04
	JSR.w CODE_81AA08
	LDY.w DATA_81AB4E,x
	BPL.b CODE_81A9F4
	LDX.b $B4
	LDA.b $4C,x
	BNE.b CODE_81A9E4
	DEC.b $4C,x
	TXA
	AND.w #$0100
	JSL.l CODE_84D92D
CODE_81A9E4:
	LDA.w #$5880
	CLC
	ADC.b $BA
	JSL.l CODE_80C056
	JSL.l CODE_81DA72
	BRA.b CODE_81AA04

CODE_81A9F4:
	SEP.b #$20
	LDA.w DATA_81AA05,y
	STA.b $1B
	REP.b #$20
	LDX.w #CODE_80CE97
	JSL.l CODE_80BA28
CODE_81AA04:
	RTS

DATA_81AA05:
	db $00,$39,$3D

CODE_81AA08:
	LDY.b $46,x
	DEC.b $48,x
	BPL.b CODE_81AA2A
	INY
	INY
	STY.b $46,x
	LDA.w $0000,y
	BIT.w #$0080
	BEQ.b CODE_81AA25
	DEC.b $4A,x
	LDA.w $0001,y
	TAY
	STY.b $46,x
	LDA.w $0000,y
CODE_81AA25:
	AND.w #$00FF
	STA.b $48,x
CODE_81AA2A:
	LDA.w $0001,y
	AND.w #$00FF
CODE_81AA30:
	ASL
	TAX
	RTS

CODE_81AA33:
	LDX.b $3C
	CLC
	ADC.b $BA
	STA.b $00,x
	ADC.w #$0008
	STA.b $04,x
	ADC.w #$0800
	STA.b $0C,x
	SBC.w #$0007
	STA.b $08,x
	TYA
	STA.b $02,x
	INC
	STA.b $06,x
	ORA.w #$0010
	STA.b $0E,x
	DEC
	STA.b $0A,x
	TXA
	CLC
	ADC.w #$0010
	STA.b $3C
	RTS

;--------------------------------------------------------------------

CODE_81AA5F:
	JSR.w CODE_81AA6C
	RTL

CODE_81AA63:
	PHA
	LDA.w #$0000
	STA.b $0A
	PLA
	BRA.b CODE_81AA6E

CODE_81AA6C:
	STZ.b $0A
CODE_81AA6E:
	STA.b $04
	LDX.b $3C
	SEP.b #$20
CODE_81AA74:
	LDA.w !ContextDependentTable,y
	BEQ.b CODE_81AAE0
	STA.b $08
	AND.b #$3F
	STA.b $00
	INY
	LDA.w !ContextDependentTable,y
	EOR.b $0A
	STA.b $01
	INY
	REP.b #$21
	LDA.w !ContextDependentTable,y
	ADC.b $BA
	ADC.b $04
	STA.b $02
	LDA.b $08
	AND.w #$0060
	BEQ.b CODE_81AAB3
	CMP.w #$0020
	BEQ.b CODE_81AAAE
	CMP.w #$0040
	BEQ.b CODE_81AAA9
	LDA.w #$1000
	BRA.b CODE_81AAB6

CODE_81AAA9:
	LDA.w #$0800
	BRA.b CODE_81AAB6

CODE_81AAAE:
	LDA.w #$0010
	BRA.b CODE_81AAB6

CODE_81AAB3:
	LDA.w #$0008
CODE_81AAB6:
	STA.b $06
	INY
	INY
	SEP.b #$20
CODE_81AABC:
	LDA.w !ContextDependentTable,y
	STA.b $02,x
	LDA.b $01
	STA.b $03,x
	REP.b #$21
	LDA.b $02
	STA.b $00,x
	ADC.b $06
	STA.b $02
	SEP.b #$20
	BIT.b $08
	BMI.b CODE_81AAD6
	INY
CODE_81AAD6:
	INX
	INX
	INX
	INX
	DEC.b $00
	BNE.b CODE_81AABC
	BRA.b CODE_81AA74

CODE_81AAE0:
	REP.b #$20
	STX.b $3C
	RTS

;--------------------------------------------------------------------

DATA_81AAE5:
	db $10,$29,$00,$00,$00,$01,$02,$03
	db $04,$05,$06,$07,$08,$09,$0A,$0B
	db $0C,$0D,$0E,$0F,$10,$29,$00,$08
	db $10,$11,$12,$13,$14,$15,$16,$17
	db $18,$19,$1A,$1B,$1C,$1D,$1E,$1F
	db $00,$10,$21,$00,$00,$80,$81,$82
	db $83,$90,$91,$92,$93,$A0,$A1,$A2
	db $A3,$B0,$B1,$B2

DATA_81AB21:
	db $B3,$00,$14,$09,$01,$0A,$01,$0B
	db $01,$0A,$01,$09,$01,$0A,$01,$0B
	db $01,$0A,$01,$09,$01,$0A,$01,$0B
	db $02,$00,$02,$01,$03,$02,$04,$03
	db $05,$04,$06,$05,$07,$06,$08,$07
DATA_81AB49:
	db $09,$08,$80 : dw DATA_81AB49

DATA_81AB4E:
	dw DATA_81AB66,DATA_81AB7B,DATA_81AB90,DATA_81ABEB,DATA_81AC3C,DATA_81AC75,DATA_81ACAE,DATA_81ACD7
	dw DATA_81ACF2,$0000,$0001,$0002

DATA_81AB66:
	db $84,$00,$00,$0E,$FA,$01,$F0,$00
	db $0E,$BA,$01,$00,$F0,$0E,$7A,$01
	db $F0,$F0,$0E,$3A,$01

DATA_81AB7B:
	db $84,$00,$00,$06,$38,$01,$F0,$00
	db $04,$38,$01,$00,$F0,$02,$38,$01
	db $F0,$F0,$00,$38,$01

DATA_81AB90:
	db $12,$F2,$F5,$1C,$3A,$00,$00,$F0
	db $1A,$38,$00,$F0,$F0,$0B,$38,$00
	db $F8,$F0,$0A,$38,$00,$00,$F8,$0A
	db $38,$00,$00,$F8,$08,$38,$00,$F4
	db $F4,$09,$38,$00,$F4,$FC,$19,$38
	db $00,$FC,$F4,$09,$78,$00,$FC,$FC
	db $19,$78,$00,$04,$08,$0A,$38,$00
	db $08,$00,$18,$78,$00,$08,$F8,$08
	db $78,$00,$F8,$08,$18,$38,$00,$00
	db $00,$08,$78,$00,$00,$00,$18,$08
	db $00,$F8,$00,$08,$38,$00,$00,$08
	db $18,$78,$00

DATA_81ABEB:
	db $10,$F2,$F5,$1D,$3A,$00,$F8,$00
	db $1C,$3A,$00,$04,$05,$1A,$38,$00
	db $08,$FD,$19,$78,$00,$08,$F5,$09
	db $78,$00,$00,$FD,$09,$78,$00,$01
	db $F5,$1A,$38,$00,$F8,$05,$19,$38
	db $00,$00,$05,$19,$78,$00,$00,$ED
	db $0B,$38,$00,$F9,$ED,$1A,$38,$00
	db $F0,$ED,$1B,$38,$00,$F7,$F5,$0A
	db $38,$00,$00,$FD,$19,$38,$00,$00
	db $F5,$09,$38,$00,$F8,$FD,$09,$38
	db $00

DATA_81AC3C:
	db $0B,$00,$ED,$1C,$3A,$00,$00,$EB
	db $1B,$38,$00,$F2,$F5,$0D,$3A,$00
	db $F8,$00,$1D,$3A,$00,$02,$F3,$0B
	db $38,$00,$FC,$FF,$0A,$38,$00,$F6
	db $F3,$1A,$38,$00,$04,$03,$0B,$38
	db $00,$04,$F7,$0A,$38,$00,$FA,$EB
	db $0B,$38,$00,$F0,$EB,$0C,$38,$00
	db $F0

DATA_81AC75:
	db $0B,$00,$ED,$1D,$3A,$00,$01,$E7
	db $0C,$38,$00,$08,$F6,$1C,$3A,$00
	db $F2,$F5,$0C,$3A,$00,$F8,$00,$0D
	db $3A,$00,$04,$FF,$1B,$38,$00,$FC
	db $FB,$1A,$38,$00,$01,$EF,$1B,$38
	db $00,$F7,$EF,$0B,$38,$00,$F9,$E7
	db $1B,$38,$00,$04,$F3,$1A,$38,$00
	db $F0

DATA_81ACAE:
	db $08,$08,$F6,$1D,$3A,$00,$00,$ED
	db $0D,$3A,$00,$F8,$00,$0C,$3A,$00
	db $04,$FC,$0C,$38,$00,$FB,$F8,$0B
	db $38,$00,$05,$F0,$0B,$38,$00,$F8
	db $EC,$1B,$38,$00,$F8,$E4,$0C,$38
	db $00

DATA_81ACD7:
	db $05,$08,$F6,$0D,$3A,$00,$00,$ED
	db $0C,$3A,$00,$06,$ED,$1B,$38,$00
	db $FA,$F5,$1B,$38,$00,$F8,$E9,$0C
	db $38,$00,$05

DATA_81ACF2:
	db $03,$08,$F6,$0C,$3A,$00,$06,$EA
	db $0C,$38,$00,$FA,$F2,$0C,$38,$00
	db $FA

DATA_81AD03:
	db $04,$29,$00,$00,$00,$01,$02,$03
	db $04,$29,$00,$08,$10,$11,$12,$13
	db $03,$29,$28,$00,$0A,$1D,$04,$03
	db $29,$28,$08,$0B,$1E,$14,$03,$29
	db $18,$20,$1B,$19,$0E,$02,$29,$18
	db $30,$17,$06,$00

DATA_81AD2F:
	db $01,$29,$00,$00,$05,$00

DATA_81AD35:
	db $05,$29,$00,$00,$0D,$19,$07,$0D
	db $1B,$03,$29,$00,$10,$19,$17,$1A
	db $00

DATA_81AD46:
	db $06,$29,$00,$00,$0F,$15,$16,$17
	db $18,$19,$06,$29,$34,$00,$0F,$06
	db $09,$0D,$0E,$19,$05,$29,$00,$0E
	db $0D,$19,$07,$0D,$1B,$06,$29,$00
	db $1C,$0F,$15,$16,$17,$18,$19,$06
	db $29,$34,$1C,$1A,$0D,$08,$1C,$19
	db $0D,$03,$29,$00,$2A,$19,$17,$1A
	db $00

DATA_81AD7F:
	db $06,$29,$00,$00,$0D,$19,$1F,$0C
	db $16,$1B,$00

;--------------------------------------------------------------------

DATA_81AD8A:
	dw $5C00,$5D00,$5E00,$6C00,$6D00,$6E00

DATA_81AD96:
	dw $B600,$B800,$BA00,$B600,$B800,$BA00

CODE_81ADA2:
	PHB
	PHK
	PLB
	DEC
	CMP.w #$0006
	BCC.b CODE_81ADAE
	LDA.w #$0005
CODE_81ADAE:
	ASL
	TAX
	LDA.w #$0200
	STA.w $1D80
	LDA.w DATA_81AD96,x
	STA.w $1D82
	LDA.w #$007F
	STA.w $1D84
	LDA.w DATA_81AD8A,x
	STA.w $1D86
	PLB
	RTL

;--------------------------------------------------------------------

CODE_81ADCA:
	PHB
	PHK
	PLB
	LDA.w #$3448
	LDY.w #DATA_81AE37
	JSR.w CODE_81AE12
	JSR.w CODE_81AE1D
	LDA.w #$3488
	JSR.w CODE_81AE71
	JSR.w CODE_81AE22
	LDA.w #$34A0
	JSR.w CODE_81AE71
	JSL.l CODE_81DA72
	PLB
	RTL

CODE_81ADEE:
	PHB
	PHK
	PLB
	LDA.w #$3448
	LDY.w #DATA_81AE46
	JSR.w CODE_81AE12
	JSR.w CODE_81AE1D
	LDA.w #$3488
	JSR.w CODE_81AE71
	JSR.w CODE_81AE22
	LDA.w #$34A0
	JSR.w CODE_81AE71
	JSL.l CODE_81DA72
	PLB
	RTL

CODE_81AE12:
	PHA
	JSR.w CODE_81AA6C
	PLA
	LDY.w #DATA_81AE57
	JMP.w CODE_81AA6C

CODE_81AE1D:
	LDA.w #$0000
	BRA.b CODE_81AE25

CODE_81AE22:
	LDA.w #$0002
CODE_81AE25:
	EOR.b $B8
	LDX.b $2C
	CPX.w #$0006
	BNE.b CODE_81AE32
	CLC
	ADC.w #$0004
CODE_81AE32:
	TAX
	LDY.w $1F30,x
	RTS

DATA_81AE37:
	db $03,$29,$00,$00,$C8,$CA,$CC,$03
	db $29,$00,$08,$C9,$CB,$CD,$00

DATA_81AE46:
	db $04,$29,$00,$00,$CE,$D0,$D2,$D4
	db $04,$29,$00,$08,$CF,$D1,$D3,$D5
	db $00

DATA_81AE57:
	db $01,$29,$24,$00,$D7,$01,$29,$24
	db $08,$EC,$01,$29,$50,$05,$D6,$01
	db $29,$47,$F7,$ED,$01,$29,$5F,$F7
	db $EE,$00

;--------------------------------------------------------------------

CODE_81AE71:
	PHY
	TAX
	TYA
	LSR
	LSR
	LSR
	LSR
	BEQ.b CODE_81AE7F
	TAY
	TXA
	JSR.w CODE_81AE85
CODE_81AE7F:
	TXA
	CLC
	ADC.w #$0008
	PLY
CODE_81AE85:
	PHA
	LDX.b $3C
	CLC
	ADC.b $BA
	STA.b $00,x
	TYA
	AND.w #$000F
	TAY
	LDA.w DATA_81AEB1,y
	AND.w #$00FF
	ORA.w #$2900
	STA.b $02,x
	INC
	STA.b $06,x
	LDA.b $00,x
	CLC
	ADC.w #$0800
	STA.b $04,x
	TXA
	CLC
	ADC.w #$0008
	STA.b $3C
	PLX
	RTS

DATA_81AEB1:
	dw $DAD8,$DEDC,$E2E0,$E6E4,$EAE8

;--------------------------------------------------------------------

DATA_81AEBB:
	dw $5E00,$6E00

DATA_81AEBF:
	dw $5C00,$6C00

CODE_81AEC3:
	LDX.b $B8
	LDA.w #$B400
	LDY.w DATA_81AEBB,x
	BRA.b CODE_81AED5

CODE_81AECD:
	LDX.b $B8
	LDA.w #$B000
	LDY.w DATA_81AEBF,x
CODE_81AED5:
	STA.w $1D82
	STY.w $1D86
	LDA.w #$0400
	STA.w $1D80
	LDA.w #$007F
	STA.w $1D84
	RTS

;--------------------------------------------------------------------

CODE_81AEE8:
	LDY.b $B8
	LDA.w #$0048
	STA.w $0F88,y
	LDX.w DATA_81AF70,y
	LDY.w #DATA_81AF30
	JSR.w CODE_81AFDF
	RTS

CODE_81AEFA:
	LDY.b $B8
	LDX.w DATA_81AF70,y
	STX.b $B4
	LDA.w $0F88,y
	BEQ.b CODE_81AF10
	DEC
	STA.w $0F88,y
	BNE.b CODE_81AF10
	JSL.l CODE_84D986
CODE_81AF10:
	LDA.w #$0009
	STA.b $02
CODE_81AF15:
	LDX.b $B4
	LDA.w #$6400
	LDY.w #$6200
	JSR.w CODE_81B019
	JSR.w CODE_81B066
	LDA.b $B4
	CLC
	ADC.w #$000A
	STA.b $B4
	DEC.b $02
	BNE.b CODE_81AF15
	RTS

DATA_81AF30:
	db $5C,$B6,$08,$64,$B6,$09,$6C,$B6
	db $0A,$74,$B6,$0B,$7C,$B6,$0C,$84
	db $B6,$0D,$94,$B6,$0E,$9C,$B6,$0F
	db $A4,$B6,$10,$00

;--------------------------------------------------------------------

DATA_81AF4C:
	dw $5000,$6000

CODE_81AF50:
	PHB
	PHK
	PLB
	STZ.w $0154,x
	LDA.w #$0400
	STA.w $1D80
	LDA.w #$7FB000
	STA.w $1D82
	LDA.w #$7FB000>>16
	STA.w $1D84
	LDA.w DATA_81AF4C,x
	STA.w $1D86
	PLB
	RTL

;--------------------------------------------------------------------

DATA_81AF70:
	dw $0000,$0080

DATA_81AF74:
	db $60,$FE,$00,$68,$F2,$01,$70,$E6
	db $02,$78,$DA,$03,$88,$CE,$04,$90
	db $C2,$05,$98,$B6,$06,$A0,$AA,$07
	db $00

CODE_81AF8D:
	LDA.w $1DCE
	AND.w #$2000
	BNE.b CODE_81AFA0
	JSL.l CODE_809FA6
	LDA.w #$0014
	JSL.l CODE_80985B
CODE_81AFA0:
	PHB
	PHK
	PLB
	LDY.b $B8
	LDX.b $C8,y
	STZ.b $C0,x
	LDX.w DATA_81AF70,y
	LDY.w #DATA_81AF74
	JSR.w CODE_81AFDF
	PLB
	RTL

;--------------------------------------------------------------------

CODE_81AFB4:
	PHB
	PHK
	PLB
	LDY.b $B8
	LDX.w DATA_81AF70,y
	STX.b $B4
	LDA.w #$0008
	STA.b $02
CODE_81AFC3:
	LDX.b $B4
	LDA.w #$4800
	LDY.w #$6C00
	JSR.w CODE_81B019
	JSR.w CODE_81B066
	LDA.b $B4
	CLC
	ADC.w #$000A
	STA.b $B4
	DEC.b $02
	BNE.b CODE_81AFC3
	PLB
	RTL

;--------------------------------------------------------------------

CODE_81AFDF:
	LDA.w !ContextDependentTable,y
	AND.w #$00FF
	BEQ.b CODE_81B018
	XBA
	STA.l $7FDC00,x
	LDA.w !ContextDependentTable+$01,y
	AND.w #$00FF
	XBA
	STA.l $7FDC02,x
	LDA.w #$0000
	STA.l $7FDC04,x
	STA.l $7FDC06,x
	LDA.w !ContextDependentTable+$02,y
	AND.w #$00FF
	ASL
	STA.l $7FDC08,x
	INY
	INY
	INY
	TXA
	CLC
	ADC.w #$000A
	TAX
	BRA.b CODE_81AFDF

CODE_81B018:
	RTS

;--------------------------------------------------------------------

CODE_81B019:
	STY.b $08
	STA.b $00
	LDA.l $7FDC06,x
	CLC
	ADC.w #$0020
	BMI.b CODE_81B02C
	CMP.w #$0300
	BCS.b CODE_81B030
CODE_81B02C:
	STA.l $7FDC06,x
CODE_81B030:
	LDA.l $7FDC02,x
	CLC
	ADC.l $7FDC06,x
	BMI.b CODE_81B061
	CMP.b $00
	BCC.b CODE_81B061
	SEP.b #$20
	LDA.b #!DSP1_Command00_16BitMultiplication
	STA.w !REGISTER_DSP1_DataRegister
	REP.b #$20
	LDA.l $7FDC06,x
	EOR.w #$FFFF
	INC
	STA.w !REGISTER_DSP1_DataRegister
	LDA.b $08
	STA.w !REGISTER_DSP1_DataRegister
	LDA.w !REGISTER_DSP1_DataRegister
	STA.l $7FDC06,x
	LDA.b $00
CODE_81B061:
	STA.l $7FDC02,x
	RTS

;--------------------------------------------------------------------

CODE_81B066:
	LDA.w #$0000
	SEP.b #$20
	LDA.l $7FDC01,x
	STA.b $04
	LDA.l $7FDC03,x
	CLC
	ADC.b $BB
	STA.b $06
	LDA.l $7FDC08,x
	TAY
	LDX.w DATA_81B0DA,y
	TXY
	LDX.b $3C
	LDA.w !ContextDependentTable,y
	BNE.b CODE_81B0B9
	LDA.b $04
	SEC
	SBC.b #$04
	STA.b $00,x
	STA.b $04,x
	LDA.b $06
	SEC
	SBC.b #$08
	STA.b $01,x
	SEC
	SBC.b #$08
	STA.b $05,x
	LDA.w !ContextDependentTable+$01,y
	STA.b $03,x
	STA.b $07,x
	LDA.w !ContextDependentTable+$02,y
	STA.b $02,x
	LDA.w !ContextDependentTable+$03,y
	STA.b $06,x
	REP.b #$21
	TXA
	ADC.w #$0008
	STA.b $3C
	RTS

CODE_81B0B9:
	LDA.b $04
	SEC
	SBC.b #$04
	STA.b $00,x
	LDA.b $06
	SEC
	SBC.b #$08
	STA.b $01,x
	LDA.w !ContextDependentTable+$01,y
	STA.b $03,x
	LDA.w !ContextDependentTable+$02,y
	STA.b $02,x
	INX
	INX
	INX
	INX
	STX.b $3C
	REP.b #$20
	RTS

DATA_81B0DA:
	dw DATA_81B0FC,DATA_81B100,DATA_81B104,DATA_81B108,DATA_81B10C,DATA_81B110,DATA_81B114,DATA_81B118
	dw DATA_81B11C,DATA_81B120,DATA_81B124,DATA_81B128,DATA_81B12C,DATA_81B130,DATA_81B134,DATA_81B138
	dw DATA_81B13C

DATA_81B0FC:
	dw $3900,$0001

DATA_81B100:
	dw $3900,$0203

DATA_81B104:
	dw $3900,$0405

DATA_81B108:
	dw $3900,$0607

DATA_81B10C:
	dw $3900,$0809

DATA_81B110:
	dw $3900,$0A0B

DATA_81B114:
	dw $3900,$0C0D

DATA_81B118:
	dw $3900,$0E0F

DATA_81B11C:
	dw $3B00,$E6E7

DATA_81B120:
	dw $3B00,$E8E9

DATA_81B124:
	dw $3B00,$EAEB

DATA_81B128:
	dw $3B00,$ECED

DATA_81B12C:
	dw $3B00,$EEEF

DATA_81B130:
	dw $3B00,$F0F1

DATA_81B134:
	dw $3B00,$F2F3

DATA_81B138:
	dw $3B00,$F4F5

DATA_81B13C:
	dw $3B00,$F6F7

;--------------------------------------------------------------------

CODE_81B140:
	LDX.w $1EBA
	JSR.w (DATA_81B152,x)
CODE_81B146:
	LDA.w $1EBA
	INC
	INC
	AND.w #$0006
	STA.w $1EBA
	RTL

DATA_81B152:
	dw CODE_81B20F
	dw CODE_81B296
	dw CODE_81B2AC
	dw CODE_81B1CB

CODE_81B15A:
	LDX.w $1EBA
	JSR.w (DATA_81B162,x)
	BRA.b CODE_81B146

DATA_81B162:
	dw CODE_81B244
	dw CODE_81B291
	dw CODE_81B2A7
	dw CODE_81B1C6

CODE_81B16A:
	LDX.w $1EBA
	LDA.w $0154
	BEQ.b CODE_81B18B
	LDA.w $0156
	BEQ.b CODE_81B186
	JSR.w (DATA_81B195,x)
CODE_81B17A:
	LDA.w $1EBA
	INC
	INC
	AND.w #$000E
	STA.w $1EBA
CODE_81B185:
	RTL

CODE_81B186:
	JSR.w (DATA_81B1A5,x)
	BRA.b CODE_81B17A

CODE_81B18B:
	LDA.w $0156
	BEQ.b CODE_81B185
	JSR.w (DATA_81B1B5,x)
	BRA.b CODE_81B17A

DATA_81B195:
	dw CODE_81B20F
	dw CODE_81B296
	dw CODE_81B2AC
	dw CODE_81B244
	dw CODE_81B291
	dw CODE_81B2A7
	dw CODE_81B1C5
	dw CODE_81B1C5

DATA_81B1A5:
	dw CODE_81B20F
	dw CODE_81B296
	dw CODE_81B2AC
	dw CODE_81B1C5
	dw CODE_81B1C5
	dw CODE_81B1C5
	dw CODE_81B1C5
	dw CODE_81B1C5

DATA_81B1B5:
	dw CODE_81B1C5
	dw CODE_81B1C5
	dw CODE_81B1C5
	dw CODE_81B244
	dw CODE_81B291
	dw CODE_81B2A7
	dw CODE_81B1C5
	dw CODE_81B1C5

CODE_81B1C5:
	RTS

CODE_81B1C6:
	LDX.w #$1100
	BRA.b CODE_81B1CE

CODE_81B1CB:
	LDX.w #$1000
CODE_81B1CE:
	LDA.w $1EB8
	BMI.b CODE_81B1D8
	BIT.w $1DCE
	BVC.b CODE_81B1E2
CODE_81B1D8:
	STZ.w $1EA0
	LDA.w #$FFFF
	STA.w $1EA4
	RTS

CODE_81B1E2:
	LDA.b $92,x
	CMP.b $90,x
	BCS.b CODE_81B1F3
	STA.w $1EA4
	LDY.b $96,x
	STY.w $1EA0
	JMP.w CODE_81B2BD

CODE_81B1F3:
	LDA.b $90,x
	CMP.w #$FFFF
	BEQ.b CODE_81B205
	STA.w $1EA4
	LDY.b $94,x
	STY.w $1EA0
	JMP.w CODE_81B2BD

CODE_81B205:
	STA.w $1EA4
	STZ.w $1EA0
	RTS

CODE_81B20C:
	JSR.w CODE_81B244
CODE_81B20F:
	LDY.w #$0000
	LDX.w #$1000
	JSR.w CODE_81B279
CODE_81B218:
	TXY
	LDX.b $02,y
	CPX.w #$00B0
	BEQ.b CODE_81B226
	LDA.b $12,x
	BMI.b CODE_81B218
	BPL.b CODE_81B229				; Note: This will always branch.

CODE_81B226:
	LDX.w #$0000
CODE_81B229:
	STX.w $1096
	LDX.w #$1000
CODE_81B22F:
	TXY
	LDX.b $00,y
	CPX.w #$00B0
	BEQ.b CODE_81B23D
	LDA.b $12,x
	BMI.b CODE_81B22F
	BPL.b CODE_81B240				; Note: This will always branch.

CODE_81B23D:
	LDX.w #$0000
CODE_81B240:
	STX.w $1094
	RTS

CODE_81B244:
	LDY.w #$0002
	LDX.w #$1100
	JSR.w CODE_81B279
CODE_81B24D:
	TXY
	LDX.b $0A,y
	CPX.w #$00B4
	BEQ.b CODE_81B25B
	LDA.b $12,x
	BMI.b CODE_81B24D
	BPL.b CODE_81B25E				; Note: This will always branch.

CODE_81B25B:
	LDX.w #$0000
CODE_81B25E:
	STX.w $1196
	LDX.w #$1100
CODE_81B264:
	TXY
	LDX.b $08,y
	CPX.w #$00B4
	BEQ.b CODE_81B272
	LDA.b $12,x
	BMI.b CODE_81B264
	BPL.b CODE_81B275				; Note: This will always branch.

CODE_81B272:
	LDX.w #$0000
CODE_81B275:
	STX.w $1194
	RTS

CODE_81B279:
	LDA.w $0088,y
	LSR
	LSR
	STA.b $98,x
	LDA.w $008C,y
	LSR
	LSR
	STA.b $9A,x
	LDA.w $0094,y
	STA.b $9C,x
	STZ.b $96,x
	STZ.b $94,x
	RTS

CODE_81B291:
	LDX.w #$1100
	BRA.b CODE_81B299

CODE_81B296:
	LDX.w #$1000
CODE_81B299:
	LDY.b $96,x
	BEQ.b CODE_81B2A3
	JSR.w CODE_81B2EF
CODE_81B2A0:
	STA.b $92,x
	RTS

CODE_81B2A3:
	DEY
	TYA
	BRA.b CODE_81B2A0

CODE_81B2A7:
	LDX.w #$1100
	BRA.b CODE_81B2AF

CODE_81B2AC:
	LDX.w #$1000
CODE_81B2AF:
	LDY.b $94,x
	BEQ.b CODE_81B2B9
	JSR.w CODE_81B2EF
CODE_81B2B6:
	STA.b $90,x
	RTS

CODE_81B2B9:
	DEY
	TYA
	BRA.b CODE_81B2B6

CODE_81B2BD:
	SEP.b #$21
	LDA.b #!DSP1_Command0C_2DCoordinateRotation
	STA.w !REGISTER_DSP1_DataRegister
	REP.b #$20
	LDA.b $9C,x
	STA.w !REGISTER_DSP1_DataRegister
	LDA.w $0018,y
	SBC.b $98,x
	STA.w !REGISTER_DSP1_DataRegister
	LDA.w $001C,y
	SEC
	SBC.b $9A,x
	STA.w !REGISTER_DSP1_DataRegister
CODE_81B2DC:
	LDA.l !REGISTER_DSP1_StatusRegister
	BPL.b CODE_81B2DC
	LDA.w !REGISTER_DSP1_DataRegister
	STA.w $1EA8
	LDA.w !REGISTER_DSP1_DataRegister
	STA.w $1EAC
	RTS

CODE_81B2EF:
	SEP.b #$21
	LDA.b #!DSP1_Command28_VectorAbsoluteValueCalculation
	STA.w !REGISTER_DSP1_DataRegister
	REP.b #$20
	LDA.w $0018,y
	SBC.b $98,x
	STA.w !REGISTER_DSP1_DataRegister
	LDA.w $001C,y
	SEC
	SBC.b $9A,x
	STA.w !REGISTER_DSP1_DataRegister
	LDA.w #$0000
	LDA.w #$0000
	STA.w !REGISTER_DSP1_DataRegister
CODE_81B312:
	LDA.l !REGISTER_DSP1_StatusRegister
	BPL.b CODE_81B312
	LDA.w !REGISTER_DSP1_DataRegister
	RTS

;--------------------------------------------------------------------

DATA_81B31C:
	dw $0C26,$0CA6

DATA_81B320:
	dw $34D4,$34D8,$38DC,$38E4,$30E0,$34E0,$34C0,$38C4
	dw $38C8,$34B0,$3CD4

DATA_81B336:
	dw $8000,$4000,$2000,$0800,$1000,$0400,$0200,$0100
	dw $0040

;--------------------------------------------------------------------

CODE_81B348:
	LDA.w #DATA_81B4DB
	STA.w $0D74,x
	LDA.b $38
	LSR
	LSR
	LSR
	LDA.w #$0000
	ADC.w #$0009
	STA.w $0D7C,x
	LDA.w #$A000
	STA.w $0D70,x
	LDA.w #$00E1
	STA.w $0D78,x
	RTL

;--------------------------------------------------------------------

CODE_81B369:
	LDA.w $0D78,x
	BEQ.b CODE_81B37D
	DEC
	STA.w $0D78,x
	AND.w #$0008
	BEQ.b CODE_81B383
	LDY.w #$0012
	JMP.w CODE_81B45C

CODE_81B37D:
	LDA.w #$0000
	STA.w $0D70,x
CODE_81B383:
	JMP.w CODE_81B426

CODE_81B386:
	RTL

CODE_81B387:
	LDX.b $B8
	LDA.w $0D70,x
	BPL.b CODE_81B386
	BIT.w #$2000
	BNE.b CODE_81B3B8
	BIT.w #$4000
	BNE.b CODE_81B3FB
	BIT.w #$1000
	BNE.b CODE_81B369
	TAY
	LDA.w $0D78,x
	BEQ.b CODE_81B3AF
	DEC
	STA.w $0D78,x
	AND.w #$0008
	BNE.b CODE_81B426
	JMP.w CODE_81B43C

CODE_81B3AF:
	TYA
	ORA.w #$4000
	STA.w $0D70,x
	BRA.b CODE_81B386

CODE_81B3B8:
	LDA.w $0D78,x
	DEC
	STA.w $0D78,x
	BMI.b CODE_81B3CC
	BIT.w $0027,x
	BPL.b CODE_81B3EE
	ORA.w #$FFF0
	STA.w $0D78,x
CODE_81B3CC:
	CMP.w #$FFC0
	BCC.b CODE_81B3DD
	SEP.b #$20
	LDA.w $0D70,x
	CMP.w $0D7C,x
	REP.b #$20
	BNE.b CODE_81B3EE
CODE_81B3DD:
	LDA.w $0D70,x
	AND.w #$DFFF
	STA.w $0D70,x
	LDA.w #$0040
	STA.w $0D78,x
	BRA.b CODE_81B386

CODE_81B3EE:
	LDA.w $0D78,x
	AND.w #$0003
	BNE.b CODE_81B470
	INC.w $0D74,x
	BRA.b CODE_81B43C

CODE_81B3FB:
	LDX.b $B4
	LDY.b $B8
	LDA.b $10,x
	AND.w #$0820
	BNE.b CODE_81B470
	LDA.b $72,x
	BNE.b CODE_81B470
	LDA.w $0027,y
	BPL.b CODE_81B470
	LDA.w $0D70,y
	PHA
	LDA.w #$0000
	STA.w $0D70,y
	PLA
	ASL
	AND.w #$00FF
	TAY
	LDA.b $E0,x
	ORA.w DATA_81B336,y
	STA.b $E0,x
CODE_81B426:
	LDX.b $B8
	LDA.w DATA_81B31C,x
	TAX
	LDA.w #$3CE9
	STA.b $00,x
	STA.b $02,x
	LDA.w #$3CE8
	STA.b $40,x
	STA.b $42,x
	BRA.b CODE_81B470

CODE_81B43C:
	SEP.b #$20
CODE_81B43E:
	LDY.w $0D74,x
	LDA.w $0000,y
	BPL.b CODE_81B452
	REP.b #$20
	LDA.w $0001,y
	STA.w $0D74,x
	SEP.b #$20
	BRA.b CODE_81B43E

CODE_81B452:
	STA.w $0D70,x
	REP.b #$20
	ASL
	AND.w #$001F
	TAY
CODE_81B45C:
	LDX.b $B8
	LDA.w DATA_81B31C,x
	TAX
	LDA.w DATA_81B320,y
	STA.b $00,x
	INC
	STA.b $02,x
	INC
	STA.b $40,x
	INC
	STA.b $42,x
CODE_81B470:
	RTL

;--------------------------------------------------------------------

DATA_81B471:
	dw DATA_81B5BB
	dw DATA_81B5A0
	dw DATA_81B5D6
	dw DATA_81B60C
	dw DATA_81B642
	dw DATA_81B627
	dw DATA_81B5F1
	dw DATA_81B65D

DATA_81B481:
	dw DATA_81B4FE
	dw DATA_81B4E3
	dw DATA_81B519
	dw DATA_81B54F
	dw DATA_81B585
	dw DATA_81B56A
	dw DATA_81B534
	dw DATA_81B65D

DATA_81B491:
	dw DATA_81B49D
	dw DATA_81B4A9
	dw DATA_81B4B4
	dw DATA_81B4BE
	dw DATA_81B4C9
	dw DATA_81B4D3

DATA_81B49D:
	db $00,$01,$02,$03,$04,$05,$06,$07
	db $08,$80,$9D,$B4

DATA_81B4A9:
	db $00,$02,$03,$04,$05,$06,$07,$08
	db $80,$A9,$B4

DATA_81B4B4:
	db $00,$01,$02,$03,$04,$05,$06,$80
	db $B4,$B4

DATA_81B4BE:
	db $00,$01,$02,$03,$04,$05,$07,$08
	db $80,$BE,$B4

DATA_81B4C9:
	db $00,$02,$03,$04,$05,$07,$08,$80
	db $C9,$B4

DATA_81B4D3:
	db $00,$01,$02,$07,$08,$80,$D3,$B4

DATA_81B4DB:
	db $0A,$02,$05,$08,$09,$80,$DB,$B4

DATA_81B4E3:
	db $06,$00,$00,$0E,$16,$1C,$1E,$20
	db $81,$02,$00,$00,$0C,$16,$18,$00
	db $20,$81,$0A,$00,$0F,$11,$13,$1D
	db $1F,$00,$81

DATA_81B4FE:
	db $06,$0E,$00,$16,$18,$1C,$1E,$20
	db $80,$02,$04,$00,$0C,$16,$18,$00
	db $20,$80,$08,$10,$12,$13,$14,$17
	db $1F,$00,$80

DATA_81B519:
	db $08,$00,$00,$10,$16,$1C,$1E,$20
	db $81,$02,$00,$00,$0A,$14,$16,$00
	db $20,$81,$0A,$00,$11,$13,$15,$1D
	db $1F,$00,$81

DATA_81B534:
	db $06,$0C,$00,$12,$18,$1C,$1E,$20
	db $80,$02,$04,$00,$0A,$14,$16,$00
	db $20,$80,$08,$10,$13,$15,$17,$1D
	db $1F,$00,$80

DATA_81B54F:
	db $06,$0A,$00,$10,$16,$1C,$1E,$20
	db $80,$02,$04,$00,$0E,$16,$18,$00
	db $20,$80,$0A,$0B,$10,$12,$14,$1D
	db $1F,$00,$80

DATA_81B56A:
	db $06,$0A,$00,$10,$16,$1C,$1E,$20
	db $80,$02,$04,$00,$0E,$18,$1A,$00
	db $20,$80,$0C,$0D,$11,$13,$15,$1D
	db $1F,$00,$80

DATA_81B585:
	db $06,$0C,$00,$12,$18,$1C,$1E,$20
	db $80,$02,$04,$00,$0E,$16,$18,$00
	db $20,$80,$0C,$10,$14,$16,$18,$1D
	db $1F,$00,$80

DATA_81B5A0:
	db $06,$00,$07,$0E,$16,$1C,$00,$20
	db $84,$02,$00,$00,$0C,$14,$16,$00
	db $20,$84,$0D,$00,$11,$12,$13,$1F
	db $00,$00,$84

DATA_81B5BB:
	db $06,$0E,$0F,$13,$18,$1C,$00,$20
	db $83,$02,$04,$00,$0E,$14,$16,$00
	db $20,$83,$0A,$12,$18,$19,$1A,$1F
	db $00,$00,$83

DATA_81B5D6:
	db $08,$00,$09,$0E,$14,$1C,$00,$20
	db $84,$02,$00,$00,$0A,$14,$16,$00
	db $20,$84,$0C,$00,$13,$14,$15,$1F
	db $00,$00,$84

DATA_81B5F1:
	db $06,$0C,$0D,$12,$18,$1C,$00,$20
	db $83,$02,$04,$00,$0A,$14,$16,$00
	db $20,$83,$0B,$0F,$15,$16,$17,$1F
	db $00,$00,$83

DATA_81B60C:
	db $08,$0A,$0B,$10,$16,$1C,$00,$20
	db $83,$02,$04,$00,$0E,$18,$1A,$00
	db $20,$83,$0C,$0E,$13,$14,$15,$1F
	db $00,$00,$83

DATA_81B627:
	db $08,$0A,$0B,$10,$16,$1C,$00,$20
	db $83,$02,$04,$00,$0E,$18,$1A,$00
	db $20,$83,$0C,$12,$17,$18,$19,$1F
	db $00,$00,$83

DATA_81B642:
	db $06,$0C,$0D,$12,$16,$1C,$00,$20
	db $83,$02,$04,$00,$0E,$18,$1A,$00
	db $20,$83,$0C,$12,$17,$18,$19,$1F
	db $00,$00,$83

DATA_81B65D:
	db $02,$06,$08,$0A,$14,$1E,$20,$00
	db $82

DATA_81B666:
	dw $0909,$0909,$0909,$0909,$0009,$0000,$1212,$1212
	dw $0009,$0000,$1212,$1212,$0009,$0000,$1212,$1212
	dw $0009,$0000,$1212,$1212

DATA_81B68E:
	dw $0000,$1209,$1209,$1209,$1209

CODE_81B698:
	TXA
	LDX.b $2C
	JMP.w (DATA_81B69E,x)

DATA_81B69E:
	dw CODE_81B6D1
	dw CODE_81B6AF
	dw CODE_81B6D1
	dw CODE_81B6A6

CODE_81B6A6:
	LDY.w #$000E
	LDA.w #$0000
	CLC
	BRA.b CODE_81B6EF

CODE_81B6AF:
	TAX
	LDA.w #$0000
	SEP.b #$21
	LDA.b $C1,x
	SBC.b #$80
	BPL.b CODE_81B6BD
	LDA.b #$00
CODE_81B6BD:
	ASL
	ASL
	ORA.w $00E6,x
	LSR
	TAY
	LDA.w DATA_81B68E,y
	REP.b #$21
	LDY.w $0D28
	ADC.w DATA_81B481,y
	BRA.b CODE_81B6F2

CODE_81B6D1:
	TAX
	LDA.w #$0000
	SEP.b #$21
	LDA.b $C1,x
	SBC.b #$80
	BPL.b CODE_81B6DF
	LDA.b #$00
CODE_81B6DF:
	ASL
	ASL
	ASL
	ASL
	ORA.b $E6,x
	LSR
	TAY
	LDA.w DATA_81B666,y
	REP.b #$21
	LDY.w $0D28
CODE_81B6EF:
	ADC.w DATA_81B471,y
CODE_81B6F2:
	STA.b $00
	TAY
	LDA.w $0008,y
	AND.w #$000F
	ASL
	TAY
	LDA.w DATA_81B491,y
	LDX.w $1EE4
	STA.w $0D74,x
	STA.b $02
	SEP.b #$20
	LDA.w $1F26
	AND.b #$1F
	STA.w $0D20
	LDY.w #$FFFF
CODE_81B715:
	INY
	CMP.b ($00),y
	BCS.b CODE_81B715
	LDA.w DATA_81B49D,y
	STA.w $0D7C,x
	REP.b #$20
	RTS

;--------------------------------------------------------------------

DATA_81B723:
	dw $0000,$FFFF,$FF80,$FF7F

DATA_81B72B:
	dw $D1D0,$D3D2,$D5D4,$D7D6,$D9D8,$DBDA,$DDDC,$DFDE

CODE_81B73B:
	PLB
	RTL

CODE_81B73D:
	PHB
	PHK
	PLB
	JSL.l CODE_81BB70
	LDY.w $1EE4
	LDX.b $C8,y
	BMI.b CODE_81B73B
	LDA.b $10,x
	AND.w #$0020
	BNE.b CODE_81B73B
	LDA.b $1F,x
	BNE.b CODE_81B73B
	LDA.b $68,x
	CMP.w #$0014
	BNE.b CODE_81B7A4
	LDA.w $0D70,y
	BMI.b CODE_81B7D5
	INC.w $1EB4
	LDA.w #$A000
	STA.w $0D70,y
	LDA.w #$00C1
	STA.w $0D78,y
	PHX
	JSR.w CODE_81B698
	PLY
	LDX.b $58,y
	LDA.l $7F0000,x
	PHA
	AND.w #$0003
	ASL
	TAX
	LDA.w DATA_81B723,x
	ADC.w $0058,y
	STA.w $1E20
	TAX
	PLA
	AND.w #$000C
	TAY
	STA.w $1E22
	LDA.w DATA_81B72B,y
	STA.l $7F0000,x
	LDA.w DATA_81B72B+$02,y
	STA.l $7F0080,x
	PLB
	RTL

CODE_81B7A4:
	CMP.w #$001A
	BNE.b CODE_81B7D5
	LDA.b $58,x
	TAX
	ORA.w #$8000
	STA.w $1E20
	STZ.w $1E22
	SEP.b #$20
	LDA.w $0D2A
	STA.l $7F0000,x
	REP.b #$21
	TYX
	LDA.w #$0001
	STA.w $0FC0,x
	ADC.w $0E00,x
	CMP.w #$0064
	BCC.b CODE_81B7D2
	LDA.w #$0000
CODE_81B7D2:
	STA.w $0E00,x
CODE_81B7D5:
	PLB
	RTL

;--------------------------------------------------------------------

CODE_81B7D7:
	PHB
	PHK
	PLB
	SEP.b #$11
	STZ.w !REGISTER_VRAMAddressIncrementValue
	LDA.w $1E20
	BEQ.b CODE_81B80D
	STZ.w $1E20
	BMI.b CODE_81B811
	LDX.w $1E22
	STA.w !REGISTER_VRAMAddressLo
	LDY.w DATA_81B72B,x
	STY.w !REGISTER_WriteToVRAMPortLo
	LDY.w DATA_81B72B+$01,x
	STY.w !REGISTER_WriteToVRAMPortLo
	ADC.w #$007F
	STA.w !REGISTER_VRAMAddressLo
	LDY.w DATA_81B72B+$02,x
	STY.w !REGISTER_WriteToVRAMPortLo
	LDY.w DATA_81B72B+$03,x
	STY.w !REGISTER_WriteToVRAMPortLo
CODE_81B80D:
	REP.b #$10
	PLB
	RTL

CODE_81B811:
	AND.w #$7FFF
	STA.w !REGISTER_VRAMAddressLo
	LDX.w $1E22
	LDY.w $0D2A
	STY.w !REGISTER_WriteToVRAMPortLo
	BRA.b CODE_81B80D

;--------------------------------------------------------------------

DATA_81B822:
	dw $CF41,$003C

DATA_81B826:
	dw $CF25,$083C,$3CD0,$3CD1,$3CD1,$7CD0,$CF15,$003C

DATA_81B836:
	dw $3CD2,$3CCC,$3CCD,$7CD2,$8038,$3CD3,$3CEA,$3CEB
	dw $7CD3,$8000

DATA_81B84A:
	dw $3CD2,$3CEC,$3CED,$7CD2,$8038,$3CD3,$3CEE,$3CEF
	dw $7CD3,$8000

DATA_81B85E:
	dw DATA_81B86C
	dw DATA_81B872
	dw DATA_81B878
	dw DATA_81B86C
	dw DATA_81B872
	dw DATA_81B878
	dw DATA_81B86C

DATA_81B86C:
	dw CODE_81B894
	dw CODE_81B8A6
	dw CODE_81BBAB

DATA_81B872:
	dw CODE_81B894
	dw CODE_81B88B
	dw CODE_81BBAB

DATA_81B878:
	dw CODE_81B886
	dw CODE_81B8A6
	dw CODE_81BBAB

CODE_81B87E:
	LDA.b $B6
	LDX.w #DATA_81B85E
	JMP.w CODE_81BB9C

CODE_81B886:
	LDY.w #$7B00
	BRA.b CODE_81B88E

CODE_81B88B:
	LDY.w #$7B80
CODE_81B88E:
	LDX.w #DATA_81B822
	JMP.w CODE_81B8D6

CODE_81B894:
	LDX.w #$0C00
	LDY.w #DATA_81B836
	JSR.w CODE_81B8B8
	LDY.w #$7B00
	LDX.w #DATA_81B826
	JMP.w CODE_81B8D6

CODE_81B8A6:
	LDX.w #$0C80
	LDY.w #DATA_81B84A
	JSR.w CODE_81B8B8
	LDY.w #$7B80
	LDX.w #DATA_81B826
	JMP.w CODE_81B8D6

CODE_81B8B8:
	LDA.w !ContextDependentTable,y
	BMI.b CODE_81B8C5
	STA.b $24,x
	INX
	INX
	INY
	INY
	BRA.b CODE_81B8B8

CODE_81B8C5:
	AND.w #$00FF
	BEQ.b CODE_81B8D5
	STA.b $00
	TXA
	CLC
	ADC.b $00
	TAX
	INY
	INY
	BRA.b CODE_81B8B8

CODE_81B8D5:
	RTS

CODE_81B8D6:
	LDA.w #$0080
	STA.w !REGISTER_VRAMAddressIncrementValue
	STY.w !REGISTER_VRAMAddressLo
CODE_81B8DF:
	LDA.w !ContextDependentTable,x
	INX
	AND.w #$00FF
	BEQ.b CODE_81B906
	LSR
	TAY
	BCS.b CODE_81B8F9
CODE_81B8EC:
	LDA.w !ContextDependentTable,x
	INX
	INX
	STA.w !REGISTER_WriteToVRAMPortLo
	DEY
	BNE.b CODE_81B8EC
	BEQ.b CODE_81B8DF				; Note: This will always branch.

CODE_81B8F9:
	LDA.w !ContextDependentTable,x
	INX
	INX
CODE_81B8FE:
	STA.w !REGISTER_WriteToVRAMPortLo
	DEY
	BNE.b CODE_81B8FE
	BEQ.b CODE_81B8DF				; Note: This will always branch.

CODE_81B906:
	RTS

DATA_81B907:
	dw DATA_81B915
	dw DATA_81B91B
	dw DATA_81B91F
	dw DATA_81B915
	dw DATA_81B91B
	dw DATA_81B91F
	dw DATA_81B921

DATA_81B915:
	dw CODE_81B935
	dw CODE_81B93A
	dw CODE_81BBAB

DATA_81B91B:
	dw CODE_81B935
	dw CODE_81BBAB

DATA_81B91F:
	dw CODE_81B93A
DATA_81B921:
	dw CODE_81BBAB

DATA_81B923:
	dw $0C00,$0C80

CODE_81B927:
	LDA.w #$0104
	STA.w $0F86
	LDA.b $B6
	LDX.w #DATA_81B907
	JMP.w CODE_81BB9C

CODE_81B935:
	LDY.w #$0000
	BRA.b CODE_81B93D

CODE_81B93A:
	LDY.w #$0002
CODE_81B93D:
	SEP.b #$20
	LDX.w DATA_81B923,y
	LDA.b #$8A
	STA.b $30,x
	LDA.b #$8B
	STA.b $36,x
	REP.b #$20
	RTS

;--------------------------------------------------------------------

CODE_81B94D:
	RTL

;--------------------------------------------------------------------

DATA_81B94E:
	dw $001C,$003A

;--------------------------------------------------------------------

CODE_81B952:
	LDA.w $1DCE
	BNE.b CODE_81B963
	LDY.w #$0000
	JSR.w CODE_81B991
	LDY.w #$0002
	JSR.w CODE_81B991
CODE_81B963:
	RTS

;--------------------------------------------------------------------

CODE_81B964:
	LDY.w #$0000
	JMP.w CODE_81B96D

CODE_81B96A:
	LDY.w #$0002
CODE_81B96D:
	LDX.b $C8,y
	LDA.b $10,x
	AND.w #$0020
	BEQ.b CODE_81B991
	LDA.w $0D56,y
	BEQ.b CODE_81B98B
	ADC.w #$00F6
	LDA.w DATA_81B94E,y
	CLC
	ADC.w #$0F32
	LDX.w DATA_81B923,y
	TAY
	BRA.b CODE_81B997

CODE_81B98B:
	ORA.w #$8000
	STA.w $0D56,y
CODE_81B991:
	LDX.w DATA_81B923,y
	LDY.w $0F86
CODE_81B997:
	SEP.b #$20
	JSR.w CODE_81B9A8
	DEY
	DEY
	JSR.w CODE_81B9A8
	DEY
	JSR.w CODE_81B9A8
	REP.b #$20
	RTS

CODE_81B9A8:
	LDA.w $0000,y
	LSR
	LSR
	LSR
	LSR
	ORA.b #$80
	STA.b $2C,x
	ORA.b #$10
	STA.b $6C,x
	INX
	INX
	LDA.w $0000,y
	AND.b #$0F
	ORA.b #$80
	STA.b $2C,x
	ORA.b #$10
	STA.b $6C,x
	INX
	INX
	INX
	INX
	RTS

;--------------------------------------------------------------------

CODE_81B9CB:
	STA.w $0059,y
	ORA.b #$00
CODE_81B9D0:
	RTS

;--------------------------------------------------------------------

DATA_81B9D1:
	dw $3C8F : dl $000C00 : dw $0100

DATA_81B9D8:
	dw $3C8F : dl $7FFE00 : dw $0100

CODE_81B9DF:
	LDX.w #DATA_81B9D1
	JSL.l CODE_819587
	LDX.w #DATA_81B9D8
	JSL.l CODE_819587
	LDA.w #$0080
	STA.w !REGISTER_VRAMAddressIncrementValue
	LDA.w #$7B00
	STA.w !REGISTER_VRAMAddressLo
	LDX.w #$0100
	LDA.w #$3C8F
CODE_81B9FF:
	STA.w !REGISTER_WriteToVRAMPortLo
	DEX
	BNE.b CODE_81B9FF
	LDA.w #$0C00
	STA.w $0D00
	LDA.w #$0C80
	STA.w $0D02
	STZ.w $0D04
	STZ.w $0D06
	LDA.w $0E50
	BPL.b CODE_81BA32
	LDA.w #$FE00
	STA.w $0D00
	LDA.w #$FE80
	STA.w $0D02
	LDA.w #$007F
	STA.w $0D04
	STA.w $0D06
	RTS

CODE_81BA32:
	JSR.w CODE_81B927
	JSR.w CODE_81B87E
	JMP.w CODE_81BB17

;--------------------------------------------------------------------

CODE_81BA3B:
	SEP.b #$20
	LDA.b #$80
	STA.w !REGISTER_VRAMAddressIncrementValue
	LDX.w #(!REGISTER_WriteToVRAMPortLo&$0000FF<<8)+$01
	STX.w DMA[$00].Parameters
	BRA.b CODE_81BA5C

CODE_81BA4A:
	SEP.b #$20
	LDA.b #$80
	STA.w !REGISTER_VRAMAddressIncrementValue
	LDX.w #(!REGISTER_WriteToVRAMPortLo&$0000FF<<8)+$01
	STX.w DMA[$00].Parameters
	LDA.b $34
	LSR
	BCC.b CODE_81BA84
CODE_81BA5C:
	LDY.w $0D00
	STY.w DMA[$00].SourceLo
	LDA.w $0D04
	BEQ.b CODE_81BA6D
	LDY.w #$7B12
	JSR.w CODE_81BAAC
CODE_81BA6D:
	STA.w DMA[$00].SourceBank
	LDX.w #$0080
	STX.w DMA[$00].SizeLo
	LDY.w #$7B20
	STY.w !REGISTER_VRAMAddressLo
	LDA.b #$01
	STA.w !REGISTER_DMAEnable
	REP.b #$20
	RTL

CODE_81BA84:
	LDY.w $0D02
	STY.w DMA[$00].SourceLo
	LDA.w $0D06
	BEQ.b CODE_81BA95
	LDY.w #$7B92
	JSR.w CODE_81BAAC
CODE_81BA95:
	STA.w DMA[$00].SourceBank
	LDX.w #$0080
	STX.w DMA[$00].SizeLo
	LDY.w #$7BA0
	STY.w !REGISTER_VRAMAddressLo
	LDA.b #$01
	STA.w !REGISTER_DMAEnable
	REP.b #$20
	RTL

CODE_81BAAC:
	STY.w !REGISTER_VRAMAddressLo
	LDY.w #$3CCF
	STY.w !REGISTER_WriteToVRAMPortLo
	STY.w !REGISTER_WriteToVRAMPortLo
	STY.w !REGISTER_WriteToVRAMPortLo
	STY.w !REGISTER_WriteToVRAMPortLo
	RTS

;--------------------------------------------------------------------

DATA_81BABF:
	db $A7,$A8,$A9,$AA,$AB,$B7,$B8,$B9
	db $BA,$BB

CODE_81BAC9:
	LDY.b $B8
	SEP.b #$20
	LDX.w $0154,y
	BEQ.b CODE_81BAD3
	DEX
CODE_81BAD3:
	LDA.w DATA_81BABF,x
	LDX.b $CE
	STA.w $004E,x
	LDA.w $0E00,y
	STA.w !REGISTER_DividendLo
	STZ.w !REGISTER_DividendHi
	LDA.b #$0A
	STA.w !REGISTER_Divisor
	LDA.w $0E00,y
	BNE.b CODE_81BAF8
	LDA.b $38
	AND.b #$08
	BEQ.b CODE_81BAF8
	LDA.b #$2A
	BRA.b CODE_81BAFA

CODE_81BAF8:
	LDA.b #$28
CODE_81BAFA:
	LDY.b $CE
	STA.w $005B,y
	STA.w $005F,y
	LDX.w !REGISTER_QuotientLo
	LDA.w DATA_81BABF,x
	STA.w $005A,y
	LDX.w !REGISTER_ProductOrRemainderLo
	LDA.w DATA_81BABF,x
	STA.w $005E,y
	REP.b #$20
	RTS

;--------------------------------------------------------------------

CODE_81BB17:
	JSR.w CODE_8181C4
	JSR.w CODE_81BB23
	JSR.w CODE_8181C9
	JMP.w CODE_81BB23

CODE_81BB23:
	LDX.b $B8
	LDA.b $C8,x
	BMI.b CODE_81BB44
	LDX.b $2C
	LDY.w DATA_81BB57,x
	BEQ.b CODE_81BB43
	LDA.w DATA_81BB53,x
	CLC
	ADC.b $CE
	STA.b $3C
	LDA.w #$54B6
	JSR.w CODE_81AA6C
	LDX.b $CE
	STZ.w $0204,x
CODE_81BB43:
	RTS

CODE_81BB44:
	RTS

CODE_81BB45:
	LDA.w #$AAAA
	BRA.b CODE_81BB4F

CODE_81BB4A:
	LDY.b $CE
	LDA.w #$5555
CODE_81BB4F:
	STA.w $0204,y
	RTL

DATA_81BB53:
	dw $0040,$0050

DATA_81BB57:
	dw DATA_81BB5F,DATA_81BB67,$0000,$0000

DATA_81BB5F:
	dw $2804,$0000,$5F5E,$AA4E

DATA_81BB67:
	dw $2804,$0808,$4E4F,$A7A7

UNK_C1BB6F:
	db $00

;--------------------------------------------------------------------

CODE_81BB70:
	LDA.w $1F26
	AND.w #$00FF
	XBA
	EOR.w $1F26
	XBA
	STA.w $1F26
	XBA
	AND.w #$00FF
	ASL
	EOR.w $1F26
	LSR
	EOR.w #$FF80
	BCC.b CODE_81BB93
	EOR.w #$8180
CODE_81BB8F:
	STA.w $1F26
	RTL

CODE_81BB93:
	CMP.w #$AA55
	BNE.b CODE_81BB8F
	STZ.w $1F26
	RTL

;--------------------------------------------------------------------

CODE_81BB9C:
	TAY
	STX.b $02
	LDA.b ($02),y
	TAX
CODE_81BBA2:
	PHX
	JSR.w (!ContextDependentTable,x)
	PLX
	INX
	INX
	BRA.b CODE_81BBA2

CODE_81BBAB:
	PLA
	PLA
	RTS

;--------------------------------------------------------------------

CODE_81BBAE:
	RTS

;--------------------------------------------------------------------

CODE_81BBAF:
	RTS

;--------------------------------------------------------------------

CODE_81BBB0:
	STZ.w $0162
	LDA.w $0E50
	BNE.b CODE_81BBC1
	LDA.w $0E32
	BNE.b CODE_81BBC1
	LDA.b $2C
	BEQ.b CODE_81BBC2
CODE_81BBC1:
	RTS

CODE_81BBC2:
	LDX.w #DATA_81BCC8
	JSL.l CODE_819587
	LDA.w !RAM_SMK_Global_CurrentRound
	CMP.w #$0004
	BEQ.b CODE_81BBFE
	ASL
	ADC.w #DATA_81BCB8
	TAY
	LDX.w #$7FD8C0
	JSR.w CODE_8193C5
	LDA.w !RAM_SMK_Global_CurrentRound
	ASL
	ADC.w #DATA_81BCC0
	TAY
	LDX.w #$7FDAC0
	JSR.w CODE_8193C5
	LDY.w #DATA_81BCA0
	LDX.w #$7FD800
	JSR.w CODE_8193C5
	LDY.w #DATA_81BCA6
	LDX.w #$7FDA00
	JSR.w CODE_8193C5
	BRA.b CODE_81BC10

CODE_81BBFE:
	LDY.w #DATA_81BCAC
	LDX.w #$7FD820
	JSR.w CODE_8193C5
	LDY.w #DATA_81BCB2
	LDX.w #$7FDA20
	JSR.w CODE_8193C5
CODE_81BC10:
	LDY.w #$0000
	LDX.w #$0000
	LDA.w #$5000
	JSR.w CODE_81BC64
	LDA.w #$6000
	JSR.w CODE_81BC64
	JSR.w CODE_8181C4
	LDX.b $B8
	LDA.w $0154,x
	BEQ.b CODE_81BC3B
	LDX.w #$0260
	STX.b $3C
	LDA.w #$3064
	LDY.w #DATA_81BC8B
	JSL.l CODE_80C056
CODE_81BC3B:
	JSR.w CODE_8181C9
	LDX.b $B8
	LDA.w $0154,x
	BEQ.b CODE_81BC57
	LDX.w #$0480
	STX.b $3C
	LDA.w #$3064
	CLC
	ADC.b $BA
	LDY.w #DATA_81BC8B
	JSL.l CODE_80C056
CODE_81BC57:
	SEP.b #$20
	LDA.b #$55
	STA.w $0406
	STA.w $0626
	REP.b #$20
	RTS

CODE_81BC64:
	PHX
	LDX.w #$0080
	STX.w !REGISTER_VRAMAddressIncrementValue
	STA.w !REGISTER_VRAMAddressLo
	LDA.w #$0020
	STA.b $02
	PLA
CODE_81BC74:
	LDX.w #$0008
CODE_81BC77:
	STY.w !REGISTER_WriteToVRAMPortLo
	DEX
	BNE.b CODE_81BC77
	LDX.w #$0008
CODE_81BC80:
	STA.w !REGISTER_WriteToVRAMPortLo
	DEX
	BNE.b CODE_81BC80
	DEC.b $02
	BNE.b CODE_81BC74
	RTS

;--------------------------------------------------------------------

DATA_81BC8B:
	db $84,$00,$00,$00,$08,$00,$10,$00
	db $02,$08,$00,$20,$00,$04,$08,$00
	db $30,$00,$06,$08,$00

DATA_81BCA0:
	db $62,$5C,$68,$5A,$46,$00

DATA_81BCA6:
	db $63,$5D,$69,$5B,$47,$00

DATA_81BCAC:
	db $4A,$50,$5A,$40,$56,$00

DATA_81BCB2:
	db $4B,$51,$5B,$41,$57,$00

DATA_81BCB8:
	dw $00CA,$00CC,$00CE,$00D0

DATA_81BCC0:
	dw $00CB,$00CD,$00CF,$00D1

DATA_81BCC8:
	dw $0000 : dl $7FD800 : dw $0400

DATA_81BCCF:
	dw $0000,$5000,$0200,$0000,$6000,$0200

;--------------------------------------------------------------------

CODE_81BCDB:
	PLB
	RTL

CODE_81BCDD:
	PHB
	PHK
	PLB
	LDA.w $0F84
	BPL.b CODE_81BCDB
	BIT.w #$0020
	BEQ.b CODE_81BCEF
	STZ.w $0F84
	BRA.b CODE_81BCDB

CODE_81BCEF:
	LDX.w #$0081
	STX.w !REGISTER_VRAMAddressIncrementValue
	BIT.w $0F84
	BVC.b CODE_81BCFD
	EOR.w #$001F
CODE_81BCFD:
	AND.w #$00FF
	BIT.w #$0010
	BEQ.b CODE_81BD15
	AND.w #$FFEF
	BIT.w #$0008
	BEQ.b CODE_81BD10
	ORA.w #$0100
CODE_81BD10:
	ORA.w #$0008
	BRA.b CODE_81BD20

CODE_81BD15:
	BIT.w #$0008
	BEQ.b CODE_81BD20
	AND.w #$0007
	ORA.w #$0100
CODE_81BD20:
	ASL
	BIT.w $0F84
	BVC.b CODE_81BD2A
	CLC
	ADC.w #$0100
CODE_81BD2A:
	TAX
	LDA.w $0F84
	AND.w #$00FF
	BIT.w $0F84
	BVC.b CODE_81BD39
	EOR.w #$001F
CODE_81BD39:
	BIT.w #$0010
	BEQ.b CODE_81BD4E
	AND.w #$FFEF
	BIT.w #$0008
	BEQ.b CODE_81BD49
	ORA.w #$0100
CODE_81BD49:
	ORA.w #$0008
	BRA.b CODE_81BD59

CODE_81BD4E:
	BIT.w #$0008
	BEQ.b CODE_81BD59
	AND.w #$0007
	ORA.w #$0100
CODE_81BD59:
	ORA.w #$5000
	LDY.w $0154
	BEQ.b CODE_81BD64
	JSR.w CODE_81BD75
CODE_81BD64:
	LDY.w $0156
	BEQ.b CODE_81BD70
	CLC
	ADC.w #$1000
	JSR.w CODE_81BD75
CODE_81BD70:
	INC.w $0F84
	PLB
	RTL

CODE_81BD75:
	PHX
	PHA
	JSR.w CODE_81BD8C
	CLC
	ADC.w #$0010
	TAY
	TXA
	CLC
	ADC.w #$0020
	TAX
	TYA
	JSR.w CODE_81BD8C
	PLA
	PLX
	RTS

CODE_81BD8C:
	PHA
	PHX
	STA.w !REGISTER_VRAMAddressLo
	LDY.w #$0004
CODE_81BD94:
	LDA.l $7FD800,x
	STA.w !REGISTER_WriteToVRAMPortLo
	TXA
	CLC
	ADC.w #$0040
	TAX
	DEY
	BNE.b CODE_81BD94
	PLX
	PLA
	RTS

;--------------------------------------------------------------------

CODE_81BDA7:
	LDA.w $0F80
	ASL
	TAX
	JMP.w (DATA_81BDAF,x)

DATA_81BDAF:
	dw CODE_81BDB9
	dw CODE_81BDBA
	dw CODE_81BDDA
	dw CODE_81BDEF
	dw CODE_81BE0D

CODE_81BDB9:
	RTS

CODE_81BDBA:
	BIT.w $0E32
	BPL.b CODE_81BDC3
	STZ.w $0F80
	RTS

CODE_81BDC3:
	LDA.w #$00B4
	STA.w $0F82
	INC.w $0F80
	LDA.w #$8000
	STA.w $0F84
	LDA.w #$00AA
	LDX.w #$0006
	BRA.b CODE_81BE15

CODE_81BDDA:
	DEC.w $0F82
	BNE.b CODE_81BDEE
	LDA.w #$C000
	STA.w $0F84
	LDA.w #$0040
	STA.w $0F82
	INC.w $0F80
CODE_81BDEE:
	RTS

CODE_81BDEF:
	DEC.w $0F82
	BNE.b CODE_81BE0C
	LDA.w #$0008
	STA.w $0FBC
	INC.w $0F80
	LDY.w #$0000
	JSR.w CODE_81BE28
	LDA.w #$0055
	LDX.w #$0006
	JMP.w CODE_81BE15

CODE_81BE0C:
	RTS

CODE_81BE0D:
	STZ.w $0F80
	LDY.w #$0002
	BRA.b CODE_81BE28

CODE_81BE15:
	SEP.b #$20
	BIT.b $C9
	BMI.b CODE_81BE1E
	STA.w $0400,x
CODE_81BE1E:
	BIT.b $CB
	BMI.b CODE_81BE25
	STA.w $0620,x
CODE_81BE25:
	REP.b #$20
	RTS

CODE_81BE28:
	LDA.w $0154,y
	BEQ.b CODE_81BE33
	LDX.w #$0002
	JSR.w CODE_81A971
CODE_81BE33:
	RTS

;--------------------------------------------------------------------

CODE_81BE34:
	LDA.w #$0001
	STA.w $0D4C
	STA.w $0D4E
	RTS

;--------------------------------------------------------------------

CODE_81BE3E:
	JMP.w CODE_81BE44

CODE_81BE41:
	JMP.w CODE_81BE44

CODE_81BE44:
	LDX.b $B8
	LDY.b $C8,x
	LDA.w $008C,y
	BIT.w #$8000
	BEQ.b CODE_81BE5D
	AND.w #$7FFF
	STA.w $008C,y
	TXA
	JSL.l CODE_84D943
	BRA.b CODE_81BE76

CODE_81BE5D:
	BIT.w #$0001
	BEQ.b CODE_81BE76
	AND.w #$FFFE
	STA.w $008C,y
	PHY
	JSR.w CODE_81BE77
	PLX
	BCC.b CODE_81BE76
	LDA.w #$8000
	ORA.b $8C,x
	STA.b $8C,x
CODE_81BE76:
	RTS

CODE_81BE77:
	LDY.w DATA_81BEAB,x
	LDA.w #$0002
	STA.b $00
CODE_81BE7F:
	LDX.w !ContextDependentTable,y
	BEQ.b CODE_81BE95
	INY
	INY
	LDA.b $12,x
	AND.w #$2000
	BEQ.b CODE_81BE91
	STX.b $02
	BRA.b CODE_81BE7F

CODE_81BE91:
	DEC.b $00
	BRA.b CODE_81BE7F

CODE_81BE95:
	LDA.b $00
	BMI.b CODE_81BEA9
	LDX.b $02
	LDA.w #$1000
	STA.b $12,x
	LDA.b $00
	LDX.b $B8
	STA.w $0D4C,x
	SEC
	RTS

CODE_81BEA9:
	CLC
	RTS

DATA_81BEAB:
	dw DATA_81BEAF
	dw DATA_81BEB7

DATA_81BEAF:
	dw $1800,$1880,$1900,$0000

DATA_81BEB7:
	dw $1980,$1238,$1338,$0000

;--------------------------------------------------------------------

CODE_81BEBF:
	STZ.w $1EB6
	STZ.w $1EB4
	RTS

;--------------------------------------------------------------------

DATA_81BEC6:
	dw $CCC0,$C4C8

CODE_81BECA:
	LDA.w $1EB4
	CMP.w #$001E
	BCC.b CODE_81BF28
	LDX.w $1EB6
	LDA.l $7FDF80,x
	CMP.w #$FFFF
	BEQ.b CODE_81BF29
	AND.w #$00FF
	TAX
	LDA.l DATA_81BEC6,x
	TAY
	LDX.w $1EB6
	LDA.l $7FDF81,x
	INX
	INX
	INX
	STX.w $1EB6
	STZ.w !REGISTER_VRAMAddressIncrementValue
	STA.w !REGISTER_VRAMAddressLo
	TAX
	CLC
	ADC.w #$0080
	PHA
	SEP.b #$20
	TYA
	STA.l $7F0000,x
	STA.w !REGISTER_WriteToVRAMPortLo
	INC
	STA.l $7F0001,x
	STA.w !REGISTER_WriteToVRAMPortLo
	INC
	PLY
	STY.w !REGISTER_VRAMAddressLo
	STA.l $7F0080,x
	STA.w !REGISTER_WriteToVRAMPortLo
	INC
	STA.l $7F0081,x
	STA.w !REGISTER_WriteToVRAMPortLo
	REP.b #$20
CODE_81BF28:
	RTL

CODE_81BF29:
	STZ.w $1EB4
	STZ.w $1EB6
	RTL

;--------------------------------------------------------------------

CODE_81BF30:
	LDA.b $2C
	CMP.w #$0004
	BNE.b CODE_81BF64
	LDA.w $0174
	CMP.w #$0002
	BNE.b CODE_81BF64
	JSL.l CODE_84E8B9
	BCS.b CODE_81BF64
	SEP.b #$20
	LDA.l $30600E
	ASL
	ASL
	ASL
	ADC.l $30600F
	REP.b #$20
	AND.w #$00FF
	ASL
	ASL
	ASL
	ASL
	ADC.w #$1880
	TAX
	LDA.w #$0006
	STA.b $08,x
CODE_81BF64:
	RTS

;--------------------------------------------------------------------

CODE_81BF65:
	LDA.w $1F2A
	BPL.b CODE_81BF7E
	LDA.w #$1000
	TSB.w $1F2A
	LDX.w #$7F6000
	LDY.w #$7F8000
	LDA.w #$0BFF
	PHB
	MVN $7F8000>>16,$7F6000>>16
	PLB
CODE_81BF7E:
	RTS

;--------------------------------------------------------------------

CODE_81BF7F:
	LDA.w #$E000
	ORA.w $0125-$01
	STA.w $1F2A
	LDA.w #$FFFF
	STA.w $0E60
	RTS

;--------------------------------------------------------------------

DATA_81BF8F:
	dw $000C,$0000

CODE_81BF93:
	PHB
	PHK
	PLB
	JSL.l CODE_81DB5C
	STZ.w $1F20
	STZ.w $1F24
	JSR.w CODE_81C733
	LDA.w DATA_81BF8F,x
	STA.b $B6
	LDX.w #CODE_80B943
	JSL.l CODE_80BA28
	JSR.w CODE_81853C
	LDA.w #$0005
	STA.w $0D0A
	JSR.w CODE_81BF65
	JSR.w CODE_81BF30
	LDA.w !RAM_SMK_Global_CurrentRound
	CMP.w #$0005
	BNE.b CODE_81BFD2
	STZ.w !RAM_SMK_Global_CurrentRound
	STZ.w !RAM_SMK_Global_RaceCup
	LDA.w #!Define_SMK_RacetrackID_MarioCircuit1
	STA.w !RAM_SMK_Race_CurrentRacetrack
CODE_81BFD2:
	JSL.l CODE_84EA17
	LDA.w #$0006
	STA.w $1E88
	STA.w $1E8A
	LDA.w #$E0E0
	STA.w $016C
	STA.w $016E
	STA.w $0170
	JSL.l CODE_84ECC0
	JSR.w CODE_81B9DF
	LDX.w #CODE_80B93E
	JSL.l CODE_80BA28
	LDA.w #$7FFE80>>16
	STA.w $0D04
	STA.w $0D06
	LDA.w #$FE00
	STA.w $0D00
	LDA.w #$7FFE80
	STA.w $0D02
	JSL.l CODE_81BA3B
	LDX.w #DATA_81C07B
	JSL.l CODE_8194F4
	LDX.w #DATA_81C085
	JSL.l CODE_8194F4
	STZ.w $1D0E
	STZ.w $1D0A
	STZ.w $1D00
	STZ.w $1D02
	STZ.w $1D04
	STZ.w $1D06
	STZ.w $1D08
	STZ.w $1D0C
	STZ.w $1D20
	STZ.w $1D2C
	JSR.w CODE_81C733
	BNE.b CODE_81C061
	LDA.w !RAM_SMK_Race_CurrentRacetrack
	CMP.w #!Define_SMK_RacetrackID_BattleCourse3
	BCS.b CODE_81C051
	LDA.w #!Define_SMK_RacetrackID_BattleCourse1
	STA.w !RAM_SMK_Race_CurrentRacetrack
CODE_81C051:
	SEC
	SBC.w #$0014
	TAX
	LDA.w DATA_81C160,x
	AND.w #$00FF
	STA.w $1D00
	BRA.b CODE_81C075

CODE_81C061:
	JSR.w CODE_81EC47
	LDA.w !RAM_SMK_Global_RaceCup
	STA.w $1D00
	ASL
	TAX
	LDA.w !RAM_SMK_Global_CurrentRound
	STA.w $1D02,x
	INC.w $1D20
CODE_81C075:
	JSL.l CODE_81C740
	PLB
	RTL

DATA_81C07B:
	db $80 : dw $5000,(!REGISTER_WriteToVRAMPortLo&$0000FF<<8)+$01 : dl $7FA000 : dw $2000

DATA_81C085:
	db $80 : dw $6000,(!REGISTER_WriteToVRAMPortLo&$0000FF<<8)+$01 : dl $7FA000 : dw $2000

;--------------------------------------------------------------------

CODE_81C08F:
	PHB
	PHK
	PLB
	SEP.b #$20
	LDA.w !RAM_SMK_Global_ScreenDisplayRegister
	CMP.b #!ScreenDisplayRegister_MaxBrightness0F
	REP.b #$20
	BNE.b CODE_81C0A1
	JSL.l CODE_80B9DF
CODE_81C0A1:
	LDA.w $1D20
	ASL
	LDX.w $1D26
	JSR.w (DATA_81C0BA,x)
	JSR.w CODE_81C0E2
	PLB
	RTL

CODE_81C0B0:
	TAX
	JMP.w (DATA_81C0BE,x)

CODE_81C0B4:
	TAX
	JMP.w (DATA_81C0D4,x)

CODE_81C0B8:
	PLB
	RTL

DATA_81C0BA:
	dw CODE_81C0B0
	dw CODE_81C0B4

DATA_81C0BE:
	dw CODE_81C2B5
	dw CODE_81C2A4
	dw CODE_81C27F
	dw CODE_81C299
	dw CODE_81C25F
	dw CODE_81C26B
	dw CODE_81C228
	dw CODE_81C107
	dw CODE_81C1B4
	dw CODE_81C1B4
	dw CODE_81C1A2

DATA_81C0D4:
	dw CODE_81C108
	dw CODE_81C164
	dw CODE_81C299
	dw CODE_81C25F
	dw CODE_81C26B
	dw CODE_81C198
	dw CODE_81C107

CODE_81C0E2:
	LDX.w #$0000
	LDA.w $1D24
	CLC
	ADC.w #$0010
	STA.w $1D24
	JSL.l CODE_80B9C6
	JSL.l CODE_83F2FA
	LDX.w #$1000
	INC.b $18,x
	LDA.w #$80C0
	STA.b $AC
	LDA.w #$0000
	STA.b $94
	RTS

CODE_81C107:
	RTS

CODE_81C108:
	JSL.l CODE_84ECC0
	JSR.w CODE_81C5F6
	JSR.w CODE_81C2F0
	JSR.w CODE_81C4A8
	JSR.w CODE_81C2E8
	JSR.w CODE_81C5D3
	LDA.w $0D10
	AND.w #$9000
	BEQ.b CODE_81C13D
	JSL.l CODE_84D978
	INC.w $1D20
	LDA.w $1D00
	ASL
	ASL
	ASL
	ASL
	ADC.w #$1800
	TAX
	LDA.w #$0002
	STA.b $04,x
	JSR.w CODE_81C143
CODE_81C13D:
	JSR.w CODE_81C580
	JMP.w CODE_81C591

CODE_81C143:
	LDY.w #$0004
	LDX.w #$1800
CODE_81C149:
	LDA.b $04,x
	BNE.b CODE_81C150
	LDA.w #$0008
CODE_81C150:
	STA.b $04,x
	TXA
	CLC
	ADC.w #$0010
	TAX
	DEY
	BNE.b CODE_81C149
	RTS

DATA_81C15C:
	db !Define_SMK_RacetrackID_BattleCourse1
	db !Define_SMK_RacetrackID_BattleCourse2
	db !Define_SMK_RacetrackID_BattleCourse3
	db !Define_SMK_RacetrackID_BattleCourse4

DATA_81C160:
	db $02,$03,$00,$01

CODE_81C164:
	LDX.w $1D20
	LDY.w $1D00
	LDA.w DATA_81C15C,y
	AND.w #$00FF
	CMP.w !RAM_SMK_Race_CurrentRacetrack
	STA.w !RAM_SMK_Race_CurrentRacetrack
	BNE.b CODE_81C180
	INX
	INX
	INX
	INX
	STX.w $1D20
CODE_81C17F:
	RTS

CODE_81C180:
	INX
	STX.w $1D20
	LDA.w #$0008
	STA.w $1E88
	STA.w $1E8A
	JSL.l CODE_84ECC0
	JSR.w CODE_81C2F0
	JSR.w CODE_81C4A8
	RTS

CODE_81C198:
	JSR.w CODE_81C2F0
	JSR.w CODE_81C414
	JSR.w CODE_81C52C
	RTS

CODE_81C1A2:
	JSR.w CODE_81C2E8
	JSR.w CODE_81DBBC
	JSR.w CODE_81C4CE
	DEC.w $1D2A
	BNE.b CODE_81C1B3
	STZ.w $1D20
CODE_81C1B3:
	RTS

CODE_81C1B4:
	LDY.w #$0029
	LDA.w #$0101
	LDX.w #$1D0A
	JSR.w CODE_81C8E5
	LDA.w $0028
	BIT.w #$0040
	BNE.b CODE_81C1D2
	BIT.w #$9000
	BEQ.b CODE_81C1F3
	LDA.w $1D0A
	BEQ.b CODE_81C1D7
CODE_81C1D2:
	STZ.w $1D20
	BRA.b CODE_81C1F3

CODE_81C1D7:
	JSL.l CODE_81DB32
	BCS.b CODE_81C1E3
	LDA.w #$0009
	STA.w $1D20
CODE_81C1E3:
	INC.w $1D20
	LDA.w #$0029
	JSL.l CODE_81F5A7
	LDA.w #$003C
	STA.w $1D2A
CODE_81C1F3:
	JSR.w CODE_81C2F0
	LDA.w #$0818
	LDY.w #DATA_81CA60
	LDX.w #$0000
	JSR.w CODE_81C838
	LDA.w #$0890
	LDY.w #DATA_81CA75
	LDX.w #$0000
	JSR.w CODE_81C838
	LDA.w #$0886
	LDX.w $1D0A
	BEQ.b CODE_81C219
	LDA.w #$08AE
CODE_81C219:
	LDY.w #DATA_81CA4C
	JSR.w CODE_81AA6C
	JSR.w CODE_81C2E8
	JSR.w CODE_81DBBC
	JMP.w CODE_81C4CE

CODE_81C228:
	JSR.w CODE_81C2F0
	JSR.w CODE_81C414
	JSR.w CODE_81C52C
	JSR.w CODE_81C555
	LDA.b $2C
	CMP.w #$0004
	BNE.b CODE_81C25E
	LDA.b $20
	AND.w #$40B0
	CMP.w #$40B0
	BNE.b CODE_81C255
	JSL.l CODE_84D978
	LDA.w #$0008
	STA.w $1D20
	LDA.w #$0001
	STA.w $1D0A
CODE_81C255:
	JSR.w CODE_81C2E8
	JSR.w CODE_81DBBC
	JSR.w CODE_81C4CE
CODE_81C25E:
	RTS

CODE_81C25F:
	LDA.w #$8000
	STA.w $1D0C
	JSL.l CODE_84ECC0
	BRA.b CODE_81C295

CODE_81C26B:
	JSL.l CODE_84ECC0
	LDA.w $1D0C
	BNE.b CODE_81C298
	LDA.w #$000A
	STA.w $1E88
	STA.w $1E8A
	BRA.b CODE_81C295

CODE_81C27F:
	LDA.w #$0008
	STA.w $1E88
	STA.w $1E8A
	JSL.l CODE_84ECC0
	JSR.w CODE_81C2F0
	JSR.w CODE_81C4ED
	JSR.w CODE_81EC47
CODE_81C295:
	INC.w $1D20
CODE_81C298:
	RTS

CODE_81C299:
	JSR.w CODE_81E67A
	JSL.l CODE_83F2C3
	INC.w $1D20
	RTS

CODE_81C2A4:
	JSL.l CODE_84ECC0
	JSR.w CODE_81C2F0
	JSR.w CODE_81C4ED
	JSR.w CODE_81C2E8
	JSR.w CODE_81C3F4
	RTS

CODE_81C2B5:
	JSL.l CODE_84ECC0
	JSR.w CODE_81C7BC
	JSR.w CODE_81C2F0
	JSR.w CODE_81C4ED
	JSR.w CODE_81C2E8
	JSR.w CODE_81C3F9
	RTS

;--------------------------------------------------------------------

CODE_81C2C9:
	LDY.w #!Define_SMK_RaceCup_StarCup
	LDA.w $1D00
	CMP.w !RAM_SMK_Global_RaceCup
	BNE.b CODE_81C2D5
	DEY
CODE_81C2D5:
	STA.w !RAM_SMK_Global_RaceCup
	ASL
	TAX
	LDA.w $1D02,x
	CMP.w !RAM_SMK_Global_CurrentRound
	BNE.b CODE_81C2E3
	DEY
CODE_81C2E3:
	STA.w !RAM_SMK_Global_CurrentRound
	TYA
	RTS

;--------------------------------------------------------------------

CODE_81C2E8:
	JSR.w CODE_8181C4
	LDX.w #$0200
	BRA.b CODE_81C2F6

CODE_81C2F0:
	JSR.w CODE_8181C9
	LDX.w #$0420
CODE_81C2F6:
	STX.b $3C
	JMP.w CODE_81C828

;--------------------------------------------------------------------

CODE_81C2FB:						; Note: Something related to selecting a course.
	LDA.w $1D22
	CLC
	ADC.w #$0100
	AND.w #$0F00
	STA.w $1D22
	ADC.w #$70FF
	LDX.w #$00A0
	JSR.w CODE_81C333
	LDX.w #$00C0
	LDA.w #$7FF0
	JSR.w CODE_81C333
	LDX.w #$00E0
	LDA.w #$027F
	JSR.w CODE_81C333
	LDX.w #$0000
	LDA.w #$001F
	JSR.w CODE_81C333
	LDA.w #$FFFF
	STA.w $0E8A
	RTL

CODE_81C333:
	STA.l $7E3B82,x
	STA.l $7E3B84,x
	LDA.w #$0000
	STA.l $7E3B86,x
	RTS

;--------------------------------------------------------------------

CODE_81C343:
	PHB
	PHK
	PLB
	JSL.l CODE_81C2FB
	LDX.w #CODE_808413
	JSL.l CODE_80BA28
	JSL.l CODE_81C35B
	JSL.l CODE_83F32E
	PLB
	RTL

CODE_81C35B:
	LDA.w $1D0C
	BEQ.b CODE_81C3AA
	AND.w #$7FFF
	TAX
	CPX.w #$0010
	BCS.b CODE_81C3AB
	SEP.b #$20
	LSR
	LSR
	LSR
	STZ.w DMA[$00].Parameters
	CLC
	ADC.b #!REGISTER_WriteToVRAMPortLo
	STA.w DMA[$00].Destination
	TXA
	ASL
	ASL
	ASL
	ASL
	AND.b #$80
	STA.w !REGISTER_VRAMAddressIncrementValue
	STZ.w DMA[$00].SourceLo
	TXA
	ASL
	ASL
	ASL
	STA.w DMA[$00].SourceHi
	AND.b #$3F
	STA.w !REGISTER_VRAMAddressHi
	STZ.w !REGISTER_VRAMAddressLo
	LDA.b #$7F
	STA.w DMA[$00].SourceBank
	LDY.w #$0800
	STY.w DMA[$00].SizeLo
	LDA.b #$01
	STA.w !REGISTER_DMAEnable
	TXA
	INC
	STA.w $1D0C
	REP.b #$20
CODE_81C3AA:
	RTL

CODE_81C3AB:
	PHB
	PHK
	PLB
	REP.b #$20
	CPX.w #$0010
	BNE.b CODE_81C3BE
	LDX.w #DATA_81C3E0
	JSL.l CODE_8194F4
	BRA.b CODE_81C3CF

CODE_81C3BE:
	CPX.w #$0011
	BNE.b CODE_81C3CC
	LDX.w #DATA_81C3EA
	JSL.l CODE_8194F4
	BRA.b CODE_81C3CF

CODE_81C3CC:
	JSR.w CODE_81E7F6
CODE_81C3CF:
	LDA.w $1D0C
	INC
	CMP.w #$8013
	BNE.b CODE_81C3DB
	LDA.w #$0000
CODE_81C3DB:
	STA.w $1D0C
	PLB
	RTL

DATA_81C3E0:
	db $80 : dw $7000,(!REGISTER_WriteToVRAMPortLo&$0000FF<<8)+$01 : dl $7FC800 : dw $0800

DATA_81C3EA:
	db $80 : dw $7800,(!REGISTER_WriteToVRAMPortLo&$0000FF<<8)+$01 : dl $7FC000 : dw $0600

;--------------------------------------------------------------------

CODE_81C3F4:
	JSR.w CODE_81C65F
	BRA.b CODE_81C40B

CODE_81C3F9:
	JSR.w CODE_81C634
	LDA.w $0D10
	AND.w #$9100
	BEQ.b CODE_81C40B
	JSL.l CODE_84D978
	INC.w $1D20
CODE_81C40B:
	JSR.w CODE_81C585
	JSR.w CODE_81C591
	JMP.w CODE_81C5AD

CODE_81C414:						; Note: Something related to switching the selected course.
	LDY.w #$0D11
	LDA.w #$0101
	LDX.w #$1D0A
	JSR.w CODE_81C8E5
	LDA.w $0D10
	BIT.w #$0040
	BNE.b CODE_81C48F
	BIT.w #$9000
	BEQ.b CODE_81C49F
	LDA.w $1D0A
	BNE.b CODE_81C497
	JSR.w CODE_81C733
	LDA.w DATA_81C4A0,x
	STA.w $0158
	LDA.w DATA_81C4A4,x
	STA.b $32
	LDA.w #$8F00
	STA.b $48
	LDA.w #$0080
	STA.w $015E
	JSL.l CODE_81F4B2
	INC.w $1D20
	LDA.w $1F2A
	BPL.b CODE_81C465
	AND.w #$00FF
	CMP.w !RAM_SMK_Race_CurrentRacetrack
	BEQ.b CODE_81C465
	STZ.w $1F2A
	STZ.w $0E60
CODE_81C465:
	LDA.w !RAM_SMK_Global_CurrentRound
	ASL
	ASL
	ASL
	ASL
	STA.b $00
	LDA.w !RAM_SMK_Global_RaceCup
	XBA
	LSR
	ADC.w #$1880
	ADC.b $00
	TAX
	LDA.b $08,x
	BEQ.b CODE_81C49A
	LDA.b $20
	AND.w #$0030
	BEQ.b CODE_81C49A
	JSR.w CODE_81BF7F
	LDA.w #$0020
	JSL.l CODE_81F5A7
	RTS

CODE_81C48F:
	STZ.w $1D20
	JSL.l CODE_84D97F
	RTS

CODE_81C497:
	STZ.w $1D20
CODE_81C49A:
	JSL.l CODE_84D978
	RTS

CODE_81C49F:
	RTS

DATA_81C4A0:
	dw $0004,$000A

DATA_81C4A4:
	dw $000E,$0002

;--------------------------------------------------------------------

CODE_81C4A8:				; Note: Something battle mode course selection related
	LDA.w !RAM_SMK_Race_CurrentRacetrack
	SEC
	SBC.w #!Define_SMK_RacetrackID_BattleCourse3
	TAX
	LDA.w DATA_81C160,x
	AND.w #$00FF
	ASL
	ASL
	ASL
	ASL
	ADC.w #$1800
	TAX
	LDA.b $02,x
	AND.w #$00FF
	ORA.w #$0800
	LDY.b $06,x
	LDX.w #$0004
	JMP.w CODE_81C838

;--------------------------------------------------------------------

CODE_81C4CE:
	LDA.w !RAM_SMK_Global_CurrentRound
	ASL
	ASL
	ASL
	ASL
	STA.b $00
	LDA.w !RAM_SMK_Global_RaceCup
	XBA
	LSR
	ADC.w #$1880
	ADC.b $00
	TAX
	LDA.w #$1048
	LDY.b $06,x
	LDX.w #$0000
	JMP.w CODE_81C838

;--------------------------------------------------------------------

CODE_81C4ED:
	LDA.w !RAM_SMK_Global_RaceCup
	ASL
	ASL
	ASL
	ASL
	ADC.w #$1800
	TAX
	LDA.b $02,x
	AND.w #$00FF
	ORA.w #$0800
	LDY.b $06,x
	LDX.w #$0004
	JSR.w CODE_81C838
	LDA.w !RAM_SMK_Global_CurrentRound
	ASL
	ASL
	ASL
	ASL
	STA.b $00
	LDA.w !RAM_SMK_Global_RaceCup
	XBA
	LSR
	ADC.w #$1880
	ADC.b $00
	TAX
	LDA.b $02,x
	AND.w #$00FF
	ORA.w #$0800
	LDY.b $06,x
	LDX.w #$0004
	JMP.w CODE_81C838

;--------------------------------------------------------------------

CODE_81C52C:
	LDA.w #$0818
	LDY.w #DATA_81CA68
	LDX.w #$0000
	JSR.w CODE_81C838
	LDA.w #$0890
	LDY.w #DATA_81CA75
	LDX.w #$0000
	JSR.w CODE_81C838
	LDA.w #$0886
	LDX.w $1D0A
	BEQ.b CODE_81C54F
	LDA.w #$08AE
CODE_81C54F:
	LDY.w #DATA_81CA4C
	JMP.w CODE_81AA6C

CODE_81C555:
	LDA.w $1D00
	ASL
	TAX
	LSR
	ORA.w #$0500
	STA.w !REGISTER_Multiplicand
	LDA.w $1D02,x
	CLC
	ADC.w !REGISTER_ProductOrRemainderLo
	ASL
	TAX
	STA.w $1D10
	LDY.w #DATA_81CA52
	LDA.w DATA_81C915,x
	XBA
	CMP.w #$8000
	BCC.b CODE_81C57C
	LDY.w #DATA_81CA59
CODE_81C57C:
	XBA
	JMP.w CODE_81AA6C

CODE_81C580:
	LDA.w #$1056
	BRA.b CODE_81C588


CODE_81C585:
	LDA.w #$1050
CODE_81C588:
	LDY.w #DATA_81C908
	LDX.w #$0000
	JMP.w CODE_81C838

CODE_81C591:
	LDX.w #$1800
CODE_81C594:
	LDA.b $00,x
	BEQ.b CODE_81C5AC
	LDY.b $06,x
	PHX
	LDA.b $04,x
	PHA
	LDA.b $02,x
	PLX
	JSR.w CODE_81C838
	PLA
	CLC
	ADC.w #$0010
	TAX
	BRA.b CODE_81C594

CODE_81C5AC:
	RTS

CODE_81C5AD:
	LDA.w $1D00
	XBA
	LSR
	ADC.w #$1880
	TAX
CODE_81C5B6:
	LDA.b $00,x
	BEQ.b CODE_81C5CE
	LDY.b $06,x
	PHX
	LDA.b $04,x
	PHA
	LDA.b $02,x
	PLX
	JSR.w CODE_81C838
	PLA
	CLC
	ADC.w #$0010
	TAX
	BRA.b CODE_81C5B6

CODE_81C5CE:
	RTS

DATA_81C5CF:
	db $20,$2E,$3C,$4A

CODE_81C5D3:
	LDY.w #$0D11
	LDA.w #$0300
	LDX.w #$1D00
	JSR.w CODE_81C8E5
	LDA.b $00,x
	AND.w #$00FF
	TAY
	LDA.w DATA_81C5CF,y
	XBA
	AND.w #$FF00
	ORA.w #$0046
	LDY.w #DATA_81CA4C
	JSR.w CODE_81AA6C
	RTS

;--------------------------------------------------------------------

CODE_81C5F6:
	STZ.w $1D02
	STZ.w $1D04
	STZ.w $1D06
	STZ.w $1D08
	STZ.w $1D0A
	STZ.w $1804
	STZ.w $1814
	STZ.w $1824
	STZ.w $1834
	STZ.w $1844
	LDX.w #$1880
	LDY.w #$0020
CODE_81C61A:
	LDA.b $08,x
	BNE.b CODE_81C621
	LDA.w #$0008
CODE_81C621:
	STA.b $04,x
	TXA
	CLC
	ADC.w #$0010
	TAX
	DEY
	BNE.b CODE_81C61A
	STZ.w $1D08
	RTS

;--------------------------------------------------------------------

DATA_81C630:
	db $20,$2E,$3C,$4E

CODE_81C634:
	JSR.w CODE_81C5F6
	LDY.w #$0D11
	LDA.w $1D28
	LDX.w #$1D00
	JSR.w CODE_81C8E5
	LDA.b $00,x
	AND.w #$00FF
	TAY
	LDA.w DATA_81C630,y
	XBA
	AND.w #$FF00
	ORA.w #$000E
	LDY.w #DATA_81CA4C
	JSR.w CODE_81AA6C
	RTS

;--------------------------------------------------------------------

DATA_81C65A:
	db $20,$2E,$3C,$4A,$58

CODE_81C65F:
	LDA.w #$0008
	STA.w $1804
	STA.w $1814
	STA.w $1824
	STA.w $1834
	STA.w $1844
	LDX.w #$1880
	LDY.w #$0020
CODE_81C677:
	LDA.b $08,x
	BNE.b CODE_81C67E
	LDA.w #$0000
CODE_81C67E:
	STA.b $04,x
	TXA
	CLC
	ADC.w #$0010
	TAX
	DEY
	BNE.b CODE_81C677
	LDA.w $1D00
	ASL
	ASL
	ASL
	ASL
	ADC.w #$1800
	TAX
	LDA.w #$0002
	STA.b $04,x
	LDY.w #$0D11
	LDA.w $1D00
	ASL
	ADC.w #$1D02
	TAX
	LDA.w #$0400
	JSR.w CODE_81C8E5
	LDA.b $00,x
	AND.w #$00FF
	TAY
	LDA.w DATA_81C65A,y
	XBA
	AND.w #$FF00
	ORA.w #$0076
	TAX
	LDA.w $0D10
	AND.w #$9000
	BEQ.b CODE_81C6F8
	JSL.l CODE_84D978
	LDA.w $1D00
	XBA
	LSR
	ADC.w #$1880
	STA.b $00
	TYA
	ASL
	ASL
	ASL
	ASL
	ADC.b $00
	TAX
	LDA.w #$0002
	STA.b $04,x
	JSR.w CODE_81C70F
	INC.w $1D20
	JSR.w CODE_81C2C9
	BNE.b CODE_81C70E
	LDA.w #$0006
	STA.w $1D20
	LDA.b $2C
	CMP.w #$0004
	BNE.b CODE_81C70E
	PLA
	RTS

CODE_81C6F8:
	TXA
	LDY.w #DATA_81CA4C
	JSR.w CODE_81AA6C
	LDA.w $0D10
	AND.w #$0240
	BEQ.b CODE_81C70E
	JSL.l CODE_84D97F
	DEC.w $1D20
CODE_81C70E:
	RTS

CODE_81C70F:
	LDX.w #$1880
	LDY.w #$0020
CODE_81C715:
	LDA.b $04,x
	BNE.b CODE_81C71C
	LDA.w #$0008
CODE_81C71C:
	STA.b $04,x
	TXA
	CLC
	ADC.w #$0010
	TAX
	DEY
	BNE.b CODE_81C715
	RTS

;--------------------------------------------------------------------

CODE_81C728:
	LDX.w #$1000
	LDA.w #$FFC0
	STA.b $18,x
	STA.b $1C,x
	RTS

;--------------------------------------------------------------------

CODE_81C733:
	LDX.w #$0000
	LDA.b $2C
	CMP.w #$0006
	BEQ.b CODE_81C73F
	INX
	INX
CODE_81C73F:
	RTS

;--------------------------------------------------------------------

CODE_81C740:
	PHB
	PHK
	PLB
	JSR.w CODE_81C728
	JSR.w CODE_81C733
	BEQ.b CODE_81C785
	JSR.w CODE_81C796
	LDY.w #DATA_81C95D
	BCS.b CODE_81C756
	LDY.w #DATA_81C94F
CODE_81C756:
	LDX.w #$1800
	JSR.w CODE_81C7FE
	LDX.w #$1880
	LDY.w #DATA_81C96F
	JSR.w CODE_81C7FE
	LDX.w #$1900
	LDY.w #DATA_81C985
	JSR.w CODE_81C7FE
	LDX.w #$1980
	LDY.w #DATA_81C99B
	JSR.w CODE_81C7FE
	LDY.w #DATA_81C9B1
	LDX.w #$1A00
	JSR.w CODE_81C7FE
	STZ.w $1D26
	PLB
	RTL

CODE_81C785:
	LDX.w #$1800
	LDY.w #DATA_81C93D
	JSR.w CODE_81C7FE
	LDA.w #$0002
	STA.w $1D26
	PLB
	RTL

;--------------------------------------------------------------------

CODE_81C796:
	SEP.b #$21
	LDX.w #$0002
	LDA.w $1F23
	BMI.b CODE_81C7AC
CODE_81C7A0:
	LDA.l $3067F2,x
	AND.b #$03
	DEC
	BNE.b CODE_81C7B3
	DEX
	BPL.b CODE_81C7A0
CODE_81C7AC:
	REP.b #$20
	LDA.w #$0300
	BRA.b CODE_81C7B8

CODE_81C7B3:
	REP.b #$21
	LDA.w #$0200
CODE_81C7B8:
	STA.w $1D28
	RTS

;--------------------------------------------------------------------

CODE_81C7BC:
	LDX.w $1D2C
	SEP.b #$20
	LDA.b $29
	BNE.b CODE_81C7EF
	LDA.b $28
	BEQ.b CODE_81C7F2
	AND.w DATA_81C7F5,x
	BEQ.b CODE_81C7EF
	INX
	CPX.w #$0009
	STX.w $1D2C
	BNE.b CODE_81C7F2
	LDA.b #$80
	TSB.w $1F23
	REP.b #$20
	LDY.w #DATA_81C95D
	LDX.w #$1800
	JSR.w CODE_81C7FE
	LDA.w #$0300
	STA.w $1D28
	SEP.b #$20
CODE_81C7EF:
	STZ.w $1D2C
CODE_81C7F2:
	REP.b #$20
	RTS

DATA_81C7F5:
	db $20,$10,$20,$10,$20,$20,$10,$10
	db $80

CODE_81C7FE:
	LDA.w !ContextDependentTable,y
	BEQ.b CODE_81C825
	STA.b $02,x
	LDA.w !ContextDependentTable+$02,y
	STA.b $06,x
	LDA.b $08,x
	BEQ.b CODE_81C811
	LDA.w #$0006
CODE_81C811:
	STA.b $04,x
	LDA.w #$0001
	STA.b $00,x
	TXA
	CLC
	ADC.w #$0010
	TAX
	TYA
	ADC.w #$0004
	TAY
	BRA.b CODE_81C7FE

CODE_81C825:
	STZ.b $00,x
	RTS

;--------------------------------------------------------------------

CODE_81C828:
	LDA.w #$00E0
	STA.b $00,x
	TXY
	INY
	LDA.w #$01FE
	PHB
	MVN $80,$80					; Note: This is used to affect either sprite OAM buffer.
	PLB
	RTS

;--------------------------------------------------------------------

CODE_81C838:
	STX.b $06
	LDX.b $3C
	CLC
	ADC.b $BA
	STA.b $00
	SEP.b #$20
	LDA.w !ContextDependentTable,y
	STA.b $04
	INY
	JSR.w CODE_81C869
	REP.b #$20
	STX.b $3C
	RTS

CODE_81C851:
	PHY
	SEC
	SBC.b #$E0
	REP.b #$20
	PHA
	AND.w #$00FF
	ASL
	TAY
	LDA.w DATA_81CA32,y
	TAY
	PLA
	SEP.b #$20
	JSR.w CODE_81C869
	PLY
	INY
CODE_81C869:
	LDA.w !ContextDependentTable,y
	CMP.b #$E0
	BCC.b CODE_81C875
	CMP.b #$FF
	BNE.b CODE_81C851
	RTS

CODE_81C875:
	STA.b $02,x
	CMP.b #$2C
	BEQ.b CODE_81C89D
	CMP.b #$2B
	BEQ.b CODE_81C899
	LDA.b $00
	STA.b $00,x
	CLC
	ADC.b #$08
	STA.b $00
	XBA
	STA.b $01,x
	XBA
	LDA.b $06
	EOR.b $04
	STA.b $03,x
	INY
	INX
	INX
	INX
	INX
	BRA.b CODE_81C869

CODE_81C899:
	LDA.b #$08
	BRA.b CODE_81C89F

CODE_81C89D:
	LDA.b #$04
CODE_81C89F:
	CLC
	ADC.b $00
	STA.b $00
	INY
	BRA.b CODE_81C869

;--------------------------------------------------------------------

DATA_81C8A7:
	dw $0408,$0102,$8040

CODE_81C8AD:
	STA.b $00
	STY.b $02
CODE_81C8B1:
	AND.w #$00FF
	ASL
	TAY
	SEP.b #$20
	LDA.b ($02)
	AND.w DATA_81C8A7,y
	BEQ.b CODE_81C8CD
	LDA.b $00,x
	BEQ.b CODE_81C8CD
	DEC.b $00,x
	REP.b #$20
	JSL.l CODE_84D971
	SEP.b #$20
CODE_81C8CD:
	LDA.b ($02)
	AND.w DATA_81C8A7+$01,y
	BEQ.b CODE_81C8E2
	LDA.b $00,x
	CMP.b $01
	BCS.b CODE_81C8E2
	INC.b $00,x
	REP.b #$20
	JSL.l CODE_84D971
CODE_81C8E2:
	REP.b #$20
	RTS

CODE_81C8E5:
	STA.b $00
	STY.b $02
	LDA.b ($02)
	AND.w #$0020
	BEQ.b CODE_81C904
	SEP.b #$20
	LDA.b $00,x
	CMP.b $01
	BCC.b CODE_81C8FA
	LDA.b #$FF
CODE_81C8FA:
	INC
	STA.b $00,x
	REP.b #$20
	JSL.l CODE_84D971
	RTS

CODE_81C904:
	LDA.b $00
	BRA.b CODE_81C8B1

;--------------------------------------------------------------------

DATA_81C908:
	db $29,$36,$37,$38,$39,$3A,$3B,$3C
	db $3D,$3E,$3F,$7F,$FF

DATA_81C915:
	db $CF,$39,$2C,$35,$D5,$3A,$CE,$41
	db $C7,$2C,$C6,$39,$2A,$23,$CC,$3B
	db $24,$27,$25,$2C,$3A,$20,$22,$41
	db $36,$35,$C6,$24,$CD,$38,$2D,$35
	db $9D,$22,$2A,$23,$C3,$34,$24,$26

DATA_81C93D:
	db $50,$20,$C7,$C9,$50,$2E,$CB,$C9
	db $50,$3C,$CF,$C9,$50,$4A,$D3,$C9
	db $00,$00

DATA_81C94F:
	db $18,$20,$D7,$C9,$18,$2E,$DA,$C9
	db $18,$3C,$DD,$C9,$00,$00

DATA_81C95D:
	db $18,$20,$D7,$C9,$18,$2E,$DA,$C9
	db $18,$3C,$DD,$C9,$18,$4E,$E0,$C9
	db $00,$00

DATA_81C96F:
	db $80,$20,$E3,$C9,$80,$2E,$E7,$C9
	db $80,$3C,$EB,$C9,$80,$4A,$EF,$C9
	db $80,$58,$F3,$C9,$00,$00

DATA_81C985:
	db $80,$20,$F7,$C9,$80,$2E,$FB,$C9
	db $80,$3C,$FF,$C9,$80,$4A,$03,$CA
	db $80,$58,$07,$CA,$00,$00

DATA_81C99B:
	db $80,$20,$0B,$CA,$80,$2E,$0F,$CA
	db $80,$3C,$13,$CA,$80,$4A,$17,$CA
	db $80,$58,$1B,$CA,$00,$00

DATA_81C9B1:
	db $80,$20,$1F,$CA,$80,$2E,$23,$CA
	db $80,$3C,$27,$CA,$80,$4A,$2B,$CA
	db $80,$58,$2F,$CA,$00,$00,$29,$EB
	db $01,$FF,$29,$EB,$02,$FF,$29,$EB
	db $03,$FF,$29,$EB,$04,$FF,$29,$E0
	db $FF,$29,$E1,$FF,$29,$E2,$FF,$29
	db $E3,$FF,$29,$E4,$01,$FF,$29,$E6
	db $01,$FF,$29,$E5,$01,$FF,$29,$E7
	db $01,$FF,$29,$E4,$02,$FF,$29,$E9
	db $01,$FF,$29,$E5,$02,$FF,$29,$E6
	db $02,$FF,$29,$E7,$02,$FF,$29,$E4
	db $03,$FF,$29,$EA,$01,$FF,$29,$E9
	db $02,$FF,$29,$E8,$01,$FF,$29,$E7
	db $03,$FF,$29,$E4,$04,$FF,$29,$E6
	db $03,$FF,$29,$EA,$02,$FF,$29,$E5
	db $03,$FF,$29,$E8,$02,$FF,$29,$EC
	db $FF

DATA_81CA32:
	dw DATA_81CA88
	dw DATA_81CA95
	dw DATA_81CAA0
	dw DATA_81CAA9
	dw DATA_81CAB5
	dw DATA_81CAC4
	dw DATA_81CAD2
	dw DATA_81CAE0
	dw DATA_81CAEF
	dw DATA_81CAFD
	dw DATA_81CB0B
	dw DATA_81CB18
	dw DATA_81CB27

DATA_81CA4C:
	db $01,$2B,$00,$00,$E5,$00

DATA_81CA52:
	db $02,$2B,$00,$00,$2B,$2C,$00

DATA_81CA59:
	db $02,$6B,$00,$00,$2C,$2B,$00

DATA_81CA60:
	db $29,$0E,$1B,$0A,$1C,$0E,$24,$FF

DATA_81CA68:
	db $29,$12,$1C,$2C,$1D,$11,$12,$1C
	db $2C,$18,$14,$24,$FF

DATA_81CA75:
	db $29,$22,$0E,$1C,$2C,$2C,$2C,$2C
	db $17,$18,$FF,$29,$0C,$0C,$2C,$1C
	db $0E,$15,$FF

DATA_81CA88:
	db $16,$1E,$1C,$11,$1B,$18,$18,$16
	db $2C,$0C,$1E,$19,$FF

DATA_81CA95:
	db $0F,$15,$18,$20,$0E,$1B,$2C,$0C
	db $1E,$19,$FF

DATA_81CAA0:
	db $1C,$1D,$0A,$1B,$2C,$0C,$1E,$19
	db $FF

DATA_81CAA9:
	db $1C,$19,$0E,$0C,$12,$0A,$15,$2C
	db $0C,$1E,$19,$FF

DATA_81CAB5:
	db $16,$0A,$1B,$12,$18,$2C,$0C,$12
	db $1B,$0C,$1E,$12,$1D,$2C,$FF

DATA_81CAC4:
	db $10,$11,$18,$1C,$1D,$2C,$1F,$0A
	db $15,$15,$0E,$22,$2C,$FF

DATA_81CAD2:
	db $0D,$18,$17,$1E,$1D,$2C,$19,$15
	db $0A,$12,$17,$1C,$2C,$FF

DATA_81CAE0:
	db $0B,$18,$20,$1C,$0E,$1B,$2C,$0C
	db $0A,$1C,$1D,$15,$0E,$2C,$FF

DATA_81CAEF:
	db $1F,$0A,$17,$12,$15,$15,$0A,$2C
	db $15,$0A,$14,$0E,$2C,$FF

DATA_81CAFD:
	db $0C,$11,$18,$0C,$18,$2C,$12,$1C
	db $15,$0A,$17,$0D,$2C,$FF

DATA_81CB0B:
	db $14,$18,$18,$19,$0A,$2C,$0B,$0E
	db $0A,$0C,$11,$2C,$FF

DATA_81CB18:
	db $0B,$0A,$1D,$1D,$15,$0E,$2C,$0C
	db $18,$1E,$1B,$1C,$0E,$2C,$FF

DATA_81CB27:
	db $1B,$0A,$12,$17,$0B,$18,$20,$2C
	db $1B,$18,$0A,$0D,$2C,$FF

;--------------------------------------------------------------------

CODE_81CB35:
	PHB
	PHK
	PLB
	INC.w $0D1A
	LDX.w #CODE_808E01
	JSL.l CODE_80BA28
	PLB
	RTL

;--------------------------------------------------------------------

CODE_81CB44:
	PHB
	PHK
	PLB
	STZ.b $4A
	STZ.b $94
	JSR.w CODE_8181C4
	STZ.w $0D1C
	LDY.b $B2
	BRA.b CODE_81CB8A

CODE_81CB55:
	STY.b $B4
	TYX
	LDA.w $0D1A
	AND.w #$0001
	EOR.w $0D1C
	INC.w $0D1C
	LSR
	BCS.b CODE_81CB7E
	LDA.b $4A
	CMP.w #$00FF
	BCS.b CODE_81CB7E
	TXA
	XBA
	AND.w #$0007
	ASL
	TAY
	LDX.w #CODE_808EC5
	JSL.l CODE_80BA28
	LDY.b $B4
CODE_81CB7E:
	LDX.b $04,y
	INX
	INX
	JSL.l CODE_80BA36
	LDX.b $B4
	LDY.b $02,x
CODE_81CB8A:
	CPY.w #$00B0
	BNE.b CODE_81CB55
	LDX.w #CODE_80B91B
	JSL.l CODE_80BA28
	PLB
	RTL

;--------------------------------------------------------------------

CODE_81CB98:
	LDA.w #$1000
	STA.b $C8
	STZ.b $4A
	STZ.w $1E92
	LDA.w #$00B0
	STA.b $B0
	STA.b $B2
	STZ.w $1EF0
CODE_81CBAC:
	LDX.w !ContextDependentTable,y
	BEQ.b CODE_81CBDC
	JSR.w CODE_81CBFF
	LDA.w !ContextDependentTable+$02,y
	STA.b $18,x
	LDA.w !ContextDependentTable+$04,y
	STA.b $1C,x
	LDA.w !ContextDependentTable+$06,y
	STA.b $2A,x
	LDA.w #$0140
	STA.b $BA,x
	LDA.w #$0120
	STA.b $30,x
	LDA.w #DATA_80CEFF
	JSL.l CODE_80C25A
	TYA
	CLC
	ADC.w #$0008
	TAY
	BRA.b CODE_81CBAC

CODE_81CBDC:
	JSR.w CODE_81CBE4
	JSL.l CODE_8194C2
	RTL

CODE_81CBE4:
	LDA.w #$5000
	LDX.w #$7F8000
	JSR.w CODE_8193FA
	LDA.w #$5020
	LDX.w #$7F8280
	JSR.w CODE_8193FA
	LDA.w #$5040
	LDX.w #$7F8500
	JMP.w CODE_8193FA

CODE_81CBFF:
	LDA.b $14,x
	PHA
	LDA.b $12,x
	PHA
	PHX
	PHY
	LDY.w #$0050
	LDA.w #$4000
	AND.b $E2,x
	STA.b $E2,x
	STZ.b $A0,x
CODE_81CC13:
	STZ.b $00,x
	INX
	INX
	DEY
	BNE.b CODE_81CC13
	PLY
	PLX
	PLA
	STA.b $12,x
	PLA
	AND.w #$3FFF
	STA.b $14,x
	RTS

;--------------------------------------------------------------------

CODE_81CC26:
	PHB
	PHK
	PLB
	STX.w $1F28
	LDX.w #$1F28
	JSR.w (!ContextDependentTable,x)
	PLB
	RTL

;--------------------------------------------------------------------

CODE_81CC34:
	LDX.b $B8
	LDA.w $1DFC,x
	ASL
	LDY.w $0FE0
	LDX.b $E6,y
	JMP.w (DATA_81CC42,x)

DATA_81CC42:
	dw CODE_81CC52
	dw CODE_81CC56
	dw CODE_81CC56
	dw CODE_81CC56
	dw CODE_81CC5A
	dw CODE_81CC5A
	dw CODE_81CC5A
	dw CODE_81CC5A

CODE_81CC52:
	TAX
	JMP.w (DATA_81D216,x)

CODE_81CC56:
	TAX
	JMP.w (DATA_81D26E,x)

CODE_81CC5A:
	TAX
	JMP.w (DATA_81CF5C,x)

CODE_81CC5E:
	LDX.b $B8
	JMP.w CODE_81D38B

CODE_81CC63:
	LDX.b $B8
	LDA.w $1DFC,x
	ASL
	TAX
	BIT.w $1F24
	BVS.b CODE_81CC7A
	LDA.w $0D0E
	BNE.b CODE_81CC77
	JMP.w (DATA_81CE9E,x)

CODE_81CC77:
	JMP.w (DATA_81CDD3,x)

CODE_81CC7A:
	JMP.w (DATA_81CDA6,x)

CODE_81CC7D:
	LDX.b $B8
	LDA.w $1DFC,x
	ASL
	TAX
	JMP.w (DATA_81CE3B,x)

CODE_81CC87:
	JSR.w CODE_81D3EC
	JSR.w CODE_81D378
	LDX.b $B8
	LDA.w $1DFC,x
	ASL
	TAX
	JMP.w (DATA_81CCD8,x)

CODE_81CC97:
	JSR.w CODE_81D3B0
	LDX.w $0FE0
	LDA.b $E4,x
	CMP.w #$02C1
	BCS.b CODE_81CCA7
	JSR.w CODE_81D3EC
CODE_81CCA7:
	LDX.b $B8
	LDA.w $1DFC,x
	ASL
	TAX
	JMP.w (DATA_81CD1A,x)

CODE_81CCB1:
	JSR.w CODE_81D3EC
	JSR.w CODE_81D378
	LDX.b $B8
	LDA.w $1DFC,x
	ASL
	TAX
	JMP.w (DATA_81CCDE,x)

CODE_81CCC1:
	LDX.w $0FE0
	LDA.b $E4,x
	CMP.w #$02C1
	BCS.b CODE_81CCCE
	JSR.w CODE_81D3EC
CODE_81CCCE:
	LDX.b $B8
	LDA.w $1DFC,x
	ASL
	TAX
	JMP.w (DATA_81CD1A,x)

DATA_81CCD8:
	dw CODE_81CCE7
	dw CODE_81CCFD
	dw CODE_81CD14

DATA_81CCDE:
	dw CODE_81CCE4
	dw CODE_81CCFD
	dw CODE_81CD17

CODE_81CCE4:
	JSR.w CODE_81D35D
CODE_81CCE7:
	JSL.l CODE_81A12C
	JSR.w CODE_81D3DC
	JSR.w CODE_81D4CB
	JSR.w CODE_81D38B
	JSR.w CODE_81D4AF
	LDA.w #$00B4
	JMP.w CODE_81D2DB

CODE_81CCFD:
	LDX.w $0FE0
	LDA.w #$4000
	AND.b $E2,x
	STA.b $E2,x
	JSR.w CODE_81D38B
	JSL.l CODE_81DF78
	LDA.w #$003C
	JMP.w CODE_81D2D2

CODE_81CD14:
	JSR.w CODE_81D3B0
CODE_81CD17:
	JMP.w CODE_81D38B

DATA_81CD1A:
	dw CODE_81CD28
	dw CODE_81CD47
	dw CODE_81CD59
	dw CODE_81CD63
	dw CODE_81CD7A
	dw CODE_81CD94
	dw CODE_81CDA0

CODE_81CD28:
	JSR.w CODE_81D515
	LDA.b $2C
	CMP.w #$0006
	BEQ.b CODE_81CD35
	JSR.w CODE_81D4CB

CODE_81CD35:
	JSR.w CODE_81D3D2
	JSR.w CODE_81D442
	JSR.w CODE_81D38B
	JSR.w CODE_81D45E
	LDA.w #$0008
	JMP.w CODE_81D2DB

CODE_81CD47:
	LDX.b $B8
	LDA.w $1DEC,x
	JSL.l CODE_81ADA2
	JSR.w CODE_81D38B
	LDA.w #$0078
	JMP.w CODE_81D2D2

CODE_81CD59:
	JSL.l CODE_81ADEE
	JSR.w CODE_81D38B
	JMP.w CODE_81D2D2

CODE_81CD63:
	JSL.l CODE_81ADEE
	JSR.w CODE_81D4CB
	JSR.w CODE_81D38B
	JSR.w CODE_81D4DD
	BEQ.b CODE_81CD79
	JSL.l CODE_84D971
	JMP.w CODE_81D2DB

CODE_81CD79:
	RTS

CODE_81CD7A:
	LDA.w #$0000
	BIT.w $1F10
	BPL.b CODE_81CD85
	LDA.w #$0001
CODE_81CD85:
	STA.w $1DCA
	JSR.w CODE_81D3B0
	JSR.w CODE_81D390
	JSR.w CODE_81A991
	JMP.w CODE_81D2DB

CODE_81CD94:
	JSR.w CODE_81D390
	JSR.w CODE_81A999
	BCC.b CODE_81CD9F
	JMP.w CODE_81D2DB

CODE_81CD9F:
	RTS

CODE_81CDA0:
	JSR.w CODE_81D390
	JMP.w CODE_81A858

DATA_81CDA6:
	dw CODE_81CDB0
	dw CODE_81CDCD
	dw CODE_81CD7A
	dw CODE_81CD94
	dw CODE_81CDA0

CODE_81CDB0:
	LDA.w #$000A
	JSL.l CODE_80985F
	LDA.w #$0000
	STA.l $7FFF00
	JSR.w CODE_81D4CB
	JSR.w CODE_81D38B
	JSR.w CODE_81DF4E
	LDA.w #$00F0
	JMP.w CODE_81D2DB

CODE_81CDCD:
	JSR.w CODE_81D38B
	JMP.w CODE_81D2D2

DATA_81CDD3:
	dw CODE_81CEB4
	dw CODE_81CDEB
	dw CODE_81D23F
	dw CODE_81CDFE
	dw CODE_81CE0A
	dw CODE_81CE10
	dw CODE_81CE16
	dw CODE_81CE22
	dw CODE_81CE35
	dw CODE_81CD7A
	dw CODE_81CD94
	dw CODE_81CDA0

CODE_81CDEB:
	LDA.w #$0009
	JSL.l CODE_80985F
	JSR.w CODE_81D4CB
	JSR.w CODE_81D38B
	LDA.w #$00B4
	JMP.w CODE_81D2DB

CODE_81CDFE:
	JSR.w CODE_81DF4E
	JSR.w CODE_81D38B
	LDA.w #$0078
	JMP.w CODE_81D2D2

CODE_81CE0A:
	JSR.w CODE_81CEF9
	JMP.w CODE_81D265

CODE_81CE10:
	JSR.w CODE_81CEF9
	JMP.w CODE_81D312

CODE_81CE16:
	JSR.w CODE_81CEF9
	JSR.w CODE_81D64D
	INC.w $1DF0
	JMP.w CODE_81D2DB

CODE_81CE22:
	JSR.w CODE_81D64D
	JSR.w CODE_81D4DD
	BEQ.b CODE_81CE34
	JSL.l CODE_84D971
	LDA.w #$000A
	JMP.w CODE_81D2DB

CODE_81CE34:
	RTS

CODE_81CE35:
	JSR.w CODE_81D64D
	JMP.w CODE_81D2D2

DATA_81CE3B:
	dw CODE_81CE41
	dw CODE_81CE59
	dw CODE_81CE70

CODE_81CE41:
	LDA.w #$9C00
	STA.w $0D0C
	LDA.w $1DF0
	BNE.b CODE_81CE56
	JMP.w CODE_81D38B

CODE_81CE4F:
	LDX.w #CODE_80D7A3
	JSL.l CODE_80BA28
CODE_81CE56:
	JMP.w CODE_81D2DB

CODE_81CE59:
	JSR.w CODE_81CEF9
	LDA.w $1DF0
	DEC
	CMP.w #$0003
	BCS.b CODE_81CE6D
	ASL
	TAX
	INC.w $1DF0
	JMP.w CODE_81CF3D

CODE_81CE6D:
	JMP.w CODE_81D2DB

CODE_81CE70:
	JSR.w CODE_81CEF9
	LDX.w #CODE_80C227
	JSL.l CODE_80BA28
	LDA.b $3C
	SEC
	SBC.w #$0070
	STA.b $3C
	LDA.w $0FB2
	BNE.b CODE_81CE9D
	LDA.w $0D0C
	CMP.w #$F000
	BEQ.b CODE_81CE93
	CLC
	ADC.w #$0300
CODE_81CE93:
	STA.w $0D0C
	JSR.w CODE_81DBBC
	JSL.l CODE_81DA72
CODE_81CE9D:
	RTS

DATA_81CE9E:
	dw CODE_81CEB4
	dw CODE_81CED4
	dw CODE_81CEEA
	dw CODE_81D2E5
	dw CODE_81CEF3
	dw CODE_81CE16
	dw CODE_81CE22
	dw CODE_81CE35
	dw CODE_81CD7A
	dw CODE_81CD94
	dw CODE_81CDA0

CODE_81CEB4:
	LDA.l $7F6004
	BNE.b CODE_81CEBD
	STZ.w $0FD6
CODE_81CEBD:
	LDA.w $1F20
	BEQ.b CODE_81CEC8
	LDA.w #$0002
	TSB.w $1F24
CODE_81CEC8:
	JSR.w CODE_81D500
	JSR.w CODE_81D64D
	JSR.w CODE_81D38B
	JMP.w CODE_81D2DB

CODE_81CED4:
	LDA.w #$000A
	JSL.l CODE_80985F
	JSR.w CODE_81D4CB
	JSR.w CODE_81D38B
	JSR.w CODE_81DF4E
	LDA.w #$00F0
	JMP.w CODE_81D2DB

CODE_81CEEA:
	JSR.w CODE_81D38B
	LDA.w #$0078
	JMP.w CODE_81D2D2

CODE_81CEF3:
	JSR.w CODE_81CEF9
	JMP.w CODE_81D312

CODE_81CEF9:
	LDA.b $37
	AND.w #$0F00
	CLC
	ADC.w #$70FF
	LDX.w #$00A0
	JSR.w CODE_81CF1D
	LDX.w #$00C0
	LDA.w #$7FF0
	JSR.w CODE_81CF1D
	LDA.w #$FFFF
	STA.w $0E8A
	LDX.w #$00E0
	LDA.w #$027F
CODE_81CF1D:
	STA.l $7E3B82,x
	STA.l $7E3B84,x
	LDA.w #$0000
	STA.l $7E3B86,x
	RTS

DATA_81CF2D:
	dw $7FA000,$7FA800,$7FB000

DATA_81CF33:
	dw $0000,$0400,$0800

DATA_81CF39:
	dw $5000,$6000

CODE_81CF3D:
	LDA.w #$0800
	STA.w $1D80
	LDA.w DATA_81CF2D,x
	STA.w $1D82
	LDA.w #$7FA000>>16
	STA.w $1D84
	LDY.b $B8
	LDA.w DATA_81CF39,y
	CLC
	ADC.w DATA_81CF33,x
	STA.w $1D86
	RTS

DATA_81CF5C:
	dw CODE_81CF8A
	dw CODE_81CFA5
	dw CODE_81CFAE
	dw CODE_81CFE4
	dw CODE_81CFFF
	dw CODE_81D019
	dw CODE_81D032
	dw CODE_81D046
	dw CODE_81D0A2
	dw CODE_81D0AF
	dw CODE_81D0C1
	dw CODE_81D0D9
	dw CODE_81D0E9
	dw CODE_81D0FD
	dw CODE_81D14B
	dw CODE_81D15E
	dw CODE_81D17A
	dw CODE_81D13D
	dw CODE_81D185
	dw CODE_81D1CC
	dw CODE_81D1D8
	dw CODE_81D1ED
	dw CODE_81D1C6

CODE_81CF8A:
	JSR.w CODE_81D354
	JSR.w CODE_81D500
	JSR.w CODE_81D4F8
	JSR.w CODE_81D4CB
	JSR.w CODE_81D3CD
	JSR.w CODE_81D49D
	JSR.w CODE_81D38B
	LDA.w #$0050
	JMP.w CODE_81D2DB

CODE_81CFA5:
	JSR.w CODE_81D38B
	JSR.w CODE_81D3EC
	JMP.w CODE_81D2D2

CODE_81CFAE:
	LDA.w $0FB4
	BNE.b CODE_81CFCE
	LDX.b $B8
	LDA.w #$1084
	STA.w $0FD8,x
	TXA
	EOR.w #$0002
	TAX
	LDA.w $0FD8,x
	CMP.w #$1084
	BEQ.b CODE_81CFCE
	LDA.w #$0421
	STA.w $0FD8,x
CODE_81CFCE:
	JSR.w CODE_81D390
	LDA.w $1D80
	BEQ.b CODE_81CFD7
	RTS

CODE_81CFD7:
	JSL.l CODE_81D5D0
	JSR.w CODE_81D3B9
	LDA.w #$00B4
	JMP.w CODE_81D2DB

CODE_81CFE4:
	JSR.w CODE_81DF4E
	JSR.w CODE_81D390
	JSL.l CODE_81D5EC
	JSR.w CODE_81D4EB
	BEQ.b CODE_81CFF9
	LDA.w #$0078
	JMP.w CODE_81D2DB

CODE_81CFF9:
	LDA.w #$0078
	JMP.w CODE_81D2D2

CODE_81CFFF:
	JSR.w CODE_81D33F
	JSR.w CODE_81D51F
	JSR.w CODE_81D3B0
	JSR.w CODE_81D390
	JSR.w CODE_81D43C
	BPL.b CODE_81D013
	JMP.w CODE_81D2DB

CODE_81D013:
	LDA.w #$0009
	JMP.w CODE_81D2CC

CODE_81D019:
	JSR.w CODE_81D390
	JSL.l CODE_81AF8D
	LDX.b $B8
	LDA.w $1D80
	BEQ.b CODE_81D028
	RTS

CODE_81D028:
	JSL.l CODE_81AF50
	LDA.w #$012C
	JMP.w CODE_81D2DB

CODE_81D032:
	JSR.w CODE_81D390
	JSL.l CODE_81AFB4
	JSL.l CODE_81DA72
	JSR.w CODE_81D2D2
	BCC.b CODE_81D045
	JSR.w CODE_81D4AF
CODE_81D045:
	RTS

CODE_81D046:
	LDX.b $B8
	LDA.w $0D70,x
	AND.w #$000F
	CMP.w #$000A
	BNE.b CODE_81D075
	LDA.w #$0002
	STA.w $0154,x
	STZ.w $0FCA,x
	LDA.w #$0020
	TXY
	BNE.b CODE_81D068
	JSL.l CODE_81F5A7
	BRA.b CODE_81D06C

CODE_81D068:
	JSL.l CODE_81F5C2
CODE_81D06C:
	LDA.w #$0012
	JSR.w CODE_81D2CC
	JMP.w CODE_81D185

CODE_81D075:
	JSR.w CODE_81D390
	JSL.l CODE_81AFB4
	JSL.l CODE_81DA72
	LDA.w $1DCE
	BPL.b CODE_81D0A1
	LDA.b $B6
	BNE.b CODE_81D096
	LDA.w $0FCA
	AND.w $0FCC
	BPL.b CODE_81D0A1
	JSR.w CODE_81D4E3
	BNE.b CODE_81D09B
CODE_81D096:
	JSR.w CODE_81D4DD
	BEQ.b CODE_81D0A2
CODE_81D09B:
	JSR.w CODE_81D553
	JMP.w CODE_81D2DB

CODE_81D0A1:
	RTS

CODE_81D0A2:
	JSL.l CODE_81AFB4
	JSL.l CODE_81DA72
	RTS

DATA_81D0AB:
	dw $0000,$0006

CODE_81D0AF:
	JSR.w CODE_81D390
	JSR.w CODE_81D1F5
	LDA.w $1D80
	BNE.b CODE_81D0C0
	JSR.w CODE_81AECD
	JMP.w CODE_81D2DB

CODE_81D0C0:
	RTS

CODE_81D0C1:
	JSR.w CODE_81D390
	JSR.w CODE_81D1F5
	LDA.w $1D80
	BNE.b CODE_81D0D8
	JSR.w CODE_81AEC3
	JSR.w CODE_81AEE8
	LDA.w #$00E0
	JMP.w CODE_81D2DB

CODE_81D0D8:
	RTS

CODE_81D0D9:
	JSR.w CODE_81D390
	JSR.w CODE_81D1F5
	JSR.w CODE_81AEFA
	JSL.l CODE_81DA72
	JMP.w CODE_81D2D2

CODE_81D0E9:
	JSR.w CODE_81D4AF
	JSR.w CODE_81D390
	JSR.w CODE_81D1F5
	JSR.w CODE_81AEFA
	JSL.l CODE_81DA72
	JMP.w CODE_81D2DB

CODE_81D0FC:
	RTS

CODE_81D0FD:
	LDA.w $1DCE
	BPL.b CODE_81D13D
	BIT.w #$2000
	BEQ.b CODE_81D114
	LDX.b $B8
	DEC.w $0154,x
	LDA.w #$0011
	JSR.w CODE_81D2CC
	BRA.b CODE_81D13D

CODE_81D114:
	AND.w #$0400
	BEQ.b CODE_81D11C
	LDA.w #$0002
CODE_81D11C:
	CMP.b $B8
	BEQ.b CODE_81D126
	TAX
	LDA.w $0FCA,x
	BPL.b CODE_81D136
CODE_81D126:
	STZ.w $1DCA
	JSR.w CODE_81A991
	JSR.w CODE_81AEFA
	JSL.l CODE_81DA72
	JMP.w CODE_81D2DB

CODE_81D136:
	LDX.b $B8
	JSR.w CODE_81A8B4
	BRA.b CODE_81D140

CODE_81D13D:
	JSR.w CODE_81D390
CODE_81D140:
	JSR.w CODE_81D1F5
	JSR.w CODE_81AEFA
	JSL.l CODE_81DA72
	RTS

CODE_81D14B:
	JSR.w CODE_81A9A3
	BCC.b CODE_81D156
	LDA.w #$001E
	JSR.w CODE_81D2DB
CODE_81D156:
	JSR.w CODE_81AEFA
	JSL.l CODE_81DA72
	RTS

CODE_81D15E:
	JSR.w CODE_81A883
	JSR.w CODE_81AEFA
	JSL.l CODE_81DA72
	JSR.w CODE_81D2D2
	BCC.b CODE_81D175
	LDA.w $1DCA
	ASL
	TAX
	JSR.w (DATA_81D176,x)
CODE_81D175:
	RTS

DATA_81D176:
	dw CODE_81D553
	dw CODE_81D597

CODE_81D17A:
	JSR.w CODE_81A883
	JSR.w CODE_81AEFA
	JSL.l CODE_81DA72
	RTS

CODE_81D185:
	LDX.b $B8
	LDA.w $1DCE
	BPL.b CODE_81D1C6
	BIT.w #$2000
	BEQ.b CODE_81D19B
	LDX.b $B8
	LDA.w #$0016
	JSR.w CODE_81D2CC
	BRA.b CODE_81D1C6

CODE_81D19B:
	AND.w #$0400
	BEQ.b CODE_81D1A3
	LDA.w #$0002
CODE_81D1A3:
	CMP.b $B8
	BEQ.b CODE_81D1AD
	TAX
	LDA.w $0FCA,x
	BPL.b CODE_81D1BA
CODE_81D1AD:
	STZ.w $1DCA
	JSR.w CODE_81A991
	JSL.l CODE_81DA72
	JMP.w CODE_81D2DB

CODE_81D1BA:
	LDX.b $B8
	JSR.w CODE_81A8B4
	JSL.l CODE_81DA72
	JMP.w CODE_81D1F5

CODE_81D1C6:
	JSR.w CODE_81D390
	JMP.w CODE_81D1F5

CODE_81D1CC:
	JSR.w CODE_81A9A3
	BCC.b CODE_81D1D7
	LDA.w #$001E
	JMP.w CODE_81D2DB

CODE_81D1D7:
	RTS

CODE_81D1D8:
	JSR.w CODE_81A883
	JSL.l CODE_81DA72
	JSR.w CODE_81D2D2
	BCC.b CODE_81D1EC
	LDA.w $1DCA
	ASL
	TAX
	JSR.w (DATA_81D176,x)
CODE_81D1EC:
	RTS

CODE_81D1ED:
	JSR.w CODE_81A883
	JSL.l CODE_81DA72
	RTS

CODE_81D1F5:
	LDY.b $B8
	LDA.w #$016E
	LDX.w DATA_81D0AB,y
	STA.w $1030,x
	STA.w $1130,x
	STA.w $1230,x
	STA.w $1330,x
	STA.w $1430,x
	STA.w $1530,x
	STA.w $1630,x
	STA.w $1730,x
	RTS

DATA_81D216:
	dw CODE_81D224
	dw CODE_81D23F
	dw CODE_81D259
	dw CODE_81D265
	dw CODE_81D312
	dw CODE_81D321
	dw CODE_81D333

CODE_81D224:
	JSR.w CODE_81D354
	JSR.w CODE_81D500
	JSR.w CODE_81D4CB
	JSR.w CODE_81D3DC
	JSR.w CODE_81D64D
	JSR.w CODE_81D38B
	JSR.w CODE_81D4A2
	LDA.w #$01A4
	JMP.w CODE_81D2DB

CODE_81D23F:
	JSR.w CODE_81D38B
	JSL.l CODE_81DF78
	BCC.b CODE_81D253
	JSR.w CODE_81D4EB
	BEQ.b CODE_81D253
	LDA.w #$003C
	JMP.w CODE_81D2DB

CODE_81D253:
	LDA.w #$003C
	JMP.w CODE_81D2D2

CODE_81D259:
	JSR.w CODE_81DF4E
	JSR.w CODE_81D38B
	LDA.w #$00F0
	JMP.w CODE_81D2D2

CODE_81D265:
	LDA.w #$8000
	STA.w $0D54
	JMP.w CODE_81D2E5

DATA_81D26E:
	dw CODE_81D27A
	dw CODE_81D2AD
	dw CODE_81D2E5
	dw CODE_81D312
	dw CODE_81D321
	dw CODE_81D333

CODE_81D27A:
	JSR.w CODE_81D354
	JSR.w CODE_81D500
	JSR.w CODE_81D4CB
	JSR.w CODE_81D4A2
	JSR.w CODE_81D3DC
	JSR.w CODE_81DF4E
	JSR.w CODE_81D38B
	JSR.w CODE_81D64D
	LDA.b $B8
	EOR.w #$0002
	TAY
	LDA.w #$00F0
	LDX.b $C8,y
	BMI.b CODE_81D2DB
	LDY.b $E6,x
	BNE.b CODE_81D2DB
	BIT.w $1DCE
	BVS.b CODE_81D2DB
	LDA.w #$01E0
	BRA.b CODE_81D2DB

CODE_81D2AD:
	JSR.w CODE_81D38B
	JSR.w CODE_81D4EB
	BNE.b CODE_81D2C2
	LDA.w $1DCE
	AND.w #$000F
	BNE.b CODE_81D2C7
	LDA.w $0D54
	BEQ.b CODE_81D2C7
CODE_81D2C2:
	LDA.w #$00F0
	BRA.b CODE_81D2DB

CODE_81D2C7:
	LDA.w #$00F0
	BRA.b CODE_81D2D2

CODE_81D2CC:
	LDX.b $B8
	STA.w $1DFC,x
	RTS

CODE_81D2D2:
	LDX.b $B8
	DEC.w $1DEC,x
	BEQ.b CODE_81D2DB
	CLC
	RTS

CODE_81D2DB:
	LDX.b $B8
	STA.w $1DEC,x
	INC.w $1DFC,x
	SEC
	RTS

CODE_81D2E5:
	JSR.w CODE_81D4A7
	JSR.w CODE_81D390
	JSR.w CODE_81D3A1
	JSR.w CODE_81D3B0
	JSR.w CODE_81D64D
	JSR.w CODE_81DF4E
	LDX.w #CODE_80D7A3
	JSL.l CODE_80BA28
	LDX.b $B8
	LDA.w $1DEC,x
	CMP.w #$00A0
	BCC.b CODE_81D30D
	JSR.w CODE_81D4F8
	BRA.b CODE_81D2D2

CODE_81D30D:
	JSR.w CODE_81D51F
	BRA.b CODE_81D2D2

CODE_81D312:
	JSR.w CODE_81D51F
	JSR.w CODE_81D4AF
	JSR.w CODE_81D390
	JSR.w CODE_81D64D
	JMP.w CODE_81D2DB

CODE_81D321:
	JSR.w CODE_81D390
	JSR.w CODE_81D64D
	LDA.w $1DCE
	BPL.b CODE_81D332
	JSR.w CODE_81D53D
	JMP.w CODE_81D2DB

CODE_81D332:
	RTS

CODE_81D333:
	JSR.w CODE_81D64D
	RTS

DATA_81D337:
	dw CODE_818232
	dw CODE_8182AD

DATA_81D33B:
	dw $FE00,$FE80

CODE_81D33F:
	LDX.w $0FE0
	LDA.b $64,x
	BEQ.b CODE_81D353
	STZ.b $64,x
	LDX.b $B8
	INC.w $0154,x
	LDA.b $B8
	JSL.l CODE_84DA80
CODE_81D353:
	RTS

CODE_81D354:
	LDA.b $B6
	BEQ.b CODE_81D35C
	JSL.l CODE_81A12C
CODE_81D35C:
	RTS

CODE_81D35D:
	LDX.w $0FE0
	LDA.b $12,x
	LSR
	ADC.w #$000C
	JSL.l CODE_80985B
	LDX.w #$1000
	JSR.w CODE_81D373
	LDX.w #$1100
CODE_81D373:
	STZ.b $1086,x
	STZ.b $1082,x
	RTS

CODE_81D378:
	LDA.w #$0002
	EOR.b $B8
	TAX
	LDA.w $1DFC,x
	CMP.w #$0002
	BCC.b CODE_81D38A
	JSL.l CODE_81ADCA
CODE_81D38A:
	RTS

CODE_81D38B:
	LDX.b $B8
	JMP.w (DATA_81D337,x)

CODE_81D390:
	LDX.b $B8
	LDA.w #$0020
	STA.w $1EF8,x
	LDA.w #$0001
	STA.w $1E96,x
	JMP.w (DATA_81D337,x)

CODE_81D3A1:
	LDX.b $B8
	LDA.w DATA_81D33B,x
	STA.w $0D00,x
	LDA.w #$007F
	STA.w $0D04,x
	RTS

CODE_81D3B0:
	LDX.b $B8
	LDA.w #$8000
	STA.w $1DC0,x
	RTS

CODE_81D3B9:
	LDX.b $B8
	LDA.w $0154,x
	DEC
	BNE.b CODE_81D3CC
	LDY.w $0FE0
	LDA.w $0064,y
	BNE.b CODE_81D3CC
	DEC.w $0FCA,x
CODE_81D3CC:
	RTS

CODE_81D3CD:
	LDA.w #$0014
	BRA.b CODE_81D3E6

CODE_81D3D2:
	LDA.w #$0004
	BRA.b CODE_81D3E6

CODE_81D3D7:
	LDA.w #$0008
	BRA.b CODE_81D3E6

CODE_81D3DC:
	LDA.b $B6
	CMP.w #$0008
	BCS.b CODE_81D3EB
	LDA.w #$0002
CODE_81D3E6:
	LDX.b $B8
	STA.w $1E88,x
CODE_81D3EB:
	RTS

CODE_81D3EC:
	LDY.b $B8
	LDX.b $C8,y
	LDA.w #$0258
	STA.b $5C,x
	LDA.b $10,x
	AND.w #$DFFF
	ORA.w #$0800
	STA.b $10,x
	STZ.b $EA,x
	LDA.b $22,x
	BPL.b CODE_81D40D
	CLC
	ADC.w #$0008
	BMI.b CODE_81D416
	BPL.b CODE_81D413					; Note: This will always branch.

CODE_81D40D:
	SEC
	SBC.w #$0008
	BPL.b CODE_81D416
CODE_81D413:
	LDA.w #$0000
CODE_81D416:
	STA.b $22,x
	LDA.b $24,x
	BPL.b CODE_81D424
	CLC
	ADC.w #$0008
	BMI.b CODE_81D42D
	BPL.b CODE_81D42A					; Note: This will always branch.

CODE_81D424:
	SEC
	SBC.w #$0008
	BPL.b CODE_81D42D
CODE_81D42A:
	LDA.w #$0000
CODE_81D42D:
	STA.b $24,x
	RTS

CODE_81D430:
	LDA.w #$0002
	BRA.b CODE_81D438

CODE_81D435:
	LDA.w #$000A
CODE_81D438:
	CLC
	ADC.b $B8
	RTS

CODE_81D43C:
	LDX.b $B8
	LDA.w $0FCA,x
	RTS

CODE_81D442:
	LDX.b $B8
	LDY.b $C8,x
	LDA.w #$4000
	AND.w $00E2,y
	STA.w $00E2,y
	LDX.b $84,y
	BNE.b CODE_81D45D
	TYA
	CLC
	ADC.b $B8
	TAX
	LDA.w #$8001
	STA.b $6C,x
CODE_81D45D:
	RTS

CODE_81D45E:
	LDA.w #$0002
	EOR.b $B8
	TAX
	LDA.b $2C
	CMP.w #$0006
	BNE.b CODE_81D46F
	INX
	INX
	INX
	INX
CODE_81D46F:
	SED
	LDA.w $1F30,x
	CMP.w #$0099
	BCS.b CODE_81D47C
	CLC
	ADC.w #$0001
CODE_81D47C:
	STA.w $1F30,x
	CLC
	LDA.w $1F30
	ADC.w $1F32
	ADC.w $1F34
	ADC.w $1F36
	STA.w $1F38
	CLD
	RTS

CODE_81D491:
	LDY.b $B8
	LDX.b $C8,y
	LDA.w #$2000
	ORA.b $10,x
	STA.b $10,x
	RTS

CODE_81D49D:
	LDA.w #$1000
	BRA.b CODE_81D4C7

CODE_81D4A2:
	LDA.w #$2000
	BRA.b CODE_81D4C7

CODE_81D4A7:
	JSR.w CODE_81D33F
	LDA.w #$4000
	BRA.b CODE_81D4C7

CODE_81D4AF:
	INC.w $1DCE
	LDA.w $1DCE
	AND.w #$000F
	CMP.w #$0002
	BNE.b CODE_81D4CA
	LDA.b $B8
	BEQ.b CODE_81D4C4
	LDA.w #$0400
CODE_81D4C4:
	ORA.w #$8000
CODE_81D4C7:
	TSB.w $1DCE
CODE_81D4CA:
	RTS

;--------------------------------------------------------------------

CODE_81D4CB:
	LDY.b $B8
	LDX.b $C8,y
	LDA.w #$0040
	ORA.b $10,x
	STA.b $10,x
	LDA.w #$FFFF
	STA.w $1EB8
	RTS

;--------------------------------------------------------------------

CODE_81D4DD:
	LDX.b $B8
	LDA.b $28,x
	BRA.b CODE_81D4E7

CODE_81D4E3:
	LDA.b $28
	ORA.b $2A
CODE_81D4E7:
	AND.w #$9000
	RTS

;--------------------------------------------------------------------

CODE_81D4EB:
	LDX.b $B8
	LDA.w $0E68
	BEQ.b CODE_81D4F7
	LDA.b $28,x
	AND.w #$1000
CODE_81D4F7:
	RTS

;--------------------------------------------------------------------

CODE_81D4F8:
	LDA.b $B8
	EOR.w #$0002
	TAX
	BRA.b CODE_81D50B

CODE_81D500:
	LDX.b $B8
	LDA.w #$8000
	ORA.w $0F90,x
	STA.w $0F90,x
CODE_81D50B:
	LDA.w #$00C0
	ORA.w $00AC,x
	STA.w $00AC,x
	RTS

;--------------------------------------------------------------------

CODE_81D515:
	LDA.w #$00C0
	TSB.w $00AC
	TSB.w $00AE
	RTS

;--------------------------------------------------------------------

CODE_81D51F:
	LDA.b $B6
	BNE.b CODE_81D53C
	LDA.b $B8
	EOR.w #$0002
	TAX
	LDA.w $0154,x
	BEQ.b CODE_81D53C
	LDA.w $0F90,x
	BMI.b CODE_81D53C
	LDA.w #$FF3F
	AND.w $00AC,x
	STA.w $00AC,x
CODE_81D53C:
	RTS

;--------------------------------------------------------------------

CODE_81D53D:
	LDA.w #$0800
	AND.w $1DCE
	BNE.b CODE_81D552
	LDA.w #$0800
	TSB.w $1DCE
	LDX.w #CODE_8085BE
	JSL.l CODE_80BA28
CODE_81D552:
	RTS

;--------------------------------------------------------------------

CODE_81D553:
	JSL.l CODE_84D706
	LDX.b $B6
	JMP.w (DATA_81D55C,x)

DATA_81D55C:
	dw CODE_81D578
	dw CODE_81D592
	dw CODE_81D592
	dw CODE_81D5A3
	dw CODE_81D5A3
	dw CODE_81D5A3
	dw CODE_81D5B3

DATA_81D56A:
	dw $0004,$0004,$0004,$000C,$000C,$000C,$000C

CODE_81D578:
	LDA.w $0154
	ORA.w $0156
	BEQ.b CODE_81D597
CODE_81D580:
	BRA.b CODE_81D5A3

CODE_81D582:
	LDA.w $1DCE
	AND.w #$3000
	BEQ.b CODE_81D5A3
	LDX.w #CODE_8085BE
	JSL.l CODE_80BA28
	RTS

CODE_81D592:
	JSR.w CODE_81D43C
	BPL.b CODE_81D580
CODE_81D597:
	LDX.w #CODE_8085FD
	JSL.l CODE_80BA28
	JSL.l CODE_84D706
	RTS

CODE_81D5A3:
	LDX.b $B6
	LDA.w DATA_81D56A,x
	STA.w $0158
	LDX.w #CODE_8085D2
	JSL.l CODE_80BA28
	RTS

CODE_81D5B3:
	LDA.w #$000C
	STA.w $0158
	LDA.w #$000E
	STA.b $32
	LDA.w #$8F00
	STA.b $48
	LDA.w #$0080
	STA.w $015E
	LDA.w #$0000
	STA.w $0174
	RTS

;--------------------------------------------------------------------

CODE_81D5D0:
	LDA.w #$FFFF
	STA.w $1EB8
	LDX.w #$0000
	PHB
	PHK
	PLB
	LDY.b $B8
	LDX.b $C8,y
	STX.b $B4
	JSR.w CODE_81A9AD
	LDX.b $B8
	JSR.w CODE_81A95D
	BRA.b CODE_81D5F5

CODE_81D5EC:
	PHB
	PHK
	PLB
	LDY.b $B8
	LDX.b $C8,y
	STX.b $B4
CODE_81D5F5:
	JSR.w CODE_81A9C6
	PLB
	RTL

;--------------------------------------------------------------------

CODE_81D5FA:
	LDA.w #$0000
	STA.l $7FE012
	STA.l $7FE014
	STA.l $7FE292
	STA.l $7FE294
	RTS

;--------------------------------------------------------------------

CODE_81D60E:
	LDX.w #$7FE280
	JSR.w CODE_81D61B
	LDX.w #$7FE000
	JSR.w CODE_81D61B
	RTL

CODE_81D61B:
	LDA.l $7F0012,x
	BEQ.b CODE_81D644
	LDA.w #$0000
	STA.l $7F0012,x
	PHX
	LDA.l $7F0004,x
	TAY
	LDA.l $7F0006,x
	TAX
	LDA.w #$7F02
	JSL.l CODE_81954D
	PLX
	TYA
	CLC
	ADC.w #$0010
	STA.l $7F0004,x
CODE_81D644:
	RTS

;--------------------------------------------------------------------

DATA_81D645:
	dw $7FE000,$7FE280

DATA_81D649:
	dw $1D00,$1D40

CODE_81D64D:
	PHB
	PEA.w $7F7F
	PLB
	PLB
	LDX.b $B8
	LDA.l DATA_81D645,x
	TAY
	LDA.l $001EF4
	BEQ.b CODE_81D685
	LDA.w $0014,y
	BNE.b CODE_81D685
	LDA.w #$0001
	STA.w $0014,y
	PHY
	TYA
	CLC
	ADC.w #$0200
	TAY
	PHY
	LDA.l DATA_81D649,x
	TAX
	JSR.w CODE_81D83E
	PLA
	PLX
	LDY.w #$007F
	JSR.w CODE_81D947
	BRA.b CODE_81D6B9

CODE_81D685:
	TYX
	LDA.b $3C
	PHA
	JSR.w CODE_81D96E
	PLA
	STA.b $00
	LDA.l $000D0E
	AND.w #$000F
	BEQ.b CODE_81D6A6
	DEC
	ASL
	TAX
	LDA.l DATA_81D6BB,x
	CLC
	ADC.b $00
	TAY
	JSR.w CODE_81D6C5
CODE_81D6A6:
	LDA.l $000D0E
	BPL.b CODE_81D6B6
	LDA.w #$0110
	CLC
	ADC.b $00
	TAY
	JSR.w CODE_81D6C5
CODE_81D6B6:
	JSR.w CODE_81DA76
CODE_81D6B9:
	PLB
	RTS

DATA_81D6BB:
	dw $00B8,$0094,$0070,$004C,$0028

CODE_81D6C5:
	SEP.b #$20
	TYX
	LDA.b #$2B
	STA.b $03,x
	STA.b $07,x
	STA.b $0B,x
	STA.b $0F,x
	STA.b $13,x
	STA.b $17,x
	STA.b $1B,x
	REP.b #$20
	RTS

;--------------------------------------------------------------------

CODE_81D6DA:
	RTL

;--------------------------------------------------------------------

CODE_81D6DB:
	LDX.b $B8
	BIT.w $1E00,x
	BVS.b CODE_81D6E4
	RTL

CODE_81D6E4:
	PHB
	PHK
	PLB
	LDA.w DATA_81D719,x
	STA.b $0A
	LDX.b $3C
	LDY.w #DATA_81D76F
	LDA.w #$1C10
	JSR.w CODE_81D7DE
	STX.b $3C
	LDX.w #DATA_81D71D
CODE_81D6FC:
	LDA.w $0000,x
	BEQ.b CODE_81D714
	CLC
	ADC.b $0A
	TAY
	LDA.w $0002,x
	PHX
	JSR.w CODE_81D737
	PLA
	CLC
	ADC.w #$0004
	TAX
	BRA.b CODE_81D6FC

CODE_81D714:
	JSR.w CODE_81DA76
	PLB
	RTL

DATA_81D719:
	dw $0000,$0060

DATA_81D71D:
	dw $1D44,$2C00,$1D44,$2000,$1D40,$1800,$1D3C,$1000
	dw $1D38,$0800,$1D34,$0000,$0000

CODE_81D737:
	CLC
	ADC.b $BA
	STA.b $08
	LDA.w $0000,y
	STA.b $04
	LDA.w $0002,y
	STA.b $06
	LDX.b $3C
	LDA.w #$2810
	CLC
	ADC.b $08
	TAY
	LDA.b $06
	JSR.w CODE_81D829
	LDA.w #$2828
	CLC
	ADC.b $08
	TAY
	LDA.b $05
	JSR.w CODE_81D820
	LDA.w #$2840
	CLC
	ADC.b $08
	TAY
	LDA.b $04
	JSR.w CODE_81D820
	STX.b $3C
	RTS

DATA_81D76F:							; Note: Pointers, but I don't know what bank they're for.
	dw $CEDB,$DEDC,$DDD5 : db $00

DATA_81D776:
	dw $5C00,$6C00

CODE_81D77A:
	LDA.w $1E0E
	BEQ.b CODE_81D788
	LDA.w #$8000
	TSB.w $1E00
	TSB.w $1E02
CODE_81D788:
	LDX.w $1EE4
	BIT.w $1E00,x
	BPL.b CODE_81D7DD
	BVS.b CODE_81D7DD
	LDA.w #$0080
	STA.w !REGISTER_VRAMAddressIncrementValue
	LDA.w $1DFF,x
	AND.w #$0300
	PHA
	ORA.l DATA_81D776,x
	STA.w !REGISTER_VRAMAddressLo
	PLA
	ASL
	CLC
	ADC.w #$7FE000
	STA.w DMA[$00].SourceLo
	LDA.w #$7FE000>>16
	STA.w DMA[$00].SourceBank
	LDA.w #$0200
	STA.w DMA[$00].SizeLo
	LDA.w #(!REGISTER_WriteToVRAMPortLo&$0000FF<<8)+$01
	STA.w DMA[$00].Parameters
	SEP.b #$20
	LDA.b #$01
	STA.w !REGISTER_DMAEnable
	LDA.w $1E00,x
	INC
	STA.w $1E00,x
	CMP.b #$04
	BNE.b CODE_81D7DB
	LDA.w $1E01,x
	ORA.b #$40
	STA.w $1E01,x
CODE_81D7DB:
	REP.b #$20
CODE_81D7DD:
	RTL

CODE_81D7DE:
	CLC
	ADC.b $BA
	STA.b $00
	BRA.b CODE_81D7F9

CODE_81D7E5:
	ORA.w #$2900
	STA.b $02,x
	LDA.b $00
	STA.b $00,x
	CLC
	ADC.w #$0008
	STA.b $00
	INY
	INX
	INX
	INX
	INX
CODE_81D7F9:
	LDA.w !ContextDependentTable,y
	AND.w #$00FF
	BNE.b CODE_81D7E5
	RTS

;--------------------------------------------------------------------

CODE_81D802:
	STA.b $02,x
	LDA.w $0002,y
	CLC
	ADC.b $BA
	STA.b $00,x
	INY
	INY
	INY
	INY
	INX
	INX
	INX
	INX
	LDA.w $0000,y
	BNE.b CODE_81D802
	RTS

;--------------------------------------------------------------------

CODE_81D818:
	PHA
	JSR.w CODE_81D820
	PLA
	XBA
CODE_81D820:
	PHA
	JSR.w CODE_81D829
	PLA
	LSR
	LSR
	LSR
	LSR
CODE_81D829:
	AND.w #$000F
	ORA.w #$39C0
	STA.b $02,x
	STY.b $00,x
	TYA
	SEC
	SBC.w #$0008
	TAY
	INX
	INX
	INX
	INX
	RTS

;--------------------------------------------------------------------

CODE_81D83E:
	JSR.w CODE_81DA8C
	JSR.w CODE_81DDE3
	LDA.w #DATA_81D914
	JSR.w CODE_81D87C
	SEP.b #$20
	LDA.b #$05
	JSR.w CODE_81D88C
	LDA.b #$04
	JSR.w CODE_81D88C
	LDA.b #$03
	JSR.w CODE_81D88C
	LDA.b #$02
	JSR.w CODE_81D88C
	LDA.b #$01
	JSR.w CODE_81D88C
	REP.b #$20
	LDA.w #DATA_81D920
	JSR.w CODE_81D87C
	SEP.b #$20
	LDA.b #$00
	JSR.w CODE_81D88C
	LDA.b #$FF
	STA.w !ContextDependentTable,y
	REP.b #$20
	RTS

CODE_81D87C:
	PHX
	TAX
	LDA.l !ContextDependentTable+(DATA_81D914&$FF0000),x
	AND.w #$00FF
	DEC
	INX
	MVN $7F,(DATA_81D914&$FF0000)>>16
	PLX
	RTS

CODE_81D88C:
	PHX
	XBA
	LDA.b #$00
	XBA
	TAX
	LDA.b #$FD
	STA.w !ContextDependentTable,y
	LDA.l DATA_81D92F,x
	STA.w !ContextDependentTable+$01,y
	LDA.l DATA_81D935,x
	STA.w !ContextDependentTable+$02,y
	LDA.l DATA_81D93B,x
	STA.w !ContextDependentTable+$03,y
	LDA.l DATA_81D941,x
	STA.w !ContextDependentTable+$04,y
	PLX
	LDA.b #$FC
	STA.w !ContextDependentTable+$05,y
	LDA.b $22,x
	CMP.b #$0A
	BCC.b CODE_81D8C1
	LDA.b #$9C
CODE_81D8C1:
	STA.w !ContextDependentTable+$06,y
	LDA.b #$28
	STA.w !ContextDependentTable+$07,y
	LDA.b $21,x
	LSR
	LSR
	LSR
	LSR
	CMP.b #$0A
	BCC.b CODE_81D8D5
	LDA.b #$9C
CODE_81D8D5:
	STA.w !ContextDependentTable+$08,y
	LDA.b $21,x
	AND.b #$0F
	CMP.b #$0A
	BCC.b CODE_81D8E2
	LDA.b #$9C
CODE_81D8E2:
	STA.w !ContextDependentTable+$09,y
	LDA.b #$29
	STA.w !ContextDependentTable+$0A,y
	LDA.b $20,x
	LSR
	LSR
	LSR
	LSR
	CMP.b #$0A
	BCC.b CODE_81D8F6
	LDA.b #$9C
CODE_81D8F6:
	STA.w !ContextDependentTable+$0B,y
	LDA.b $20,x
	AND.b #$0F
	CMP.b #$0A
	BCC.b CODE_81D903
	LDA.b #$9C
CODE_81D903:
	STA.w !ContextDependentTable+$0C,y
	REP.b #$21
	TYA
	ADC.w #$000D
	TAY
	INX
	INX
	INX
	INX
	SEP.b #$20
	RTS

DATA_81D914:
	db $0A,$FD,$84,$2D,$30,$31,$32,$33
	db $34,$35,$2D,$2D

DATA_81D920:
	db $0E,$FD,$62,$9E,$9E,$9E,$9E,$9E
	db $9E,$9E,$9E,$9E,$9E,$9E,$9E

DATA_81D92F:
	db $72,$52,$42,$32,$22,$12

DATA_81D935:
	db $A0,$FC,$FC,$FC,$FC,$FC

DATA_81D93B:
	db $A1,$9F,$9F,$9F,$9F,$9F

DATA_81D941:
	db $A2,$05,$04,$03,$02,$01

;--------------------------------------------------------------------

CODE_81D947:
	STA.w $0000,x
	TYA
	STA.w $0002,x
	STZ.w $0008,x
	STZ.w $000A,x
	LDA.w #$5800
	LDY.b $B8
	BEQ.b CODE_81D95E
	LDA.w #$6800
CODE_81D95E:
	STA.w $0004,x
	LDA.w #$2980
	STA.w $000C,x
	LDA.w #$0005
	STA.w $0010,x
	RTS

;--------------------------------------------------------------------

CODE_81D96E:
	LDA.w $0010,x
	BEQ.b CODE_81D979
	DEC.w $0010,x
	BEQ.b CODE_81D979
	RTS

CODE_81D979:
	LDA.w $0000,x
	STA.b $02
	LDA.w $0002,x
	STA.b $04
	TXA
	CLC
	ADC.w #$0016
	STA.b $06
	LDY.w $0008,x
	SEP.b #$20
CODE_81D98F:
	LDA.b [$02],y
	CMP.b #$FB
	BCC.b CODE_81D9EF
	INC
	BEQ.b CODE_81D9AA
	INC
	BEQ.b CODE_81D9C6
	INC
	BEQ.b CODE_81D9B2
	LDA.b #$08
	CLC
	ADC.w $000E,x
	STA.w $000E,x
	INY
	BRA.b CODE_81D98F

CODE_81D9AA:
	LDA.b #$02
	STA.w $0014,x
	JMP.w CODE_81DA44

CODE_81D9B2:
	INY
	PHX
	LDA.b #$00
	XBA
	LDA.b [$02],y
	AND.b #$70
	LSR
	LSR
	LSR
	LSR
	TAX
	LDA.l DATA_81DA6A,x
	BRA.b CODE_81D9D4

CODE_81D9C6:
	INY
	PHX
	LDA.b [$02],y
	AND.b #$70
	LSR
	STA.b $00
	LSR
	ADC.b $00
	ADC.b #$20
CODE_81D9D4:
	XBA
	LDA.b [$02],y
	ASL
	LDA.b [$02],y
	AND.b #$0F
	ROL
	ASL
	ASL
	ADC.b #$40
	PLX
	REP.b #$21
	ADC.b $BA
	STA.w $000E,x
	INY
	SEP.b #$20
	JMP.w CODE_81D98F

CODE_81D9EF:
	REP.b #$20
	AND.w #$00FF
	PHA
	INY
	ASL
	ASL
	ASL
	ASL
	ASL
	ADC.w #$A000
	STA.w $0006,x
	TYA
	STA.w $0008,x
	LDY.w $000A,x
	PLA
	CMP.w #$002E
	BEQ.b CODE_81DA1E
	CMP.w #$002F
	BEQ.b CODE_81DA1E
	LDA.w $000E,x
	STA.b ($06),y
	CLC
	ADC.w #$0008
	BRA.b CODE_81DA2B

CODE_81DA1E:
	LDA.w $000E,x
	SEC
	SBC.w #$0808
	STA.b ($06),y
	CLC
	ADC.w #$0808
CODE_81DA2B:
	STA.w $000E,x
	INY
	INY
	LDA.w $000C,x
	STA.b ($06),y
	INC
	STA.w $000C,x
	INY
	INY
	TYA
	STA.w $000A,x
	DEC.w $0012,x
	BRA.b CODE_81DA4B

CODE_81DA44:
	REP.b #$20
	LDA.w $000A,x
	BRA.b CODE_81DA58

CODE_81DA4B:
	LDA.w $000A,x
	LDY.b $B8
	BEQ.b CODE_81DA58
	SEC
	SBC.w #$0004
	BEQ.b CODE_81DA69
CODE_81DA58:
	PHA
	LDY.b $3C
	CLC
	ADC.b $3C
	STA.b $3C
	LDX.b $06
	PLA
	DEC
	PHB
	MVN $80,$7F
	PLB
CODE_81DA69:
	RTS

DATA_81DA6A:
	db $15,$25,$2E,$37,$40,$49,$51,$59

;--------------------------------------------------------------------

CODE_81DA72:
	JSR.w CODE_81DA76
	RTL

CODE_81DA76:
	LDX.b $3C
	LDY.w #$E080
	BRA.b CODE_81DA83

CODE_81DA7D:
	STY.b $00,x
	INX
	INX
	INX
	INX
CODE_81DA83:
	TXA
	BIT.w #$000F
	BNE.b CODE_81DA7D
	STA.b $3C
	RTS

;--------------------------------------------------------------------

CODE_81DA8C:
	PHY
	PHX
	PHX
	CLC
	LDA.b $B8
	BEQ.b CODE_81DA97
	LDA.w #$001E
CODE_81DA97:
	ADC.w #$0F32
	STA.b $00
	LDA.w #$0000
	STA.b $02
	LDA.w #$0005
	STA.b $04
	LDY.w #$0000
CODE_81DAA9:
	INY
	LDA.b [$00],y
	STA.b $04,x
	INY
	INY
	INY
	LDA.b [$00],y
	CMP.w #$FFFF
	BNE.b CODE_81DABB
	LDA.w #$0000
CODE_81DABB:
	STA.b $06,x
	INY
	INY
	INX
	INX
	INX
	INX
	DEC.b $04
	BNE.b CODE_81DAA9
	PLX
	SEP.b #$20
	LDA.l $000104
	CMP.b #$09
	BNE.b CODE_81DAE2
	LDA.l $000102
	CMP.b #$59
	BNE.b CODE_81DAE2
	LDA.l $000101
	CMP.b #$99
	BEQ.b CODE_81DB18
CODE_81DAE2:
	REP.b #$20
	LDY.w #$0005
CODE_81DAE7:
	JSR.w CODE_81DAFC
	INX
	INX
	INX
	INX
	DEY
	BNE.b CODE_81DAE7
	LDA.b $00,x
	STA.b $20,x
	LDA.b $02,x
	STA.b $22,x
	PLX
	PLY
	RTS

CODE_81DAFC:
	SED
	LDA.b $04,x
	SEC
	SBC.b $00,x
	BCS.b CODE_81DB0E
	LDA.w #$6000
	SEC
	SBC.b $00,x
	CLC
	ADC.b $04,x
	CLC
CODE_81DB0E:
	STA.b $20,x
	LDA.b $06,x
	SBC.b $02,x
	STA.b $22,x
	CLD
	RTS

CODE_81DB18:
	REP.b #$20
	LDY.w #$0006
CODE_81DB1D:
	LDA.w #$AAAA
	STA.b $20,x
	LDA.w #$00AA
	STA.b $22,x
	INX
	INX
	INX
	INX
	DEY
	BNE.b CODE_81DB1D
	PLX
	PLY
	RTS

;--------------------------------------------------------------------

CODE_81DB31:
	RTL

;--------------------------------------------------------------------

CODE_81DB32:
	JSR.w CODE_81DBB1
	LDA.l $306667,x
	AND.w #$000F
	CMP.w #$000A
	BNE.b CODE_81DB46
	JSR.w CODE_81DB82
	CLC
	RTL

CODE_81DB46:
	PHX
	INX
	INX
	INX
	INX
	INX
	LDY.w #$0004
	JSR.w CODE_81DB94
	PLX
	JSR.w CODE_81DEF1
	STA.l $306660,x
	SEC
	RTL

;--------------------------------------------------------------------

CODE_81DB5C:
	PHB
	PHK
	PLB
	LDA.w #$0000
CODE_81DB62:
	PHA
	JSR.w CODE_81DB6F
	PLA
	INC
	CMP.w #$0014
	BNE.b CODE_81DB62
	PLB
	RTL

CODE_81DB6F:
	ORA.w #$1400
	JSR.w CODE_81DF14
	TAX
	JSR.w CODE_81DEF1
	BEQ.b CODE_81DB82
	CMP.l $306660,x
	BNE.b CODE_81DB82
	RTS

CODE_81DB82:
	PHX
	INX
	INX
	LDY.w #$0006
	JSR.w CODE_81DB94
	PLX
	JSR.w CODE_81DEF1
	STA.l $306660,x
	RTS

CODE_81DB94:
	SEP.b #$20
CODE_81DB96:
	LDA.b #$99
	STA.l $306660,x
	LDA.b #$59
	STA.l $306661,x
	LDA.b #$0A
	STA.l $306662,x
	INX
	INX
	INX
	DEY
	BNE.b CODE_81DB96
	REP.b #$20
	RTS

CODE_81DBB1:
	LDA.w $0125-$01
	ORA.w #$1400
	JSR.w CODE_81DF14
	TAX
	RTS

;--------------------------------------------------------------------

CODE_81DBBC:
	LDA.w $0125-$01
	ORA.w #$1400
	JSR.w CODE_81DF14
	STA.w $1BC0
	JSR.w CODE_81DCCC
	LDA.w #$2014
	LDY.w #DATA_81DC7F
	LDX.w #$0004
	JSR.w CODE_81DCC5
	LDY.w #$1B00
	JSR.w CODE_81DC23
	LDX.w #$0004
	LDA.w $0D0A
	CMP.w #$0000
	BNE.b CODE_81DBEB
	LDX.w #$0002
CODE_81DBEB:
	LDA.w #$205C
	JSR.w CODE_81DCC5
	LDY.w #$1B20
	JSR.w CODE_81DC23
	LDX.w #$0004
	LDA.w $0D0A
	CMP.w #$0001
	BNE.b CODE_81DC05
	LDX.w #$0002
CODE_81DC05:
	LDA.w #$2C5C
	JSR.w CODE_81DCC5
	LDY.w #$1B40
	JSR.w CODE_81DC23
	LDX.w #$0004
	LDA.w $0D0A
	CMP.w #$0002
	BNE.b CODE_81DC1F
	LDX.w #$0002
CODE_81DC1F:
	LDA.w #$385C
	JSR.w CODE_81DCC5
	LDY.w #$1B60
	JSR.w CODE_81DC23
	LDX.w #$0004
	LDA.w $0D0A
	CMP.w #$0003
	BNE.b CODE_81DC39
	LDX.w #$0002
CODE_81DC39:
	LDA.w #$445C
	JSR.w CODE_81DCC5
	LDY.w #$1B80
	JSR.w CODE_81DC23
	LDX.w #$0004
	LDA.w $0D0A
	CMP.w #$0004
	BNE.b CODE_81DC53
	LDX.w #$0002
CODE_81DC53:
	LDA.w #$505C
	JSR.w CODE_81DCC5
	LDY.w #DATA_81DC87
	LDA.w #$5F14
	LDX.w #$0006
	JSR.w CODE_81DCC5
	LDY.w #$1BA0
	JSR.w CODE_81DC23
	LDX.w #$0006
	LDA.w $0D0E
	AND.w #$000F
	BEQ.b CODE_81DC79
	LDX.w #$0002
CODE_81DC79:
	LDA.w #$5F5C
	JMP.w CODE_81DCC5

DATA_81DC7F:
	db $29,$0B,$0E,$1C,$1D,$2C,$05,$FF

DATA_81DC87:
	db $29,$0B,$0E,$1C,$1D,$2C,$15,$0A
	db $19,$FF,$16,$0A,$1B,$12,$18,$FF
	db $15,$1E,$12,$10,$12,$FF,$0B,$18
	db $20,$1C,$0E,$1B,$FF,$19,$1B,$12
	db $17,$0C,$0E,$1C,$1C,$FF,$0D,$25
	db $14,$25,$13,$1B,$FF,$14,$18,$18
	db $19,$0A,$FF,$1D,$18,$0A,$0D,$FF
	db $22,$18,$1C,$11,$12,$FF

CODE_81DCC5:
	CLC
	ADC.w $0D0C
	JMP.w CODE_81C838

CODE_81DCCC:
	LDA.w #DATA_81DD19
	STA.b $00
	LDY.w #$1B00
	LDX.w $1BC0
	INX
	INX
	BRA.b CODE_81DD02

CODE_81DCDB:
	LDA.l $306660,x
	CMP.l $306663,x
	BNE.b CODE_81DCFB
	SEP.b #$20
	LDA.l $306662,x
	AND.b #$0F
	STA.b $02
	LDA.l $306665,x
	AND.b #$0F
	CMP.b $02
	REP.b #$20
	BEQ.b CODE_81DCFF
CODE_81DCFB:
	INC.b $00
	INC.b $00
CODE_81DCFF:
	INX
	INX
	INX
CODE_81DD02:
	LDA.b ($00)
	STA.w $0001,y
	TYA
	CLC
	ADC.w #$0020
	TAY
	CMP.w #$1BA0
	BNE.b CODE_81DCDB
	LDA.w #$2B2B
	STA.w $0001,y
	RTS

DATA_81DD19:
	db $01,$90,$02,$95,$03,$96,$04,$9B
	db $05,$9B

CODE_81DC23:
	PHY
	TYA
	AND.w #$00F0
	LSR
	LSR
	LSR
	LSR
	LSR
	ORA.w #$0300
	JSR.w CODE_81DF14
	CLC
	ADC.w $1BC0
	TAX
	INX
	INX
	SEP.b #$20
	LDA.b #$29
	STA.w $0000,y
	LDA.b #$2C
	STA.w $0003,y
	LDA.l $306662,x
	AND.b #$0F
	CMP.b #$0A
	BCC.b CODE_81DD53
	JMP.w CODE_81DDAE

CODE_81DD53:
	STA.w $0004,y
	LDA.b #$28
	STA.w $0005,y
	LDA.l $306661,x
	PHA
	LSR
	LSR
	LSR
	LSR
	STA.w $0006,y
	PLA
	AND.b #$0F
	STA.w $0007,y
	LDA.b #$29
	STA.w $0008,y
	LDA.l $306660,x
	PHA
	LSR
	LSR
	LSR
	LSR
	STA.w $0009,y
	PLA
	AND.b #$0F
	STA.w $000A,y
	LDA.b #$2C
	STA.w $000B,y
	REP.b #$20
	LDA.l $306662,x
	AND.w #$00F0
	LSR
	LSR
	LSR
	TAX
	LDA.w DATA_81DDD3,x
	TAX
	SEP.b #$20
CODE_81DD9C:
	LDA.w $0000,x
	STA.w $000C,y
	CMP.b #$FF
	BEQ.b CODE_81DDAA
	INX
	INY
	BRA.b CODE_81DD9C

CODE_81DDAA:
	REP.b #$20
	PLY
	RTS

CODE_81DDAE:
	LDX.w #$0000
CODE_81DDB1:
	LDA.w DATA_81DDC3,x
	STA.w $0001,y
	CMP.b #$FF
	BEQ.b CODE_81DDBF
	INY
	INX
	BRA.b CODE_81DDB1

CODE_81DDBF:
	REP.b #$20
	PLY
	RTS

DATA_81DDC3:
	db $2B,$2B,$2C,$9C,$28,$9C,$9C,$29
	db $9C,$9C,$2C,$9C,$9C,$9C,$9C,$FF

DATA_81DDD3:
	db $91,$DC,$97,$DC,$9D,$DC,$A4,$DC
	db $AD,$DC,$B4,$DC,$BA,$DC,$BF,$DC

;--------------------------------------------------------------------

CODE_81DDE3:
	LDA.b $2C
	CMP.w #$0004
	BEQ.b CODE_81DDEB
	RTS

CODE_81DDEB:
	PHY
	PHX
	PHB
	PEA.w $3080
	PLB
	PHX
	LDA.w $0125-$01
	ORA.w #$1400
	JSR.w CODE_81DF14
	STA.b $04
	LDY.b $B8
	LDX.b $C8,y
	LDA.b $12,x
	ASL
	ASL
	ASL
	STA.b $08
	PLX
	LDY.w #$0005
	BRA.b CODE_81DE1F

CODE_81DE0F:
	LDA.b $00
	CMP.b $22,x
	BCC.b CODE_81DE29
	BNE.b CODE_81DE1F
	LDA.b $02
	CMP.b $20,x
	BEQ.b CODE_81DE29
	BCC.b CODE_81DE29
CODE_81DE1F:
	STY.b $06
	LDA.b $20,x
	STA.b $02
	LDA.b $22,x
	STA.b $00
CODE_81DE29:
	INX
	INX
	INX
	INX
	DEY
	BNE.b CODE_81DE0F
	PHX
	LDX.b $04
	LDA.l $306673,x
	AND.w #$000F
	CMP.b $00
	BCC.b CODE_81DE63
	BNE.b CODE_81DE4A
	LDA.l $306671,x
	CMP.b $02
	BCC.b CODE_81DE63
	BEQ.b CODE_81DE63
CODE_81DE4A:
	LDA.b $02
	STA.l $306671,x
	SEP.b #$20
	LDA.b $06
	STA.w $0D0E
	LDA.b $00
	AND.b #$0F
	ORA.b $08
	STA.l $306673,x
	REP.b #$20
CODE_81DE63:
	PLX
	LDA.b $20,x
	STA.b $02
	LDA.b $22,x
	STA.b $00
	LDA.b $04
	CLC
	ADC.w #$306660
	TAX
	LDY.w #$00000A
	LDA.w #$0013
	MVN $00000A>>16,$306660>>16
	PLB
	LDA.b $04
	CLC
	ADC.w #$000C
	TAY
	LDX.w #$0005
CODE_81DE87:
	LDA.w $306664,y
	AND.w #$000F
	CMP.b $00
	BCC.b CODE_81DEA2
	BNE.b CODE_81DE9C
	LDA.w $306662,y
	CMP.b $02
	BEQ.b CODE_81DEA2
	BCC.b CODE_81DEA2
CODE_81DE9C:
	DEY
	DEY
	DEY
	DEX
	BNE.b CODE_81DE87
CODE_81DEA2:
	TXA
	STA.l $000D0A
	CPX.w #$0005
	BEQ.b CODE_81DEE5
	INY
	INY
	INY
	LDA.b $02
	STA.w $306662,y
	SEP.b #$20
	LDA.b #$80
	STA.l $000D0F
	LDA.b $00
	AND.b #$0F
	ORA.b $08
	STA.w $306664,y
	REP.b #$20
	TXA
	STA.b $06
	ASL
	ADC.b $06
	TAX
CODE_81DECE:
	CPX.w #$000C
	BEQ.b CODE_81DEE5
	LDA.b $0C,x
	STA.w $306665,y
	LDA.b $0D,x
	STA.w $306666,y
	INX
	INX
	INX
	INY
	INY
	INY
	BRA.b CODE_81DECE

CODE_81DEE5:
	LDX.b $04
	JSR.w CODE_81DEF1
	STA.w $306660,x
	PLB
	PLX
	PLY
	RTS

CODE_81DEF1:
	PHX
	INX
	INX
	STZ.b $02
	LDY.w #$0012
	SEP.b #$20
CODE_81DEFB:
	CLC
	LDA.l $306660,x
	ADC.b $02
	STA.b $02
	LDA.b #$00
	ADC.b $03
	STA.b $03
	INX
	DEY
	BNE.b CODE_81DEFB
	REP.b #$20
	PLX
	LDA.b $02
	RTS

;--------------------------------------------------------------------

CODE_81DF14:
	SEP.b #$20
	STA.w !REGISTER_Multiplicand
	XBA
	STA.w !REGISTER_Multiplier
	NOP #3
	REP.b #$20
	LDA.w !REGISTER_ProductOrRemainderLo
	RTS

;--------------------------------------------------------------------

CODE_81DF26:
	LDA.w #$1000
	STA.w $1DD8
	LDA.w #$1100
	STA.w $1DDA
	STZ.w $1E10
	STZ.w $1E12
	STZ.w $1E14
	STZ.w $1E16
	LDA.w #$FFFF
	STA.w $1DD0
	STZ.w $1DD4
	STZ.w $1DDC
	STZ.w $1DDE
	RTS

;--------------------------------------------------------------------

CODE_81DF4E:
	LDX.b $B8
	LDA.w #$3FFF
	AND.b $AC,x
	STA.b $AC,x
	JMP.w CODE_81D4CB

;--------------------------------------------------------------------

CODE_81DF5A:
	LDX.b $B8
	LDA.b $AC,x
	ORA.w #$8000
	AND.w #$80FF
	STA.b $AC,x
	LDA.w #$2000
	STA.w $1010
	STA.w $1110
	CLC
	LDA.w #$0080
	ADC.b $94,x
	STA.b $94,x
	RTL

;--------------------------------------------------------------------

CODE_81DF78:
	LDX.b $B8
	LDA.b $AC,x
	ORA.w #$8000
	AND.w #$80FF
	STA.b $AC,x
	LDY.b $A8,x
	LDA.w $00A4,y
	CLC
	ADC.w $1E14,x
	STA.b $94,x
	LDA.w $1E14,x
	CMP.w #$8000
	BEQ.b CODE_81DFA1
	CLC
	ADC.w #$0200
	STA.w $1E14,x
	CLC
	BRA.b CODE_81DFC5

CODE_81DFA1:
	LDY.b $C8,x
	BMI.b CODE_81DFC5
	LDA.w #$4000
	AND.b $E2,x
	STA.b $E2,x
	LDA.w $0084,y
	BNE.b CODE_81DFC4
	LDA.b $38
	AND.w #$001F
	BEQ.b CODE_81DFC4
	TYA
	CLC
	ADC.b $B8
	TAX
	LDA.w #$8000
	ORA.b $6C,x
	STA.b $6C,x
CODE_81DFC4:
	SEC
CODE_81DFC5:
	RTL

;--------------------------------------------------------------------

UNK_C1DFC6:
	db $6B,$E2

;--------------------------------------------------------------------

CODE_81DFC7:
	LDA.w $0084,y
	BNE.b CODE_81DFE0
	LDA.b $38
	AND.w #$001F
	BEQ.b CODE_81DFE0
	TYA
	CLC
	ADC.b $B8
	TAX
	LDA.w #$8000
	ORA.b $6C,x
	STA.b $6C,x
CODE_81DFE0:
	SEC
	RTL

UNK_C1DFE2:
	dw $006B,$0000,$9D40,$0000,$4210,$0000,$2800,$0000
	dw $20C2,$0000,$0240,$0000,$5320,$0000,$0002

;--------------------------------------------------------------------

CODE_81E000:
	PHB
	PHK
	PLB
	REP.b #$30
	JSR.w CODE_81E404
	JSL.l CODE_808BEA
	JSR.w CODE_81F4D9
	JSR.w CODE_81E3EA
	JSR.w CODE_81F7E1
	JSL.l CODE_81E576
	JSL.l CODE_81E4B3
	JSL.l CODE_80FF93
	LDA.w #$0F00
	STA.w $0048
	LDA.w #$001A
	STA.w $0036
	SEP.b #$20
	CLI
	LDA.b #$B1
	STA.w !REGISTER_IRQNMIAndJoypadEnableFlags
	REP.b #$30
	LDA.w #$0004
	STA.b $32
	LDA.w #$8F00
	STA.b $48
	LDA.w #$0060
	STA.w $015E
	PLB
	RTL

;--------------------------------------------------------------------

DATA_81E049:
	dw CODE_81E0AC
	dw CODE_81E19E
	dw CODE_81E0AD
	dw CODE_81E126
	dw CODE_81E12E
	dw CODE_81E2F3
	dw CODE_81E13E
	dw CODE_81E22B
	dw CODE_81E388
	dw CODE_81E390
	dw CODE_81E398
	dw CODE_81E258
	dw CODE_81E34F
	dw CODE_81E0AC
	dw CODE_81E136

CODE_81E067:
	LDA.b $32
	BEQ.b CODE_81E0AC
	LDA.w $0160
	CMP.w #$8000
	BNE.b CODE_81E0AC
	SEP.b #$30
	PHB
	PHK
	PLB
	STZ.w !REGISTER_DMAEnable
	STZ.w !REGISTER_HDMAEnable
	LDA.b $36
	STA.w $0106
	STZ.b $36
	STZ.b $D0
	SEI
	STZ.w !REGISTER_IRQNMIAndJoypadEnableFlags
	REP.b #$30
	JSR.w CODE_81F3AA
	LDX.b $32
	JSR.w (DATA_81E049,x)
	LDA.w #$0001
	STA.b $48
	LDA.b $32
	STA.b $36
	STZ.b $32
	SEP.b #$30
	CLI
	LDA.b #$B1
	STA.l !REGISTER_IRQNMIAndJoypadEnableFlags
	REP.b #$30
	PLB
CODE_81E0AC:
	RTL

;--------------------------------------------------------------------

CODE_81E0AD:
	JSL.l CODE_80FF9A
	JSR.w CODE_81E50D
	JSR.w CODE_81E10A
	JSR.w CODE_81E118
	JSR.w CODE_81E584
	STZ.w $0E68
	LDX.w #$0006
CODE_81E0C3:
	LDA.l $088473,x					; Note: This supposedly reads from bank 08, but bank 08 doesn't exist.
	CMP.w DATA_81F239,x
	BNE.b CODE_81E0D2
	DEX
	BPL.b CODE_81E0C3
	DEC.w $0E68
CODE_81E0D2:
	LDA.w $0E32
	BEQ.b CODE_81E0FC
	STZ.w $0E32
	LDA.w $0E3A
	STA.b $2E
	LDA.w $0E3C
	STA.b $2C
	LDA.w $0E3E
	STA.w $0030
	LDA.w $0E44
	STA.w !RAM_SMK_Global_RaceCup
	LDA.w $0E40
	STA.w $1012
	LDA.w $0E42
	STA.w $1112
CODE_81E0FC:
	JSL.l CODE_858000
	STZ.w $0158
	STZ.w $0E50
	JSR.w CODE_81E933
	RTS

;--------------------------------------------------------------------

CODE_81E10A:
	LDY.w #SMK_GFX_TitleScreen
	LDA.w #SMK_GFX_TitleScreen>>16
	LDX.w #$7F0000
	JSL.l CODE_84E09E
	RTS

CODE_81E118:
	LDY.w #SMK_GFX_CharacterSelectScreen
	LDA.w #SMK_GFX_CharacterSelectScreen>>16
	LDX.w #$7FC000
	JSL.l CODE_84E09E
	RTS

;--------------------------------------------------------------------

CODE_81E126:
	JSR.w CODE_81E118
	JSL.l CODE_85909B
	RTS

;--------------------------------------------------------------------

CODE_81E12E:
	JSR.w CODE_81E118
	JSL.l CODE_859799
	RTS

;--------------------------------------------------------------------

CODE_81E136:
	JSR.w CODE_81E66C
	JSL.l CODE_83FB04
	RTS

;--------------------------------------------------------------------

CODE_81E13E:
	LDA.w #$0000
	STA.w $1012
	DEC.w $0E50
	STZ.w $0E52
	LDA.w #$0006
	STA.b $3A
	STZ.w $1D0C
	LDA.w #$1000
	STA.w $0E54
	JSL.l CODE_809CAA
	JSR.w CODE_81E1D0
	JSR.w CODE_81E66C
	LDA.w #$4600
	STA.w !REGISTER_VRAMAddressLo
	LDA.w #(!REGISTER_WriteToVRAMPortLo&$0000FF<<8)+$01
	STA.w DMA[$00].Parameters
	LDA.w #$7FA000
	STA.w DMA[$00].SourceLo
	LDA.w #$1000
	STA.w DMA[$00].SizeLo
	SEP.b #$20
	LDA.b #$7FA000>>16
	STA.w DMA[$00].SourceBank
	LDA.b #$80
	STA.w !REGISTER_VRAMAddressIncrementValue
	LDA.b #$01
	STA.w !REGISTER_DMAEnable
	REP.b #$20
	LDX.w #$1700
CODE_81E190:
	STZ.b $DA,x
	TXA
	SEC
	SBC.w #$0100
	TAX
	CPX.w #$1000
	BCS.b CODE_81E190
	RTS

;--------------------------------------------------------------------

CODE_81E19E:
	LDX.w $0158
	LDA.w DATA_81E1A9,x
	STA.b $3A
	JMP.w (DATA_81E1B9,x)

DATA_81E1A9:
	dw $0000,$0000,$0002,$0002,$0008,$0002,$0002,$0000

DATA_81E1B9:
	dw CODE_81E1C9
	dw CODE_81E1D6
	dw CODE_81E1F6
	dw CODE_81E1D6
	dw CODE_81E1D0
	dw CODE_81E1FC
	dw CODE_81E20F
	dw CODE_81E1D0

CODE_81E1C9:
	STZ.w !RAM_SMK_Global_CurrentRound
	JSL.l CODE_84D500
CODE_81E1D0:
	JSR.w CODE_81EE28
	JSR.w CODE_81E2A8
CODE_81E1D6:
	JSR.w CODE_81EC47
	JSR.w CODE_81E2B9
	JSR.w CODE_81F418
CODE_81E1DF:
	JSR.w CODE_81E2CC
	JSR.w CODE_81ED0C
	JSL.l CODE_818397
	JSR.w CODE_81ED50
	JSR.w CODE_81EF17
	JSR.w CODE_81F241
	JSR.w CODE_81E2E8
	RTS

CODE_81E1F6:
	JSL.l CODE_809FFF
	BRA.b CODE_81E1DF

CODE_81E1FC:
	LDA.w $0174
	STA.b $2E
	LDA.w #$0002
	STA.b $3A
	JSR.w CODE_81E2A8
	JSR.w CODE_81E2B9
	JSR.w CODE_81F418
CODE_81E20F:
	JSL.l CODE_84E536
	JSR.w CODE_81EDF2
	JSR.w CODE_81EC95
	JSR.w CODE_81E2CC
	JSL.l CODE_818397
	JSR.w CODE_81EC6B
	JSR.w CODE_81E2E8
	STZ.b $34
	STZ.b $38
	RTS

;--------------------------------------------------------------------

CODE_81E22B:
	LDA.w #$0002
	STA.b $3A
	LDA.w $0174
	STA.b $2E
	JSR.w CODE_81EDF2
	JSR.w CODE_81E2A8
	JSR.w CODE_81E2B9
	JSR.w CODE_81F413
	JSR.w CODE_81ECDD
	JSR.w CODE_81F148
	JSR.w CODE_81E2CC
	JSL.l CODE_818397
	JSR.w CODE_81E2E8
	JSR.w CODE_81E5D5
	JSR.w CODE_81E9EC
	RTS

;--------------------------------------------------------------------

CODE_81E258:
	LDA.b $2E
	STA.w $0174
	LDA.w #$0002
	STA.b $2E
	JSR.w CODE_81F7F5
	JSR.w CODE_81E50D
	JSR.w CODE_81EC95
	JSL.l CODE_81BF93
	JSR.w CODE_81EC5E
	JSR.w CODE_81E627
	JSR.w CODE_81F155
	JSR.w CODE_81F818
	JSR.w CODE_81E561
	BRA.b CODE_81E2DB

CODE_81E280:
	PHB
	PHK
	PLB
	JSR.w CODE_81F7F5
	JSR.w CODE_81EC5E
	JSR.w CODE_81FBB4
	JSR.w CODE_81EFB9
	JSR.w CODE_81F155
	JSR.w CODE_81F818
	JSR.w CODE_81E561
	JSL.l CODE_818354
	JSR.w CODE_81ED50
	JSL.l CODE_84EA17
	JSR.w CODE_81F1CC
	PLB
	RTL

CODE_81E2A8:
	JSR.w CODE_81F7F5
	JSR.w CODE_81E86A
	LDA.b $2C
	CMP.w #$0004
	BEQ.b CODE_81E2B8
	JSR.w CODE_81E584
CODE_81E2B8:
	RTS

CODE_81E2B9:
	JSR.w CODE_81E50D
	JSR.w CODE_81EC5E
	JSR.w CODE_81EB11
	JSR.w CODE_81E631
	JSR.w CODE_81E970
	JSR.w CODE_81FBB4
	RTS

CODE_81E2CC:
	JSR.w CODE_81E3FA
	JSR.w CODE_81E3AA
	JSR.w CODE_81EFB9
	JSR.w CODE_81E63F
	JSR.w CODE_81E9E5
CODE_81E2DB:
	JSR.w CODE_81F155
	JSR.w CODE_81F818
	JSR.w CODE_81E561
	JSR.w CODE_81E72E
	RTS

CODE_81E2E8:
	JSL.l CODE_84EA17
	JSR.w CODE_81F1CC
	JSR.w CODE_81F2C8
CODE_81E2F2:
	RTS

;--------------------------------------------------------------------

CODE_81E2F3:
	JSR.w CODE_81E50D
	LDY.w #SMK_GFX_Sprite_CheckeredFlag
	LDA.w #SMK_GFX_Sprite_CheckeredFlag>>16
	LDX.w #$7F0000
	JSL.l CODE_84E09E
	LDA.w #$4000
	STA.w !REGISTER_VRAMAddressLo
	LDA.w #$0080
	STA.w !REGISTER_VRAMAddressIncrementValue
	LDA.w #$0001
	STA.w DMA[$00].Parameters
	LDA.w #(($7F0000<<8)&$00FF00)|(!REGISTER_WriteToVRAMPortLo&$0000FF)
	STA.w DMA[$00].Destination
	LDA.w #$7F0000>>8
	STA.w DMA[$00].SourceHi
	LDA.w #$0800
	STA.w DMA[$00].SizeLo
	LDX.w #$0001
	STX.w !REGISTER_DMAEnable
	LDY.w #SMK_GFX_TitleScreen
	LDA.w #SMK_GFX_TitleScreen>>16
	LDX.w #$7F0000
	JSL.l CODE_84E09E
	LDY.w #SMK_GFX_CharacterSelectScreen
	LDA.w #SMK_GFX_CharacterSelectScreen>>16
	LDX.w #$7FC000
	JSL.l CODE_84E09E
	JSR.w CODE_81E592
	JSL.l CODE_85BB35
	RTS

;--------------------------------------------------------------------

CODE_81E34F:
	LDY.w #SMK_GFX_TournamentEndCutscene
	LDA.w #SMK_GFX_TournamentEndCutscene>>16
	LDX.w #$7FC000
	JSL.l CODE_84E09E
	LDY.w #$7FC000
	LDA.w #$7F0000>>16
	LDX.w #$7F0000
	JSL.l CODE_84E09E
	LDX.w #$2400
	LDY.w #$C000
	LDA.w #$0C98
	JSL.l CODE_819638
	LDX.w #$0C00
	LDY.w #$E800
	LDA.w #$0240
	JSL.l CODE_819638
	JSL.l CODE_859809
	RTS

;--------------------------------------------------------------------

CODE_81E388:
	JSR.w CODE_81E3A0
	JSL.l $088AAE
	RTS

;--------------------------------------------------------------------

CODE_81E390:
	JSR.w CODE_81E3A0
	JSL.l $088B66
	RTS

;--------------------------------------------------------------------

CODE_81E398:
	JSR.w CODE_81E3A0
	JSL.l $088BF5
	RTS

CODE_81E3A0:
	JSR.w CODE_81E68E
	JSR.w CODE_81EC5E
	JSR.w CODE_81E627
	RTS

;--------------------------------------------------------------------

CODE_81E3AA:
	LDX.w $002C
	JMP.w (DATA_81E3B0,x)

DATA_81E3B0:
	dw CODE_81E3B8
	dw CODE_81E3D0
	dw CODE_81E3CB
	dw CODE_81E3CB

CODE_81E3B8:
	LDX.w $10E6
	LDA.w DATA_81E3DA,x
	STA.w $0E00
	LDX.w $11E6
	LDA.w DATA_81E3DA,x
	STA.w $0E02
	RTS

CODE_81E3CB:
	LDA.w #$0000
	BRA.b CODE_81E3D3

CODE_81E3D0:
	LDA.w #$0003
CODE_81E3D3:
	STA.w $0E00
	STA.w $0E02
	RTS

DATA_81E3DA:
	dw $0002,$0002,$0003,$0003,$0004,$0004,$0005,$0005

;--------------------------------------------------------------------

CODE_81E3EA:
	SEP.b #$30
	LDX.b #$80
	LDA.b #!DSP1_Command80_NullCommand
CODE_81E3F0:
	STA.l !REGISTER_DSP1_DataRegister
	DEX
	BNE.b CODE_81E3F0
	REP.b #$30
	RTS

;--------------------------------------------------------------------

CODE_81E3FA:
	STZ.w $0100
	STZ.w $0102
	STZ.w $0104
	RTS

;--------------------------------------------------------------------

CODE_81E404:
	REP.b #$30
	LDA.w #$0000
	STA.l $7FFFFF
	LDA.w #$007E
	LDX.w #$2000
	LDY.w #$E000
	JSL.l CODE_81F60A
	LDA.w #$007F
	LDX.w #$0000
	LDY.w #$FFFF
	JSL.l CODE_81F60A
	LDA.w $1012
	AND.w #$FFFE
	CMP.w #$000F
	BCC.b CODE_81E435
	LDA.w #$0000
CODE_81E435:
	STA.b $00
	LDA.w $1112
	AND.w #$FFFE
	CMP.w #$000F
	BCC.b CODE_81E445
	LDA.w #$0002
CODE_81E445:
	STA.b $02
	LDX.w #$0032
	LDY.w #$1EFE
	JSL.l CODE_81F60A
	LDA.b $00
	STA.w $1012
	LDA.b $02
	STA.w $1112
	LDA.b $2C
	AND.w #$FFFE
	CMP.w #$0007
	BCC.b CODE_81E468
	LDA.w #$0000
CODE_81E468:
	STA.b $2C
	LDA.b $2E
	AND.w #$FFFE
	CMP.w #$0005
	BCC.b CODE_81E477
	LDA.w #$0002
CODE_81E477:
	STA.b $2E
	LDA.b $30
	AND.w #$FFFE
	CMP.w #$0005
	BCC.b CODE_81E486
	LDA.w #$0000
CODE_81E486:
	STA.b $30
	JSL.l CODE_818522
	LDA.w #$0000
	STA.w $0140
	SED
	CLC
	LDA.w $1F30
	ADC.w $1F32
	ADC.w $1F34
	ADC.w $1F36
	CMP.w $1F38
	BEQ.b CODE_81E4B1
	STZ.w $1F30
	STZ.w $1F32
	STZ.w $1F34
	STZ.w $1F36
CODE_81E4B1:
	CLD
	RTS

;--------------------------------------------------------------------

CODE_81E4B3:
	REP.b #$30
	LDY.w #DATA_C61F46
	LDA.w #DATA_C61F46>>16
	LDX.w #$7F0000
	JSL.l CODE_84E09E
	LDX.w #$0000
	STZ.b $10
CODE_81E4C7:
	STZ.b $12
CODE_81E4C9:
	PHX
	LDY.b $12
	CPY.b $10
	BCC.b CODE_81E4DC
	LDX.b $10
	PHY
	JSR.w CODE_81F722
	REP.b #$10
	PLY
	PLX
	BRA.b CODE_81E4EE

CODE_81E4DC:
	LDX.b $12
	LDY.b $10
	PHY
	JSR.w CODE_81F722
	REP.b #$10
	PLY
	PLX
	SEC
	SBC.b #$40
	EOR.b #$FF
	INC
CODE_81E4EE:
	STA.l $7F9000,x
	INX
	REP.b #$30
	LDA.b $12
	CMP.w #$003F
	BEQ.b CODE_81E500
	INC.b $12
	BRA.b CODE_81E4C9

CODE_81E500:
	LDA.b $10
	INC
	CMP.w #$0040
	BEQ.b CODE_81E50C
	STA.b $10
	BRA.b CODE_81E4C7

CODE_81E50C:
	RTL

;--------------------------------------------------------------------

CODE_81E50D:
	SEP.b #$30
	LDA.b #!SpriteGFXLocationInVRAMLo_4000|!SpriteGFXLocationInVRAMHi_Add1000|!SpriteSize_8x8_16x16
	STA.w !REGISTER_OAMSizeAndDataAreaDesignation
	STZ.w !REGISTER_BG1AddressAndSize
	LDA.b #$7B
	STA.w !REGISTER_BG2AddressAndSize
	STA.w !REGISTER_BG3AddressAndSize
	STA.w !REGISTER_BG4AddressAndSize
	LDA.b #$70
	STA.w !REGISTER_BG1And2TileDataDesignation
	LDA.b #$77
	STA.w !REGISTER_BG3And4TileDataDesignation
	LDA.b #$C0
	STA.w !REGISTER_Mode7TilemapSettings
	LDA.b #$01
	LDA.b #$10
	STA.w !REGISTER_MainScreenLayers
	STA.w !REGISTER_MainScreenWindowMask
	STZ.w !REGISTER_SubScreenLayers
	STZ.w !REGISTER_SubScreenWindowMask
	STZ.w !REGISTER_ColorMathSelectAndEnable
	STZ.w !REGISTER_InitialScreenSettings
	STZ.w !REGISTER_HCountTimerLo
	STZ.w !REGISTER_HCountTimerHi
	STZ.w !REGISTER_VCountTimerLo
	STZ.w !REGISTER_VCountTimerHi
	STZ.w !REGISTER_IRQNMIAndJoypadEnableFlags
	STZ.b $D0
	STZ.w !REGISTER_DMAEnable
	STZ.w !REGISTER_HDMAEnable
	REP.b #$30
	RTS

;--------------------------------------------------------------------

CODE_81E561:
	SEP.b #$20
	LDA.b #$80
	STA.w !REGISTER_HCountTimerLo
	STZ.w !REGISTER_HCountTimerHi
	STZ.w !REGISTER_VCountTimerHi
	LDA.b #$B1
	STA.w !REGISTER_IRQNMIAndJoypadEnableFlags
	REP.b #$20
	RTS

;--------------------------------------------------------------------

CODE_81E576:
	PHB
	PHK
	PLB
	JSR.w CODE_81E592
	JSR.w CODE_81E5A0
	JSR.w CODE_81E584
	PLB
	RTL

CODE_81E584:
	LDY.w #SMK_GFX_Sprite_Items
	LDA.w #SMK_GFX_Sprite_Items>>16
	LDX.w #$7F8000
	JSL.l CODE_84E09E
	RTS

CODE_81E592:
	LDY.w #SMK_GFX_Sprite_Letters
	LDA.w #SMK_GFX_Sprite_Letters>>16
	LDX.w #$7F4400
	JSL.l CODE_84E09E
	RTS

CODE_81E5A0:					; Note: This seems to be a 2BPP to 4BPP conversion routine.
	PHB
	LDA.w #$007F
	PHA
	PLB
	LDY.w #$0000
	LDX.w #$0000
CODE_81E5AC:
	LDA.w #$0008
	STA.b $1C
CODE_81E5B1:
	LDA.w $7F4400,y
	STA.w $7FA000,x
	INX
	INX
	INY
	INY
	DEC.b $1C
	BNE.b CODE_81E5B1
	LDA.w #$0008
	STA.b $1C
CODE_81E5C4:
	STZ.w $7FA000,x
	INX
	INX
	DEC.b $1C
	BNE.b CODE_81E5C4
	CPY.w #$2000
	BNE.b CODE_81E5AC
	PLB
	PLB
	RTS

;--------------------------------------------------------------------

CODE_81E5D5:
	REP.b #$30
	LDA.w #$0080
	STA.w !REGISTER_VRAMAddressIncrementValue
	LDA.w #SMK_GFX_Sprite_BattleModeBalloons>>16
	LDY.w #SMK_GFX_Sprite_BattleModeBalloons
	LDX.w #$7FC000
	JSL.l CODE_84E09E
	LDA.w #$5200
	STA.w !REGISTER_VRAMAddressLo
	LDA.w #$0001
	STA.w DMA[$00].Parameters
	LDA.w #(($7FC000<<8)&$00FF00)|(!REGISTER_WriteToVRAMPortLo&$0000FF)
	STA.w DMA[$00].Destination
	LDA.w #$7FC000>>8
	STA.w DMA[$00].SourceHi
	LDA.w #$0400
	STA.w DMA[$00].SizeLo
	LDA.w #$0001
	STA.w !REGISTER_DMAEnable
	LDA.w #$6200
	STA.w !REGISTER_VRAMAddressLo
	LDA.w #$7FC0
	STA.w DMA[$00].SourceHi
	LDA.w #$0400
	STA.w DMA[$00].SizeLo
	LDA.w #$0001
	STA.w !REGISTER_DMAEnable
	RTS

;--------------------------------------------------------------------

CODE_81E627:
	JSR.w CODE_81E631
	JSR.w CODE_81E63F
	JSR.w CODE_81E72E
	RTS

CODE_81E631:
	JSR.w CODE_81E68E
	JSR.w CODE_81E6D4
	JSR.w CODE_81E769
	JSL.l CODE_83F2C3
	RTS

CODE_81E63F:
	JSR.w CODE_81E745
	JSL.l CODE_84F147
	JSR.w CODE_81E7B5
	RTS

;--------------------------------------------------------------------

CODE_81E64A:
	LDA.w !RAM_SMK_Race_CurrentRacetrack
	ASL
	CLC
	ADC.w !RAM_SMK_Race_CurrentRacetrack
	TAX
	RTS

;--------------------------------------------------------------------

CODE_81E654:
	PHB
	PHK
	PLB
	JSR.w CODE_81EC47
	JSR.w CODE_81EC5E
	JSR.w CODE_81EB11
	JSR.w CODE_81E67A
	JSR.w CODE_81E66C
	JSL.l CODE_83F2C3
	PLB
	RTL

CODE_81E66C:
	LDY.w #SMK_PaletteDATA_8reditsLetters
	LDA.w #SMK_PaletteDATA_8reditsLetters>>16
	LDX.w #$7E3B80
	JSL.l CODE_84DF38
	RTS

CODE_81E67A:
	JSR.w CODE_81EC5E
	JSR.w CODE_81E745
	JSR.w CODE_81E6D4
	JSR.w CODE_81E72E
	RTS

;--------------------------------------------------------------------

CODE_81E687:
	JSR.w CODE_81E769
	JSR.w CODE_81E7B5
	RTS

;--------------------------------------------------------------------

CODE_81E68E:
	JSR.w CODE_81E6B9
	LDA.w #$0080
	STA.w !REGISTER_VRAMAddressIncrementValue
	LDA.w #$3000
	STA.w !REGISTER_VRAMAddressLo
	STZ.w DMA[$00].Parameters
	LDA.w #(($7F7000<<8)&$00FF00)|(!REGISTER_WriteToVRAMPortHi&$0000FF)
	STA.w DMA[$00].Destination
	LDA.w #$7F7000>>8
	STA.w DMA[$00].SourceHi
	LDA.w #$1000
	STA.w DMA[$00].SizeLo
	LDA.w #$0001
	STA.w !REGISTER_DMAEnable
	RTS

CODE_81E6B9:
	LDY.w #SMK_GFX_Mode7_GlobalTrackTiles
	LDA.w #SMK_GFX_Mode7_GlobalTrackTiles>>16
	LDX.w #$7F0000
	JSL.l CODE_84E09E
	LDX.w #$0000
	LDY.w #$7000
	LDA.w #$0040
	JSL.l CODE_84E378
	RTS

;--------------------------------------------------------------------

CODE_81E6D4:
	JSR.w CODE_81E84C
	LDA.l DATA_81EBA3,x
	TAY
	LDA.l DATA_81EBA3+$02,x
	AND.w #$00FF
	LDX.w #$7FC000
	JSL.l CODE_84E09E
	LDX.w #$C000
	LDY.w #$4000
	LDA.w #$00C0
	JSL.l CODE_84E378
	JSR.w CODE_81E84C
	LDA.l DATA_81EBEB,x
	TAY
	LDA.l DATA_81EBEB+$02,x
	AND.w #$00FF
	LDX.w #$7FC800
	JSL.l CODE_84E09E
	LDA.w #SMK_Tilemap_TimerAndItemBox>>16
	LDY.w #SMK_Tilemap_TimerAndItemBox
	LDX.w #$7FD000
	JSL.l CODE_84E09E
	JSR.w CODE_81E84C
	LDA.l DATA_81EC03,x
	TAY
	LDA.l DATA_81EC03+$02,x
	LDX.w #$7FC000
	JSL.l CODE_84E09E
	RTS

;--------------------------------------------------------------------

CODE_81E72E:					; Note: Routine that decompresses the palette data for tracks.
	JSR.w CODE_81E84C
	LDA.l DATA_81EBBB,x
	TAY
	LDA.l DATA_81EBBB+$02,x
	AND.w #$00FF
	LDX.w #$7E3A80
	JSL.l CODE_84DF38
	RTS

CODE_81E745:					; Note: Routine that decompresses the track data?
	JSR.w CODE_81E64A
	LDA.l DATA_81EB5B,x
	TAY
	LDA.l DATA_81EB5B+$02,x
	AND.w #$00FF
	LDX.w #$7FC000
	JSL.l CODE_84E09E
	LDY.w #$7FC000
	LDA.w #$7FC000>>16
	LDX.w #$7F0000
	JSL.l CODE_84E09E
	RTS

CODE_81E769:
	LDA.w #$0080
	STA.w !REGISTER_VRAMAddressIncrementValue
	STZ.w !REGISTER_VRAMAddressLo
	STZ.w DMA[$00].Parameters
	LDA.w #(($7F4000<<8)&$00FF00)|(!REGISTER_WriteToVRAMPortHi&$0000FF)
	STA.w DMA[$00].Destination
	LDA.w #$7F4000>>8
	STA.w DMA[$00].SourceHi
	LDA.w #$3000
	STA.w DMA[$00].SizeLo
	LDA.w #$0001
	STA.w !REGISTER_DMAEnable
	LDA.w #$7000
	STA.w !REGISTER_VRAMAddressLo
	LDA.w #(!REGISTER_WriteToVRAMPortLo&$0000FF<<8)+$01
	STA.w DMA[$00].Parameters
	STZ.w DMA[$00].SourceLo
	LDA.w #$7FC800>>8
	STA.w DMA[$00].SourceHi
	LDA.w #$1000
	STA.w DMA[$00].SizeLo
	LDA.w #$0001
	STA.w !REGISTER_DMAEnable
	JSR.w CODE_81E7DA
	JSR.w CODE_81E7F6
	RTS

CODE_81E7B5:
	STZ.w DMA[$00].Parameters
	LDA.w #$0000
	STA.w !REGISTER_VRAMAddressIncrementValue
	STZ.w !REGISTER_VRAMAddressLo
	LDA.w #(($7F0000<<8)&$00FF00)|(!REGISTER_WriteToVRAMPortLo&$0000FF)
	STA.w DMA[$00].Destination
	LDA.w #$7F0000>>8
	STA.w DMA[$00].SourceHi
	LDA.w #$4000
	STA.w DMA[$00].SizeLo
	LDA.w #$0001
	STA.w !REGISTER_DMAEnable
	RTS

CODE_81E7DA:
	LDA.w #$0080
	STA.w !REGISTER_VRAMAddressIncrementValue
	LDA.w #(!REGISTER_WriteToVRAMPortLo&$0000FF<<8)+$01
	STA.w DMA[$00].Parameters
	STZ.w DMA[$00].SourceLo
	LDX.w #$0600
	LDA.w #$7800
	LDY.w #$7FC000
	JSR.w CODE_81E836
	RTS

CODE_81E7F6:
	LDA.w #$0080
	STA.w !REGISTER_VRAMAddressIncrementValue
	LDA.w #(!REGISTER_WriteToVRAMPortLo&$0000FF<<8)+$01
	STA.w DMA[$00].Parameters
	STZ.w DMA[$00].SourceLo
	LDX.w #$0300
	LDA.w #$7C00
	LDY.w #$7FC100
	JSR.w CODE_81E836
	LDX.w #$0100
	LDA.w #$7D80
	LDY.w #$7FC000
	JSR.w CODE_81E836
	LDX.w #$0100
	LDA.w #$7E00
	LDY.w #$7FC500
	JSR.w CODE_81E836
	LDX.w #$0100
	LDA.w #$7E80
	LDY.w #$7FC400
	JSR.w CODE_81E836
	RTS

CODE_81E836:
	STY.w DMA[$00].SourceLo
	STA.w !REGISTER_VRAMAddressLo
	LDA.w #$7FC000>>16
	STA.w DMA[$00].SourceBank
	STX.w DMA[$00].SizeLo
	LDA.w #$0001
	STA.w !REGISTER_DMAEnable
	RTS

CODE_81E84C:
	LDA.w !RAM_SMK_Global_RacetrackType
	LSR
	CLC
	ADC.w !RAM_SMK_Global_RacetrackType
	TAX
	RTS

CODE_81E856:
	LDA.w #$0080
	STA.w !REGISTER_VRAMAddressIncrementValue
	LDY.w #SMK_GFX_Sprite_LakituAndSpriteHUD
	LDA.w #SMK_GFX_Sprite_LakituAndSpriteHUD>>16
	LDX.w #$7FC000
	JSL.l CODE_84E09E
	RTS

CODE_81E86A:
	JSR.w CODE_81E856
	LDA.w #$4400
	STA.w !REGISTER_VRAMAddressLo
	LDA.w #$0001
	STA.w DMA[$00].Parameters
	LDA.w #$0001
	STA.w DMA[$00].Parameters
	LDA.w #(($7FC200<<8)&$00FF00)|(!REGISTER_WriteToVRAMPortLo&$0000FF)
	STA.w DMA[$00].Destination
	LDA.w #$7FC200>>8
	STA.w DMA[$00].SourceHi
	LDX.w #$0001
	LDA.w $0E50
	BNE.b CODE_81E8B1
	LDA.w #$1000
	STA.w DMA[$00].SizeLo
	STX.w !REGISTER_DMAEnable
	LDA.w #$4FB0
	STA.w !REGISTER_VRAMAddressLo
	LDA.w #$7FC180
	STA.w DMA[$00].SourceLo
	LDA.w #$0080
	STA.w DMA[$00].SizeLo
	STX.w !REGISTER_DMAEnable
CODE_81E8B1:
	LDA.w #$4EB0
	STA.w !REGISTER_VRAMAddressLo
	LDA.w #$7FC120
	STA.w DMA[$00].SourceLo
	LDA.w #$0060
	STA.w DMA[$00].SizeLo
	STX.w !REGISTER_DMAEnable
	LDA.w #$5680
	STA.w !REGISTER_VRAMAddressLo
	LDA.w #$7FD200
	STA.w DMA[$00].SourceLo
	LDA.w #$7FD200>>16
	STA.w DMA[$00].SourceBank
	LDA.w #$00C0
	STA.w DMA[$00].SizeLo
	STX.w !REGISTER_DMAEnable
	LDA.w #$5780
	STA.w !REGISTER_VRAMAddressLo
	LDA.w #$7FD2C0
	STA.w DMA[$00].SourceLo
	LDA.w #$7FD2C0>>16
	STA.w DMA[$00].SourceBank
	LDA.w #$00C0
	STA.w DMA[$00].SizeLo
	STX.w !REGISTER_DMAEnable
	LDA.w #$6680
	STA.w !REGISTER_VRAMAddressLo
	LDA.w #$7FD200
	STA.w DMA[$00].SourceLo
	LDA.w #$7FD200>>16
	STA.w DMA[$00].SourceBank
	LDA.w #$00C0
	STA.w DMA[$00].SizeLo
	STX.w !REGISTER_DMAEnable
	LDA.w #$6780
	STA.w !REGISTER_VRAMAddressLo
	LDA.w #$7FD2C0
	STA.w DMA[$00].SourceLo
	LDA.w #$7FD2C0>>16
	STA.w DMA[$00].SourceBank
	LDA.w #$00C0
	STA.w DMA[$00].SizeLo
	STX.w !REGISTER_DMAEnable
	RTS

CODE_81E933:
	JSR.w CODE_81E856
	LDX.w #$0001
	LDA.w #$5060
	STA.w !REGISTER_VRAMAddressLo
	LDA.w #$7FD200
	STA.w DMA[$00].SourceLo
	LDA.w #$7FD200>>16
	STA.w DMA[$00].SourceBank
	LDA.w #$0040
	STA.w DMA[$00].SizeLo
	STX.w !REGISTER_DMAEnable
	LDA.w #$5160
	STA.w !REGISTER_VRAMAddressLo
	LDA.w #$7FD2C0
	STA.w DMA[$00].SourceLo
	LDA.w #$7FD2C0>>16
	STA.w DMA[$00].SourceBank
	LDA.w #$0040
	STA.w DMA[$00].SizeLo
	STX.w !REGISTER_DMAEnable
	RTS

CODE_81E970:
	JSR.w CODE_81E84C
	LDY.w !RAM_SMK_Global_RacetrackType
	CPY.w #!Define_SMK_RacetrackType_RainbowRoad
	BNE.b CODE_81E97E
	LDY.w #$000C
CODE_81E97E:
	STY.w $0E30
	LDY.w !RAM_SMK_Race_CurrentRacetrack
	CPY.w #!Define_SMK_RacetrackID_DonutPlains1
	BNE.b CODE_81E992
	LDY.w #$0002
	STY.w $0E30
	LDX.w #(!Define_SMK_RacetrackType_MarioCircuit/$02)*$03
CODE_81E992:
	LDY.w DATA_81EBD3,x
	LDA.w DATA_81EBD3+$02,x
	AND.w #$00FF
	LDX.w #$7F4000
	JSL.l CODE_84E09E
	LDA.w #$0080
	STA.w !REGISTER_VRAMAddressIncrementValue
	LDA.w #$4C00
	STA.w !REGISTER_VRAMAddressLo
	LDX.w #$0001
	STX.w DMA[$00].Parameters
	LDA.w #(($7F4000<<8)&$00FF00)|(!REGISTER_WriteToVRAMPortLo&$0000FF)
	STA.w DMA[$00].Destination
	LDA.w #$7F4000>>8
	STA.w DMA[$00].SourceHi
	LDA.w #$0560
	STA.w DMA[$00].SizeLo
	STX.w !REGISTER_DMAEnable
	LDA.w #$4F00
	STA.w !REGISTER_VRAMAddressLo
	LDA.w #$7F4600
	STA.w DMA[$00].SourceLo
	LDA.w #$7F4600>>16
	STA.w DMA[$00].SourceBank
	LDA.w #$0160
	STA.w DMA[$00].SizeLo
	STX.w !REGISTER_DMAEnable
	RTS

CODE_81E9E5:
	JSR.w CODE_81E9F0
	JSR.w CODE_81EA70
	RTS

CODE_81E9EC:
	JSR.w CODE_81E9F0
CODE_81E9EF:
	RTS

CODE_81E9F0:
	LDA.w $0E50
	BNE.b CODE_81E9EF
	LDA.w #$0080
	STA.w !REGISTER_VRAMAddressIncrementValue
	LDY.w #SMK_GFX_Sprite_TerrainEffects
	LDA.w #SMK_GFX_Sprite_TerrainEffects>>16
	LDX.w #$7FC000
	JSL.l CODE_84E09E
	LDA.w #$4000
	STA.w !REGISTER_VRAMAddressLo
	LDX.w #$0001
	STX.w DMA[$00].Parameters
	LDA.w #(($7FC000<<8)&$00FF00)|(!REGISTER_WriteToVRAMPortLo&$0000FF)
	STA.w DMA[$00].Destination
	LDA.w #$7FC000>>8
	STA.w DMA[$00].SourceHi
	LDA.w #$0800
	STA.w DMA[$00].SizeLo
	STX.w !REGISTER_DMAEnable
	LDY.w #SMK_GFX_Sprite_DirtAndTireSmoke
	LDA.w #SMK_GFX_Sprite_DirtAndTireSmoke>>16
	LDX.w #$7F6C00
	JSL.l CODE_84E09E
	LDX.w #$0001
	LDA.w #$5000
	STA.w !REGISTER_VRAMAddressLo
	LDA.w #$7F6C00
	STA.w DMA[$00].SourceLo
	LDA.w #$7F6C00>>16
	STA.w DMA[$00].SourceBank
	LDA.w #$0400
	STA.w DMA[$00].SizeLo
	STX.w !REGISTER_DMAEnable
	LDA.w #$6000
	STA.w !REGISTER_VRAMAddressLo
	LDA.w #$7F6C00
	STA.w DMA[$00].SourceLo
	LDA.w #$7F6C00>>16
	STA.w DMA[$00].SourceBank
	LDA.w #$0400
	STA.w DMA[$00].SizeLo
	STX.w !REGISTER_DMAEnable
	RTS

CODE_81EA70:
	LDY.w #SMK_GFX_Sprite_CharacterIcons
	LDA.w #SMK_GFX_Sprite_CharacterIcons>>16
	LDX.w #$7FC000
	JSL.l CODE_84E09E
	LDA.w #$5200
	STA.w !REGISTER_VRAMAddressLo
	LDX.w #$0001
	LDA.w #(!REGISTER_WriteToVRAMPortLo&$0000FF<<8)+$01
	STA.w DMA[$00].Parameters
	LDA.w #$7FC800
	STA.w DMA[$00].SourceLo
	LDA.w #$7FC800>>16
	STA.w DMA[$00].SourceBank
	LDA.w #$0680
	STA.w DMA[$00].SizeLo
	STX.w !REGISTER_DMAEnable
	LDA.w #$6200
	STA.w !REGISTER_VRAMAddressLo
	LDA.w #(!REGISTER_WriteToVRAMPortLo&$0000FF<<8)+$01
	STA.w DMA[$00].Parameters
	LDA.w #$7FC800
	STA.w DMA[$00].SourceLo
	LDA.w #$7FC800>>16
	STA.w DMA[$00].SourceBank
	LDA.w #$0400
	STA.w DMA[$00].SizeLo
	STX.w !REGISTER_DMAEnable
	LDA.w #$6400
	STA.w !REGISTER_VRAMAddressLo
	LDA.w #$0001
	STA.w DMA[$00].Parameters
	LDA.w #(!REGISTER_WriteToVRAMPortLo&$0000FF<<8)+$01
	STA.w DMA[$00].Parameters
	LDA.w #$7FCC80
	STA.w DMA[$00].SourceLo
	LDA.w #$7FCC80>>16
	STA.w DMA[$00].SourceBank
	LDA.w #$0280
	STA.w DMA[$00].SizeLo
	STX.w !REGISTER_DMAEnable
	LDY.w #SMK_GFX_Sprite_FlattenedDrivers
	LDA.w #SMK_GFX_Sprite_FlattenedDrivers>>16
	LDX.w #$7FCC00
	JSL.l CODE_84E09E
	LDY.w #SMK_GFX_Sprite_GiveUpSmoke
	LDA.w #SMK_GFX_Sprite_GiveUpSmoke>>16
	LDX.w #$7FC800
	JSL.l CODE_84E09E
	LDY.w #SMK_GFX_Sprite_AngryFace
	LDA.w #SMK_GFX_Sprite_AngryFace>>16
	LDX.w #$7FD580
	JSL.l CODE_84E09E
	RTS

CODE_81EB11:
	LDY.w #DATA_87FDBA
	LDA.w #DATA_87FDBA>>16
	LDX.w #$7F0000
	JSL.l CODE_84E09E
	LDY.w !RAM_SMK_Global_RacetrackType
	LDX.w DATA_81EB4B,y
	LDY.w #$0000
	SEP.b #$20
CODE_81EB29:
	LDA.l $7F0000,x
	STA.w $0B00,y
	INX
	INY
	CPY.w #$00C0
	BNE.b CODE_81EB29
	LDX.w #$0000
CODE_81EB3A:
	LDA.l $7F0000,x
	STA.w $0B00,y
	INX
	INY
	CPY.w #$0100
	BCC.b CODE_81EB3A
	REP.b #$20
	RTS

DATA_81EB4B:
	dw $0100,$0040,$0129,$0283,$0205,$02E7,$01A9,$0367

DATA_81EB5B:
	dl SMK_LevelData_MarioCircuit3
	dl SMK_LevelData_GhostValley2
	dl SMK_LevelData_DonutPlains2
	dl SMK_LevelData_BowserCastle2
	dl SMK_LevelData_VanillaLake2
	dl SMK_LevelData_RainbowRoad
	dl SMK_LevelData_KoopaBeach2
	dl SMK_LevelData_MarioCircuit1
	dl SMK_LevelData_GhostValley3
	dl SMK_LevelData_BowserCastle3
	dl SMK_LevelData_ChocoIsland2
	dl SMK_LevelData_DonutPlains3
	dl SMK_LevelData_VanillaLake1
	dl SMK_LevelData_KoopaBeach1
	dl SMK_LevelData_MarioCircuit4
	dl SMK_LevelData_MarioCircuit2
	dl SMK_LevelData_GhostValley1
	dl SMK_LevelData_BowserCastle1
	dl SMK_LevelData_ChocoIsland1
	dl SMK_LevelData_DonutPlains1
	dl SMK_LevelData_BattleCourse3
	dl SMK_LevelData_BattleCourse4
	dl SMK_LevelData_BattleCourse1
	dl SMK_LevelData_BattleCourse2

DATA_81EBA3:
	dl SMK_GFX_Mode7_GhostValleyTrack
	dl SMK_GFX_Mode7_MarioCircuitTrack
	dl SMK_GFX_Mode7_DonutPlainsTrack
	dl SMK_GFX_Mode7_ChocoIslandTrack
	dl SMK_GFX_Mode7_VanillaLakeTrack
	dl SMK_GFX_Mode7_KoopaBeachTrack
	dl SMK_GFX_Mode7_BowserCastleTrack
	dl SMK_GFX_Mode7_RainbowRoadTrack

DATA_81EBBB:
	dl SMK_PaletteData_GhostValleyCourse
	dl SMK_PaletteData_MarioCircuitCourse
	dl SMK_PaletteData_DonutPlainsCourse
	dl SMK_PaletteData_ChocoIslandCourse
	dl SMK_PaletteData_VanillaLakeCourse
	dl SMK_PaletteData_KoopaBeachCourse
	dl SMK_PaletteData_BowserCastleCourse
	dl SMK_PaletteData_RainbowRoadCourse

DATA_81EBD3:
	dl SMK_GFX_Sprite_GhostValleySupports
	dl SMK_GFX_Sprite_MarioCircuitPipes
	dl SMK_GFX_Sprite_DonutPlainsMoles
	dl SMK_GFX_Sprite_ChocoIslandPiranhaPlants
	dl SMK_GFX_Sprite_VanillaLakePipes
	dl SMK_GFX_Sprite_KoopaBeachCheepCheeps
	dl SMK_GFX_Sprite_BowserCastleThwomps
	dl SMK_GFX_Sprite_RainbowRoadThwomps

DATA_81EBEB:
	dl SMK_GFX_BG_GhostValley
	dl SMK_GFX_BG_MarioCicuit
	dl SMK_GFX_BG_DonutPlains
	dl SMK_GFX_BG_ChocoIsland
	dl SMK_GFX_BG_VanillaLake
	dl SMK_GFX_BG_KoopaBeach
	dl SMK_GFX_BG_BowserCastle
	dl SMK_GFX_BG_RainbowRoad

DATA_81EC03:
	dl SMK_Tilemap_GhostValleyBGs
	dl SMK_Tilemap_MarioCircuitBGs
	dl SMK_Tilemap_DonutPlainsBGs
	dl SMK_Tilemap_ChocoIslandBGs
	dl SMK_Tilemap_VanillaLakeBGs
	dl SMK_Tilemap_KoopaBeachBGs
	dl SMK_Tilemap_BowserCastleBGs
	dl SMK_Tilemap_RainbowRoadBGs

;--------------------------------------------------------------------

DATA_81EC1B:
	db !Define_SMK_RacetrackID_MarioCircuit1
	db !Define_SMK_RacetrackID_DonutPlains1
	db !Define_SMK_RacetrackID_GhostValley1
	db !Define_SMK_RacetrackID_BowserCastle1
	db !Define_SMK_RacetrackID_MarioCircuit2
	db !Define_SMK_RacetrackID_ChocoIsland1
	db !Define_SMK_RacetrackID_GhostValley2
	db !Define_SMK_RacetrackID_DonutPlains2
	db !Define_SMK_RacetrackID_BowserCastle2
	db !Define_SMK_RacetrackID_MarioCircuit3
	db !Define_SMK_RacetrackID_KoopaBeach1
	db !Define_SMK_RacetrackID_ChocoIsland2
	db !Define_SMK_RacetrackID_VanillaLake1
	db !Define_SMK_RacetrackID_BowserCastle3
	db !Define_SMK_RacetrackID_MarioCircuit4
	db !Define_SMK_RacetrackID_DonutPlains3
	db !Define_SMK_RacetrackID_KoopaBeach2
	db !Define_SMK_RacetrackID_GhostValley3
	db !Define_SMK_RacetrackID_VanillaLake2
	db !Define_SMK_RacetrackID_RainbowRoad

DATA_81EC2F:
	db !Define_SMK_RacetrackType_MarioCircuit
	db !Define_SMK_RacetrackType_GhostValley
	db !Define_SMK_RacetrackType_DonutPlains
	db !Define_SMK_RacetrackType_BowserCastle
	db !Define_SMK_RacetrackType_VanillaLake
	db !Define_SMK_RacetrackType_RainbowRoad
	db !Define_SMK_RacetrackType_KoopaBeach
	db !Define_SMK_RacetrackType_MarioCircuit
	db !Define_SMK_RacetrackType_GhostValley
	db !Define_SMK_RacetrackType_BowserCastle
	db !Define_SMK_RacetrackType_ChocoIsland
	db !Define_SMK_RacetrackType_DonutPlains
	db !Define_SMK_RacetrackType_VanillaLake
	db !Define_SMK_RacetrackType_KoopaBeach
	db !Define_SMK_RacetrackType_MarioCircuit
	db !Define_SMK_RacetrackType_MarioCircuit
	db !Define_SMK_RacetrackType_GhostValley
	db !Define_SMK_RacetrackType_BowserCastle
	db !Define_SMK_RacetrackType_ChocoIsland
	db !Define_SMK_RacetrackType_DonutPlains
	db !Define_SMK_RacetrackType_VanillaLake
	db !Define_SMK_RacetrackType_MarioCircuit
	db !Define_SMK_RacetrackType_DonutPlains
	db !Define_SMK_RacetrackType_KoopaBeach

CODE_81EC47:
	LDA.w !RAM_SMK_Global_RaceCup
	ASL
	ASL
	CLC
	ADC.w !RAM_SMK_Global_RaceCup
	ADC.w !RAM_SMK_Global_CurrentRound
	TAX
	LDA.w DATA_81EC1B,x
	AND.w #$00FF
	STA.w !RAM_SMK_Race_CurrentRacetrack
	RTS

CODE_81EC5E:
	LDX.w !RAM_SMK_Race_CurrentRacetrack
	LDA.w DATA_81EC2F,x
	AND.w #$00FF
	STA.w !RAM_SMK_Global_RacetrackType
	RTS

;--------------------------------------------------------------------

CODE_81EC6B:
	LDA.b $2C
	CMP.w #$0004
	BNE.b CODE_81EC94
	LDA.w $0E60
	BEQ.b CODE_81EC89
	LDA.w #$8000
	STA.w $1110
	LDA.w $0E66
	BEQ.b CODE_81EC94
	LDA.w #$2000
	STA.w $1210
	RTS

CODE_81EC89:
	LDA.w $0E66
	BEQ.b CODE_81EC94
	LDA.w #$2000
	STA.w $1110
CODE_81EC94:
	RTS

;--------------------------------------------------------------------

CODE_81EC95:
	LDA.w #$0002
	STA.b $30
	JSR.w CODE_81FEB6
	JSR.w CODE_81EDCF
	LDY.w #$0000
	LDA.b $2E
	BEQ.b CODE_81ECE0
	CMP.w #$0004
	BEQ.b CODE_81ECF1
	LDA.w #$1000
	JSR.w CODE_81EDE0
	LDA.w $0E60
	BEQ.b CODE_81ECC5
	LDA.w $0E64
	STA.w $1112
	LDA.w #$1100
	JSR.w CODE_81EDE0
	BRA.b CODE_81ECFA

CODE_81ECC5:
	LDA.w $0E66
	BEQ.b CODE_81ECD8
	LDA.w $0E62
	STA.w $1112
	LDA.w #$1100
	JSR.w CODE_81EDE0
	BRA.b CODE_81ECFA

CODE_81ECD8:
	STZ.w $1110
	BRA.b CODE_81ECFA

CODE_81ECDD:
	JSR.w CODE_81EDCF
CODE_81ECE0:
	LDY.w #$0000
	LDA.w #$1000
	JSR.w CODE_81EDE0
	LDA.w #$1100
	JSR.w CODE_81EDE0
	BRA.b CODE_81ECFA

CODE_81ECF1:
	STZ.w $1010
	LDA.w #$1100
	JSR.w CODE_81EDE0
CODE_81ECFA:
	LDA.w #$0000
CODE_81ECFD:
	STA.w $010E,y
	INY
	INY
	CPY.w #$0012
	BCC.b CODE_81ECFD
	JSR.w CODE_81EDF2
	BRA.b CODE_81ED61

CODE_81ED0C:
	REP.b #$30
	LDX.w #$1700
CODE_81ED11:
	CPX.w #$1200
	BCC.b CODE_81ED1D
CODE_81ED16:
	LDA.w #$2000
	STA.b $10,x
	BRA.b CODE_81ED44

CODE_81ED1D:
	CPX.w #$1000
	BEQ.b CODE_81ED33
	LDA.b $2E
	CMP.w #$0002
	BEQ.b CODE_81ED16
	LDA.w $0156
	BNE.b CODE_81ED3F
CODE_81ED2E:
	LDA.w #$0000
	BRA.b CODE_81ED42

CODE_81ED33:
	LDA.b $2E
	CMP.w #$0004
	BEQ.b CODE_81ED16
	LDA.w $0154
	BEQ.b CODE_81ED2E
CODE_81ED3F:
	LDA.w #$8040
CODE_81ED42:
	STA.b $10,x
CODE_81ED44:
	TXA
	SEC
	SBC.w #$0100
	TAX
	CMP.w #$1000
	BCS.b CODE_81ED11
	RTS

;--------------------------------------------------------------------

CODE_81ED50:
	LDX.w #$1700
CODE_81ED53:
	JSR.w CODE_81F0C5
	TXA
	SEC
	SBC.w #$0100
	TAX
	CMP.w #$1000
	BCS.b CODE_81ED53
CODE_81ED61:
	STZ.b $3C
	STZ.b $3E
	STZ.w $0144
	STZ.w $0E8E
	STZ.w $017E
	STZ.w !RAM_SMK_Race_NumberOfRacersWhoFinished
	STZ.w $0172
	STZ.w $0146
	STZ.b $4A
	STZ.w $0128
	STZ.w $0E12
	STZ.w $0E0E
	STZ.w $0E5E
	LDA.w #$FFFF
	STA.w $0178
	STA.w $0E10
	STA.w $0E8A
	LDA.w #$8500
	STA.w $014C
	STA.w $0122
	STA.w $0142
	LDX.w #$001C
	LDA.w #$FFFF
CODE_81EDA3:
	STA.l $000F32,x
	STA.l $000F50,x
	DEX
	DEX
	BPL.b CODE_81EDA3
	SEP.b #$30
	JSL.l CODE_808B1E
	REP.b #$30
	LDX.w #$0020
CODE_81EDBA:
	STZ.b $DE,x
	DEX
	DEX
	BPL.b CODE_81EDBA
	LDA.w #$0004
CODE_81EDC3:
	STA.b $38
	PHA
	JSL.l CODE_808E52
	PLA
	DEC
	BPL.b CODE_81EDC3
	RTS

;--------------------------------------------------------------------

CODE_81EDCF:
	LDX.w #$1200
CODE_81EDD2:
	STZ.b $10,x
	TXA
	CLC
	ADC.w #$0100
	TAX
	CMP.w #$1800
	BCC.b CODE_81EDD2
	RTS

;--------------------------------------------------------------------

CODE_81EDE0:
	STA.w $010E,y
	TAX
	TYA
	STA.b $E6,x
	LDA.w #$8040
	STA.b $10,x
	JSR.w CODE_81F0C5
	INY
	INY
	RTS

;--------------------------------------------------------------------

CODE_81EDF2:
	LDX.w #$1000
	LDA.w #$0710
	JSR.w CODE_81F01F
	LDX.w #$1100
	LDA.w #$0768
	JSR.w CODE_81F01F
	LDY.w #$000A
	LDX.w $0030
	BEQ.b CODE_81EE0F
	LDY.w #$0016
CODE_81EE0F:
	LDX.w #$000A
CODE_81EE12:
	LDA.w DATA_81EFE7,y
	STA.w $0E20,x
	DEY
	DEY
	DEX
	DEX
	BPL.b CODE_81EE12
	LDA.w #$0004
	STA.w $0154
	STA.w $0156
	RTS

;--------------------------------------------------------------------

CODE_81EE28:
	JSR.w CODE_81EDF2
	JSR.w CODE_81FEB6
	LDX.b $2E
	JSR.w (DATA_81EE72,x)
	LDX.w #$1700
CODE_81EE36:
	LDA.w DATA_81EE97,y
	CMP.w $1012
	BEQ.b CODE_81EE54
	CMP.w $1112
	BEQ.b CODE_81EE54
	STA.b $12,x
	INY
	INY
	TXA
	SEC
	SBC.w #$0100
	CMP.w #$1200
	BCC.b CODE_81EE58
	TAX
	BRA.b CODE_81EE36

CODE_81EE54:
	INY
	INY
	BRA.b CODE_81EE36

CODE_81EE58:
	LDA.w #$1000
	LDY.w #$000E
CODE_81EE5E:
	STA.w $010E,y
	STA.w $0F70,y
	TAX
	STY.b $E6,x
	STZ.b $F0,x
	CLC
	ADC.w #$0100
	DEY
	DEY
	BPL.b CODE_81EE5E
	RTS

DATA_81EE72:
	dw CODE_81EE8C
	dw CODE_81EE78
	dw CODE_81EE82

CODE_81EE78:
	LDA.w $1012
	JSR.w CODE_81EE8F
	STA.w $1112
	RTS

CODE_81EE82:
	LDA.w $1112
	JSR.w CODE_81EE8F
	STA.w $1012
	RTS

CODE_81EE8C:
	LDA.w $1112
CODE_81EE8F:
	ASL
	ASL
	ASL
	TAY
	LDA.w DATA_81EEA3,y
	RTS

DATA_81EE97:
	dw $0008,$0006,$000E,$0002,$000C,$0004

DATA_81EEA3:
	dw $000A,$0000,$000E,$0000,$0004,$000A,$0006,$0008
	dw $000C,$0002,$0000,$0002,$0006,$000E,$0008,$000C
	dw $000A,$0004,$0004,$000C,$0000,$0008,$0002,$000E
	dw $000A,$0006,$000C,$0004,$000A,$0002,$0006,$0000
	dw $000E,$0008,$0002,$000E,$0006,$0000,$0004,$0008
	dw $000C,$000A,$0006,$0008,$0000,$000E,$0002,$000A
	dw $0004,$000C,$000A,$0008,$0006,$0004,$0000,$000C
	dw $0002,$000E

;--------------------------------------------------------------------

CODE_81EF17:
	LDA.w !RAM_SMK_Global_CurrentRound
	BEQ.b CODE_81EF95
	LDY.w #$0000
	LDX.w $0F70,y
	LDA.b $10,x
	BMI.b CODE_81EF26
CODE_81EF26:
	TYA
	ASL
	ASL
	ASL
	CLC
	ADC.w #DATA_81EF55
	STA.b $00
	LDA.w #$810608>>16
	STA.b $02
	LDY.w #$0000
	LDX.w #$0000
CODE_81EF3B:
	LDA.w $0F70,x
	PHX
	TAX
	LDA.b $10,x
	BMI.b CODE_81EF4C
	LDA.b [$00],y
	AND.w #$00FF
	STA.b $DA,x
	INY
CODE_81EF4C:
	PLX
	INX
	INX
	CPX.w #$0010
	BCC.b CODE_81EF3B
	RTS

DATA_81EF55:
	dw $0608,$0204,$0000,$0000,$0608,$0204,$0000,$0000
	dw $0408,$0206,$0000,$0000,$0408,$0602,$0000,$0000
	dw $0408,$0002,$0006,$0000,$0408,$0002,$0600,$0000
	dw $0408,$0002,$0000,$0006,$0608,$0204,$0000,$0000

CODE_81EF95:
	LDA.w #$0008
	STA.b $1E
	LDY.w #$0000
CODE_81EF9D:
	LDX.w $010E,y
	LDA.b $10,x
	BMI.b CODE_81EFB1
	LDA.b $1E
	STA.b $DA,x
	DEC
	DEC
	BPL.b CODE_81EFAF
	LDA.w #$0000
CODE_81EFAF:
	STA.b $1E
CODE_81EFB1:
	INY
	INY
	CPY.w #$0010
	BCC.b CODE_81EF9D
	RTS

;--------------------------------------------------------------------

CODE_81EFB9:
	LDY.w #$1700
	LDX.w #$000E
CODE_81EFBF:
	LDA.l DATA_80846E,x
	STA.w $00B6,y
	CLC
	ADC.w #$1000
	STA.w $00B8,y
	LDA.l DATA_80847E,x
	PHX
	LDX.b $12,y
	ORA.l DATA_80848E,x
	STA.w $0014,y
	TYA
	SEC
	SBC.w #$0100
	TAY
	PLX
	DEX
	DEX
	BPL.b CODE_81EFBF
	RTS

;--------------------------------------------------------------------

DATA_81EFE7:
	dw $3FFF,$0120,$0080,$FE00,$FD00,$FF00,$5FFF,$0200
	dw $0040,$FD80,$FC80,$FE80

;--------------------------------------------------------------------

CODE_81EFFF:
	PHA
	LDA.b $30
	CMP.w #$0004
	BCC.b CODE_81F00F
	PLA
	STA.b $10
	LSR
	CLC
	ADC.b $10
	RTS

CODE_81F00F:
	PLA
	RTS

CODE_81F011:
	PHA
	LDA.b $30
	CMP.w #$0004
	BCC.b CODE_81F00F
	PLA
	CLC
	ADC.w #$0030
	RTS

CODE_81F01F:
	STA.b $04
	STZ.b $06
	LDY.b $12,x
	PHY
	LDA.w DATA_818000,y
	LDY.b $2C
	BNE.b CODE_81F040
	LDY.b $30
	BEQ.b CODE_81F03C
	CPY.w #$0002
	BEQ.b CODE_81F040
	CLC
	ADC.w #$00A0
	BRA.b CODE_81F040

CODE_81F03C:
	SEC
	SBC.w #$0080
CODE_81F040:
	STA.w $00B4,x
	PLY
	LDX.w DATA_818010,y
	PHY
	LDY.w #$0000
CODE_81F04B:
	LDA.w !ContextDependentTable,x
	AND.w #$00FF
	ASL
	ASL
	ASL
	ASL
	JSR.w CODE_81EFFF
	STA.b [$04],y
	INX
	INY
	INY
	CPY.w #$0020
	BCC.b CODE_81F04B
	PLY
	LDX.w DATA_818060,y
	PHY
	LDY.w #$0020
CODE_81F06A:
	CPY.w #$0034
	BCS.b CODE_81F074
	LDA.w #$FFFF
	BRA.b CODE_81F082

CODE_81F074:
	LDA.w !ContextDependentTable,x
	AND.w #$00FF
	ASL
	ASL
	ASL
	ASL
	JSR.w CODE_81F011
	INX
CODE_81F082:
	STA.b [$04],y
	INY
	INY
	CPY.w #$0040
	BCC.b CODE_81F06A
	PLY
	LDX.w DATA_818088,y
	LDY.w #$0040
CODE_81F092:
	LDA.w !ContextDependentTable,x
	STA.b [$04],y
	INY
	INY
	LDA.w !ContextDependentTable+$02,x
	AND.w #$00FF
	STA.b [$04],y
	INY
	INY
	LDA.w !ContextDependentTable+$03,x
	AND.w #$00FF
	STA.b [$04],y
	INY
	INY
	LDA.w !ContextDependentTable+$04,x
	AND.w #$00FF
	STA.b [$04],y
	INY
	INY
	CPY.w #$0058
	BEQ.b CODE_81F0C4
	TXA
	CLC
	ADC.w #$0005
	TAX
	BRA.b CODE_81F092

CODE_81F0C4:
	RTS

;--------------------------------------------------------------------

CODE_81F0C5:
	STZ.b $A4,x
	STZ.b $A2,x
	STZ.b $2A,x
	STZ.b $D0,x
	STZ.b $CC,x
	STZ.b $CE,x
	STZ.b $D6,x
	STZ.b $22,x
	STZ.b $24,x
	STZ.b $26,x
	STZ.b $C4,x
	STZ.b $C2,x
	STZ.b $E0,x
	STZ.b $CA,x
	STZ.b $FC,x
	STZ.b $E4,x
	LDA.b $E2,x
	AND.w #$4000
	STA.b $E2,x
	LDA.w $0018,x
	LSR
	LSR
	LSR
	LSR
	STA.b $10
	LDA.w $001C,x
	ASL
	ASL
	AND.w #$FFC0
	ORA.b $10
	PHX
	TAX
	LDA.l $7F5000,x
	AND.w #$00FF
	ORA.w #$7F00
	PLX
	STA.b $C0,x
	STA.b $DC,x
	STA.b $F8,x
	STZ.b $A0,x
	STZ.b $C8,x
	STZ.b $AC,x
	STZ.b $E8,x
	STZ.b $EA,x
	STZ.b $EC,x
	STZ.b $EE,x
	STZ.b $B2,x
	STZ.b $A6,x
	STZ.b $A8,x
	STZ.b $AA,x
	STZ.b $FA,x
	STZ.b $28,x
	LDA.w #$0040
	STA.b $DE,x
	LDA.w #$0140
	STA.b $30,x
	STA.b $36,x
	STA.b $BA,x
	STA.b $BC,x
	STZ.b $C6,x
	STZ.b $D4,x
	STZ.b $FE,x
	LDA.w #$FFFF
	STA.b $F6,x
	RTS

;--------------------------------------------------------------------

CODE_81F148:
	LDA.w #$8000
	STA.w $11A4
	STA.w $11A2
	STA.w $112A
	RTS

;--------------------------------------------------------------------

CODE_81F155:
	LDX.b $2E
	JMP.w (DATA_81F15A,x)

DATA_81F15A:
	dw CODE_81F160
	dw CODE_81F173
	dw CODE_81F189

CODE_81F160:
	LDA.w #$1000
	LDX.w #$0000
	JSR.w CODE_81F19F
	LDA.w #$1100
	LDX.w #$0002
	JSR.w CODE_81F19F
	RTS

CODE_81F173:
	LDA.w #$1000
	LDX.w #$0000
	JSR.w CODE_81F19F
	LDA.w #$1000
	LDY.w #$1100
	LDX.w #$0002
	JSR.w CODE_81F1AD
	RTS

CODE_81F189:
	LDA.w #$1100
	LDY.w #$1000
	LDX.w #$0000
	JSR.w CODE_81F1AD
	LDA.w #$1100
	LDX.w #$0002
	JSR.w CODE_81F19F
	RTS

CODE_81F19F:
	STA.b $A8,x
	TAY
	TXA
	STA.w $00D2,y
	STZ.b $A4,x
	LDA.w #$C0C0
	BRA.b CODE_81F1BD

CODE_81F1AD:
	STA.b $A8,x
	LDA.w #$FFFF
	STA.w $00D2,y
	LDA.w #$0006
	STA.b $A4,x
	LDA.w #$00C0
CODE_81F1BD:
	STA.b $AC,x
	LDA.w #$00C0
	STA.b $D4,x
	STA.b $DC,x
	STZ.b $D8,x
	STZ.w $0E04,x
	RTS

;--------------------------------------------------------------------

CODE_81F1CC:
	LDA.w $1F05
	BIT.w #$4000
	BNE.b CODE_81F1D9
	LDA.b $3A
	BEQ.b CODE_81F1DF
	RTS

CODE_81F1D9:
	LDA.w #$0008
	STA.b $3A
	RTS

CODE_81F1DF:
	LDX.b $2E
	JMP.w (DATA_81F1E4,x)

DATA_81F1E4:
	dw CODE_81F1EA
	dw CODE_81F1FB
	dw CODE_81F1F3

CODE_81F1EA:
	LDX.w #$1000
	LDY.w #$0000
	JSR.w CODE_81F201
CODE_81F1F3:
	LDX.w #$1100
	LDY.w #$0002
	BRA.b CODE_81F201

CODE_81F1FB:
	LDX.w #$1000
	LDY.w #$0000
CODE_81F201:
	LDA.b $18,x
	ASL
	ASL
	STA.w $0088,y
	LDA.b $1C,x
	SEC
	SBC.w #$0300
	ASL
	ASL
	STA.w $008C,y
	LDA.w #$8000
	STA.w $0094,y
	LDA.w $00AC,y
	AND.w #$3FFF
	STA.w $00AC,y
	LDA.w #$0020
	STA.w $015E
	RTS

;--------------------------------------------------------------------

DATA_81F229:
	dw $02F4,$8A36,$45E1,$9BC0,$52D7,$FFF0,$C2B1,$0002

DATA_81F239:
	dw $0901,$0306,$0900,$0200

;--------------------------------------------------------------------

CODE_81F241:
	LDA.b $2C
	BNE.b CODE_81F2A7
	LDA.w $0E32
	BNE.b CODE_81F2A7
	LDY.w #$0000
	LDX.w #$0000
CODE_81F250:
	LDA.w DATA_81F2A8-$01,x
	AND.w #$FF00
	ORA.w #$0008
	STA.w $0204,y
	CLC
	ADC.w #$0008
	STA.w $0200,y
	LDA.w DATA_81F2A8+$01,x
	AND.w #$00FF
	ORA.w #$3300
	STA.w $0206,y
	LDA.w DATA_81F2B8-$01,x
	AND.w #$FF00
	ORA.w #$0008
	STA.w $0424,y
	CLC
	ADC.w #$0008
	STA.w $0420,y
	LDA.w DATA_81F2B8+$01,x
	AND.w #$00FF
	ORA.w #$3300
	STA.w $0426,y
	TXA
	CLC
	ADC.w #$0004
	TAX
	TYA
	ADC.w #$0008
	TAY
	CPX.w #$0010
	BNE.b CODE_81F250
	LDA.w #$FFFF
	STA.w $0400
	STA.w $0620
CODE_81F2A7:
	RTS

DATA_81F2A8:
	dw $4027,$010E,$4138,$0110,$4249,$0112,$435A,$0114

DATA_81F2B8:
	dw $4074,$0116,$4185,$0118,$4296,$011A,$43A7,$011C

;--------------------------------------------------------------------

CODE_81F2C8:
	LDA.w $0E50
	BEQ.b CODE_81F2CE
	RTS

CODE_81F2CE:
	STZ.w $0E0C
	STZ.w $0E14
	STZ.b $40
	LDX.w !RAM_SMK_Global_RacetrackType
	LDA.w DATA_81F398,x
	STA.b $42
	LDA.w #$0080
	STA.b $D2
	LDA.w #$0001
	STA.w $0E46
	LDX.b $2E
	JMP.w (DATA_81F2EE,x)

DATA_81F2EE:
	dw CODE_81F310
	dw CODE_81F2F4
	dw CODE_81F302

CODE_81F2F4:
	JSR.w CODE_81F327
	LDA.w #$007C
	STA.w $0E48
	LDX.w #$1000
	BRA.b CODE_81F366

CODE_81F302:
	JSR.w CODE_81F336
	LDA.w #$007C
	STA.w $0E48
	LDX.w #$1100
	BRA.b CODE_81F366

CODE_81F310:
	JSR.w CODE_81F327
	JSR.w CODE_81F336
	LDA.w #$007D
	STA.w $0E48
	LDX.w #$1000
	JSR.w CODE_81F366
	LDX.w #$1100
	BRA.b CODE_81F36D

CODE_81F327:
	LDA.w $1084
	BEQ.b CODE_81F331
	LDA.w #$0040
	BRA.b CODE_81F343

CODE_81F331:
	LDA.w #$0010
	BRA.b CODE_81F343

CODE_81F336:
	LDA.w $1184
	BEQ.b CODE_81F340
	LDA.w #$0020
	BRA.b CODE_81F343

CODE_81F340:
	LDA.w #$0008
CODE_81F343:
	TSB.b $D2
	RTS

CODE_81F346:
	LDA.w #$0001
	STA.w $0E0C
	LDA.w #$0004
	STA.w $0E18
CODE_81F352:
	LDA.w #$7F00
	STA.b $40
	STZ.b $42
	LDA.w #$0001
	STA.w $0E46
	LDA.w #$007C
	STA.w $0E48
	RTS

;--------------------------------------------------------------------

CODE_81F366:
	LDY.b $12,x
	LDA.w DATA_81F388,y
	BRA.b CODE_81F376

CODE_81F36D:
	LDY.b $12,x
	LDA.w DATA_81F388,y
	CLC
	ADC.w #$0004
CODE_81F376:
	LDY.w $0E46
	STA.w $0E48,y
	INC.w $0E46
	RTS

;--------------------------------------------------------------------

CODE_81F380:
	LDX.b $32
	CPX.w #$000A
	BEQ.b CODE_81F352
	RTS

;--------------------------------------------------------------------

DATA_81F388:
	dw $0070,$0070,$0071,$0073,$0071,$0072,$0072,$0073

DATA_81F398:
	dw $8000,$0000,$0000,$0000,$8000,$0000,$8000,$0000
	dw $8000

;--------------------------------------------------------------------

CODE_81F3AA:
	LDA.w $0120
	BNE.b CODE_81F380
	DEC.w $0120
	STZ.w $0E0C
	STZ.w $0E6A
	LDA.w #$3F00
	STA.w !REGISTER_APUPort0
	STZ.w !REGISTER_APUPort2
	JSL.l CODE_81F4FD
	LDX.b $32
	JMP.w (DATA_81F3CA,x)

DATA_81F3CA:
	dw CODE_81F412
	dw CODE_81F412
	dw CODE_81F3E8
	dw CODE_81F40A
	dw CODE_81F40A
	dw CODE_81F352
	dw CODE_81F3F0
	dw CODE_81F412
	dw CODE_81F412
	dw CODE_81F412
	dw CODE_81F412
	dw CODE_81F40A
	dw CODE_81F3F8
	dw CODE_81F412
	dw CODE_81F412

CODE_81F3E8:
	JSR.w CODE_81F346
	LDX.w #$0000
	BRA.b CODE_81F427

CODE_81F3F0:
	JSR.w CODE_81F346
	LDX.w #$0024
	BRA.b CODE_81F427

CODE_81F3F8:
	JSR.w CODE_81F346
	LDA.w $190E
	BEQ.b CODE_81F405
	LDX.w #$0021
	BRA.b CODE_81F427

CODE_81F405:
	LDX.w #$001E
	BRA.b CODE_81F427

CODE_81F40A:
	JSR.w CODE_81F346
	LDX.w #$0003
	BRA.w CODE_81F427

CODE_81F412:
	RTS

;--------------------------------------------------------------------

; Note: Routine that uploads new music to the SPC700.

CODE_81F413:
	LDX.w #$001B
	BRA.b CODE_81F427

CODE_81F418:
	LDA.w $0E50
	BNE.b CODE_81F46C
	LDX.w !RAM_SMK_Global_RacetrackType
	LDA.w DATA_81F46D,x
	AND.w #$00FF
	TAX
CODE_81F427:
	LDA.w $0E32
	BNE.b CODE_81F46C
	LDY.w DATA_81F47E,x
	LDA.w DATA_81F47E+$02,x
	AND.w #$00FF
	LDX.w #$7FC000
	JSL.l CODE_84E09E
	SEP.b #$20
	STZ.w !REGISTER_APUPort3
	STZ.w !REGISTER_APUPort2
	STZ.w !REGISTER_APUPort1
	STZ.w !REGISTER_APUPort0
	JSL.l CODE_81F4FD
	LDA.b #$1F
	STA.w !REGISTER_APUPort0
	JSL.l CODE_81F4FD
	LDY.w #$C000
	LDA.b #$7F
	JSL.l CODE_81F504
	REP.b #$30
	STZ.w !REGISTER_APUPort0
	STZ.w !REGISTER_APUPort2
	JSL.l CODE_81F4FD
CODE_81F46C:
	RTS

DATA_81F46D:
	dw $0015,$0006,$0009,$000C,$0012,$000F,$0018,$0027
	db $1B

DATA_81F47E:
	dl SMK_MusicData_TitleScreen
	dl SMK_MusicData_CharacterSelect
	dl SMK_MusicData_MarioCircut
	dl SMK_MusicData_DonutPlains
	dl SMK_MusicData_ChocoIsland
	dl SMK_MusicData_KoopaBeach
	dl SMK_MusicData_VanillaLake
	dl SMK_MusicData_GhostValley
	dl SMK_MusicData_BowserCastle
	dl SMK_MusicData_BattleMode
	dl SMK_MusicData_TournamentWin
	dl SMK_MusicData_TournamentLose
	dl SMK_MusicData_StaffRoll
	dl SMK_MusicData_RainbowRoad

;--------------------------------------------------------------------

CODE_81F4A8:
	STZ.w !REGISTER_APUPort0
	STZ.w !REGISTER_APUPort1
	RTS

;--------------------------------------------------------------------

CODE_81F4AF:
	STZ.b $42
	RTS

;--------------------------------------------------------------------

CODE_81F4B2:
	STZ.w $0120
	LDA.w #$001E
	STA.w $0E18
	LDA.w #$0001
	STA.w $0E0C
	LDA.w #$003F
	STA.b $41
	STZ.b $42
	RTL

;--------------------------------------------------------------------

CODE_81F4C9:
	LDA.w #$000F
	STA.b $41
	STZ.b $42
	RTL

;--------------------------------------------------------------------

CODE_81F4D1:
	LDA.b $42
	AND.w #$8080
	STA.b $42
	RTL

;--------------------------------------------------------------------

CODE_81F4D9:
	LDA.w #DATA_828000>>16
	LDY.w #DATA_828000
	JSL.l CODE_81F504
	REP.b #$30
	JSL.l CODE_81F4FD
	LDA.w #$4020
	STA.w !REGISTER_APUPort0
	JSL.l CODE_81F4FD
	LDA.w #$4000
	STA.w !REGISTER_APUPort0
	STZ.w $0E0C
	RTS

;--------------------------------------------------------------------

CODE_81F4FD:
	LDX.w #$4000
CODE_81F500:
	DEX
	BNE.b CODE_81F500
	RTL

CODE_81F504:
	SEP.b #$20
	STY.b $10
	STA.b $12
	LDY.w #$0000
	LDX.w #$BBAA
CODE_81F510:
	CPX.w !REGISTER_APUPort0
	BNE.b CODE_81F510
	LDA.b #$CC
	BRA.b CODE_81F53F

CODE_81F519:
	JSR.w CODE_81F56C
	XBA
	LDA.b #$00
	BRA.b CODE_81F52C

CODE_81F521:
	XBA
	JSR.w CODE_81F56C
	XBA
CODE_81F526:
	CMP.w !REGISTER_APUPort0
	BNE.b CODE_81F526
	INC
CODE_81F52C:
	REP.b #$20
	STA.w !REGISTER_APUPort0
	SEP.b #$20
	DEX
	BNE.b CODE_81F521
CODE_81F536:
	CMP.w !REGISTER_APUPort0
	BNE.b CODE_81F536
CODE_81F53B:
	ADC.b #$03
	BEQ.b CODE_81F53B
CODE_81F53F:
	PHA
	JSR.w CODE_81F56C
	XBA
	JSR.w CODE_81F56C
	XBA
	TAX
	JSR.w CODE_81F56C
	STA.w !REGISTER_APUPort2
	JSR.w CODE_81F56C
	STA.w !REGISTER_APUPort3
	CPX.w #$0001
	LDA.b #$00
	ROL
	STA.w !REGISTER_APUPort1
	ADC.b #$7F
	PLA
	STA.w !REGISTER_APUPort0
CODE_81F564:
	CMP.w !REGISTER_APUPort0
	BNE.b CODE_81F564
	BVS.b CODE_81F519
	RTL

CODE_81F56C:
	LDA.b [$10],y
	INY
	CPY.w #$8000
	BNE.b CODE_81F579
	INC.b $12
	LDY.w #$0000
CODE_81F579:
	RTS

;--------------------------------------------------------------------

CODE_81F57A:
	PHX
	PHA
	CPX.w #$1100
	BEQ.b CODE_81F597
	BCC.b CODE_81F588
	PLA
	PLX
	RTL

CODE_81F586:
	PHX
	PHA
CODE_81F588:
	LDA.w $1010
	BPL.b CODE_81F5A4
	BIT.w #$0020
	BNE.b CODE_81F5A4
	PLA
	BRA.b CODE_81F5A8

CODE_81F595:
	PHX
	PHA
CODE_81F597:
	LDA.w $1110
	BPL.b CODE_81F5A4
	BIT.w #$0020
	BNE.b CODE_81F5A4
	PLA
	BRA.b CODE_81F5C3

CODE_81F5A4:
	PLA
	PLX
	RTL

CODE_81F5A7:
	PHX
CODE_81F5A8:
	PHY
	PHP
	REP.b #$30
	LDX.w $0E32
	BNE.b CODE_81F5BB
CODE_81F5B1:
	LDY.w #$0000
	JSR.w CODE_81F5E2
	PLP
	PLY
	PLX
	RTL

CODE_81F5BB:
	STZ.w $0E6A
CODE_81F5BE:
	PLP
	PLY
	PLX
	RTL

CODE_81F5C2:
	PHX
CODE_81F5C3:
	PHY
	PHP
	REP.b #$30
	LDX.b $2E
	CPX.w #$0004
	BEQ.b CODE_81F5B1
	LDX.w $0E32
	BNE.b CODE_81F5BB
	LDX.w $0E60
	BNE.b CODE_81F5BE
	LDY.w #$FFFF
	JSR.w CODE_81F5E2
	PLP
	PLY
	PLX
	RTL

;--------------------------------------------------------------------

CODE_81F5E2:
	LDX.w $0E6A
	CPX.w #$0006
	BCS.b CODE_81F5F6
	STA.w $0E6C,x
	TYA
	STA.w $0E74,x
	INX
	INX
	STX.w $0E6A
CODE_81F5F6:
	RTS

;--------------------------------------------------------------------

CODE_81F5F7:
	RTL

;--------------------------------------------------------------------

CODE_81F5F8:
	PHA
	LDA.w $0E50
	BNE.b CODE_81F634
	PLA
	STY.w DMA[$00].SizeLo
	LDY.w #DATA_81F636
	STY.w DMA[$00].SourceLo
	BRA.b CODE_81F613

CODE_81F60A:
	STY.w DMA[$00].SizeLo
	LDY.w #DATA_81F636+$01
	STY.w DMA[$00].SourceLo
CODE_81F613:
	STX.w !REGISTER_WRAMAddressLo
	SEP.b #$20
	AND.b #$01
	STA.w !REGISTER_WRAMAddressBank
	LDA.b #DATA_81F636>>16
	STA.w DMA[$00].SourceBank
	LDA.b #$08
	STA.w DMA[$00].Parameters
	LDA.b #!REGISTER_ReadOrWriteToWRAMPort
	STA.w DMA[$00].Destination
	LDA.b #$01
	STA.w !REGISTER_DMAEnable
	REP.b #$20
	RTL

CODE_81F634:
	PLA
	RTL

DATA_81F636:
	db $7F,$00

;--------------------------------------------------------------------

CODE_81F638:
	TXA
	LDX.w #$0000
	CMP.w #$0000
	BEQ.b CODE_81F6A7
	BPL.b CODE_81F64A
	EOR.w #$FFFF
	INC
	LDX.w #$0004
CODE_81F64A:
	STA.b $00
	TYA
	BEQ.b CODE_81F6B6
	BPL.b CODE_81F657
	EOR.w #$FFFF
	INC
	INX
	INX
CODE_81F657:
	STA.b $02
	CMP.b $00
	BCS.b CODE_81F67A
	LDA.w #$003F
CODE_81F660:
	CMP.b $00
	BCS.b CODE_81F66A
	LSR.b $00
	LSR.b $02
	BRA.b CODE_81F660

CODE_81F66A:
	LDA.b $02
	XBA
	LSR
	LSR
	CLC
	ADC.b $00
	JSR.w (DATA_81F697,x)
	AND.w #$FF00
	CLC
	RTL

CODE_81F67A:
	LDA.w #$003F
CODE_81F67D:
	CMP.b $02
	BCS.b CODE_81F687
	LSR.b $00
	LSR.b $02
	BRA.b CODE_81F67D

CODE_81F687:
	LDA.b $00
	XBA
	LSR
	LSR
	CLC
	ADC.b $02
	JSR.w (DATA_81F69F,x)
	AND.w #$FF00
	CLC
	RTL

DATA_81F697:
	dw CODE_81F6C7
	dw CODE_81F6D2
	dw CODE_81F6DD
	dw CODE_81F6E8

DATA_81F69F:
	dw CODE_81F6F3
	dw CODE_81F6FE
	dw CODE_81F705
	dw CODE_81F710

CODE_81F6A7:
	TYA
	BEQ.b CODE_81F6C5
	BPL.b CODE_81F6B1
	LDA.w #$0000
	CLC
	RTL

CODE_81F6B1:
	LDA.w #$8000
	CLC
	RTL

CODE_81F6B6:
	CPX.w #$0000
	BEQ.b CODE_81F6C0
	LDA.w #$C000
	CLC
	RTL

CODE_81F6C0:
	LDA.w #$4000
	CLC
	RTL

CODE_81F6C5:
	SEC
	RTL

CODE_81F6C7:
	TAX
	CLC
	LDA.w #$4000
	ADC.l $7F8FFF,x
	CLC
	RTS

CODE_81F6D2:
	TAX
	LDA.w #$40FF
	SEC
	SBC.l $7F8FFF,x
	CLC
	RTS

CODE_81F6DD:
	TAX
	LDA.w #$C0FF
	SEC
	SBC.l $7F8FFF,x
	CLC
	RTS

CODE_81F6E8:
	TAX
	CLC
	LDA.w #$C000
	ADC.l $7F8FFF,x
	CLC
	RTS

CODE_81F6F3:
	TAX
	SEC
	LDA.w #$80FF
	SBC.l $7F8FFF,x
	CLC
	RTS

CODE_81F6FE:
	TAX
	LDA.l $7F8FFF,x
	CLC
	RTS

CODE_81F705:
	TAX
	CLC
	LDA.w #$8000
	ADC.l $7F8FFF,x
	CLC
	RTS

CODE_81F710:
	TAX
	LDA.l $7F8FFF,x
	AND.w #$FF00
	EOR.w #$FFFF
	INC
	CLC
	RTS

;--------------------------------------------------------------------

DATA_81F71E:
	db $40,$80,$00,$C0

;--------------------------------------------------------------------

CODE_81F722:
	STZ.b $04
	TYA
	BEQ.b CODE_81F79D
	BPL.b CODE_81F72F
	EOR.w #$FFFF
	INC
	INC.b $04
CODE_81F72F:
	STA.b $06
	TAY
	TXA
	BEQ.b CODE_81F7AA
	BPL.b CODE_81F73F
	EOR.w #$FFFF
	INC
	INC.b $04
	INC.b $04
CODE_81F73F:
	CMP.b $06
	BCC.b CODE_81F749
	STA.b $06
	STY.b $0A
	BRA.b CODE_81F750

CODE_81F749:
	STA.b $0A
	LDA.w #$0004
	TSB.b $04
CODE_81F750:
	STZ.b $08
	LDA.w #$0100
CODE_81F755:
	CMP.b $06
	BCS.b CODE_81F761
	LSR.b $06
	LSR.b $0A
	ROR.b $08
	BRA.b CODE_81F755

CODE_81F761:
	LDA.b $09
	STA.w !REGISTER_DividendLo
	LDA.b $06
	STA.w !REGISTER_Divisor
	NOP #7
	LDX.w !REGISTER_QuotientLo
	CPX.w #$0100
	BCC.b CODE_81F77D
	LDX.w #$00FF
CODE_81F77D:
	SEP.b #$30
	LDA.l $7F0000,x
	LDX.b $04
	PHA
	LDA.l DATA_81F7C3,x
	BEQ.b CODE_81F796
	PLA
	EOR.b #$FF
	INC
	CLC
	ADC.l DATA_81F7CB,x
	RTS

CODE_81F796:
	PLA
	CLC
	ADC.l DATA_81F7CB,x
	RTS

CODE_81F79D:
	TXA
	BEQ.b CODE_81F7B6
	SEP.b #$30
	BPL.b CODE_81F7A7
	LDA.b #$C0
	RTS

CODE_81F7A7:
	LDA.b #$40
	RTS

CODE_81F7AA:
	SEP.b #$30
	LDA.b $04
	BNE.b CODE_81F7B3
	LDA.b #$00
	RTS

CODE_81F7B3:
	LDA.b #$80
	RTS

CODE_81F7B6:
	SEP.b #$30
	LDA.b #$00
	RTS

DATA_81F7BB:
	db $00,$80,$00,$80,$40,$40,$C0,$C0

DATA_81F7C3:
	db $FF,$00,$00,$FF,$00,$FF,$FF,$00

DATA_81F7CB:
	db $40,$40,$C0,$C0,$00,$80,$00,$80

;--------------------------------------------------------------------

CODE_81F7D3:
	PHB
	PHK
	PLB
	JSR.w CODE_81FB4F
	JSR.w CODE_81F9E0
	JSR.w CODE_81F82A
	PLB
	RTL

;--------------------------------------------------------------------

CODE_81F7E1:
	LDA.w $0140
	BNE.b CODE_81F7F4
	LDX.w #$0000
	STZ.b $A4
	JSR.w CODE_81FB4F
	JSR.w CODE_81F964
	JSR.w CODE_81FB7E
CODE_81F7F4:
	RTS

;--------------------------------------------------------------------

CODE_81F7F5:
	SEP.b #$30
	LDA.b #$43
	STA.b $01
	LDA.b #$60
	LDX.b #$30
	SEC
CODE_81F800:
	STA.b $00
	LDY.b #$07
CODE_81F804:
	DEX
	LDA.w DATA_81F8D7,x
	STA.b ($00),y
	DEY
	BPL.b CODE_81F804
	LDA.b $00
	SBC.b #$10
	CMP.b #$00
	BNE.b CODE_81F800
	REP.b #$30
	RTS

;--------------------------------------------------------------------

CODE_81F818:
	LDX.w #$0000
	JSR.w CODE_81FB4F
	JSR.w CODE_81F9E0
	LDX.w #$0002
	JSR.w CODE_81FB4F
	JSR.w CODE_81F9E0
CODE_81F82A:
	SEP.b #$20
	LDX.b $2E
	JMP.w (DATA_81F88B,x)

CODE_81F831:
	LDX.b $A6
	JMP.w (DATA_81F891,x)

CODE_81F836:
	LDX.b $A4
	JMP.w (DATA_81F89F,x)

CODE_81F83B:
	LDY.w #$0000
	BRA.b CODE_81F848

CODE_81F840:
	LDY.w #$000E
	BRA.b CODE_81F848

CODE_81F845:
	LDY.w #$001C
CODE_81F848:
	LDX.w #$0000
CODE_81F84B:
	LDA.w DATA_81F8AD,y
	STA.w $0640,x
	STA.w $064D,x
	STA.w $065A,x
	STA.w $0667,x
	BEQ.b CODE_81F862
	INY
	INX
	INX
	INX
	BRA.b CODE_81F84B

CODE_81F862:
	INY
	LDX.w #$0000
CODE_81F866:
	LDA.w DATA_81F8AD,y
	STA.w $0674,x
	STA.w $067D,x
	BEQ.b CODE_81F888
	INY
	INX
	LDA.w DATA_81F8AD,y
	STA.w $0674,x
	BEQ.b CODE_81F87F
	LDA.b #$11
	BRA.b CODE_81F881

CODE_81F87F:
	LDA.b #$1E
CODE_81F881:
	STA.w $067D,x
	INY
	INX
	BRA.b CODE_81F866

CODE_81F888:
	REP.b #$20
	RTS

DATA_81F88B:
	dw CODE_81F83B
	dw CODE_81F831
	dw CODE_81F836

DATA_81F891:
	dw CODE_81F83B
	dw CODE_81F83B
	dw CODE_81F83B
	dw CODE_81F840
	dw CODE_81F840
	dw CODE_81F840
	dw CODE_81F840

DATA_81F89F:
	dw CODE_81F83B
	dw CODE_81F83B
	dw CODE_81F83B
	dw CODE_81F845
	dw CODE_81F845
	dw CODE_81F845
	dw CODE_81F845

DATA_81F8AD:
	db $18,$D4,$1C,$D4,$00,$18,$00,$58
	db $07,$18,$00,$58,$07,$00,$18,$D4
	db $07,$E9,$00,$18,$00,$58,$07,$03
	db $00,$6D,$07,$00,$01,$EB,$1C,$D4
	db $00,$01,$00,$6F,$07,$18,$00,$58
	db $07,$00

;--------------------------------------------------------------------

DATA_81F8D7:
	db $42,$1B,$40,$06,$00,$00,$00,$7E
	db $42,$1C,$4D,$06,$00,$00,$08,$7E
	db $42,$1D,$5A,$06,$00,$00,$00,$7E
	db $42,$1E,$67,$06,$00,$00,$00,$7E
	db $00,$05,$74,$06,$00,$00,$00,$00
	db $00,$2C,$7D,$06,$00,$00,$00,$00

;--------------------------------------------------------------------

CODE_81F907:
	SEP.b #$20
	LDA.b #!DSP1_Command0A_RasterDataCalculation
	STA.l !REGISTER_DSP1_DataRegister
	REP.b #$20
	LDA.b $A0,x
	SBC.b $9C,x
	STA.l !REGISTER_DSP1_DataRegister
	LDX.w #$0000
	LDY.w #$0070
CODE_81F91F:
	LDA.l !REGISTER_DSP1_StatusRegister
	BPL.b CODE_81F91F
	LDA.l !REGISTER_DSP1_DataRegister
	STA.l $7E3C80,x
	LDA.l !REGISTER_DSP1_DataRegister
	STA.l $7E3D60,x
	LDA.l !REGISTER_DSP1_DataRegister
	STA.l $7E3E40,x
	LDA.l !REGISTER_DSP1_DataRegister
	STA.l $7E3F20,x
	INX
	INX
	DEY
	BNE.b CODE_81F91F
	LDA.w #$8000
CODE_81F94D:
	LDA.l !REGISTER_DSP1_StatusRegister
	BPL.b CODE_81F94D
	STA.l !REGISTER_DSP1_DataRegister
	STA.l !REGISTER_DSP1_DataRegister
	STA.l !REGISTER_DSP1_DataRegister
	STA.l !REGISTER_DSP1_DataRegister
	RTS

;--------------------------------------------------------------------

CODE_81F964:
	STZ.b $94
CODE_81F966:
	LDX.w #$0000
	JSR.w CODE_81F9E0
	JSR.w CODE_81F97D
	LDA.b $94
	CLC
	ADC.w #$0100
	STA.b $94
	CMP.w #$8000
	BNE.b CODE_81F966
	RTS

;--------------------------------------------------------------------

CODE_81F97D:
	LDA.b $94
	STA.w !REGISTER_ProgrammableIOPortOutput
	LDA.w #$00C0
	STA.w !REGISTER_Multiplier
	SEP.b #$20
	LDA.b #!DSP1_Command0A_RasterDataCalculation
	STA.l !REGISTER_DSP1_DataRegister
	REP.b #$30
	LDA.w #$001C
	SBC.b $9C
	STA.l !REGISTER_DSP1_DataRegister
	LDA.l !REGISTER_ProductOrRemainderLo
	TAX
	LDY.w #$0060
CODE_81F9A3:
	LDA.l !REGISTER_DSP1_StatusRegister
	BPL.b CODE_81F9A3
	LDA.l !REGISTER_DSP1_DataRegister
	STA.l $7E4000,x
	LDA.l !REGISTER_DSP1_DataRegister
	LDA.l !REGISTER_DSP1_DataRegister
	LDA.l !REGISTER_DSP1_DataRegister
	STA.l $7EA000,x
	INX
	INX
	DEY
	BNE.b CODE_81F9A3
CODE_81F9C6:
	LDA.l !REGISTER_DSP1_StatusRegister
	BPL.b CODE_81F9C6
	LDA.w #!DSP1_Command80_NullCommand<<8
	STA.l !REGISTER_DSP1_DataRegister
	STA.l !REGISTER_DSP1_DataRegister
	STA.l !REGISTER_DSP1_DataRegister
	STA.l !REGISTER_DSP1_DataRegister
	RTS

;--------------------------------------------------------------------

CODE_81F9E0:
	SEP.b #$20
	LDA.b #!DSP1_Command02_ProjectionParameterSetting
	STA.l !REGISTER_DSP1_DataRegister
	REP.b #$20
	LDA.b $88,x
	STA.l !REGISTER_DSP1_DataRegister
	LDA.b $8C,x
	STA.l !REGISTER_DSP1_DataRegister
	LDA.w #$0000
	STA.l !REGISTER_DSP1_DataRegister
	LDA.b $7C,x
	STA.l !REGISTER_DSP1_DataRegister
	LDA.b $84,x
	STA.l !REGISTER_DSP1_DataRegister
	LDA.b $94,x
	STA.l !REGISTER_DSP1_DataRegister
	LDA.b $80,x
	STA.l !REGISTER_DSP1_DataRegister
CODE_81FA15:
	LDA.l !REGISTER_DSP1_StatusRegister
	BPL.b CODE_81FA15
	CLC
	LDA.b $98,x
	ADC.l !REGISTER_DSP1_DataRegister
	STA.b $9C,x
	CLC
	ADC.l !REGISTER_DSP1_DataRegister
	JSR.w (DATA_81FA47,x)
	STA.b $A0,x
	SEC
	LDA.l !REGISTER_DSP1_DataRegister
	STA.b $58,x
	SBC.w #$007F
	STA.b $4C,x
	SEC
	LDA.l !REGISTER_DSP1_DataRegister
	STA.b $5E,x
	SBC.b $9C,x
	INC
	STA.b $52,x
	RTS

DATA_81FA47:
	dw CODE_81FA4B
	dw CODE_81FA54

CODE_81FA4B:
	CMP.w #$0020
	BCC.b CODE_81FA53
	LDA.w #$0001
CODE_81FA53:
	RTS

CODE_81FA54:
	CMP.w #$0090
	BCC.b CODE_81FA5C
	LDA.w #$0071
CODE_81FA5C:
	RTS

;--------------------------------------------------------------------

DATA_81FA5D:
	dw $0066,$00D6

;--------------------------------------------------------------------

CODE_81FA61:
	LDX.b $A4
	JSR.w (DATA_81FA6C,x)
	LDX.b $A6
	JSR.w (DATA_81FA74,x)
	RTL

DATA_81FA6C:
	dw CODE_81FA9D
	dw CODE_81FA9D
	dw CODE_81FA9D
	dw CODE_81FA7C

DATA_81FA74:
	dw CODE_81FAF6
	dw CODE_81FAF6
	dw CODE_81FAF6
	dw CODE_81FA81

CODE_81FA7C:
	LDX.w #$0004
	BRA.b CODE_81FA84

CODE_81FA81:
	LDX.w #$000A
CODE_81FA84:
	LDA.w #$3C80
	STA.w $0640,x
	LDA.w #$3D60
	STA.w $064D,x
	LDA.w #$3E40
	STA.w $065A,x
	LDA.w #$3F20
	STA.w $0667,x
	RTS

CODE_81FA9D:
	SEP.b #$30
	LDA.b #$40
	STA.b $91
	LDA.b #$A0
	STA.b $47
	STZ.b $90
	STZ.b $46
	LDA.b #$C0
	STA.w !REGISTER_Multiplicand
	LDA.b $95
	PHA
	BPL.b CODE_81FAB7
	EOR.b #$FF
CODE_81FAB7:
	STA.w !REGISTER_Multiplier
	PLA
	PHA
	SEC
	SBC.b #$40
	BPL.b CODE_81FAC3
	EOR.b #$FF
CODE_81FAC3:
	TAY
	PLA
	CLC
	ADC.b #$40
	BPL.b CODE_81FACC
	EOR.b #$FF
CODE_81FACC:
	TAX
	REP.b #$30
	LDA.w !REGISTER_ProductOrRemainderLo
	STY.w !REGISTER_Multiplier
	CLC
	PHA
	ADC.b $90
	STA.w $0644
	PLA
	ADC.b $46
	STA.w $066B
	LDA.w !REGISTER_ProductOrRemainderLo
	STX.w !REGISTER_Multiplier
	ADC.b $90
	STA.w $065E
	LDA.w !REGISTER_ProductOrRemainderLo
	ADC.b $46
	STA.w $0651
	RTS

CODE_81FAF6:
	SEP.b #$30
	LDA.b #$40
	STA.b $91
	LDA.b #$A0
	STA.b $47
	STZ.b $90
	STZ.b $46
	LDA.b #$C0
	STA.w !REGISTER_Multiplicand
	LDA.b $97
	PHA
	BPL.b CODE_81FB10
	EOR.b #$FF
CODE_81FB10:
	STA.w !REGISTER_Multiplier
	PLA
	PHA
	SEC
	SBC.b #$40
	BPL.b CODE_81FB1C
	EOR.b #$FF
CODE_81FB1C:
	TAY
	PLA
	CLC
	ADC.b #$40
	BPL.b CODE_81FB25
	EOR.b #$FF
CODE_81FB25:
	TAX
	REP.b #$30
	LDA.w !REGISTER_ProductOrRemainderLo
	STY.w !REGISTER_Multiplier
	CLC
	PHA
	ADC.b $90
	STA.w $064A
	PLA
	ADC.b $46
	STA.w $0671
	LDA.w !REGISTER_ProductOrRemainderLo
	STX.w !REGISTER_Multiplier
	ADC.b $90
	STA.w $0664
	LDA.w !REGISTER_ProductOrRemainderLo
	ADC.b $46
	STA.w $0657
	RTS

;--------------------------------------------------------------------

CODE_81FB4F:
	LDY.b $A4,x
	LDA.w DATA_81FB98,y
	TAY
	LDA.w !ContextDependentTable,y
	STA.b $7C,x
	LDA.w !ContextDependentTable+$02,y
	STA.b $80,x
	LDA.w !ContextDependentTable+$04,y
	STA.b $84,x
	LDA.w !ContextDependentTable+$06,y
	CLC
	ADC.w DATA_81FB90,x
	STA.b $98,x
	LDA.w !ContextDependentTable+$08,y
	STA.b $88,x
	LDA.w !ContextDependentTable+$0A,y
	SEC
	SBC.w DATA_81FB94,x
	STA.b $8C,x
	STZ.b $94,x
	RTS

CODE_81FB7E:
	LDA.w #$0006
	STA.b $A4
	LDX.w #$0000
	JSR.w CODE_81FB4F
	JSR.w CODE_81F9E0
	JSR.w CODE_81F907
	RTS

DATA_81FB90:
	dw $0000,$0070

DATA_81FB94:
	dw $0260,$02A0

DATA_81FB98:
	dw DATA_81FBA0
	dw DATA_81FBA0
	dw DATA_81FBA0
	dw DATA_81FBA8

DATA_81FBA0:
	dw $0040,$3400,$0100,$0066

DATA_81FBA8:
	dw $0880,$2A00,$0200,$0066,$0800
	dw $1200

;--------------------------------------------------------------------

; Note: Something related to theI of the racers. Putting an RTS here causes all the computer opponents to drive in a straight line.

CODE_81FBB4:
	REP.b #$20
	LDX.w #$5000
	LDA.w #$007F
	LDY.w #$1000
	JSL.l CODE_81F5F8
	LDA.w !RAM_SMK_Race_CurrentRacetrack
	ASL
	TAX
	LDA.w $0E68
	BNE.b CODE_81FBE0
	LDA.w DATA_81FF9B,x
	STA.b $08
	LDA.w #DATA_C60526>>16
	STA.b $0A
	STA.b $0E
	LDA.w DATA_81FFCB,x
	STA.b $0C
	BRA.b CODE_81FBFB

CODE_81FBE0:
	JSR.w CODE_81E64A
	LDA.l $08847B,x				; Note: These table references make no sense. They point to bank 08, but bank 08 doesn't exist.
	STA.b $08
	LDA.l $08847D,x
	STA.b $0A
	LDA.l $0884C6,x
	STA.b $0C
	LDA.l $0884C8,x
	STA.b $0E
CODE_81FBFB:
	LDY.w #$0000
	STZ.w $0148
CODE_81FC01:
	LDA.b [$08],y
	AND.w #$00FF
	CMP.w #$00FF
	BEQ.b CODE_81FC29
	TAX
	INY
	LDA.b [$08],y
	INY
	INY
	PHA
	AND.w #$00FF
	STA.b $06
	PLA
	AND.w #$FF00
	LSR
	LSR
	TSB.b $06
	JSR.w (DATA_81FD5D,x)
	REP.b #$20
	INC.w $0148
	BRA.b CODE_81FC01

CODE_81FC29:
	LDY.w #$0000
	LDX.w #$0000
	LDA.w $0148
	STA.b $00
CODE_81FC34:
	LDA.b [$0C],y
	PHA
	AND.w #$00FF
	ASL
	ASL
	ASL
	STA.w $0900,x
	PLA
	XBA
	AND.w #$00FF
	ASL
	ASL
	ASL
	STA.w $0A00,x
	INY
	INY
	LDA.b [$0C],y
	AND.w #$00FF
	STA.w $0800,x
	INY
	INX
	INX
	DEC.b $00
	BNE.b CODE_81FC34
	LDA.w $0900
	STA.w $0900,x
	LDA.w $0A00
	STA.w $0A00,x
	LDA.w !RAM_SMK_Race_CurrentRacetrack
	CMP.w #!Define_SMK_RacetrackID_BattleCourse3
	BCS.b CODE_81FCB5
	ASL
	CLC
	ADC.w !RAM_SMK_Race_CurrentRacetrack
	ASL
	TAX
	LDA.w DATA_8180D4,x
	STA.w $014A
	LDA.w DATA_8180D4+$02,x
	STA.b $06
	LDA.w DATA_8180D4+$04,x
	PHA
	AND.w #$00FF
	STA.b $02
	PLA
	XBA
	AND.w #$00FF
	STA.b $04
	LDX.b $06
CODE_81FC94:
	LDY.b $02
	SEP.b #$20
CODE_81FC98:
	LDA.l $7F5000,x
	ORA.b #$80
	STA.l $7F5000,x
	INX
	DEY
	BNE.b CODE_81FC98
	REP.b #$20
	LDA.b $06
	CLC
	ADC.w #$0040
	STA.b $06
	TAX
	DEC.b $04
	BNE.b CODE_81FC94
CODE_81FCB5:
	LDA.w $0148
	ASL
	TAX
CODE_81FCBA:
	LDA.w $0900,x
	STA.b $14
	LSR
	LSR
	LSR
	LSR
	STA.b $12
	SEC
	SBC.w $0A00,x
	STA.b $16
	ASL
	ASL
	AND.w #$FFC0
	ORA.b $12
	PHX
	TAX
	LDA.l $7F5000,x
	AND.w #$007F
	ASL
	TAX
	LDA.w $0A00,x
	SEC
	SBC.b $16
	TAY
	LDA.w $0900,x
	SEC
	SBC.b $14
	TAX
	JSL.l CODE_81F638
	PLX
	SEP.b #$20
	XBA
	STA.w $0801,x
	REP.b #$20
	DEX
	DEX
	BPL.b CODE_81FCBA
	LDX.w #$0000
CODE_81FCFF:
	REP.b #$20
	LDA.l $7F5000,x
	AND.w #$007F
	CMP.w #$007F
	BEQ.b CODE_81FD19
	ASL
	TAY
	JSR.w CODE_81FD22
	SEP.b #$20
	XBA
	STA.l $7F4000,x
CODE_81FD19:
	INX
	CPX.w #$1000
	BNE.b CODE_81FCFF
	REP.b #$20
	RTS

CODE_81FD22:
	LDA.w $0900,y
	STA.b $12
	LDA.w $0A00,y
	STA.b $14
	TXA
	AND.w #$0FC0
	LSR
	LSR
	CLC
	ADC.w #$0008
	SEC
	SBC.b $14
	EOR.w #$FFFF
	INC
	STA.b $14
	TAY
	TXA
	AND.w #$003F
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.w #$0008
	SEC
	SBC.b $12
	EOR.w #$FFFF
	INC
	STA.b $12
	PHX
	TAX
	JSL.l CODE_81F638
	PLX
	RTS

DATA_81FD5D:
	dw DATA_81FD6B
	dw DATA_81FD9C
	dw DATA_81FDC8
	dw DATA_81FDF4
	dw DATA_81FE20
	dw DATA_81FE4C
	dw DATA_81FE81

DATA_81FD6B:
	SEP.b #$20
	LDA.b [$08],y
	STA.b $02
	INY
	LDA.b [$08],y
	STA.b $04
	INY
CODE_81FD77:
	SEP.b #$20
	LDX.b $06
	LDA.b $02
	STA.b $00
CODE_81FD7F:
	LDA.w $0148
	STA.l $7F5000,x
	INX
	DEC.b $00
	BNE.b CODE_81FD7F
	DEC.b $04
	BNE.b CODE_81FD90
	RTS

CODE_81FD90:
	REP.b #$20
	LDA.b $06
	CLC
	ADC.w #$0040
	STA.b $06
	BRA.b CODE_81FD77

DATA_81FD9C:
	SEP.b #$20
	LDA.b [$08],y
	STA.b $02
	INY
CODE_81FDA3:
	SEP.b #$20
	LDX.b $06
	LDA.b $02
	STA.b $00
CODE_81FDAB:
	LDA.w $0148
	STA.l $7F5000,x
	INX
	DEC.b $00
	BNE.b CODE_81FDAB
	DEC.b $02
	BNE.b CODE_81FDBC
	RTS

CODE_81FDBC:
	REP.b #$20
	LDA.b $06
	CLC
	ADC.w #$0040
	STA.b $06
	BRA.b CODE_81FDA3

DATA_81FDC8:
	SEP.b #$20
	LDA.b [$08],y
	STA.b $02
	INY
CODE_81FDCF:
	SEP.b #$20
	LDX.b $06
	LDA.b $02
	STA.b $00
CODE_81FDD7:
	LDA.w $0148
	STA.l $7F5000,x
	DEX
	DEC.b $00
	BNE.b CODE_81FDD7
	DEC.b $02
	BNE.b CODE_81FDE8
	RTS

CODE_81FDE8:
	REP.b #$20
	LDA.b $06
	CLC
	ADC.w #$0040
	STA.b $06
	BRA.b CODE_81FDCF

DATA_81FDF4:
	SEP.b #$20
	LDA.b [$08],y
	STA.b $02
	INY
CODE_81FDFB:
	SEP.b #$20
	LDX.b $06
	LDA.b $02
	STA.b $00
CODE_81FE03:
	LDA.w $0148
	STA.l $7F5000,x
	DEX
	DEC.b $00
	BNE.b CODE_81FE03
	DEC.b $02
	BNE.b CODE_81FE14
	RTS

CODE_81FE14:
	REP.b #$20
	LDA.b $06
	SEC
	SBC.w #$0040
	STA.b $06
	BRA.b CODE_81FDFB

DATA_81FE20:
	SEP.b #$20
	LDA.b [$08],y
	STA.b $02
	INY
CODE_81FE27:
	SEP.b #$20
	LDX.b $06
	LDA.b $02
	STA.b $00
CODE_81FE2F:
	LDA.w $0148
	STA.l $7F5000,x
	INX
	DEC.b $00
	BNE.b CODE_81FE2F
	DEC.b $02
	BNE.b CODE_81FE40
	RTS

CODE_81FE40:
	REP.b #$20
	LDA.b $06
	SEC
	SBC.w #$0040
	STA.b $06
	BRA.b CODE_81FE27

DATA_81FE4C:
	SEP.b #$20
	LDA.b [$08],y
	STA.b $02
	INY
	LDA.b [$08],y
	STA.b $04
	INY
CODE_81FE58:
	SEP.b #$20
	LDX.b $06
	LDA.b $04
	STA.b $00
CODE_81FE60:
	LDA.w $0148
	STA.l $7F5000,x
	TXA
	CLC
	ADC.b #$40
	TAX
	DEC.b $00
	BNE.b CODE_81FE60
	DEC.b $04
	BNE.b CODE_81FE75
	RTS

CODE_81FE75:
	REP.b #$20
	LDA.b $06
	CLC
	ADC.w #$003F
	STA.b $06
	BRA.b CODE_81FE58

DATA_81FE81:
	SEP.b #$20
	LDA.b [$08],y
	STA.b $02
	INY
	LDA.b [$08],y
	STA.b $04
	INY
CODE_81FE8D:
	SEP.b #$20
	LDX.b $06
	LDA.b $04
	STA.b $00
CODE_81FE95:
	LDA.w $0148
	STA.l $7F5000,x
	TXA
	CLC
	ADC.b #$40
	TAX
	DEC.b $00
	BNE.b CODE_81FE95
	DEC.b $04
	BNE.b CODE_81FEAA
	RTS

CODE_81FEAA:
	REP.b #$20
	LDA.b $06
	CLC
	ADC.w #$0041
	STA.b $06
	BRA.b CODE_81FE8D

CODE_81FEB6:
	LDX.w $0030
	LDY.w DATA_81FED5,x
	LDX.w #$0000
CODE_81FEBF:
	LDA.w !ContextDependentTable,y
	AND.w #$00FF
	ASL
	ASL
	ASL
	ASL
	STA.w $0690,x
	INY
	INX
	INX
	CPX.w #$0080
	BNE.b CODE_81FEBF
	RTS

DATA_81FED5:
	dw DATA_81FEDB
	dw DATA_81FF1B
	dw DATA_81FF5B

DATA_81FEDB:
	db $20,$60,$40,$80,$C0,$C0,$E0,$C0,$B0,$A0,$90,$80,$70,$60,$50,$40
	db $1C,$20,$26,$2A,$20,$2C,$38,$38,$10,$1E,$24,$26,$10,$16,$20,$24
	db $04,$06,$08,$0A,$0C,$0E,$10,$14,$08,$0A,$0C,$0E,$10,$12,$14,$18
	db $02,$04,$06,$08,$0A,$0C,$0E,$12,$02,$03,$04,$06,$08,$0A,$0C,$10

DATA_81FF1B:
	db $20,$60,$40,$80,$C0,$C0,$E0,$C0,$B0,$A0,$90,$80,$70,$60,$50,$40
	db $23,$28,$30,$33,$2B,$2F,$39,$41,$23,$26,$2B,$2D,$16,$1E,$24,$28
	db $06,$08,$0A,$0C,$0E,$10,$14,$18,$0C,$0E,$10,$12,$16,$1C,$20,$24
	db $04,$06,$08,$0A,$0C,$0E,$12,$16,$02,$04,$06,$08,$0A,$0C,$0E,$12

DATA_81FF5B:
	db $30,$80,$80,$A0,$E0,$E0,$FF,$FF,$D0,$C0,$A0,$90,$80,$80,$80,$80
	db $26,$2E,$35,$37,$34,$3C,$3E,$42,$24,$2C,$34,$36,$16,$1E,$24,$28
	db $07,$09,$0B,$0D,$0F,$11,$15,$19,$0B,$0D,$0F,$11,$13,$15,$19,$1D
	db $05,$07,$09,$0B,$0D,$0F,$13,$17,$02,$04,$06,$08,$0A,$0C,$0E,$12

DATA_81FF9B:
	dw DATA_C60526
	dw DATA_C606F3
	dw DATA_C6084E
	dw DATA_C6097D
	dw DATA_C60B84
	dw DATA_C60C6D
	dw DATA_C60DD2
	dw DATA_C60ECB
	dw DATA_C60FB4
	dw DATA_C6111D
	dw DATA_C612B6
	dw DATA_C6139F
	dw DATA_C614B0
	dw DATA_C61573
	dw DATA_C61692
	dw DATA_C617D9
	dw DATA_C618EC
	dw DATA_C619F1
	dw DATA_C61B0A
	dw DATA_C61BED
	dw DATA_C61D1E
	dw DATA_C61D1E
	dw DATA_C61DBF
	dw DATA_C61D1E

DATA_81FFCB:
	dw DATA_C6063F
	dw DATA_C607C7
	dw DATA_C6090B
	dw DATA_C60ABE
	dw DATA_C60C16
	dw DATA_C60D48
	dw DATA_C60E6E
	dw DATA_C60F5A
	dw DATA_C61093
	dw DATA_C6121D
	dw DATA_C61348
	dw DATA_C61447
	dw DATA_C61528
	dw DATA_C61626
	dw DATA_C6175E
	dw DATA_C61883
	dw DATA_C6198E
	dw DATA_C61AA1
	dw DATA_C61B96
	dw DATA_C61CA9
	dw DATA_C61D83
	dw DATA_C61D83
	dw DATA_C61E01
	dw DATA_C61D83


UNK_C1FFFB:
	db $00,$00,$00,$00,$40

;--------------------------------------------------------------------

%BANK_END(<EndBank>)
endmacro

;#############################################################################################################
;#############################################################################################################

macro SMKBankC2Macros(StartBank, EndBank)
%BANK_START(<StartBank>)

SMK_GFX_BG_MarioCicuit:
;$C20000
	incbin "Graphics/Compressed/GFX_BG_MarioCicuit.lz5"

SMK_GFX_BG_GhostValley:
;$C20148
	incbin "Graphics/Compressed/GFX_BG_GhostValley.lz5"

SMK_GFX_BG_DonutPlains:
;$C20356
	incbin "Graphics/Compressed/GFX_BG_DonutPlains.lz5"

SMK_GFX_BG_BowserCastle:
;$C20523
	incbin "Graphics/Compressed/GFX_BG_BowserCastle.lz5"

SMK_GFX_BG_VanillaLake:
;$C205EB
	incbin "Graphics/Compressed/GFX_BG_VanillaLake.lz5"

SMK_GFX_BG_ChocoIsland:
;$C206B5
	incbin "Graphics/Compressed/GFX_BG_ChocoIsland.lz5"

SMK_GFX_BG_KoopaBeach:
;$C208A2
	incbin "Graphics/Compressed/GFX_BG_KoopaBeach.lz5"			; Glitch: Decompressing this file also decompresses the one below it.

SMK_Tilemap_MarioCircuitBGs:
;$C20946
	incbin "Tilemaps/Tilemap_MarioCircuitBGs.lz5"

	%FREE_BYTES(NULLROM, 5 ,$FF)

SMK_Tilemap_GhostValleyBGs:
;$C20B34
	incbin "Tilemaps/Tilemap_GhostValleyBGs.lz5"

SMK_Tilemap_DonutPlainsBGs:
;$C20CF3
	incbin "Tilemaps/Tilemap_DonutPlainsBGs.lz5"

SMK_Tilemap_BowserCastleBGs:
;$C20E85
	incbin "Tilemaps/Tilemap_BowserCastleBGs.lz5"

SMK_Tilemap_VanillaLakeBGs:
;$C21126
	incbin "Tilemaps/Tilemap_VanillaLakeBGs.lz5"

SMK_Tilemap_ChocoIslandBGs:
;$C2124C
	incbin "Tilemaps/Tilemap_ChocoIslandBGs.lz5"

SMK_Tilemap_KoopaBeachBGs:
;$C213A8
	incbin "Tilemaps/Tilemap_KoopaBeachBGs.lz5"

SMK_LevelData_BattleCourse3:
;$C214EE
	incbin "TrackData/BattleCourse3.lz5"

SMK_LevelData_BattleCourse2:
;$C21765
	incbin "TrackData/BattleCourse2.lz5"

SMK_MusicData_TournamentWin:
;$C21A83
	incbin "SPC700/Music/Music_TournamentWin.lz5"

DATA_C21C93:
	db $00,$00,$00,$00,$00,$00,$34,$12,$C2,$32,$02,$04,$0C,$08,$00,$01
	db $0E,$0F,$02,$08,$09,$09,$0F,$0F,$55,$01,$A3,$40,$09,$50,$19,$40
	db $2A,$48,$1C,$40,$16,$48,$1A,$40,$10,$48,$4D,$40,$24,$48,$05,$08
	db $0C,$48,$09,$08,$14,$48,$0D,$40,$0B,$50,$0C,$40,$01,$50,$0E,$52
	db $1F,$50,$0D,$40,$0B,$48,$09,$40,$05,$4A,$33,$48,$0C,$08,$1B,$48
	db $0C,$08,$17,$48,$20,$40,$08,$48,$20,$40,$0F,$50,$11,$40,$29,$50
	db $0A,$52,$02,$50,$0B,$10,$11,$50,$13,$10,$18,$50,$02,$40,$0B,$48
	db $09,$40,$07,$42,$00,$40,$1F,$48,$0C,$40,$34,$48,$02,$40,$09,$48
	db $02,$40,$07,$48,$03,$40,$04,$48,$07,$40,$1E,$48,$1F,$40,$10,$48

DATA_C21D23:
	db $1D,$1F,$1D,$16,$00,$00,$34,$12,$E0,$C2,$1D,$16,$17,$0A,$00,$01
	db $1D,$1D,$1E,$15,$12,$12,$12,$13,$46,$01,$1F,$40,$28,$50,$06,$40
	db $04,$50,$20,$40,$37,$50,$0C,$10,$0A,$00,$13,$10,$06,$00,$01,$40
	db $0C,$08,$0B,$00,$00,$40,$00,$44,$01,$40,$06,$50,$05,$10,$0B,$00
	db $07,$40,$18,$50,$09,$10,$01,$00,$14,$40,$13,$50,$09,$10,$0C,$50
	db $16,$10,$0C,$50,$12,$40,$08,$50,$02,$10,$05,$00,$05,$08,$1C,$48
	db $0B,$40,$0E,$48,$0C,$08,$12,$48,$0B,$08,$28,$48,$0A,$08,$2C,$48
	db $0B,$08,$0B,$48,$0D,$40,$00,$44,$00,$40,$05,$50,$00,$40,$00,$50
	db $05,$10,$0A,$00,$05,$40,$09,$50,$09,$40,$0A,$50,$04,$40,$0E,$50
	db $0A,$40,$06,$50,$24,$10,$00,$50,$19,$40,$05,$50,$0B,$40,$06,$48
	db $0A,$40,$06,$50,$0C,$10,$02,$50,$00,$54,$04,$50,$04,$10,$00,$50
	db $03,$40,$07,$00,$00,$10,$08,$50,$05,$40,$07,$50,$17,$40,$05,$50
	db $15,$40,$05,$48,$08,$08,$01,$48,$14,$40,$09,$50,$11,$40,$09,$50
	db $21,$40,$05,$50,$02,$40,$08,$50,$05,$40,$09,$50,$13,$10,$11,$50
	db $0A,$40,$0B,$50,$10,$40,$0A,$48,$1C,$40,$03,$48,$07,$40,$1C,$00
	db $FF,$FF

	%FREE_BYTES(NULLROM, 491, $FF)

DATA_C22000:
	incbin "Graphics/GFX_Peach.bin"

;--------------------------------------------------------------------

%HiROMBankSplit()

;--------------------------------------------------------------------

DATA_828000:
	incbin "SPC700/Engine.bin":0-(($010000-DATA_828000)&$00FFFF)
.End:
%BANK_END(<EndBank>)
endmacro

;#############################################################################################################
;#############################################################################################################

macro SMKBankC3Macros(StartBank, EndBank)
%BANK_START(<StartBank>)

SMK_GFX_Sprite_CharacterIcons:
;$C30000
	incbin "Graphics/Compressed/GFX_Sprite_CharacterIcons.lz5"

SMK_MusicData_DonutPlains:
;$C30B9D
	incbin "SPC700/Music/Music_DonutPlains.lz5"

SMK_LevelData_VanillaLake1:
;$C3103C
	incbin "TrackData/VanillaLake1.lz5"

SMK_PaletteDATA_8reditsLetters:
;$C31F7F
	incbin "Palettes/CreditsLetters.lz5"

	%FREE_BYTES(NULLROM, 1, $FF)

DATA_C32000:
	incbin "Graphics/GFX_DK.bin"

;--------------------------------------------------------------------

%HiROMBankSplit()

;--------------------------------------------------------------------

DATA_838000:
	incbin "SPC700/Engine.bin":(DATA_828000_End-DATA_828000)-

	%FREE_BYTES(NULLROM, 257, $FF)

;--------------------------------------------------------------------

SMK_LevelData_KoopaBeach2:
;$83D551
	incbin "TrackData/KoopaBeach2.lz5"

SMK_LevelData_RainbowRoad:
;$83EAD1
	incbin "TrackData/RainbowRoad.lz5"

	%FREE_BYTES(NULLROM, 1, $FF)

;--------------------------------------------------------------------

DATA_83F000:
	dw CODE_83F057
	dw CODE_83F010
	dw CODE_83F03D
	dw CODE_83F010
	dw CODE_83F030
	dw CODE_83F04A
	dw CODE_83F023
	dw CODE_83F010

CODE_83F010:
	LDY.w #DATA_83F0BD
	JMP.w CODE_83F2CE

CODE_83F016:
	LDX.w #DATA_83F0B2
	JSL.l CODE_84E331
	LDY.w #DATA_83F109
	JMP.w CODE_83F2CE

CODE_83F023:
	LDX.w #DATA_83F085
	JSL.l CODE_84E331
	LDY.w #DATA_83F0C1
	JMP.w CODE_83F2CE

CODE_83F030:
	LDX.w #DATA_83F09C
	JSL.l CODE_84E331
	LDY.w #DATA_83F0ED
	JMP.w CODE_83F2CE

CODE_83F03D:
	LDX.w #DATA_83F0A7
	JSL.l CODE_84E331
	LDY.w #DATA_83F0FB
	JMP.w CODE_83F2CE

CODE_83F04A:
	LDX.w #DATA_83F071
	JSL.l CODE_84E331
	LDY.w #DATA_83F139
	JMP.w CODE_83F2CE

CODE_83F057:
	LDA.w #SMK_GFX_BG_GhostValley>>16
	LDY.w #SMK_GFX_BG_GhostValley
	LDX.w #$7FD800
	JSL.l CODE_84E09E
	LDX.w #DATA_83F07C
	JSL.l CODE_84E204
	LDY.w #DATA_83F117
	JMP.w CODE_83F2CE

DATA_83F071:
	dl $7F4000,$7FF000
	db $03,$00
	db $06,$04
	db $00

DATA_83F07C:
	dl $7FD800,$7FF000
	db $0C,$04
	db $00

DATA_83F085:
	dl $7F4000,$7FF000
	db $01,$01
	db $01,$01
	db $01,$02
	db $01,$02
	db $01,$03
	db $01,$03
	db $01,$58
	db $01,$58
	db $00

DATA_83F09C:
	dl $7F4000,$7FF000
	db $01,$0A
	db $01,$0A
	db $00

DATA_83F0A7:
	dl $7F4000,$7FF000
	db $01,$73
	db $01,$73
	db $00

DATA_83F0B2:
	dl $7F4000,$7FF000
	db $01,$5F
	db $01,$5F
	db $00

DATA_83F0BD:
	dw $0000,DATA_83F203

DATA_83F0C1:
	dw $0D80,DATA_83F1BB,$0040,$0040,$1900
	dw $0D8A,DATA_83F1CD,$0080,$0040,$1900
	dw $0D94,DATA_83F1DF,$00C0,$0040,$1900
	dw $0D9E,DATA_83F1F1,$1600,$0040,$1900
	dw $0000,DATA_83F243

DATA_83F0ED:
	dw $0D80,DATA_83F191,$0280,$0040,$1900
	dw $0000,DATA_83F283

DATA_83F0FB:
	dw $0D80,DATA_83F191,$1CC0,$0040,$1900
	dw $0000,DATA_83F283

DATA_83F109:
	dw $0D80,DATA_83F1A3,$17C0,$0040,$1900
	dw $0000,DATA_83F223

DATA_83F117:
	dw $0D80,DATA_83F179,$7020,$0040,$1801
	dw $0D8A,DATA_83F181,$7040,$0040,$1801
	dw $0D94,DATA_83F189,$7060,$0040,$1801
	dw $0000,DATA_83F2A3

DATA_83F139:
	dw $0D80,DATA_83F15B,$0000,$0040,$1900
	dw $0D8A,DATA_83F165,$0100,$0040,$1900
	dw $0D94,DATA_83F16F,$01C0,$0040,$1900
	dw $0000,DATA_83F263

DATA_83F15B:
	dw $0000,$0040,$0080,$0040,$FFF8

DATA_83F165:
	dw $00C0,$0100,$0140,$0100,$FFF8

DATA_83F16F:
	dw $0180,$01C0,$0200,$01C0,$FFF8

DATA_83F179:
	dw $0000,$0040,$0080,$FFFA

DATA_83F181:
	dw $0040,$0080,$0000,$FFFA

DATA_83F189:
	dw $0080,$0000,$0040,$FFFA

DATA_83F191:
	dw $0038,$0030,$0028,$0020,$0018,$0010,$0008,$0000
	dw $FFF0

DATA_83F1A3:
	dw $0000,$0008,$0010,$0010,$0018,$0018,$0018,$0018
	dw $0010,$0010,$0008,$FFEA

DATA_83F1BB:
	dw $0000,$0008,$0010,$0018,$0020,$0028,$0030,$0038
	dw $FFF0

DATA_83F1CD:
	dw $00B8,$00B0,$00A8,$00A0,$0098,$0090,$0088,$0080
	dw $FFF0

DATA_83F1DF:
	dw $0138,$0130,$0128,$0120,$0118,$0110,$0108,$0100
	dw $FFF0

DATA_83F1F1:
	dw $01B8,$01B0,$01A8,$01A0,$0198,$0190,$0188,$0180
	dw $FFF0

DATA_83F203:
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

DATA_83F223:
	dw $0D80,$0000,$0000,$0000,$0D80,$0000,$0000,$0000
	dw $0D80,$0000,$0000,$0000,$0D80,$0000,$0000,$0000

DATA_83F243:
	dw $0D80,$0D8A,$0D94,$0D9E,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

DATA_83F263:
	dw $0D80,$0D8A,$0D94,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

DATA_83F283:
	dw $0D80,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

DATA_83F2A3:
	dw $0D80,$0000,$0000,$0000,$0000,$0000,$0D8A,$0000
	dw $0D94,$0000,$0000,$0000,$0000,$0000,$0000,$0000

CODE_83F2C3:
	PHB
	PHK
	PLB
	LDX.w !RAM_SMK_Global_RacetrackType
	JSR.w (DATA_83F000,x)
	PLB
	RTL

CODE_83F2CE:
	LDA.w !ContextDependentTable,y
	BEQ.b CODE_83F2F0
	TAX
	LDA.w !ContextDependentTable+$02,y
	STA.b $06,x
	LDA.w !ContextDependentTable+$04,y
	STA.b $02,x
	LDA.w !ContextDependentTable+$06,y
	STA.b $04,x
	LDA.w !ContextDependentTable+$08,y
	STA.b $08,x
	TYA
	CLC
	ADC.w #$000A
	TAY
	BRA.b CODE_83F2CE

CODE_83F2F0:
	LDA.w !ContextDependentTable+$02,y
	STA.w $0DD0
	STZ.w $0DD2
	RTS

CODE_83F2FA:
	PHB
	PHK
	PLB
	LDA.w $0FBE
	BNE.b CODE_83F32C
	LDA.b $38
	AND.w #$000F
	ASL
	ADC.w $0DD0
	TAY
	LDX.w !ContextDependentTable,y
	STX.w $0DD2
	BEQ.b CODE_83F32C
	LDY.b $06,x
	LDA.w !ContextDependentTable,y
	BPL.b CODE_83F322
	CLC
	ADC.b $06,x
	TAY
	LDA.w !ContextDependentTable,y
CODE_83F322:
	CLC
	ADC.w #$F000
	STA.b $00,x
	INY
	INY
	STY.b $06,x
CODE_83F32C:
	PLB
	RTL

;--------------------------------------------------------------------

CODE_83F32E:
	LDA.w $0FBE
	BNE.b CODE_83F35F
	LDX.w $0DD2
	BEQ.b CODE_83F35F
	SEP.b #$20
	LDA.b #$80
	STA.w !REGISTER_VRAMAddressIncrementValue
	LDY.b $08,x
	STY.w DMA[$00].Parameters
	LDY.b $02,x
	STY.w !REGISTER_VRAMAddressLo
	LDY.b $00,x
	STY.w DMA[$00].SourceLo
	LDA.b #$7F
	STA.w DMA[$00].SourceBank
	LDY.b $04,x
	STY.w DMA[$00].SizeLo
	LDA.b #$01
	STA.w !REGISTER_DMAEnable
	REP.b #$20
CODE_83F35F:
	RTL

;--------------------------------------------------------------------

CODE_83F360:
	PHB
	PHK
	PLB
	LDA.w $0E52
	AND.w #$0002
	BEQ.b CODE_83F37D
	LDA.w $0E54
	BEQ.b CODE_83F37D
	LDA.w #$0200
	STA.b $00
	LDA.w #$0400
	STA.b $02
	JSR.w CODE_83F39E
CODE_83F37D:
	PLB
	RTL

CODE_83F37F:
	PHB
	PHK
	PLB
	LDA.w $0E52
	AND.w #$0002
	BNE.b CODE_83F39C
	LDA.w $0E54
	BEQ.b CODE_83F39C
	LDA.w #$0420
	STA.b $00
	LDA.w #$0620
	STA.b $02
	JSR.w CODE_83F39E
CODE_83F39C:
	PLB
	RTL

CODE_83F39E:
	LDA.w $0E54
	CMP.w #$1000
	BNE.b CODE_83F3AF
	JSR.w CODE_83F3FB
	JSR.w CODE_83F514
	JMP.w CODE_83F3FA

CODE_83F3AF:
	LDA.w $1A12
	CMP.w #$0002
	BEQ.b CODE_83F3C8
	CMP.w #$0001
	BEQ.b CODE_83F3C2
	JSR.w CODE_83F483
	JMP.w CODE_83F3FA

CODE_83F3C2:
	JSR.w CODE_83F5B5
	JMP.w CODE_83F3FA

CODE_83F3C8:
	LDA.w $0E52
	CMP.w #$000E
	BNE.b CODE_83F3DB
	LDA.w $1A56
	BNE.b CODE_83F3DB
	JSR.w CODE_83F6EE
	JMP.w CODE_83F3FA

CODE_83F3DB:
	INC.w $1A00
	LDA.w $1A00
	CMP.w #$00B3
	BCC.b CODE_83F3FA
	CMP.w #$00B4
	BEQ.b CODE_83F3F4
	JSR.w CODE_83F4EA
	JSR.w CODE_83F680
	JMP.w CODE_83F3FA

CODE_83F3F4:
	LDA.w #$0040
	STA.w $0E54
CODE_83F3FA:
	RTS

CODE_83F3FB:
	LDX.w $0E52
	LDA.w DATA_83F8C6,x
	STA.w $1A02
	CLC
	ADC.w #$0002
	STA.w $1A04
	LDA.w #$0004
	STA.w $1A0C
	LDY.w #$0000
	LDA.w #$5555
CODE_83F417:
	STA.b ($02),y
	INY
	INY
	CPY.w #$0020
	BNE.b CODE_83F417
	LDA.w DATA_83F8D6,x
	STA.w $1A06
	LDY.w #$0000
	LDA.w #$7E3C02
	STA.b $04
	LDA.w #$7E3C02>>16
	STA.b $06
	LDA.w DATA_83F473,x
	TAX
CODE_83F437:
	LDA.l $7E3C00,x
	STA.b [$04],y
	INX
	INX
	INY
	INY
	CPY.w #$0006
	BNE.b CODE_83F437
	LDX.w $0E52
	LDY.w #$0002
	LDA.w DATA_83F7F0,x
	TAX
CODE_83F450:
	LDA.w !ContextDependentTable,x
	STA.b ($00),y
	INX
	INX
	JSR.w CODE_83FCBC
	CPY.w $1A04
	BNE.b CODE_83F450
	LDY.w #$0000
	LDX.w $0E52
	LDA.w DATA_83F8E6,x
CODE_83F468:
	STA.b ($00),y
	JSR.w CODE_83FCBC
	CPY.w $1A02
	BNE.b CODE_83F468
	RTS

DATA_83F473:
	dw $0002,$000A,$0012,$001A,$0002,$000A,$0012,$001A

CODE_83F483:
	SEP.b #$20
	LDY.w $1A10
CODE_83F488:
	LDA.b ($00),y
	CMP.w $1A06
	BEQ.b CODE_83F4B1
	CLC
	ADC.b #$04
	STA.b ($00),y
	BCC.b CODE_83F499
	JSR.w CODE_83F794
CODE_83F499:
	JSR.w CODE_83FCBC
	CPY.w $1A0C
	BNE.b CODE_83F488
	LDA.w $1A0E
	CMP.b #$1C
	BEQ.b CODE_83F4D6
	CLC
	ADC.b #$04
	STA.w $1A0E
CODE_83F4AE:
	REP.b #$20
	RTS

CODE_83F4B1:
	LDA.w $1A10
	CLC
	ADC.b #$04
	CMP.w $1A0C
	BEQ.b CODE_83F4CB
	STA.w $1A10
	LDA.w $1A06
	SEC
	SBC.b #$08
	STA.w $1A06
	JMP.w CODE_83F499

CODE_83F4CB:
	LDA.b #$01
	STA.w $1A12
	STZ.w $1A10
	JMP.w CODE_83F4AE

CODE_83F4D6:
	STZ.w $1A0E
	LDA.w $1A0C
	CMP.w $1A02
	BEQ.b CODE_83F4AE
	CLC
	ADC.b #$04
	STA.w $1A0C
	JMP.w CODE_83F4AE

CODE_83F4EA:
	LDA.w $1A08
	CMP.w #$0040
	BEQ.b CODE_83F511
	SEP.b #$20
	STZ.w $1A0A
	LDY.w $1A10
CODE_83F4FA:
	LDA.b ($00),y
	CLC
	ADC.b #$04
	STA.b ($00),y
	BCC.b CODE_83F506
	JSR.w CODE_83F794
CODE_83F506:
	JSR.w CODE_83FCBC
	CPY.w $1A02
	BNE.b CODE_83F4FA
	INC.w $1A08
CODE_83F511:
	REP.b #$20
	RTS

CODE_83F514:
	LDA.w #$0058
	STA.w $1A20
	LDA.w #$0050
	STA.w $1A2C
	LDX.w $0E52
	LDA.w DATA_83FA9A,x
	TAX
	LDA.w !ContextDependentTable,x
	STA.w $1A14
	STA.w $1A2E
	CLC
	ADC.w #$0008
	STA.w $1A22
	LDA.w !ContextDependentTable+$02,x
	STA.w $1A16
	STA.w $1A30
	CLC
	ADC.w #$0008
	STA.w $1A24
	LDA.w !ContextDependentTable+$04,x
	STA.w $1A18
	CLC
	ADC.w #$0002
	STA.w $1A3E
	LDX.w $0E52
	LDA.w DATA_83FAD4,x
	STA.w $1A1A
	STA.w $1A1C
	STA.w $1A1E
	LDA.w DATA_83FAF4,x
	STA.w $1A32
	LDA.w #$FC00
	STA.w $1AB2
	LDX.w $0E52
	LDY.w #$0052
	LDA.w DATA_83F8F6,x
	TAX
CODE_83F579:
	JSR.w CODE_83F7DA
	CPY.w $1A3E
	BNE.b CODE_83F579
	LDX.w $0E52
	LDA.w DATA_83FAE4,x
	STA.w $1A54
	LDX.w #$0000
CODE_83F58D:
	LDA.w $1A14,x
	STA.w $1A52
	LDA.w $1A2C,x
	TAY
	LDA.w $1A54
CODE_83F59A:
	JSR.w CODE_83F7C9
	CPY.w $1A52
	BNE.b CODE_83F59A
	SEC
	SBC.w #$1800
	CLC
	ADC.w #$0010
	STA.w $1A54
	INX
	INX
	CPX.w $1A32
	BNE.b CODE_83F58D
	RTS

CODE_83F5B5:
	LDX.w #$0000
CODE_83F5B8:
	JSR.w CODE_83F5E4
	INX
	INX
	CPX.w $1A32
	BNE.b CODE_83F5B8
	LDA.w $1A38
	LDA.w $0E52
	CMP.w #$000E
	BNE.b CODE_83F5D5
	LDA.w $1A38
	BEQ.b CODE_83F5D5
	JSR.w CODE_83F6BA
CODE_83F5D5:
	LDA.w $1A40
	CMP.w $1A32
	BNE.b CODE_83F5E3
	LDA.w #$0002
	STA.w $1A12
CODE_83F5E3:
	RTS

CODE_83F5E4:
	LDA.w $1A38,x
	BNE.b CODE_83F62F
	LDA.w $1A2C,x
	TAY
CODE_83F5ED:
	SEP.b #$20
	LDA.b ($00),y
	SEC
	SBC.b #$04
	STA.b ($00),y
	BCS.b CODE_83F5FD
	PHX
	JSR.w CODE_83F794
	PLX
CODE_83F5FD:
	JSR.w CODE_83FCBC
	LDA.b ($00),y
	SEC
	SBC.b #$04
	STA.b ($00),y
	PHA
	BCS.b CODE_83F60F
	PHX
	JSR.w CODE_83F794
	PLX
CODE_83F60F:
	PLA
	CMP.w $1A1A,x
	BEQ.b CODE_83F630
CODE_83F615:
	REP.b #$20
	JSR.w CODE_83FCBC
	TYA
	CMP.w $1A20,x
	BNE.b CODE_83F5ED
	LDA.w $1A26,x
	CMP.w #$001C
	BEQ.b CODE_83F669
	CLC
	ADC.w #$0004
	STA.w $1A26,x
CODE_83F62F:
	RTS

CODE_83F630:
	REP.b #$20
	LDA.w $1A2C,x
	CLC
	ADC.w #$0008
	CMP.w $1A14,x
	BEQ.b CODE_83F65B
	STA.w $1A2C,x
	CPX.w #$0002
	BNE.b CODE_83F64E
	LDA.w $0E52
	CMP.w #$000E
	BEQ.b CODE_83F615
CODE_83F64E:
	LDA.w $1A1A,x
	CLC
	ADC.w #$0008
	STA.w $1A1A,x
	JMP.w CODE_83F615

CODE_83F65B:
	REP.b #$20
	INC.w $1A38,x
	INC.w $1A40
	INC.w $1A40
	JMP.w CODE_83F4AE

CODE_83F669:
	REP.b #$20
	STZ.w $1A26,x
	LDA.w $1A20,x
	CMP.w $1A14,x
	BEQ.b CODE_83F62F
	CLC
	ADC.w #$0008
	STA.w $1A20,x
	JMP.w CODE_83F62F

CODE_83F680:
	LDA.w $1A42
	CMP.w #$0040
	BEQ.b CODE_83F69A
	SEP.b #$20
	LDY.w #$0050
CODE_83F68D:
	JSR.w CODE_83F69B
	CPY.w $1A18
	BNE.b CODE_83F68D
	REP.b #$20
	INC.w $1A42
CODE_83F69A:
	RTS

CODE_83F69B:
	LDA.b ($00),y
	SEC
	SBC.b #$04
	STA.b ($00),y
	BCS.b CODE_83F6A7
	JSR.w CODE_83F794
CODE_83F6A7:
	JSR.w CODE_83FCBC
	LDA.b ($00),y
	SEC
	SBC.b #$04
	STA.b ($00),y
	BCS.b CODE_83F6B6
	JSR.w CODE_83F794
CODE_83F6B6:
	JSR.w CODE_83FCBC
	RTS

CODE_83F6BA:
	SEP.b #$20
	LDY.w #$0058
	LDA.b ($00),y
	CMP.b #$70
	BEQ.b CODE_83F6D0
	LDY.w #$0058
CODE_83F6C8:
	JSR.w CODE_83F69B
	CPY.w #$00C0
	BNE.b CODE_83F6C8
CODE_83F6D0:
	LDY.w #$0050
	JSR.w CODE_83F69B
	LDY.w #$0050
	LDA.b ($00),y
	CMP.b #$F0
	BNE.b CODE_83F6EB
	LDY.w #$0051
	LDA.b #$E0
	STA.b ($00),y
	LDY.w #$0055
	STA.b ($00),y
CODE_83F6EB:
	REP.b #$20
	RTS

CODE_83F6EE:
	LDX.w #$0000
	REP.b #$20
	LDA.w $1AB2
	CMP.w #$0400
	BEQ.b CODE_83F702
	CLC
	ADC.w #$0080
	STA.w $1AB2
CODE_83F702:
	LDY.w #$00C8
CODE_83F705:
	LDA.w $1A94,x
	BEQ.b CODE_83F71B
	JSR.w CODE_83FCBC
	JSR.w CODE_83FCBC
	CPX.w #$001C
	BNE.b CODE_83F71E
	INC.w $1A56
	JMP.w CODE_83F71E

CODE_83F71B:
	JSR.w CODE_83F746
CODE_83F71E:
	INX
	INX
	CPX.w #$001E
	BNE.b CODE_83F705
	REP.b #$20
	RTS

DATA_83F728:
	dw $0072,$00E4,$0156,$01C8,$0239,$02AB,$031D,$038F
	dw $0401,$0472,$04E4,$0556,$05C8,$0639,$06AB

CODE_83F746:
	SEP.b #$20
	LDA.w $1A76,x
	CLC
	ADC.w DATA_83F728,x
	STA.w $1A76,x
	LDA.w DATA_83F728+$01,x
	ADC.b #$00
	STA.w $1A77,x
	INY
	LDA.b ($00),y
	CLC
	ADC.w $1AB3
	CMP.b #$34
	BEQ.b CODE_83F789
	STA.b ($00),y
	DEY
	LDA.b ($00),y
	CLC
	ADC.w $1A77,x
	STA.b ($00),y
	JSR.w CODE_83FCBC
	LDA.b ($00),y
	CLC
	ADC.w $1A77,x
	STA.b ($00),y
	INY
	LDA.b ($00),y
	CLC
	ADC.w $1AB3
	STA.b ($00),y
	DEY
	JSR.w CODE_83FCBC
	RTS

CODE_83F789:
	INC.w $1A94,x
	DEY
	JSR.w CODE_83FCBC
	JSR.w CODE_83FCBC
	RTS

CODE_83F794:
	REP.b #$30
	PHY
	TYA
	AND.w #$000C
	LSR
	LSR
	TAX
	TYA
	LSR
	LSR
	LSR
	LSR
	TAY
	SEP.b #$20
	LDA.b ($02),y
	AND.w DATA_83F7C1,x
	BNE.b CODE_83F7B6
	LDA.b ($02),y
	ORA.w DATA_83F7C1,x
	STA.b ($02),y
	PLY
CODE_83F7B5:
	RTS

CODE_83F7B6:
	LDA.b ($02),y
	AND.w DATA_83F7C5,x
	STA.b ($02),y
	PLY
	JMP.w CODE_83F7B5

DATA_83F7C1:
	dw $0401,$4010

DATA_83F7C5:
	dw $FBFE,$BFEF

CODE_83F7C9:
	PHA
	STA.b ($00),y
	JSR.w CODE_83FCBC
	CLC
	ADC.w #$0800
	STA.b ($00),y
	JSR.w CODE_83FCBC
	PLA
	RTS

CODE_83F7DA:
	LDA.w !ContextDependentTable,x
	STA.b ($00),y
	JSR.w CODE_83FCBC
	CMP.w #$0A8F
	BEQ.b CODE_83F7E8
	INC
CODE_83F7E8:
	STA.b ($00),y
	JSR.w CODE_83FCBC
	INX
	INX
	RTS

DATA_83F7F0:
	dw DATA_83F800
	dw DATA_83F824
	dw DATA_83F834
	dw DATA_83F84A
	dw DATA_83F864
	dw DATA_83F882
	dw DATA_83F89A
	dw DATA_83F8B4

DATA_83F800:
	dw $087B,$086E,$086C,$087E,$086D,$0878,$087B,$0879
	dw $088F,$086E,$087F,$0872,$087D,$087E,$086C,$086E
	dw $0881,$086E

DATA_83F824:
	dw $087B,$086E,$086C,$087E,$086D,$0878,$087B,$0879

DATA_83F834:
	dw $087C,$087B,$086E,$0876,$0876,$086A,$087B,$0870
	dw $0878,$087B,$0879

DATA_83F84A:
	dw $087C,$087B,$086E,$0877,$0870,$0872,$087C,$086E
	dw $086D,$0885,$0870,$0885,$086C

DATA_83F864:
	dw $087C,$087B,$086E,$087C,$0878,$0879,$0876,$0878
	dw $086C,$088F,$086D,$0877,$087E,$0878,$087C

DATA_83F882:
	dw $087C,$087B,$0878,$087D,$086A,$087B,$087D,$087C
	dw $087E,$0875,$0875,$0872

DATA_83F89A:
	dw $087B,$0878,$087D,$0872,$086D,$086E,$088F,$0875
	dw $086A,$087E,$0877,$086A,$0876

DATA_83F8B4:
	dw $087C,$087B,$0878,$087D,$086C,$086E,$087B,$0872
	dw $086D

DATA_83F8C6:
	dw $0048,$0020,$002C,$0034,$003C,$0030,$0034,$0024

DATA_83F8D6:
	dw $0098,$0048,$0060,$0070,$0080,$0068,$0070,$0050

DATA_83F8E6:
	dw $80F8,$10F8,$80F8,$10F8,$80F8,$10F8,$80F8,$10F8

DATA_83F8F6:
	dw DATA_83F906
	dw DATA_83F926
	dw DATA_83F946
	dw DATA_83F996
	dw DATA_83F9CA
	dw DATA_83F9EE
	dw DATA_83FA42
	dw DATA_83FA5E

DATA_83F906:
	dw $0AAE,$0AB0,$0AC2,$0ABC,$0AC4,$0AAE,$0AB0,$0A8F
	dw $0AD0,$0AA0,$0AB8,$0AA0,$0AC8,$0AA4,$0AAE,$0AB0

DATA_83F926:
	dw $0AC4,$0AAE,$0AB0,$0AAC,$0AA8,$0AC2,$0AC8,$0A8F
	dw $0AB8,$0AB0,$0AD0,$0AA0,$0AB8,$0ABC,$0AC6,$0ABC

DATA_83F946:
	dw $0AB4,$0AA8,$0ABA,$0AB2,$0AB0,$0A8F,$0AD0,$0AA0
	dw $0AB8,$0AA0,$0AB8,$0ABC,$0AC6,$0ABC,$0AAE,$0AA0
	dw $0AB2,$0AB0,$0AB8,$0AA8,$0A8F,$0AD0,$0AA0,$0AB2
	dw $0AB0,$0AB8,$0AA0,$0AB8,$0AA0,$0AC4,$0AA0,$0AC6
	dw $0ABC,$0A8F,$0AB4,$0AB0,$0AB8,$0AC8,$0AC2,$0AA0

DATA_83F996:
	dw $0ABA,$0AA0,$0ABC,$0AB4,$0AB0,$0A8F,$0AB8,$0ABC
	dw $0AC2,$0AB0,$0AC6,$0AA0,$0AA6,$0AA0,$0AC4,$0AAE
	dw $0AB0,$0A8F,$0AC4,$0AC8,$0AAC,$0AB0,$0AD0,$0AA0
	dw $0AB8,$0AA0

DATA_83F9CA:
	dw $0AC6,$0AA0,$0AC2,$0ABC,$0A8F,$0AA2,$0AA0,$0ABA
	dw $0AA6,$0ABC,$0AC4,$0ABC,$0AD0,$0ABC,$0A8F,$0ABC
	dw $0AB4,$0AA0

DATA_83F9EE:
	dw $0AD0,$0ABC,$0AC4,$0AAE,$0AB0,$0AA0,$0AB4,$0AB0
	dw $0A8F,$0AB4,$0ABC,$0AB0,$0AD2,$0AC8,$0AB8,$0AB0
	dw $0AB8,$0AB0,$0AA8,$0A8F,$0AD0,$0ABC,$0AC4,$0AAE
	dw $0AB0,$0AB8,$0AC8,$0AC2,$0AA0,$0AD0,$0ABC,$0AB0
	dw $0AA4,$0AAE,$0AB0,$0A8F,$0AB4,$0ABC,$0AC6,$0AA0
	dw $0AA2,$0AA8

DATA_83FA42:
	dw $0AA0,$0AC6,$0AC4,$0AC8,$0AC4,$0AAE,$0AB0,$0A8F
	dw $0AC6,$0AA8,$0AB2,$0AB0,$0AB8,$0AA0

DATA_83FA5E:
	dw $0ABC,$0AAE,$0AB0,$0AA6,$0AA8,$0AC0,$0AC8,$0AB0
	dw $0A8F,$0AB4,$0ABC,$0ABA,$0ABA,$0ABC,$0AC6,$0AA0
	dw $0AA6,$0AA0,$0AC4,$0AAE,$0AB0,$0A8F,$0AC4,$0AC8
	dw $0AAC,$0AB0,$0AD0,$0AA0,$0AB8,$0AA0

DATA_83FA9A:
	dw DATA_83FAAA
	dw DATA_83FAAA
	dw DATA_83FAB0
	dw DATA_83FAB6
	dw DATA_83FABC
	dw DATA_83FAC2
	dw DATA_83FAC8
	dw DATA_83FACE

DATA_83FAAA:
	dw $00D0,$00D0,$00D0

DATA_83FAB0:
	dw $00C0,$0128,$0190

DATA_83FAB6:
	dw $00A0,$0120,$0120

DATA_83FABC:
	dw $00A0,$00E0,$00E0

DATA_83FAC2:
	dw $00D0,$0138,$01A0

DATA_83FAC8:
	dw $00C0,$00C0,$00C0

DATA_83FACE:
	dw $00C0,$0140,$0140

DATA_83FAD4:
	dw $0070,$0070,$0080,$0070,$00A0,$0070,$0080,$0070

DATA_83FAE4:
	dw $A800,$3800,$C000,$4800,$B800,$5000,$A800,$4800

DATA_83FAF4:
	dw $0002,$0002,$0006,$0004,$0004,$0006,$0002,$0004

;--------------------------------------------------------------------

CODE_83FB04:
	PHB
	PHK
	PLB
	SEP.b #$30
	JSL.l CODE_8584C5
	JSR.w CODE_83FB85
	REP.b #$30
	PLB
	RTL

;--------------------------------------------------------------------

CODE_83FB14:
	PHB
	PHK
	PLB
	INC.w $0072
	LDA.w $0072
	CMP.w #$0100
	BCC.b CODE_83FB34
	CMP.w #$012C
	BEQ.b CODE_83FB3A
	CMP.w #$021E
	BEQ.b CODE_83FB40
	CMP.w #$0430
	BCS.b CODE_83FB55
	JMP.w CODE_83FB49

CODE_83FB34:
	JSR.w CODE_83FCC1
	JMP.w CODE_83FB49

CODE_83FB3A:
	INC.w $1860
	JMP.w CODE_83FB49

CODE_83FB40:
	INC.w $1820
	LDA.w #$0002
	STA.w $18F0
CODE_83FB49:
	JSR.w CODE_83FCF3
	JSR.w CODE_83FE0F
	JSR.w CODE_83FE8A
	JMP.w CODE_83FB74

CODE_83FB55:
	LDA.w $0072
	CMP.w #$0800
	BNE.b CODE_83FB63
	LDA.w #$0600
	STA.w $0072
CODE_83FB63:
	JSR.w CODE_83FEBB
	LDA.w $0074
	CMP.w #$00FF
	BNE.b CODE_83FB74
	JSR.w CODE_83FCF3
	JSR.w CODE_83FE8A
CODE_83FB74:
	PLB
	RTL

;--------------------------------------------------------------------

CODE_83FB76:
	PHB
	PHK
	PLB
	SEP.b #$20
	LDA.w $0078
	STA.w !REGISTER_ScreenDisplayRegister
	REP.b #$20
	PLB
	RTL

;--------------------------------------------------------------------

CODE_83FB85:
	SEP.b #$20
	LDA.b #$14
	STA.w !REGISTER_MainScreenLayers
	REP.b #$30
	LDX.w #$0000
	LDA.w #$AAAA
CODE_83FB94:
	STA.w $0400,x
	INX
	INX
	CPX.w #$0020
	BNE.b CODE_83FB94
	STZ.w $040C
	STZ.w $040E
	STZ.w $0410
	LDA.w #$00FF
	STA.w $0074
	LDA.w #$000F
	STA.w $0078
	LDA.w #$000C
	STA.w $007A
	LDX.w #$0000
	LDA.w #$FC00
CODE_83FBBF:
	STA.w $1800,x
	INX
	INX
	CPX.w #$0010
	BNE.b CODE_83FBBF
	LDX.w #$0000
	LDA.w #$00A0
CODE_83FBCF:
	STA.w $1810,x
	INX
	INX
	CPX.w #$0010
	BNE.b CODE_83FBCF
	LDA.w #$009C
	STA.w $1814
	STA.w $181E
	LDX.w #$0000
	LDA.w #$00A3
CODE_83FBE8:
	STA.w $1840,x
	INX
	INX
	CPX.w #$0010
	BNE.b CODE_83FBE8
	LDA.w #$009F
	STA.w $1844
	STA.w $184E
	LDX.w #$0000
	LDA.w #$0400
CODE_83FC01:
	STA.w $1850,x
	INX
	INX
	CPX.w #$0010
	BNE.b CODE_83FC01
	LDA.w #$1C00
	STA.w !REGISTER_VRAMAddressLo
	LDX.w #$0000
	LDA.w #$0000
CODE_83FC17:
	STA.l $002118
	INX
	INX
	CPX.w #$0800
	BNE.b CODE_83FC17
	LDX.w #$0000
	LDA.w #$0F0F
CODE_83FC28:
	STA.w !REGISTER_WriteToVRAMPortLo
	INX
	INX
	CPX.w #$0400
	BNE.b CODE_83FC28
	LDX.w #$0182
	LDA.w #$00C1
	JSR.w CODE_83FC9B
	LDX.w #$018A
	LDA.w #$00D1
	JSR.w CODE_83FC9B
	LDX.w #$0192
	LDA.w #$00E1
	JSR.w CODE_83FC9B
	LDX.w #$019A
	LDA.w #$00F1
	JSR.w CODE_83FC9B
	LDX.w #$0000
	LDY.w #$00C0
CODE_83FC5C:
	LDA.w DATA_83FF7A,x
	STA.w $0200,y
	LDA.w DATA_83FF6A,x
	STA.w $0202,y
	JSR.w CODE_83FCBC
	LDA.w DATA_83FF7A,x
	CLC
	ADC.w #$0800
	STA.w $0200,y
	LDA.w DATA_83FF6A,x
	INC
	STA.w $0202,y
	JSR.w CODE_83FCBC
	INX
	INX
	CPX.w #$0010
	BNE.b CODE_83FC5C
	LDA.w #$F038
	STA.w $0300
	LDA.w #$08DA
	STA.w $0302
	JSL.l CODE_85BAC8
	JSL.l CODE_85BAD0
	RTS

CODE_83FC9B:
	SEP.b #$20
	STA.w !REGISTER_CGRAMAddress
	LDY.w #$0000
CODE_83FCA3:
	LDA.l $7E3A80,x
	STA.w !REGISTER_WriteToCGRAMPort
	INX
	LDA.l $7E3A80,x
	STA.w !REGISTER_WriteToCGRAMPort
	INX
	INY
	CPY.w #$0003
	BNE.b CODE_83FCA3
	REP.b #$20
	RTS

;--------------------------------------------------------------------

CODE_83FCBC:
	INY
	INY
	INY
	INY
	RTS

;--------------------------------------------------------------------

CODE_83FCC1:
	STZ.w $007C
	INC.b $65
	LDA.b $65
	CMP.w #$0012
	BNE.b CODE_83FCF2
	STZ.b $65
	INC.b $76
	INC.b $76
	LDA.b $76
	CMP.w #$0004
	BNE.b CODE_83FCDF
	LDA.w #$0000
	STZ.b $76
CODE_83FCDF:
	LDA.b $76
	LDX.w #$0000
CODE_83FCE4:
	STA.w $18F0,x
	INX
	INX
	CPX.w #$0010
	BNE.b CODE_83FCE4
	JSL.l CODE_85BAD0
CODE_83FCF2:
	RTS

;--------------------------------------------------------------------

CODE_83FCF3:
	JSL.l CODE_85BAD0
	LDY.w #$0000
CODE_83FCFA:
	LDA.w DATA_83FF4A,y
	TAX
	JSR.w CODE_83FD09
	INY
	INY
	CPY.w #$0010
	BNE.b CODE_83FCFA
	RTS

CODE_83FD09:
	LDA.w $1820,y
	BEQ.b CODE_83FD73
	LDA.w $1800,y
	CMP.w #$0300
	BEQ.b CODE_83FD1D
	CLC
	ADC.w #$0040
	STA.w $1800,y
CODE_83FD1D:
	SEP.b #$20
	LDA.w $1810,y
	CLC
	ADC.w $1801,y
	CMP.w $1840,y
	BCS.b CODE_83FD85
	STA.w $1810,y
	LDA.w $1801,y
	BNE.b CODE_83FD49
	PHY
	INY
	INY
	CPY.w #$0010
	BNE.b CODE_83FD3E
	LDY.w #$0000
CODE_83FD3E:
	LDA.b #$01
	STA.w $1820,y
	LDA.b #$02
	STA.w $18F0,y
	PLY
CODE_83FD49:
	LDA.w $1810,y
	STA.w $0070
CODE_83FD4F:
	LDA.w $0070
	STA.w $0201,x
	INC.w $0067
	LDA.w $0067
	CMP.b #$02
	BEQ.b CODE_83FD76
CODE_83FD5F:
	INX
	INX
	INX
	INX
	TXA
	CMP.w DATA_83FF5A,y
	BNE.b CODE_83FD4F
	STZ.w $0067
	REP.b #$20
	TYA
	TAX
	JSR.w (DATA_83FDFF,x)
CODE_83FD73:
	REP.b #$20
	RTS

CODE_83FD76:
	STZ.w $0067
	LDA.w $0070
CODE_83FD7A:
	CLC
	ADC.b #$10
	STA.w $0070
	JMP.w CODE_83FD5F

CODE_83FD85:
	LDA.b #$FC
	STA.w $1801,y
	LDA.b #$00
	STA.w $1820,y
	STA.w $18F0,y
	JMP.w CODE_83FD49

CODE_83FD95:
	LDA.w $18F0,y
	CMP.w #$0002
	BNE.b CODE_83FDA9
	LDA.w #$3648
	STA.w $029A
	ORA.w #$4000
	STA.w $029E
CODE_83FDA9:
	RTS

CODE_83FDAA:
	LDA.w $18F0,y
	CMP.w #$0002
	BNE.b CODE_83FDA9
	LDA.w #$304E
	STA.w $028A
	ORA.w #$4000
	STA.w $028E
	RTS

CODE_83FDBF:
	LDA.w $18F0,y
	CMP.w #$0002
	BNE.b CODE_83FDA9
	LDA.w #$364A
	STA.w $0222
	ORA.w #$4000
	STA.w $0226
	LDA.w #$E0F8
	STA.w $0228
	STA.w $022C
	RTS

CODE_83FDDD:
	RTS

CODE_83FDDE:
	RTS

CODE_83FDDF:
	RTS

CODE_83FDE0:
	RTS

CODE_83FDE1:
	LDA.w $18F0,y
	CMP.w #$0002
	BNE.b CODE_83FDA9
	LDA.w #$304C
	STA.w $020A
	ORA.w #$4000
	STA.w $020E
	LDA.w #$E0F8
	STA.w $0210
	STA.w $0214
	RTS

DATA_83FDFF:
	dw CODE_83FDE1
	dw CODE_83FDBF
	dw CODE_83FDE0
	dw CODE_83FDDD
	dw CODE_83FDDE
	dw CODE_83FDDF
	dw CODE_83FDAA
	dw CODE_83FD95

;--------------------------------------------------------------------

CODE_83FE0F:
	LDY.w #$0000
CODE_83FE12:
	JSR.w CODE_83FE1D
	INY
	INY
	CPY.w #$0010
	BNE.b CODE_83FE12
	RTS

CODE_83FE1D:
	TYA
	ASL
	ASL
	TAX
	LDA.w $1860,y
	BEQ.b CODE_83FE65
	STZ.w $007C
	LDA.w $1850,y
	CMP.w #$0400
	BEQ.b CODE_83FE38
	CLC
	ADC.w #$0020
	STA.w $1850,y
CODE_83FE38:
	SEP.b #$20
	CPY.w #$0000
	BNE.b CODE_83FE49
	LDA.w $0301
	CLC
	ADC.w $1851,y
	STA.w $0301
CODE_83FE49:
	LDA.w $02C1,x
	CLC
	ADC.w $1851,y
	STA.w $02C1,x
	INX
	INX
	INX
	INX
	LDA.w $02C1,x
	CLC
	ADC.w $1851,y
	STA.w $02C1,x
	CMP.b #$50
	BCS.b CODE_83FE68
CODE_83FE65:
	REP.b #$20
	RTS

CODE_83FE68:
	BMI.b CODE_83FE65
	LDA.w $1851,y
	LSR
	BEQ.b CODE_83FE82
	EOR.b #$FF
	INC
	STA.w $1851,y
	INY
	INY
	LDA.b #$01
	STA.w $1860,y
	DEY
	DEY
	JMP.w CODE_83FE65

CODE_83FE82:
	LDA.b #$00
	STA.w $1860,y
	JMP.w CODE_83FE65

;--------------------------------------------------------------------

CODE_83FE8A:
	INC.w $007C
	LDA.w $007C
	CMP.w #$0004
	BNE.b CODE_83FEB8
	STZ.w $007C
	SEP.b #$20
	LDX.w #$00C3
CODE_83FE9D:
	LDA.w $0200,x
	CLC
	ADC.b #$02
	STA.w $0200,x
	CMP.b #$10
	BNE.b CODE_83FEAF
	LDA.b #$08
	STA.w $0200,x
CODE_83FEAF:
	INX
	INX
	INX
	INX
	CPX.w #$0107
	BNE.b CODE_83FE9D
CODE_83FEB8:
	REP.b #$20
	RTS

;--------------------------------------------------------------------

CODE_83FEBB:
	DEC.w $007A
	LDA.w $007A
	BNE.b CODE_83FEDD
	LDA.w #$000C
	STA.w $007A
	LDA.w $0078
	CLC
	ADC.w $0074
	AND.w #$00FF
	STA.w $0078
	BEQ.b CODE_83FEDE
	CMP.w #$000F
	BEQ.b CODE_83FF37
CODE_83FEDD:
	RTS

CODE_83FEDE:
	LDX.w #$0000
	LDA.w #$E0F8
CODE_83FEE4:
	STA.w $0200,x
	INX
	INX
	CPX.w #$0200
	BNE.b CODE_83FEE4
	LDY.w #$00C0
	LDX.w #$0000
CODE_83FEF4:
	LDA.w DATA_83FF8A,x
	STA.w $0200,y
	LDA.w DATA_83FF96,x
	STA.w $0202,y
	JSR.w CODE_83FCBC
	LDA.w DATA_83FF8A,x
	CLC
	ADC.w #$0800
	STA.w $0200,y
	LDA.w DATA_83FF96,x
	INC
	STA.w $0202,y
	JSR.w CODE_83FCBC
	INX
	INX
	CPX.w #$000C
	BNE.b CODE_83FEF4
	LDA.w #$6848
	STA.w $02F0
	LDA.w #$00DA
	STA.w $02F2
	LDA.w #$003C
	STA.w $007A
	LDA.w #$000F
	STA.w $0074
	RTS

CODE_83FF37:
	STZ.w $0074
	LDA.w $0072
	CMP.w #$052B
	BNE.b CODE_83FF49
	LDA.w #$0020
	JSL.l CODE_81F5A7
CODE_83FF49:
	RTS

;--------------------------------------------------------------------

DATA_83FF4A:
	dw $0000,$0018,$0030,$0044,$0058,$006C,$0080,$0090

DATA_83FF5A:
	dw $0018,$0030,$0040,$0054,$0068,$007C,$0090,$00A0

DATA_83FF6A:
	dw $08C6,$0AAE,$0CA0,$0EBA,$08B4,$0AD0,$0CBC,$0EC8

DATA_83FF7A:
	dw $F040,$F050,$F060,$F070,$F080,$F098,$F0A8,$F0B8

DATA_83FF8A:
	dw $6850,$6860,$6870,$6888,$6898,$68A8

DATA_83FF96:
	dw $0EC6,$0EAE,$0EA8,$0EA8,$0EBA,$0EA6

;--------------------------------------------------------------------

	%FREE_BYTES(NULLROM, 30, $00)
	%FREE_BYTES(NULLROM, 32, $FF)

UNK_C3FFE0:
	dw $0000,$EBC9,$0000,$EA3D,$0000,$FC7F,$0000,$7BFF
	dw $0000,$8011,$0000,$2000,$0000,$0504,$0000,$C002

%BANK_END(<EndBank>)
endmacro

;#############################################################################################################
;#############################################################################################################

macro SMKBankC4Macros(StartBank, EndBank)
%BANK_START(<StartBank>)

SMK_GFX_Mode7_GlobalTrackTiles:
;$C40000
	incbin "Graphics/Compressed/GFX_Mode7_GlobalTrackTiles.lz5"

SMK_GFX_Sprite_Items:
;$C40594
	incbin "Graphics/Compressed/GFX_Sprite_Items.lz5"

SMK_PaletteData_MarioCircuitCourse:
;$C4117F
	incbin "Palettes/MarioCircuitCourse.lz5"

SMK_PaletteData_GhostValleyCourse:
;$C41313
	incbin "Palettes/GhostValleyCourse.lz5"

SMK_PaletteData_DonutPlainsCourse:
;$C414C4
	incbin "Palettes/DonutPlainsCourse.lz5"

SMK_PaletteData_BowserCastleCourse:
;$C41675
	incbin "Palettes/BowserCastleCourse.lz5"

SMK_PaletteData_VanillaLakeCourse:
;$C4182F
	incbin "Palettes/VanillaLakeCourse.lz5"

SMK_PaletteData_ChocoIslandCourse:
;$C419C0
	incbin "Palettes/ChocoIslandCourse.lz5"

SMK_PaletteData_KoopaBeachCourse:
;$C41B5B
	incbin "Palettes/KoopaBeachCourse.lz5"

SMK_PaletteData_RainbowRoadCourse:
;$C41D0B
	incbin "Palettes/RainbowRoadCourse.lz5"

	%FREE_BYTES(NULLROM, 10 ,$FF)

SMK_GFX_Mode7_RainbowRoadTrack:
;$C41EBB
	incbin "Graphics/Compressed/GFX_Mode7_RainbowRoadTrack.lz5"

	%FREE_BYTES(NULLROM, 49 ,$FF)

DATA_C42000:
	incbin "Graphics/GFX_Yoshi.bin"

;--------------------------------------------------------------------

%HiROMBankSplit()

;--------------------------------------------------------------------

SMK_GFX_Sprite_GiveUpSmoke:
;$848000
	incbin "Graphics/Compressed/GFX_Sprite_GiveUpSmoke.lz5"

SMK_GFX_Mode7_MarioCircuitTrack:
;$8481C9
	incbin "Graphics/Compressed/GFX_Mode7_MarioCircuitTrack.lz5"

SMK_GFX_Mode7_BowserCastleTrack:
;$848F6A
	incbin "Graphics/Compressed/GFX_Mode7_BowserCastleTrack.lz5"			; Glitch: Decompressing this file also decompresses the one below it.

SMK_MusicData_TitleScreen:
;$849801
	incbin "SPC700/Music/Music_TitleScreen.lz5"

SMK_GFX_Sprite_DirtAndTireSmoke:
;$849C19
	incbin "Graphics/Compressed/GFX_Sprite_DirtAndTireSmoke.lz5"

	%FREE_BYTES(NULLROM, 30, $FF)

DATA_849E90:
	db $12,$17,$17,$17,$18,$18,$1E,$1F,$12,$17,$17,$17,$17,$17,$13,$13
	db $17,$17,$17,$17,$17,$12,$12,$12,$22,$00,$0B,$10,$36,$01,$00,$40
	db $3B,$50,$0D,$40,$07,$50,$1D,$40,$1A,$48,$0D,$40,$0F,$48,$36,$08
	db $51,$40,$01,$48,$13,$08,$00,$48,$05,$40,$21,$48,$00,$4C,$08,$48
	db $0B,$08,$02,$00,$1A,$40,$1E,$48,$0A,$40,$17,$48,$4D,$08,$15,$48
	db $37,$40,$08,$00,$03,$40,$0A,$00,$00,$10,$0A,$50,$87,$40,$8A,$48
	db $10,$40,$08,$48,$01,$40,$21,$48,$23,$40,$05,$50,$29,$40,$02,$42
	db $15,$4A,$1A,$48,$09,$40,$04,$42,$09,$40,$07,$50,$0F,$40,$0C,$50
	db $1A,$40,$08,$50,$05,$40,$15,$50,$1C,$40,$00,$50,$00,$54,$0B,$50
	db $09,$40,$1E,$50,$08,$40,$21,$50,$2E,$40,$01,$50,$09,$52,$07,$50
	db $1A,$10,$08,$50,$1F,$40,$04,$48,$12,$40,$07,$50,$03,$40,$00,$44
	db $3A,$40,$05,$00,$0E,$08,$11,$00,$0D,$10,$00,$00,$16,$17,$17,$17
	db $19,$19,$19,$19,$17,$16,$17,$17,$19,$19,$19,$19,$17,$16,$17,$17

DATA_849F60:
	db $00,$00,$00,$00,$00,$00,$34,$12,$51,$2B,$02,$04,$0C,$06,$01,$00
	db $0E,$0F,$02,$08,$09,$09,$0F,$0F,$5F,$01,$5B,$40,$15,$50,$0E,$40
	db $03,$50,$11,$40,$0B,$48,$08,$40,$11,$48,$02,$00,$1C,$40,$01,$50
	db $12,$10,$0F,$50,$05,$10,$0B,$50,$0F,$40,$02,$50,$0D,$40,$0C,$50
	db $11,$40,$0F,$50,$0D,$40,$07,$50,$0E,$40,$17,$50,$11,$40,$11,$50
	db $1B,$40,$0E,$48,$20,$40,$19,$50,$01,$40,$05,$50,$2D,$40,$08,$50
	db $12,$10,$14,$50,$1F,$40,$13,$50,$10,$40,$10,$48,$55,$40,$12,$50
	db $09,$D0,$0F,$50,$0B,$40,$00,$4C,$0D,$48,$0C,$40,$00,$50,$0F,$10
	db $00,$50,$15,$40,$11,$50,$16,$40,$13,$50,$16,$40,$0F,$48,$16,$40
	db $08,$48,$1C,$40,$00,$50,$0C,$D0,$26,$50,$0C,$10,$00,$00,$00,$40

DATA_84A000:
	incbin "Graphics/GFX_Luigi.bin"

SMK_MusicData_KoopaBeach:
;$84C800
	incbin "SPC700/Music/Music_KoopaBeach.lz5"

SMK_MusicData_BowserCastle:
;$84CC3A
	incbin "SPC700/Music/Music_BowserCastle.lz5"

SMK_MusicData_ChocoIsland:
;$84CFAF
	incbin "SPC700/Music/Music_ChocoIsland.lz5"

	%FREE_BYTES(NULLROM, 43, $FF)

;--------------------------------------------------------------------

CODE_84D500:
	LDX.w #$000E
	LDA.w #$FFFF
CODE_84D506:
	STA.w $1F3A,x
	DEX
	BPL.b CODE_84D506
	RTL

;--------------------------------------------------------------------

CODE_84D50D:
	LDA.b $2C
	BNE.b CODE_84D56E
	PHX
	LDY.w #$000E
	LDA.w #$0000
CODE_84D518:
	STA.w $0000,y
	DEY
	BPL.b CODE_84D518
	LDY.w !RAM_SMK_Global_CurrentRound
	CPX.w #$1100
	BEQ.b CODE_84D52B
	LDA.w $10E6
	BRA.b CODE_84D534

CODE_84D52B:
	TYA
	CLC
	ADC.w #$0008
	TAY
	LDA.w $11E6
CODE_84D534:
	STA.w $1F3A,y
CODE_84D537:
	SEP.b #$30
	LDA.w $1F3A,y
	BMI.b CODE_84D541
	TAX
	INC.b $00,x
CODE_84D541:
	CPY.b #$00
	BEQ.b CODE_84D54C
	CPY.b #$08
	BEQ.b CODE_84D54C
	DEY
	BRA.b CODE_84D537

CODE_84D54C:
	LDX.b #$0E
	LDA.b #$02
CODE_84D550:
	CMP.b $00,x
	BCC.b CODE_84D55E
	DEX
	DEX
	BPL.b CODE_84D550
	REP.b #$30
	PLX
	STZ.b $64,x
	RTL

CODE_84D55E:
	LDA.b #$FF
	STA.w $1F3A,y
	STA.w $1F3B,y
	STA.w $1F3C,y
	REP.b #$30
	PLX
	DEC.b $64,x
CODE_84D56E:
	RTL

;--------------------------------------------------------------------

CODE_84D56F:
	LDA.w $017E
	BNE.b CODE_84D57C
	LDX.w !RAM_SMK_Global_RacetrackType
	CPX.w #!Define_SMK_RacetrackType_KoopaBeach
	BEQ.b CODE_84D57D
CODE_84D57C:
	RTL

CODE_84D57D:
	PHB
	PHK
	PLB
	SEP.b #$30
	LDX.b #$30
	LDA.b $38
	AND.b #$07
	CMP.b #$07
	BNE.b CODE_84D5B3
	LDA.b $38
	AND.b #$78
	LSR
	LSR
	LSR
	TAY
	LDA.w DATA_84D5B7,y
	TAY
CODE_84D598:
	LDA.w DATA_84D5C7,y
	PHY
	TAY
	LDA.w DATA_84D5F9,y
	STA.l $7E3A80,x
	LDA.w DATA_84D5F9+$01,y
	STA.l $7E3A81,x
	PLY
	INX
	INX
	INY
	CPX.b #$3A
	BNE.b CODE_84D598
CODE_84D5B3:
	REP.b #$30
	PLB
	RTL

DATA_84D5B7:
	db $00,$05,$0A,$0F,$0F,$14,$14,$14
	db $19,$19,$19,$19,$23,$28,$2D,$2D

DATA_84D5C7:
	db $00,$00,$00,$02,$04
	db $00,$00,$02,$04,$06
	db $00,$02,$04,$06,$06
	db $02,$04,$06,$06,$08
	db $04,$06,$06,$08,$08
	db $04,$06,$08,$08,$08
	db $0A,$04,$08,$08,$08
	db $02,$0C,$0E,$08,$08
	db $00,$02,$0C,$0E,$08
	db $00,$00,$02,$0C,$0E

DATA_84D5F9:
	dw $7EB2,$7F56,$7FFD,$3A54,$4296,$7FB9,$7FFB,$7FFE

;--------------------------------------------------------------------

DATA_84D609:
	dw $0006,$0006,$FFFA,$FFFA

DATA_84D611:
	dw $FFFA,$0006,$FFFA,$0006

DATA_84D619:
	dw $FA00,$0600,$FA00,$0600

DATA_84D621:
	dw $FA00,$FA00,$0600,$0600

CODE_84D629:
	PHB
	PHK
	PLB
	LDY.b $6A,x
	LDA.w $00C0,y
	AND.w #$00FF
	CLC
	ADC.w #$0004
	CMP.w $0148
	BCC.b CODE_84D640
	SBC.w $0148
CODE_84D640:
	ASL
	TAY
	PHX
	LDA.b $38
	AND.w #$0006
	TAX
	LDA.w $0900,y
	CLC
	ADC.w DATA_84D609,x
	STA.b $02
	LDA.w $0A00,y
	CLC
	ADC.w DATA_84D611,x
	STA.b $04
	PLX
	LDY.w #$0000
	LDA.b $18,x
	SEC
	SBC.b $02
	BPL.b CODE_84D66D
	LDY.w #$0004
	EOR.w #$FFFF
	INC
CODE_84D66D:
	STA.b $06
	LDA.b $1C,x
	SEC
	SBC.b $04
	BPL.b CODE_84D67C
	INY
	INY
	EOR.w #$FFFF
	INC
CODE_84D67C:
	STA.b $08
	CMP.b $06
	BCS.b CODE_84D6A5
	LDA.b $06
	JSR.w CODE_84D6EE
	STA.b $00
	LDA.b $08
	JSR.w CODE_84D6CF
	CPY.w #$0002
	BEQ.b CODE_84D69C
	CPY.w #$0006
	BEQ.b CODE_84D69C
	EOR.w #$FFFF
	INC
CODE_84D69C:
	STA.b $24,x
	LDA.w DATA_84D621,y
	STA.b $22,x
	BRA.b CODE_84D6BF

CODE_84D6A5:
	JSR.w CODE_84D6EE
	STA.b $00
	LDA.b $06
	JSR.w CODE_84D6CF
	CPY.w #$0004
	BCS.b CODE_84D6B8
	EOR.w #$FFFF
	INC
CODE_84D6B8:
	STA.b $22,x
	LDA.w DATA_84D619,y
	STA.b $24,x
CODE_84D6BF:
	LDA.b $00
	AND.w #$00FF
	XBA
	LSR
	LSR
	LSR
	LSR
	LSR
	LSR
	STA.b $26,x
	PLB
	RTL

;--------------------------------------------------------------------

CODE_84D6CF:
	ASL
	ASL
	ASL
	ASL
	STA.w !REGISTER_DividendLo
	SEP.b #$20
	LDA.b $00
	STA.w !REGISTER_Divisor
	REP.b #$20
	NOP #7
	LDA.w !REGISTER_QuotientLo
	ASL
	ASL
	ASL
	ASL
	RTS

;--------------------------------------------------------------------

CODE_84D6EE:
	STA.w !REGISTER_DividendLo
	SEP.b #$20
	LDA.b #$06
	STA.w !REGISTER_Divisor
	REP.b #$20
	NOP #7
	LDA.w !REGISTER_QuotientLo
	RTS

;--------------------------------------------------------------------

CODE_84D705:
	RTL

;--------------------------------------------------------------------

CODE_84D706:
	LDA.b $2C
	BNE.b CODE_84D712
	LDA.w $1DCE
	AND.w #$2000
	BNE.b CODE_84D716
CODE_84D712:
	JML.l CODE_81F4B2

CODE_84D716:
	RTL

;--------------------------------------------------------------------

CODE_84D717:
	JMP.w [$0FDC]

CODE_84D71A:
	LDA.w #$0055
	JMP.w [$0FDC]

CODE_84D720:
	LDA.w #$0054
	JMP.w [$0FAA]

CODE_84D726:
	LDA.w #$0042
	JMP.w [$0FAD]

CODE_84D72C:
	BNE.b CODE_84D734
	LDA.w #$0043
	JMP.w [$0FAA]

CODE_84D734:
	LDA.w #$0043
	JMP.w [$0FAD]

;--------------------------------------------------------------------

CODE_84D73A:
	PHY
	PHX
	JSR.w CODE_84D9DA
	PHK
	JSR.w (DATA_84D746,x)
	PLX
	PLY
	RTL

DATA_84D746:
	dw $0000
	dw CODE_84D756
	dw CODE_84D75C
	dw CODE_84D762
	dw $0000
	dw CODE_84D768
	dw CODE_84D76E
	dw CODE_84D774

CODE_84D756:
	LDA.w #$0030
	JMP.w [$0FAA]

CODE_84D75C:
	LDA.w #$0031
	JMP.w [$0FAA]

CODE_84D762:
	LDA.w #$0032
	JMP.w [$0FAA]

CODE_84D768:
	LDA.w #$0030
	JMP.w [$0FAD]

CODE_84D76E:
	LDA.w #$0031
	JMP.w [$0FAD]

CODE_84D774:
	LDA.w #$0032
	JMP.w [$0FAD]

;--------------------------------------------------------------------

CODE_84D77A:
	PHY
	PHX
	JSR.w CODE_84D9DA
	PHK
	JSR.w (DATA_84D786,x)
	PLX
	PLY
	RTL


DATA_84D786:
	dw $0000
	dw CODE_84D796
	dw CODE_84D79C
	dw CODE_84D7A2
	dw $0000
	dw CODE_84D7A8
	dw CODE_84D7AE
	dw CODE_84D7B4

CODE_84D796:
	LDA.w #$003C
	JMP.w [$0FAA]

CODE_84D79C:
	LDA.w #$003D
	JMP.w [$0FAA]

CODE_84D7A2:
	LDA.w #$003E
	JMP.w [$0FAA]

CODE_84D7A8:
	LDA.w #$003C
	JMP.w [$0FAD]

CODE_84D7AE:
	LDA.w #$003D
	JMP.w [$0FAD]

CODE_84D7B4:
	LDA.w #$003E
	JMP.w [$0FAD]

;--------------------------------------------------------------------

CODE_84D7BA:
	PHY
	PHX
	JSR.w CODE_84D9DA
	PHK
	JSR.w (DATA_84D7C6,x)
	PLX
	PLY
	RTL

DATA_84D7C6:
	dw $0000
	dw CODE_84D7D6
	dw CODE_84D7DC
	dw CODE_84D7E2
	dw $0000
	dw CODE_84D7E8
	dw CODE_84D7EE
	dw CODE_84D7F4

CODE_84D7D6:
	LDA.w #$0036
	JMP.w [$0FAA]

CODE_84D7DC:
	LDA.w #$0037
	JMP.w [$0FAA]

CODE_84D7E2:
	LDA.w #$0038
	JMP.w [$0FAA]

CODE_84D7E8:
	LDA.w #$0036
	JMP.w [$0FAD]

CODE_84D7EE:
	LDA.w #$0037
	JMP.w [$0FAD]

CODE_84D7F4:
	LDA.w #$0038
	JMP.w [$0FAD]

;--------------------------------------------------------------------

CODE_84D7FA:
	PHY
	PHX
	JSR.w CODE_84D9DA
	PHK
	JSR.w (DATA_84D806,x)
	PLX
	PLY
	RTL

DATA_84D806:
	dw $0000
	dw CODE_84D816
	dw CODE_84D81C
	dw CODE_84D822
	dw $0000
	dw CODE_84D828
	dw CODE_84D82E
	dw CODE_84D834

CODE_84D816:
	LDA.w #$0033
	JMP.w [$0FAA]

CODE_84D81C:
	LDA.w #$0034
	JMP.w [$0FAA]

CODE_84D822:
	LDA.w #$0035
	JMP.w [$0FAA]

CODE_84D828:
	LDA.w #$0033
	JMP.w [$0FAD]

CODE_84D82E:
	LDA.w #$0034
	JMP.w [$0FAD]

CODE_84D834:
	LDA.w #$0035
	JMP.w [$0FAD]

;--------------------------------------------------------------------

CODE_84D83A:
	PHX
	LDA.b $3A
	CMP.w #$0006
	BNE.b CODE_84D883
	TXA
	SEC
	SBC.w #$0040
	TAY
	LDA.b $0E,x
	CMP.w $0006,y
	BCS.b CODE_84D859
	LDA.w $0006,y
	CMP.w #$0140
	BCC.b CODE_84D869
	LDA.b $0E,x
CODE_84D859:
	LDX.w #$000A
	CMP.w #$0140
	BCC.b CODE_84D86C
	LDA.w $0006,y
	CMP.w #$0140
	BCS.b CODE_84D883
CODE_84D869:
	LDX.w #$0002
CODE_84D86C:
	CMP.w #$00A0
	BCS.b CODE_84D87F
	INX
	INX
	CMP.w #$0060
	BCS.b CODE_84D87F
	INX
	INX
	CMP.w #$0040
	BCC.b CODE_84D883
CODE_84D87F:
	PHK
	JSR.w (DATA_84D885,x)
CODE_84D883:
	PLX
	RTL

DATA_84D885:
	dw $0000
	dw CODE_84D895
	dw CODE_84D89B
	dw CODE_84D8A1
	dw $0000
	dw CODE_84D8A7
	dw CODE_84D8AD
	dw CODE_84D8B3

CODE_84D895:
	LDA.w #$0044
	JMP.w [$0FAA]

CODE_84D89B:
	LDA.w #$0045
	JMP.w [$0FAA]

CODE_84D8A1:
	LDA.w #$0046
	JMP.w [$0FAA]

CODE_84D8A7:
	LDA.w #$0044
	JMP.w [$0FAD]

CODE_84D8AD:
	LDA.w #$0045
	JMP.w [$0FAD]

CODE_84D8B3:
	LDA.w #$0046
	JMP.w [$0FAD]

;--------------------------------------------------------------------

CODE_84D8B9:
	LDA.b $6A,x
	CMP.w #$1000
	BNE.b CODE_84D8C6
	LDA.w #$0039
	JMP.w [$0FAA]

CODE_84D8C6:
	LDA.w #$0039
	JMP.w [$0FAD]

CODE_84D8CC:
	LDA.b $6A,x
	CMP.w #$1000
	BNE.b CODE_84D8D9
	LDA.w #$0066
	JMP.w [$0FAA]

CODE_84D8D9:
	LDA.w #$0066
	JMP.w [$0FAD]

CODE_84D8DF:
	BNE.b CODE_84D8E7
	LDA.w #$003C
	JMP.w [$0FAA]

CODE_84D8E7:
	LDA.w #$003C
	JMP.w [$0FAD]

;--------------------------------------------------------------------

CODE_84D8ED:
	PHY
	PHX
	JSR.w CODE_84D9DA
	PHK
	JSR.w (DATA_84D8F9,x)
	PLX
	PLY
	RTL

DATA_84D8F9:
	dw $0000
	dw CODE_84D909
	dw CODE_84D90F
	dw CODE_84D915
	dw $0000
	dw CODE_84D91B
	dw CODE_84D921
	dw CODE_84D927

CODE_84D909:
	LDA.w #$0058
	JMP.w [$0FAA]

CODE_84D90F:
	LDA.w #$0059
	JMP.w [$0FAA]

CODE_84D915:
	LDA.w #$005A
	JMP.w [$0FAA]

CODE_84D91B:
	LDA.w #$0058
	JMP.w [$0FAD]

CODE_84D921:
	LDA.w #$0059
	JMP.w [$0FAD]

CODE_84D927:
	LDA.w #$005A
	JMP.w [$0FAD]

;--------------------------------------------------------------------

CODE_84D92D:
	BNE.b CODE_84D936
	LDA.w #$0026
	JML.l CODE_81F5A7

CODE_84D936:
	LDA.w #$0026
	JML.l CODE_81F5C2

CODE_84D93D:
	LDA.w #$0020
	JMP.w [$0FDC]

CODE_84D943:
	LDA.w #$0029
	JMP.w [$0FDC]

CODE_84D949:
	LDA.w #$0047
	JMP.w [$0FDC]

CODE_84D94F:
	LDA.w #$003F
	JMP.w [$0FDC]

CODE_84D955:
	BNE.b CODE_84D95D
	LDA.w #$002B
	JMP.w [$0FAA]

CODE_84D95D:
	LDA.w #$002B
	JMP.w [$0FAD]

CODE_84D963:
	BNE.b CODE_84D96B
	LDA.w #$004F
	JMP.w [$0FAA]

CODE_84D96B:
	LDA.w #$004F
	JMP.w [$0FAD]

CODE_84D971:
	LDA.w #$002C
	JML.l CODE_81F5A7

CODE_84D978:
	LDA.w #$002E
	JML.l CODE_81F5A7

CODE_84D97F:
	LDA.w #$002F
	JML.l CODE_81F5A7

CODE_84D986:
	LDA.w #$005B
	JML.l CODE_81F5A7

;--------------------------------------------------------------------

CODE_84D98D:
	LDA.w #$004D				; Note: What is the point of this? Was this supposed to be LDX?
	PHX
	LDX.b $12,y
	LDA.l DATA_84D99B,x
	PLX
	JMP.w [$0FDC]

DATA_84D99B:
	dw $004D,$004D,$0051,$004D,$005C,$004D,$004D,$0050

;--------------------------------------------------------------------

CODE_84D9AB:
	PHY
	PHX
	LDA.w $00E6,y
	DEC
	DEC
	TAX
	LDY.w $010E,x
	LDX.b $10,y
	BMI.b CODE_84D9C7
	LDX.b  $12,y
	LDA.l DATA_84D9CA,x
	BEQ.b CODE_84D9C7
	PLX
	PLY
	JMP.w [$0FDC]

CODE_84D9C7:
	PLX
	PLY
	RTL

DATA_84D9CA:
	dw $0000,$0000,$0051,$0000,$005C,$0000,$0000,$0050

;--------------------------------------------------------------------

CODE_84D9DA:
	LDA.b $06,x
	CMP.w #$0120
	BCS.b CODE_84DA02
	SEP.b #$20
	LDA.b $2D,x
	INC
	REP.b #$20
	BNE.b CODE_84DA02
	LDA.b $0E,x
	CMP.w #$0120
	BCS.b CODE_84DA14
	SEP.b #$20
	LDA.b $33,x
	INC
	REP.b #$20
	BNE.b CODE_84DA14
	LDA.b $06,x
	CMP.b $0E,x
	BCS.b CODE_84DA14
	BCC.b CODE_84DA26			; Note: This will always branch.

CODE_84DA02:
	LDA.b $0E,x
	CMP.w #$0120
	BCS.b CODE_84DA38
	SEP.b #$20
	LDA.b $33,x
	INC
	REP.b #$20
	BNE.b CODE_84DA38
	BRA.b CODE_84DA26

CODE_84DA14:
	TXY
	LDX.w #$0000
CODE_84DA18:
	LDA.l DATA_84DA3C,x
	BEQ.b CODE_84DA38
	CMP.w $0006,y
	INX
	INX
	BCS.b CODE_84DA18
	RTS

CODE_84DA26:
	TXY
	LDX.w #$0008
CODE_84DA2A:
	LDA.l DATA_84DA3C-$08,x
	BEQ.b CODE_84DA38
	CMP.w $000E,y
	INX
	INX
	BCS.b CODE_84DA2A
	RTS

CODE_84DA38:
	PLA
	PLX
	PLY
	RTL

DATA_84DA3C:
	dw $00C0,$0060,$0030,$0000

;--------------------------------------------------------------------

CODE_84DA44:
	LDX.b $12,y
	LDA.w $10E6
	CMP.w $11E6
	BCS.b CODE_84DA55
	LDA.l DATA_84DA70,x
	JMP.w [$0FAA]

CODE_84DA55:
	LDA.l DATA_84DA70,x
	JMP.w [$0FAD]

CODE_84DA5C:
	LDA.w $10E6
	CMP.w $11E6
	BCS.b CODE_84DA6A
	LDA.w #$0053
	JMP.w [$0FAA]

CODE_84DA6A:
	LDA.w #$0053
	JMP.w [$0FAD]

DATA_84DA70:
	dw $0052,$0052,$0051,$0052,$005C,$0052,$0052,$0050

;--------------------------------------------------------------------

CODE_84DA80:
	BNE.b CODE_84DA89
	LDA.w #$003B
	JML.l CODE_81F5A7

CODE_84DA89:
	LDA.w #$003B
	JML.l CODE_81F5C2

CODE_84DA90:
	LDA.w #$FFFF
	STA.w $0D38
	STA.w $0D36
	STA.w $0D34
	STZ.w $0D32
	LDA.w #$00FF
	STA.w $0D34
	STA.w $0D36
	RTL

;--------------------------------------------------------------------

DATA_84DAA9:
	dw CODE_84DC80
	dw CODE_84DBD5
	dw CODE_84DBD5
	dw CODE_84DBD5
	dw CODE_84DBD5
	dw CODE_84DBB7
	dw CODE_84DBD5
	dw CODE_84DAC4

CODE_84DAB9:
	PHB
	PHK
	PLB
	LDX.w $0D28
	JSR.w (DATA_84DAA9,x)
	PLB
	RTL

CODE_84DAC4:
	RTS

DATA_84DAC5:
	dw $0000,$0008,$0010,$0018,$0000

DATA_84DACF:
	dw $170C,$00FF,$0F00,$FFFF,$0000

DATA_84DAD9:
	dw $1408,$211C,$0BFF,$1E15,$FFFF

DATA_84DAE3:
	dw $110C,$241A,$0EFF,$1C14,$FFFF

DATA_84DAED:
	dw $110C,$2C1D,$0EFF,$2114,$FFFF

DATA_84DAF7:
	dw $140C,$00FF,$0F00,$FFFF,$0000

DATA_84DB01:
	dw $0D08,$1C13,$09FF,$1511,$FFFF

DATA_84DB0B:
	dw $170E,$261C,$0EFF,$1C17,$FF26

DATA_84DB15:
	dw $1009,$2017,$0CFF,$2213,$FFFF

DATA_84DB1F:
	dw $200E,$3F32,$0EFF,$3528,$FFFF

DATA_84DB29:
	dw $1608,$381D,$08FF,$1D16,$FFFF

DATA_84DB33:
	dw $1A09,$2C27,$0AFF,$2A1C,$FFFF

DATA_84DB3D:
	dw $0F09,$241E,$0BFF,$2012,$FFFF

DATA_84DB47:
	dw $150E,$241D,$11FF,$2018,$FFFF

DATA_84DB51:
	dw $1208,$2219,$0AFF,$1E16,$FFFF

DATA_84DB5B:
	dw $1F0C,$00FF,$1000,$FFFF,$0000

DATA_84DB65:
	dw $1F10,$00FF,$1000,$FFFF,$0000

DATA_84DB6F:
	dw $FF44,$00FF,$4400,$FFFF,$0000

DATA_84DB79:
	dw $FF44,$00FF,$4400,$FFFF,$0000

DATA_84DB83:
	dw $0000,DATA_84DB93,DATA_84DBA9,DATA_84DB9B,DATA_84DBAF,DATA_84DBB3,DATA_84DBA1,DATA_84DB93

DATA_84DB93:
	dw DATA_84DACF,DATA_84DAD9,DATA_84DAE3,DATA_84DAED

DATA_84DB9B:
	dw DATA_84DAF7,DATA_84DB01,DATA_84DB0B

DATA_84DBA1:
	dw DATA_84DB15,DATA_84DB1F,DATA_84DB29,DATA_84DB33

DATA_84DBA9:
	dw DATA_84DB3D,DATA_84DB47,DATA_84DB51

DATA_84DBAF:
	dw DATA_84DB5B,DATA_84DB65

DATA_84DBB3:
	dw DATA_84DB6F,DATA_84DB79

CODE_84DBB7:
	JSR.w CODE_84DBD5
	BCC.b CODE_84DBD4
	LDY.w #$1DA0
	BRA.b CODE_84DBCF

CODE_84DBC1:
	CLC
	ADC.b $0C
	TAX
	LDA.b $18,x
	STA.b $28,x
	LDA.b $1C,x
	STA.b $2A,x
	INY
	INY
CODE_84DBCF:
	LDA.w $0000,y
	BNE.b CODE_84DBC1
CODE_84DBD4:
	RTS

CODE_84DBD5:
	LDA.w DATA_84DB83,x
	STA.b $00
	LDY.w $0D2C
	LDA.b ($00),y
	BNE.b CODE_84DBE2
CODE_84DBE1:
	RTS

CODE_84DBE2:
	STA.b $16
	LDY.w $1EE4
	LDX.b $C8,y
	BPL.b CODE_84DBFA
	CLC
	ADC.w #$0005
	STA.b $16
	TYA
	EOR.w #$0002
	TAY
	LDX.b $C8,y
	BMI.b CODE_84DBE1
CODE_84DBFA:
	LDY.w #$0000
	SEP.b #$20
	LDA.b $C0,x
	CMP.b #$FF
	BEQ.b CODE_84DC0B
	DEY
CODE_84DC06:
	INY
	CMP.b ($16),y
	BCS.b CODE_84DC06
CODE_84DC0B:
	REP.b #$20
	TYA
	ASL
	LDY.w $1EE4
	CMP.w $0D34,y
	BEQ.b CODE_84DC7A
	STA.w $0D34,y
	TAX
	LDA.w DATA_84DC7C,y
	STA.b $0C
	LDA.w !RAM_SMK_Race_CurrentRacetrack
	XBA
	LSR
	LSR
	ADC.w #DATA_85C800
	STA.b $08
	LDA.w #DATA_85C800>>16
	STA.b $0A
	LDY.w DATA_84DAC5,x
	LDA.b [$08],y
	BNE.b CODE_84DC3A
	LDY.w #$0000
CODE_84DC3A:
	STY.b $02
	LDY.w #$1DA0
	BRA.b CODE_84DC73

CODE_84DC41:
	CLC
	ADC.b $0C
	TAX
	PHY
	LDY.b $02
	LDA.b [$08],y
	PHA
	AND.w #$007F
	ASL
	ASL
	ASL
	ADC.w $0FC6
	STA.b $18,x
	PLA
	AND.w #$FF80
	LSR
	LSR
	LSR
	LSR
	ADC.w $0FC6
	STA.b $1C,x
	LDA.w #$FE00
	STA.b $2E,x
	STA.b $34,x
	STZ.b $08,x
	INY
	INY
	STY.b $02
	PLY
	INY
	INY
CODE_84DC73:
	LDA.w $0000,y
	BNE.b CODE_84DC41
	SEC
	RTS

CODE_84DC7A:
	CLC
	RTS

DATA_84DC7C:
	dw $0000,$0040

CODE_84DC80:
	LDY.w $0D2C
	LDA.w DATA_84DD15,y
	STA.b $08
	LDY.w $1EE4
	LDX.b $C8,y
	BMI.b CODE_84DC97
	LDA.w DATA_84DC7C,y
	STA.b $0C
	JSR.w CODE_84DC98
CODE_84DC97:
	RTS

CODE_84DC98:
	LDY.b $08
	LDA.w !ContextDependentTable,y
	STA.b $04
	INY
	INY
	STY.b $08
	LDA.b $C0,x
	AND.w #$00FF
	TAY
	LDA.b ($04),y
	AND.w #$00FF
	ASL
	STA.b $02
	LDY.w #$1DA0
	BRA.b CODE_84DCE5

CODE_84DCB6:
	CLC
	ADC.b $0C
	TAX
	PHY
	LDY.b $02
	LDA.b ($08),y
	BNE.b CODE_84DCC4
	TAY
	LDA.b ($08),y
CODE_84DCC4:
	PHA
	AND.w #$00FF
	ASL
	ASL
	ASL
	ADC.w #$0004
	STA.b $18,x
	PLA
	AND.w #$FF00
	LSR
	LSR
	LSR
	LSR
	LSR
	ADC.w #$0004
	STA.b $1C,x
	INY
	INY
	STY.b $02
	PLY
	INY
	INY
CODE_84DCE5:
	LDA.w !ContextDependentTable,y
	BNE.b CODE_84DCB6
	RTS

CODE_84DCEB:
	PHA
	SEP.b #$21
	LDA.b #!DSP1_Command28_VectorAbsoluteValueCalculation
	STA.w !REGISTER_DSP1_DataRegister
	REP.b #$20
	PLA
	SBC.b $18,x
	STA.w !REGISTER_DSP1_DataRegister
	TYA
	SEC
	SBC.b $1C,x
	STA.w !REGISTER_DSP1_DataRegister
	LDA.w #$0000
	LDA.w #$0000
	STA.w !REGISTER_DSP1_DataRegister
CODE_84DD0B:
	LDA.l !REGISTER_DSP1_StatusRegister
	BPL.b CODE_84DD0B
	LDA.w !REGISTER_DSP1_DataRegister
	RTS

DATA_84DD15:
	dw DATA_84DD1B
	dw DATA_84DDB2
	dw DATA_84DE5E

DATA_84DD1B:
	dw DATA_84DD91
	db $73,$15,$70,$12,$6C,$11,$68,$11
	db $64,$11,$60,$11,$5C,$11,$58,$11
	db $53,$13,$50,$16,$4D,$19,$4A,$0E
	db $46,$0E,$42,$0E,$3E,$0E,$39,$0B
	db $36,$08,$33,$05,$30,$11,$2C,$11
	db $28,$11,$24,$11,$12,$13,$0F,$16
	db $0F,$1A,$0F,$1E,$0F,$22,$0F,$26
	db $0F,$2A,$0F,$2E,$10,$55,$13,$58
	db $17,$59,$1B,$59,$1F,$59,$23,$59
	db $27,$59,$2B,$59,$40,$62,$43,$65
	db $45,$6A,$45,$6E,$45,$72,$53,$70
	db $57,$72,$5B,$72,$5F,$72,$63,$72
	db $67,$72,$6B,$72,$70,$71,$73,$6E
	db $74,$68,$74,$64,$74,$60,$74,$5C
	db $74,$58,$00,$00

DATA_84DD91:
	db $00,$00,$00,$00,$01,$03,$08,$0B
	db $0B,$0F,$16,$16,$16,$17,$1E,$1E
	db $1E,$1F,$20,$26,$26,$27,$2B,$2C
	db $2C,$32,$32,$34,$34,$34,$00,$00
	db $00

DATA_84DDB2:
	dw DATA_84DE2E
	db $12,$14,$16,$12,$1A,$12,$1E,$12
	db $22,$12,$26,$14,$29,$17,$29,$1B
	db $29,$1F,$35,$25,$39,$27,$3D,$27
	db $41,$27,$45,$27,$49,$27,$53,$25
	db $56,$21,$56,$1D,$56,$19,$56,$15
	db $68,$28,$6C,$28,$6F,$29,$6F,$2D
	db $6F,$31,$6F,$35,$6F,$39,$6F,$3D
	db $6F,$41,$6D,$4C,$69,$4F,$65,$4F
	db $61,$4F,$5D,$4F,$54,$59,$51,$5C
	db $49,$57,$50,$60,$50,$64,$50,$68
	db $47,$6D,$44,$70,$40,$72,$3C,$72
	db $34,$74,$30,$72,$2C,$71,$29,$6E
	db $26,$6B,$22,$71,$1E,$71,$1A,$71
	db $16,$71,$10,$64,$0F,$60,$0F,$5C
	db $0F,$58,$0F,$54,$0F,$50,$0F,$4C
	db $00,$00

DATA_84DE2E:
	db $00,$00,$00,$01,$05,$05,$06,$09
	db $09,$0A,$0A,$0F,$0F,$0F,$10,$14
	db $14,$16,$1D,$1D,$1D,$1D,$1D,$1E
	db $22,$22,$23,$25,$28,$28,$2B,$2C
	db $2C,$31,$31,$31,$35,$35,$36,$36
	db $00,$00,$00,$00,$00,$00,$00,$00

DATA_84DE5E:
	dw DATA_84DF08
	db $12,$12,$16,$12,$1A,$12,$1E,$12
	db $22,$12,$26,$12,$2A,$12,$2E,$12
	db $32,$12,$36,$12,$54,$08,$59,$08
	db $6F,$13,$6F,$17,$6F,$1B,$6C,$1D
	db $68,$1D,$64,$1D,$60,$1D,$5C,$1D
	db $64,$27,$64,$2B,$64,$2F,$5A,$27
	db $56,$27,$52,$27,$5A,$31,$5A,$35
	db $5A,$39,$50,$31,$4C,$31,$48,$31
	db $44,$31,$40,$31,$3C,$31,$34,$3C
	db $32,$3F,$32,$43,$34,$46,$38,$48
	db $3C,$48,$40,$48,$43,$54,$46,$57
	db $49,$5A,$4C,$5D,$50,$52,$54,$52
	db $58,$52,$5A,$5B,$5E,$5B,$6F,$5F
	db $6F,$63,$6F,$67,$6F,$6B,$6F,$6F
	db $6C,$72,$68,$72,$64,$77,$60,$77
	db $52,$79,$46,$75,$42,$75,$37,$72
	db $34,$6F,$31,$6C,$2C,$71,$28,$71
	db $24,$71,$21,$66,$1E,$63,$1B,$60
	db $17,$67,$13,$67,$0F,$67,$0F,$5A
	db $0F,$56,$0F,$52,$0F,$4E,$0F,$4A
	db $0F,$46,$0F,$42,$0F,$3E,$00,$00

DATA_84DF08:
	db $00,$00,$06,$06,$06,$0A,$0A,$0A
	db $0C,$0C,$0F,$0F,$0F,$14,$14,$1A
	db $1E,$23,$24,$26,$27,$2A,$2E,$2E
	db $31,$33,$33,$33,$38,$38,$38,$3A
	db $3C,$3C,$3D,$3D,$3F,$42,$45,$48
	db $4B,$4B,$4B,$00,$00,$00,$00,$00

;--------------------------------------------------------------------

CODE_84DF38:
	STX.b $0E
	STY.b $10
	PHB
	SEP.b #$20
	PHA
	REP.b #$20
	PLB
	JSR.w CODE_84DF48
	PLB
	RTL

CODE_84DF48:
	LDY.b $0E
	STY.b $00
	STZ.b $0C
	STZ.b $04
	STZ.b $06
	STZ.b $08
	STZ.b $12
	STZ.b $14
	STZ.b $16
CODE_84DF5A:
	SEP.b #$20
	REP.b #$10
	LDX.b $10
	LDA.w $0000,x
	INX
	STX.b $10
	STA.b $04
	CMP.b #$FF
	BEQ.b CODE_84DF97
	AND.b #$E0
	CMP.b #$E0
	BNE.b CODE_84DF9A
	LDA.b $04
	ASL
	ASL
	ASL
	AND.b #$E0
	PHA
	REP.b #$20
	LDX.b $10
	LDA.w $0000,x
	STA.b $12
	DEX
	LDA.w $0000,x
	STA.b $13
	INX
	INX
	STX.b $10
	LDA.b $12
	AND.w #$03FF
	SEP.b #$20
	JMP.w CODE_84DFA4

CODE_84DF97:
	REP.b #$30
	RTS

CODE_84DF9A:
	PHA
	REP.b #$20
	LDA.b $04
	AND.w #$001F
	SEP.b #$20
CODE_84DFA4:
	TAY
	INY
	STY.b $14
	PLA
	CMP.b #$00
	BPL.b CODE_84DFB0
	JMP.w CODE_84DFDE

CODE_84DFB0:
	CMP.b #$20
	BEQ.b CODE_84DFD5
	CMP.b #$40
	BEQ.b CODE_84DFD8
	CMP.b #$60
	BEQ.b CODE_84DFDB
	LDX.b $10
CODE_84DFBE:
	LDA.w $0000,x
	LDX.b $0E
	STA.l $7E0000,x
	INX
	STX.b $0E
	LDX.b $10
	INX
	STX.b $10
	DEY
	BNE.b CODE_84DFBE
	JMP.w CODE_84DF5A

CODE_84DFD5:
	JMP.w CODE_84E025

CODE_84DFD8:
	JMP.w CODE_84E03A

CODE_84DFDB:
	JMP.w CODE_84E06D

CODE_84DFDE:
	CMP.b #$C0
	BCS.b CODE_84E022
	AND.b #$20
	STA.b $16
	REP.b #$21
	LDA.w $0000,x
	ADC.b $00
	STA.b $04
	INX
	INX
	STX.b $10
CODE_84DFF3:
	SEP.b #$20
	LDY.b $14
CODE_84DFF7:
	LDX.b $04
	LDA.l $7E0000,x
	INX
	STX.b $04
	LDA.b $16
	BEQ.b CODE_84E00E
	DEX
	LDA.l $7E0000,x
	EOR.b #$FF
	JMP.w CODE_84E013

CODE_84E00E:
	DEX
	LDA.l $7E0000,x
CODE_84E013:
	LDX.b $0E
	STA.l $7E0000,x
	INX
	STX.b $0E
	DEY
	BNE.b CODE_84DFF7
	JMP.w CODE_84DF5A

CODE_84E022:
	JMP.w CODE_84E067

CODE_84E025:
	LDA.w $0000,x
	INX
	STX.b $10
	LDX.b $0E
CODE_84E02D:
	STA.l $7E0000,x
	INX
	DEY
	BNE.b CODE_84E02D
	STX.b $0E
	JMP.w CODE_84DF5A

CODE_84E03A:
	LDA.w $0000,x
	INX
	STA.b $04
	LDA.w $0000,x
	STA.b $06
	INX
	STX.b $10
CODE_84E048:
	LDX.b $0E
	LDA.b $04
	STA.l $7E0000,x
	INX
	STX.b $0E
	DEY
	BEQ.b CODE_84E064
	LDX.b $0E
	LDA.b $06
	STA.l $7E0000,x
	INX
	STX.b $0E
	DEY
	BNE.b CODE_84E048
CODE_84E064:
	JMP.w CODE_84DF5A

CODE_84E067:
	JMP.w CODE_84E083

CODE_84E06A:
	JMP.w CODE_84DFF3

CODE_84E06D:
	LDA.w $0000,x
	INX
	STX.b $10
	LDX.b $0E
CODE_84E075:
	STA.l $7E0000,x
	INC
	INX
	DEY
	BNE.b CODE_84E075
	STX.b $0E
	JMP.w CODE_84DF5A

CODE_84E083:
	AND.b #$20
	STA.b $16
	LDA.w $0000,x
	INX
	STX.b $10
	STA.b $04
	STZ.b $05
	STZ.b $06
	REP.b #$20
	LDA.b $0E
	SEC
	SBC.b $04
	STA.b $04
	BRA.b CODE_84E06A

;--------------------------------------------------------------------

CODE_84E09E:
	STX.b $0E
	STY.b $10
	PHB
	SEP.b #$20
	PHA
	REP.b #$20
	PLB
	JSR.w CODE_84E0AE
	PLB
	RTL

CODE_84E0AE:
	LDY.b $0E
	STY.b $00
	STZ.b $0C
	STZ.b $04
	STZ.b $06
	STZ.b $08
	STZ.b $12
	STZ.b $14
	STZ.b $16
CODE_84E0C0:
	SEP.b #$20
	REP.b #$10
	LDX.b $10
	LDA.w $0000,x
	INX
	STX.b $10
	STA.b $04
	CMP.b #$FF
	BEQ.b CODE_84E0FD
	AND.b #$E0
	CMP.b #$E0
	BNE.b CODE_84E100
	LDA.b $04
	ASL
	ASL
	ASL
	AND.b #$E0
	PHA
	REP.b #$20
	LDX.b $10
	LDA.w $0000,x
	STA.b $12
	DEX
	LDA.w $0000,x
	STA.b $13
	INX
	INX
	STX.b $10
	LDA.b $12
	AND.w #$03FF
	SEP.b #$20
	JMP.w CODE_84E10A

CODE_84E0FD:
	REP.b #$30
	RTS

CODE_84E100:
	PHA
	REP.b #$20
	LDA.b $04
	AND.w #$001F
	SEP.b #$20
CODE_84E10A:
	TAY
	INY
	STY.b $14
	PLA
	CMP.b #$00
	BPL.b CODE_84E116
	JMP.w CODE_84E144

CODE_84E116:
	CMP.b #$20
	BEQ.b CODE_84E13B
	CMP.b #$40
	BEQ.b CODE_84E13E
	CMP.b #$60
	BEQ.b CODE_84E141
	LDX.b $10
CODE_84E124:
	LDA.w $0000,x
	LDX.b $0E
	STA.l $7F0000,x
	INX
	STX.b $0E
	LDX.b $10
	INX
	STX.b $10
	DEY
	BNE.b CODE_84E124
	JMP.w CODE_84E0C0

CODE_84E13B:
	JMP.w CODE_84E18B

CODE_84E13E:
	JMP.w CODE_84E1A0

CODE_84E141:
	JMP.w CODE_84E1D3

CODE_84E144:
	CMP.b #$C0
	BCS.b CODE_84E188
	AND.b #$20
	STA.b $16
	REP.b #$21
	LDA.w $0000,x
	ADC.b $00
	STA.b $04
	INX
	INX
	STX.b $10
CODE_84E159:
	SEP.b #$20
	LDY.b $14
CODE_84E15D:
	LDX.b $04
	LDA.l $7F0000,x
	INX
	STX.b $04
	LDA.b $16
	BEQ.b CODE_84E174
	DEX
	LDA.l $7F0000,x
	EOR.b #$FF
	JMP.w CODE_84E179

CODE_84E174:
	DEX
	LDA.l $7F0000,x
CODE_84E179:
	LDX.b $0E
	STA.l $7F0000,x
	INX
	STX.b $0E
	DEY
	BNE.b CODE_84E15D
	JMP.w CODE_84E0C0

CODE_84E188:
	JMP.w CODE_84E1CD

CODE_84E18B:
	LDA.w $0000,x
	INX
	STX.b $10
	LDX.b $0E
CODE_84E193:
	STA.l $7F0000,x
	INX
	DEY
	BNE.b CODE_84E193
	STX.b $0E
	JMP.w CODE_84E0C0

CODE_84E1A0:
	LDA.w $0000,x
	INX
	STA.b $04
	LDA.w $0000,x
	STA.b $06
	INX
	STX.b $10
CODE_84E1AE:
	LDX.b $0E
	LDA.b $04
	STA.l $7F0000,x
	INX
	STX.b $0E
	DEY
	BEQ.b CODE_84E1CA
	LDX.b $0E
	LDA.b $06
	STA.l $7F0000,x
	INX
	STX.b $0E
	DEY
	BNE.b CODE_84E1AE
CODE_84E1CA:
	JMP.w CODE_84E0C0

CODE_84E1CD:
	JMP.w CODE_84E1E9

CODE_84E1D0:
	JMP.w CODE_84E159

CODE_84E1D3:
	LDA.w $0000,x
	INX
	STX.b $10
	LDX.b $0E
CODE_84E1DB:
	STA.l $7F0000,x
	INC
	INX
	DEY
	BNE.b CODE_84E1DB
	STX.b $0E
	JMP.w CODE_84E0C0

CODE_84E1E9:
	AND.b #$20
	STA.b $16
	LDA.w $0000,x
	INX
	STX.b $10
	STA.b $04
	STZ.b $05
	STZ.b $06
	REP.b #$20
	LDA.b $0E
	SEC
	SBC.b $04
	STA.b $04
	BRA.b CODE_84E1D0

;--------------------------------------------------------------------

CODE_84E204:
	SEP.b #$20
	PHB
	PLA
	STA.b $19
	PHB
	LDA.w !ContextDependentTable+$02,x
	PHA
	LDY.w !ContextDependentTable+$03,x
	STY.b $09
	LDA.w !ContextDependentTable+$05,x
	STA.b $0B
	LDY.w !ContextDependentTable,x
	STY.b $06
	LDY.w #$0000
	PLB
	INX
	INX
	INX
	INX
	INX
	INX
	STX.b $17
CODE_84E22A:
	LDA.b [$17]
	BEQ.b CODE_84E23D
	STA.b $02
	STZ.b $03
	INC.b $17
	LDA.b [$17]
	INC.b $17
	JSR.w CODE_84E241
	BRA.b CODE_84E22A

CODE_84E23D:
	PLB
	REP.b #$20
	RTL

CODE_84E241:
	REP.b #$20
	AND.w #$00FF
	ASL
	ASL
	ASL
	ASL
	ADC.b $06
	TAX
CODE_84E24D:
	LDA.w #$0008
	STA.b $0E
CODE_84E252:
	LDA.w !ContextDependentTable,x
	STA.b [$09],y
	INX
	INX
	INY
	INY
	DEC.b $0E
	BNE.b CODE_84E252
	DEC.b $02
	BNE.b CODE_84E24D
	SEP.b #$20
	RTS

DATA_84E266:
	db $00,$80,$7F,$00,$40,$7F,$C0,$00
	db $00,$00,$A0,$7F,$00,$70,$7F,$40
	db $00,$00,$00,$80,$7F,$00,$00,$C0
	db $00,$00,$A0,$7F,$00,$30,$40,$00

;--------------------------------------------------------------------

CODE_84E285:
	RTL

;--------------------------------------------------------------------

CODE_84E286:
	LDY.w #SMK_GFX_Mode7_MarioCircuitTrack
	LDA.w #SMK_GFX_Mode7_MarioCircuitTrack>>16
	LDX.w #$8000
	JSL.l CODE_84E09E
	LDY.w #SMK_GFX_Mode7_GlobalTrackTiles
	LDA.w #SMK_GFX_Mode7_GlobalTrackTiles>>16
	LDX.w #$A000
	JSL.l CODE_84E09E
	PHB
	PHK
	PLB
	PHB
	PHK
	PLB
	LDY.w #$7F4000
	LDA.w #$7F4000>>16
	LDX.w #$6000
	JSR.w CODE_84E2CD
	LDA.w #$0080
	STA.w !REGISTER_VRAMAddressIncrementValue
	LDA.w #$5000
	STA.w !REGISTER_VRAMAddressLo
	LDA.w #$0000
CODE_84E2C2:
	STA.w !REGISTER_WriteToVRAMPortLo
	INC
	CMP.w #$0100
	BNE.b CODE_84E2C2
	PLB
	RTL

CODE_84E2CD:
	PHP
	REP.b #$10
	SEP.b #$20
	STA.b $14
	STY.b $12
	LDA.b #$80
	STA.w !REGISTER_VRAMAddressIncrementValue
	STX.w !REGISTER_VRAMAddressLo
	LDY.w #$0000
CODE_84E2E1:
	LDX.w #$0000
CODE_84E2E4:
	LDA.b #$08
	STA.b $15
CODE_84E2E8:
	LDA.b [$12],y
	LSR
	ROL.w $0C00,x
	LSR
	ROL.w $0C01,x
	LSR
	ROL.w $0C10,x
	LSR
	ROL.w $0C11,x
	LSR
	ROL.w $0C20,x
	LSR
	ROL.w $0C21,x
	LSR
	ROL.w $0C30,x
	LSR
	ROL.w $0C31,x
	INY
	DEC.b $15
	BNE.b CODE_84E2E8
	INX
	INX
	CPX.w #$0010
	BNE.b CODE_84E2E4
	REP.b #$20
	LDX.w #$0000
CODE_84E31B:
	LDA.w $0C00,x
	STA.w !REGISTER_WriteToVRAMPortLo
	INX
	INX
	CPX.w #$0040
	BNE.b CODE_84E31B
	SEP.b #$20
	CPY.w #$4000
	BNE.b CODE_84E2E1
	PLP
	RTS

;--------------------------------------------------------------------

CODE_84E331:
	SEP.b #$20
	LDY.w !ContextDependentTable,x
	STY.b $06
	LDA.w !ContextDependentTable+$02,x
	STA.b $08
	LDY.w !ContextDependentTable+$03,x
	STY.b $09
	LDA.w !ContextDependentTable+$05,x
	STA.b $0B
	REP.b #$20
CODE_84E349:
	LDA.w !ContextDependentTable+$05,x
	AND.w #$FF00
	BEQ.b CODE_84E369
	LSR
	LSR
	LSR
	PHA
	LDA.w !ContextDependentTable+$06,x
	AND.w #$FF00
	LSR
	LSR
	TAY
	PLA
	PHX
	TAX
	JSR.w CODE_84E36A
	PLX
	INX
	INX
	BRA.b CODE_84E349

CODE_84E369:
	RTL

CODE_84E36A:
	LDA.b [$06],y
	STA.b [$09]
	INY
	INY
	INC.b $09
	INC.b $09
	DEX
	BNE.b CODE_84E36A
	RTS

;--------------------------------------------------------------------

CODE_84E378:
	STX.b $06
	STY.b $09
	STA.b $02
	PHB
	LDA.w #$007F
	STA.b $08
	STA.b $0B
	STZ.b $0C
	LDY.w #$0000
	SEP.b #$20
	JSR.w CODE_84E3C7
	REP.b #$20
	PLB
	RTL

CODE_84E394:
	SEP.b #$20
	PHB
	LDY.w $0000,x
	STY.b $06
	LDA.w $0002,x
	STA.b $08
	LDY.w $0003,x
	STY.b $09
	LDA.w $0005,x
	STA.b $0B
	STZ.b $0D
	LDY.w #$0000
CODE_84E3B0:
	LDA.w $0006,x
	BEQ.b CODE_84E3C3
	STA.b $02
	LDA.w $0007,x
	STA.b $0C
	JSR.w CODE_84E3C7
	INX
	INX
	BRA.b CODE_84E3B0

CODE_84E3C3:
	PLB
	REP.b #$20
	RTL

CODE_84E3C7:
	PHX
	PHB
	LDA.b $08
	PHA
	PLB
	REP.b #$20
	LDA.b $0C
	ASL
	ASL
	ASL
	ASL
	ASL
	ADC.b $06
	TAX
	SEP.b #$20
CODE_84E3DB:
	PHY
	LDY.b $0C
	LDA.b [$06],y
	STA.b $04
	PLY
	LDA.b #$20
	STA.b $0E
CODE_84E3E7:
	LDA.w $0100,x
	AND.b #$0F
	BEQ.b CODE_84E3F0
	ORA.b $04
CODE_84E3F0:
	STA.b [$09],y
	INY
	LDA.w $0100,x
	LSR
	LSR
	LSR
	LSR
	BEQ.b CODE_84E3FE
	ORA.b $04
CODE_84E3FE:
	STA.b [$09],y
	INY
	INX
	DEC.b $0E
	BNE.b CODE_84E3E7
	INC.b $0C
	DEC.b $02
	BNE.b CODE_84E3DB
	PLB
	PLX
	RTS

;--------------------------------------------------------------------

CODE_84E40F:
	PHB
	LDA.w $0006,x
	AND.w #$00FF
	STA.b $0C
	ASL
	ASL
	ASL
	ASL
	ASL
	ADC.w $0000,x
	STA.b $06
	SEP.b #$20
	LDA.w $0002,x
	STA.b $08
	LDA.b #$80
	STA.w !REGISTER_VRAMAddressIncrementValue
	LDY.w $0003,x
	STY.w !REGISTER_VRAMAddressLo
	LDA.w $0005,x
	STA.b $02
	JSR.w CODE_84E440
	PLB
	REP.b #$20
	RTL

;--------------------------------------------------------------------

CODE_84E440:
	PHX
	LDY.w #$0100
CODE_84E444:
	PHY
	LDY.b $0C
	LDA.b [$06],y
	STA.b $04
	PLY
	LDX.w #$0020
CODE_84E44F:
	LDA.b [$06],y
	AND.b #$0F
	BEQ.b CODE_84E457
	ORA.b $04
CODE_84E457:
	STA.w !REGISTER_WriteToVRAMPortHi
	LDA.b [$06],y
	LSR
	LSR
	LSR
	LSR
	BEQ.b CODE_84E464
	ORA.b $04
CODE_84E464:
	STA.w !REGISTER_WriteToVRAMPortHi
	INY
	DEX
	BNE.b CODE_84E44F
	INC.b $0C
	DEC.b $02
	BNE.b CODE_84E444
	PLX
	RTS

CODE_84E473:
	PHB
	STA.b $02
	STZ.b $0C
	SEP.b #$20
	LDY.w #$7F0000
	STY.b $06
	LDA.b #$7F0000>>16
	STA.b $08
	LDA.b #$80
	STA.w !REGISTER_VRAMAddressIncrementValue
	STX.w !REGISTER_VRAMAddressLo
	JSR.w CODE_84E440
	PLB
	REP.b #$20
	RTL

;--------------------------------------------------------------------

DATA_84E492:
	db $00,$02,$03,$04,$04,$04,$03,$02
	db $00,$FE,$FD,$FC,$FC,$FC,$FD,$FE
	db $00,$02,$03,$04,$04,$04,$03,$02
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$01,$01,$01,$01
	db $02,$02,$02,$02,$01,$01,$01,$01
	db $00,$FD,$FA,$F7,$F6,$F4,$F4,$F4
	db $F4,$F4,$F4,$F6,$F7,$FA,$FD,$00

DATA_84E4D2:
	db $00,$02,$03,$03,$02,$00,$FE,$FD
	db $FD,$FE,$00,$02,$03,$03,$02,$00
	db $FE,$FD,$FD,$FE,$00,$00,$00,$00
	db $02,$00,$00,$00,$00,$00,$00,$00
	db $00,$01,$01,$01,$02,$02,$02,$02
	db $02,$02,$02,$02,$01,$01,$01,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00

DATA_84E512:
	dw $0030,$0020,$0030,$0030,$0020,$0030,$0020,$0030

DATA_84E522:
	dw $FA00,$FC00,$FA00,$FA00,$FC00,$FA00,$FC00,$FA00

DATA_84E532:
	dw $0100,$FF00

;--------------------------------------------------------------------

CODE_84E536:
	LDA.b $2C
	CMP.w #$0004
	BNE.b CODE_84E57E
	LDA.w $1F24
	BMI.b CODE_84E57E
	LDA.w #$1000
	TRB.w $1F2A
	BEQ.b CODE_84E558
	LDX.w #$7F8000
	LDY.w #$7F6000
	LDA.w #$0BFF
	PHB
	MVN $7F6000>>16,$7F8000>>16
	PLB
CODE_84E558:
	LDA.w $1F2A
	BIT.w #$4000
	BEQ.b CODE_84E57E
	BIT.w #$2000
	BEQ.b CODE_84E56B
	LDA.l $30600D
	BRA.b CODE_84E56F

CODE_84E56B:
	LDA.l $7F600D
CODE_84E56F:
	AND.w #$00FF
	STA.w $0E64
	STA.w $1112
	LDA.w #$FFFF
	STA.w $0E60
CODE_84E57E:
	RTL

;--------------------------------------------------------------------

DATA_84E57F:					; Note: Demo movement data pointers?
	dl DATA_849F60 : db $50
	dl $000000 : db $50
	dl DATA_87FF45 : db $58
	dl DATA_C01F4C : db $60
	dl DATA_C21C93 : db $48
	dl $000000 : db $50
	dl DATA_C21D23 : db $70
	dl DATA_849E90 : db $68
	dl $000000 : db $50
	dl $000000 : db $50

CODE_84E5A7:
	PHB
	PHK
	PLB
	LDA.w $0E32
	BMI.b CODE_84E5BF
	LDA.w $1F20
	ASL
	TAX
	JSR.w (DATA_84E5B9,x)
	PLB
	RTL

DATA_84E5B9:
	dw CODE_84E5DB
	dw CODE_84E5DC
	dw CODE_84E62E

CODE_84E5BF:
	JSR.w CODE_84E67B
	LDA.w #$0002
	STA.w $1F20
	LDA.w #$0001
	STA.l $7F6004
	JSR.w CODE_84E62E
	LDA.w #$0002
	STA.l $7FFF02
	PLB
	RTL

CODE_84E5DB:
	RTS

CODE_84E5DC:
	LDX.w #DATA_84E670
	JSL.l CODE_819587
	LDA.w #$0001
	STA.l $7FFF00
	LDA.w #$0000
	STA.l $7FFF02
	LDA.w #$FFFF
	STA.l $7FFF0C
	STA.l $7FFF0E
	JSR.w CODE_84E964
	SEP.b #$20
	LDA.w $1012
	STA.l $7F600D
	LDA.w !RAM_SMK_Global_RaceCup
	STA.l $7F600E
	LDA.w !RAM_SMK_Global_CurrentRound
	STA.l $7F600F
	REP.b #$20
	LDA.w #$0000
	STA.l $7F6004
	LDA.w #$1234
	STA.l $7F6006
	LDA.w $1F26
	STA.l $7F6008
	RTS

CODE_84E62E:
	LDX.w #DATA_84E670
	JSL.l CODE_819587
	LDA.w #$FFFF
	STA.l $7FFF0C
	STA.l $7FFF0E
	LDA.w #$0002
	STA.l $7FFF00
	LDA.w #$0000
	BIT.w $1F2A
	BPL.b CODE_84E652
	LDA.w #$0002
CODE_84E652:
	STA.l $7FFF02
	LDA.l $7F6004
	BNE.b CODE_84E668
	LDA.w #$4000
	STA.w $0F9E
	LDA.w #DATA_80D210
	STA.w $0FA0
CODE_84E668:
	LDA.l $7F6008
	STA.w $1F26
	RTS

DATA_84E670:
	dw $0000 : dl $7FFF00 : dw $0010

CODE_84E677:
	DEC.w $0FA2
	RTL

CODE_84E67B:
	LDA.w $0E34
	ASL
	ASL
	TAY
	LDX.w #$0000
	JSR.w CODE_84E68E
	INY
	INY
	INY
	INY
	LDX.w #$0600
CODE_84E68E:
	PHY
	LDA.w DATA_84E57F,y
	BEQ.b CODE_84E6AE
	STA.b $00
	LDA.w DATA_84E57F+$02,y
	STA.b $02
	STZ.b $04
	LDY.w #$0000
CODE_84E6A0:
	LDA.b [$00],y
	STA.l $7F6000,x
	INX
	INX
	INY
	INY
	DEC.b $03
	BNE.b CODE_84E6A0
CODE_84E6AE:
	PLY
	RTS

;--------------------------------------------------------------------

CODE_84E6B0:
	LDA.w #$0002
	BRA.b CODE_84E6C4

CODE_84E6B5:
	LDA.w #$0001
	BRA.b CODE_84E6C4

CODE_84E6BA:
	LDA.w $1F20
	BEQ.b CODE_84E6D7
	BIT.w $0162
	BMI.b CODE_84E6D7
CODE_84E6C4:
	LDA.l $7FFF00,x
	TXY
	PHX
	PHB
	PEA.w $7F7F
	PLB
	PLB
	ASL
	TAX
	JSR.w (DATA_84E6D8,x)
	PLB
	PLX
CODE_84E6D7:
	RTL

DATA_84E6D8:
	dw CODE_84E6E2
	dw CODE_84E7C0
	dw CODE_84E6E3

DATA_84E6DE:
	dw $0000,$0600

CODE_84E6E2:
	RTS

CODE_84E6E3:
	TYX
	LDA.l DATA_84E6DE,x
	CLC
	ADC.w #$6018
	STA.b $04
	LDA.b #$00
	BEQ.b CODE_84E727
	PLP
	STA.b $28,x
	STZ.b $20,x
	LDY.w $7FFF04,x
	LDA.w $7FFF08,x
	BEQ.b CODE_84E706
	DEC.w $7FFF08,x
	DEY
	JMP.w CODE_84E791

CODE_84E706:
	LDA.b ($04),y
	INC
	BNE.b CODE_84E70F
	STZ.w $7FFF00,x
	RTS

CODE_84E70F:
	INY
	JSR.w CODE_84E723
	DEY
	LDA.b ($04),y
	AND.w #$01FF
	STA.w $7FFF08,x
	INY
	INY
	TYA
	STA.w $7FFF04,x
	RTS

CODE_84E723:
	SEP.b #$20
	LDA.b ($04),y
CODE_84E727:
	AND.b #$04
	BEQ.b CODE_84E739
	DEY
	DEY
	LDA.b ($04),y
	AND.b #$04
	BNE.b CODE_84E737
	LDA.b #$80
	STA.b $28,x
CODE_84E737:
	INY
	INY
CODE_84E739:
	LDA.b ($04),y
	AND.b #$10
	BEQ.b CODE_84E74F
	DEY
	DEY
	LDA.b ($04),y
	AND.b #$10
	BNE.b CODE_84E74D
	LDA.b #$02
	ORA.b $29,x
	STA.b $29,x
CODE_84E74D:
	INY
	INY
CODE_84E74F:
	LDA.b ($04),y
	AND.b #$08
	BEQ.b CODE_84E765
	DEY
	DEY
	LDA.b ($04),y
	AND.b #$08
	BNE.b CODE_84E763
	LDA.b #$01
	ORA.b $29,x
	STA.b $29,x
CODE_84E763:
	INY
	INY
CODE_84E765:
	LDA.b ($04),y
	AND.b #$80
	BEQ.b CODE_84E77B
	DEY
	DEY
	LDA.b ($04),y
	AND.b #$80
	BNE.b CODE_84E779
	LDA.b #$20
	ORA.b $28,x
	STA.b $28,x
CODE_84E779:
	INY
	INY
CODE_84E77B:
	LDA.b ($04),y
	AND.b #$02
	BEQ.b CODE_84E791
	DEY
	DEY
	LDA.b ($04),y
	AND.b #$02
	BNE.b CODE_84E78F
	LDA.b #$10
	ORA.b $28,x
	STA.b $28,x
CODE_84E78F:
	INY
	INY
CODE_84E791:
	SEP.b #$20
	LDA.b ($04),y
	AND.b #$80
	BEQ.b CODE_84E79D
	LDA.b #$20
	STA.b $20,x
CODE_84E79D:
	LDA.b ($04),y
	AND.b #$02
	BEQ.b CODE_84E7A9
	LDA.b #$10
	ORA.b $20,x
	STA.b $20,x
CODE_84E7A9:
	LDA.b ($04),y
	AND.b #$60
	ASL
	STA.b $21,x
	LDA.b ($04),y
	AND.b #$18
	BEQ.b CODE_84E7BD
	LSR
	LSR
	LSR
	ORA.b $21,x
	STA.b $21,x
CODE_84E7BD:
	REP.b #$20
	RTS

CODE_84E7C0:
	TYX
	LDA.l DATA_84E6DE,x
	CLC
	ADC.w #$6018
	STA.b $04
	LDA.l $001F24
	BIT.w #$0002
	BEQ.b CODE_84E7ED
	AND.w #$FFFD
	STA.l $001F24
	LDY.w $7FFF04,x
	LDA.w $7FFF08,x
	BEQ.b CODE_84E7FC
	DEY
	DEY
	ORA.b ($04),y
	STA.b ($04),y
	INY
	INY
	BRA.b CODE_84E7FC

CODE_84E7ED:
	LDY.w $7FFF04,x
	CPY.w #$05E4
	BCC.b CODE_84E805
	LDA.w #$0000
	STA.l $001F24
CODE_84E7FC:
	LDA.w #$FFFF
	STA.b ($04),y
	STZ.w $7FFF00,x
	RTS

CODE_84E805:
	SEP.b #$20
	STZ.b $00
	LDA.b $20,x
	AND.b #$20
	BEQ.b CODE_84E813
	LDA.b #$80
	STA.b $00
CODE_84E813:
	LDA.b $20,x
	AND.b #$10
	BEQ.b CODE_84E81F
	LDA.b #$02
	ORA.b $00
	STA.b $00
CODE_84E81F:
	LDA.b $21,x
	AND.b #$03
	ASL
	ASL
	ASL
	ORA.b $00
	STA.b $00
	LDA.b $21,x
	AND.b #$C0
	LSR
	ORA.b $00
	STA.b $00
	LDA.b #$00
	BIT.b $28,x
	BPL.b CODE_84E83B
	LDA.b #$04
CODE_84E83B:
	ORA.b $00
	STA.b $00
	CMP.w $7FFF0C,x
	STA.w $7FFF0C,x
	BNE.b CODE_84E856
	REP.b #$20
	LDA.w $7FFF08,x
	INC
	BIT.w #$0200
	BNE.b CODE_84E856
	STA.w $7FFF08,x
	RTS

CODE_84E856:
	SEP.b #$20
	LDY.w $7FFF04,x
	LDA.b #$00
	STA.b ($04),y
	INY
	LDA.b $00
	STA.b ($04),y
	REP.b #$20
	LDA.w $7FFF08,x
	BEQ.b CODE_84E87B
	AND.w #$01FF
	DEY
	DEY
	DEY
	ORA.b ($04),y
	STA.b ($04),y
	STZ.w $7FFF08,x
	INY
	INY
	INY
CODE_84E87B:
	INY
	TYA
	STA.w $7FFF04,x
	RTS

;--------------------------------------------------------------------

CODE_84E881:
	STZ.b $00
	CPX.w #$0002
	BNE.b CODE_84E89E
	LDX.w #$05FA
CODE_84E88B:
	LDA.l $7F6004,x
	STA.l $306004,x
	CLC
	ADC.b $00
	STA.b $00
	DEX
	DEX
	BPL.b CODE_84E88B
	BRA.b CODE_84E8B2

CODE_84E89E:
	LDX.w #$05FA
CODE_84E8A1:
	LDA.l $7F6604,x
	STA.l $306004,x
	CLC
	ADC.b $00
	STA.b $00
	DEX
	DEX
	BPL.b CODE_84E8A1
CODE_84E8B2:
	LDA.b $00
	STA.l $306002
	RTL

;--------------------------------------------------------------------

CODE_84E8B9:
	STZ.b $00
	LDX.w #$05FA
CODE_84E8BE:
	LDA.l $306004,x
	CLC
	ADC.b $00
	STA.b $00
	DEX
	DEX
	BPL.b CODE_84E8BE
	LDA.b $00
	CMP.l $306002
	BNE.b CODE_84E8DE
	LDA.l $306006
	CMP.w #$1234
	BNE.b CODE_84E8DE
	CLC
	RTL

CODE_84E8DE:
	SEC
	RTL

;--------------------------------------------------------------------

CODE_84E8E0:
	LDA.w $0FB6
	BNE.b CODE_84E953
	LDA.w $1F24
	LSR
	BCC.b CODE_84E956
	LDA.l $7F6004
	BNE.b CODE_84E956
	LDA.w $1F2A
	BPL.b CODE_84E928
	AND.w #$00FF
	CMP.w !RAM_SMK_Race_CurrentRacetrack
	BNE.b CODE_84E928
	LDA.w $0E60
	BPL.b CODE_84E928
	SEP.b #$20
	LDA.w $10F6
	CMP.l $7F660C
	BEQ.b CODE_84E912
	BCC.b CODE_84E928
	BCS.b CODE_84E95B					; Note: This will always branch.

CODE_84E912:
	LDA.w $10F4
	CMP.l $7F660B
	BEQ.b CODE_84E91F
	BCC.b CODE_84E928
	BCS.b CODE_84E95B					; Note: This will always branch.

CODE_84E91F:
	LDA.w $10F3
	CMP.l $7F660A
	BCS.b CODE_84E95B
CODE_84E928:
	SEP.b #$20
	LDA.w $10F6
	STA.l $7F600C
	LDA.w $10F4
	STA.l $7F600B
	LDA.w $10F3
	STA.l $7F600A
	REP.b #$20
	LDA.w !RAM_SMK_Race_CurrentRacetrack
	ORA.w #$C000
	STA.w $1F2A
	LDA.w #$0002
	STA.w $0FB0
	REP.b #$20
	RTL

CODE_84E953:
	REP.b #$20
	RTL

CODE_84E956:
	BIT.w $0E60
	BPL.b CODE_84E953
CODE_84E95B:
	REP.b #$20
	LDA.w #$0004
	STA.w $0FB0
	RTL

;--------------------------------------------------------------------

CODE_84E964:
	LDA.w #$4000
	TRB.w $1F2A
	BEQ.b CODE_84E9A0
	LDA.w #$2000
	TRB.w $1F2A
	BEQ.b CODE_84E992
	LDX.w #$306000
	LDY.w #$7F6600
	LDA.w #$05FF
	PHB
	MVN $7F6600>>16,$306000>>16
	PLB
	LDX.w #$306000
	LDY.w #$7F6000
	LDA.w #$05FF
	PHB
	MVN $7F6000>>16,$306000>>16
	PLB
	BRA.b CODE_84E9A0

CODE_84E992:
	LDX.w #$7F6000
	LDY.w #$7F6600
	LDA.w #$05FF
	PHB
	MVN $7F6600>>16,$7F6000>>16
	PLB
CODE_84E9A0:
	BIT.w $1F2A
	BPL.b CODE_84E9AC
	LDA.w #$0002
	STA.l $7FFF02
CODE_84E9AC:
	RTS

;--------------------------------------------------------------------

CODE_84E9AD:
	RTL

;--------------------------------------------------------------------

CODE_84E9AE:
	LDA.w $0E68
	BEQ.b CODE_84E9FA
	LDA.w $1118
	LDX.w #$0C0A
	JSR.w CODE_84E9FB
	LDA.w $1116
	LDX.w #$0C4A
	JSR.w CODE_84E9FB
	LDA.w $111C
	LDX.w #$0C14
	JSR.w CODE_84E9FB
	LDA.w $111A
	LDX.w #$0C54
	JSR.w CODE_84E9FB
	LDA.b $22
	LDX.w #$0C1E
	JSR.w CODE_84E9FB
	LDA.w $11AE
	LDX.w #$0C5E
	JSR.w CODE_84E9FB
	LDA.b $38
	LDX.w #$0C28
	JSR.w CODE_84E9FB
	LDA.l $7FFF06
	LDX.w #$0C68
	JSR.w CODE_84E9FB
CODE_84E9FA:
	RTL

CODE_84E9FB:
	PHA
	JSR.w CODE_84EA01
	PLA
	XBA
CODE_84EA01:
	PHA
	JSR.w CODE_84EA0A
	PLA
	LSR
	LSR
	LSR
	LSR
CODE_84EA0A:
	SEP.b #$20
	AND.b #$0F
	ORA.b #$A0
	STA.b $00,x
	REP.b #$20
	DEX
	DEX
	RTS

;--------------------------------------------------------------------

CODE_84EA17:
	PHB
	PHK
	PLB
	LDY.w #DATA_85E770
	LDA.w #DATA_85E770>>16
	LDX.w #$7FE580
	JSL.l CODE_84E09E
	SEP.b #$30
	LDA.b #$A0
	STA.w !REGISTER_ObjectAndColorWindowSettings
	LDA.b #$FF
	STA.w !REGISTER_BG1And2WindowMaskSettings
	STA.w !REGISTER_BG3And4WindowMaskSettings
	LDA.b #$A0
	STA.w $0108
	STA.w $0109
	LDA.b #$00
	STA.w $014E
	STA.w $014F
	LDA.b #$10
	STA.w $017A
	STA.w $017B
	LDA.b #$00
	STA.w !REGISTER_BGWindowLogicSettings
	STA.w !REGISTER_ColorAndObjectWindowLogicSettings
	STZ.w !REGISTER_SubScreenLayers
	STZ.w !REGISTER_MainScreenWindowMask
	STZ.w !REGISTER_SubScreenWindowMask
	LDA.b #$44
	STA.w HDMA[$07].Parameters
	LDA.b #!REGISTER_Window1LeftPositionDesignation
	STA.w HDMA[$07].Destination
	LDA.b #$7FE500
	STA.w HDMA[$07].SourceLo
	LDA.b #$7FE500>>8
	STA.w HDMA[$07].SourceHi
	LDA.b #$7FE500>>16
	STA.w HDMA[$07].SourceBank
	LDA.b #$7F0000
	STA.w HDMA[$07].IndirectSourceLo
	STA.w HDMA[$07].IndirectSourceHi
	LDA.b #$7F0000>>16
	STA.w HDMA[$07].IndirectSourceBank
	REP.b #$30
	PHB
	LDX.w #DATA_84EB72
	LDY.w #$7FE524
	LDA.w #$0003
	MVN $7FE524>>16,DATA_84EB72>>16
	LDX.w #DATA_84EB76
	LDY.w #$7FE528
	LDA.w #$0003
	MVN $7FE528>>16,DATA_84EB76>>16
	LDX.w #DATA_84EB7A
	LDY.w #$7FE550
	LDA.w #$0003
	MVN $7FE550>>16,DATA_84EB7A>>16
	LDX.w #DATA_84EB82
	LDY.w #$7FE500
	LDA.w #$0019
	MVN $7FE500>>16,DATA_84EB82>>16
	PLB
	LDA.w #$0000
	STA.l $7FE530
	STA.l $7FE53C
	STA.l $7FE540
	LDA.b $B6
	LSR
	TAX
	LDA.w DATA_84EB4C,x
	AND.w #$00FF
	STA.w $1E88
	LDA.w DATA_84EB53,x
	AND.w #$00FF
	STA.w $1E8A
	LDY.w $0D6E
	LDA.w DATA_84EB60,y
	STA.w $016C
	LDA.w DATA_84EB66,y
	STA.w $016E
	LDA.w DATA_84EB6C,y
	STA.w $0170
	LDA.w DATA_84EB5A,y
	STA.w $016A
	LDY.w #$0004
	LDA.w $1E96
	BPL.b CODE_84EB04
	STY.w $1E88
CODE_84EB04:
	LDA.w $1E98
	BPL.b CODE_84EB0C
	STY.w $1E8A
CODE_84EB0C:
	LDA.w $0E50
	BEQ.b CODE_84EB4A
	LDA.w #$001A
	STA.w $1E88
	LDA.w #$001C
	STA.w $1E8A
	LDY.w #$0001
CODE_84EB20:
	SEP.b #$20
	LDA.b #$00
	STA.w $017A,y
	LDA.b #$BF
	STA.w $016A,y
	LDA.b #$FF
	STA.w $016C,y
	STA.w $016E,y
	STA.w $0170,y
	LDA.b #$AF
	STA.w $0108,y
	LDA.b #$11
	STA.w $014E,y
	REP.b #$20
	DEY
	BPL.b CODE_84EB20
	JSL.l CODE_84ECC0
CODE_84EB4A:
	PLB
	RTL

DATA_84EB4C:
	db $00,$00,$12,$00,$0C,$12,$0C

DATA_84EB53:
	db $00,$12,$00,$00,$12,$0C,$0C

DATA_84EB5A:
	dw $3D3D,$BDBD,$3D3D

DATA_84EB60:
	dw $2E2E,$2424,$2E2E

DATA_84EB66:
	dw $4E4E,$4444,$4E4E

DATA_84EB6C:
	dw $8E8E,$8484,$8E8E

DATA_84EB72:
	dw $2021,$2021

DATA_84EB76:
	dw $FF00,$FF00

DATA_84EB7A:
	dw $EB15,$EB15,$1400,$FFEC

DATA_84EB82:
	db $24,$24,$E5

DATA_84EB85:
	db $2C,$24,$E5

DATA_84EB88:
	db $14,$24,$E5

DATA_84EB8B:
	db $0E,$24,$E5,$22,$24,$E5,$2C,$24
	db $E5,$14,$24,$E5,$04,$24,$E5,$00

DATA_84EB9B:
	db $24,$22

CODE_84EB9D:
	LDA.w $0E52
	BIT.w #$0002
	BNE.b CODE_84EBCE
	BEQ.b CODE_84EBAF			; Note: This will always branch.

CODE_84EBA7:
	LDA.w $0E52
	BIT.w #$0002
	BEQ.b CODE_84EBCE
CODE_84EBAF:
	SEP.b #$20
	LDA.b #$AF
	STA.w $016A,y
	LDA.b #$00
	STA.w $017A,y
	LDA.b #$AF
	LDX.w $0E54
	BEQ.b CODE_84EBC8
	CMP.b #$FF
	BCS.b CODE_84EBC8
	LDA.b #$A0
CODE_84EBC8:
	STA.w $0108,y
	REP.b #$20
	RTS

CODE_84EBCE:
	LDA.w #$00BF
	STA.w $016A,y
	LDA.w #$00AF
	STA.w $0108,y
	LDA.w $0E54
	CMP.w #$0FC0
	BCS.b CODE_84EBF6
	CMP.w #$003F
	BCC.b CODE_84EBEC
	LDA.w #$0000
	BRA.b CODE_84EC02

CODE_84EBEC:
	SEP.b #$20
	EOR.b #$3F
	INC
	INC
	REP.b #$20
	BRA.b CODE_84EC02

CODE_84EBF6:
	CMP.w #$1000
	BCC.b CODE_84EBFE
	LDA.w #$1001
CODE_84EBFE:
	SEC
	SBC.w #$0FC0
CODE_84EC02:
	STA.l $7FE560
	SEP.b #$20
	LDA.b #$20
	STA.w $017A,y
	LDA.l $7FE560
	CMP.b #$40
	BCC.b CODE_84EC1C
	LDA.b #$00
	STA.w $017A,y
	LDA.b #$3F
CODE_84EC1C:
	STA.l $7FE560
	LDA.l $7FE560
	SEC
	SBC.b #$0D
	BPL.b CODE_84EC2B
	LDA.b #$00
CODE_84EC2B:
	STA.b $0A
	LDX.b $04
	LDA.w DATA_84EC96,y
	STA.l $7FE500,x
	LDA.b $0A
	INC
	STA.l $7FE503,x
	LDA.b $0A
	ASL
	EOR.b #$FF
	SEC
	ADC.b #$66
	STA.l $7FE506,x
	CLC
	LDA.b $0A
	ADC.w DATA_84EC98,y
	STA.l $7FE509,x
	REP.b #$20
	LDA.w #$E524
	STA.l $7FE501,x
	STA.l $7FE504,x
	STA.l $7FE50A,x
	LDY.w $0E54
	CPY.w #$0002
	BCC.b CODE_84EC74
	CPY.w #$1000
	BCS.b CODE_84EC74
	LDA.w #$E558
CODE_84EC74:
	STA.l $7FE507,x
	SEP.b #$20
	LDA.l $7FE560
	INC
	ASL
	STA.l $7FE558
	STA.l $7FE55A
	EOR.b #$FF
	INC
	STA.l $7FE559
	STA.l $7FE55B
	REP.b #$20
	RTS

DATA_84EC96:
	db $03,$05

DATA_84EC98:
	db $08,$02

;--------------------------------------------------------------------

DATA_84EC9A:
	dw CODE_84EEEB
	dw CODE_84EF8C
	dw CODE_84EE5A
	dw CODE_84ED91
	dw CODE_84EE3F
	dw CODE_84EE51
	dw CODE_84ED91
	dw CODE_84EE3F
	dw CODE_84EDC7
	dw CODE_84ED40
	dw CODE_84EF5C
	dw CODE_84EEBD
	dw CODE_84EEBC
	dw CODE_84EBA7
	dw CODE_84EB9D

DATA_84ECB8:
	dw $0024,$0022

DATA_84ECBC:
	dw $0029,$0027

CODE_84ECC0:
	PHB
	PHK
	PLB
	LDA.w $0FA2
	BEQ.b CODE_84ECF5
	LDA.w $0F9E
	BEQ.b CODE_84ECE7
	LDA.b $20
	BIT.w #$0020
	BEQ.b CODE_84ECD9
	LDY.w #$FF00
	BRA.b CODE_84ECE1

CODE_84ECD9:
	BIT.w #$0010
	BEQ.b CODE_84ECE7
	LDY.w #$0100
CODE_84ECE1:
	TYA
	CLC
	ADC.b $94
	STA.b $94
CODE_84ECE7:
	LDX.w #$0000
	JSL.l CODE_84E6BA
	LDX.w #$0002
	JSL.l CODE_84E6BA
CODE_84ECF5:
	LDA.b $2C
	BNE.b CODE_84ED13
	LDA.w $0154
	BNE.b CODE_84ED06
	STZ.b $20
	LDA.w #$00C0
	TSB.w $00AC
CODE_84ED06:
	LDA.w $0156
	BNE.b CODE_84ED13
	STZ.b $22
	LDA.w #$00C0
	TSB.w $00AE
CODE_84ED13:
	LDA.w #CODE_81F586
	STA.w $0FDC
	STZ.b $02
	LDY.w #$0000
	STZ.b $04
	LDX.w $1E88
	JSR.w (DATA_84EC9A,x)
	LDA.w #CODE_81F595
	STA.w $0FDC
	LDA.w #$0002
	STA.b $02
	LSR
	TAY
	LDA.w #$000C
	STA.b $04
	LDX.w $1E8A
	JSR.w (DATA_84EC9A,x)
	PLB
	RTL

;--------------------------------------------------------------------

CODE_84ED40:
	STZ.w $0D52
	LDX.b $02
	LDA.w $0174
	CMP.w #$0002
	BNE.b CODE_84ED55
	LDA.w #$0010
	STA.w $1E88,x
	BRA.b CODE_84ED84

CODE_84ED55:
	LDX.b $04
	LDA.w $0D50
	BEQ.b CODE_84ED84
	CMP.w #$0008
	BCC.b CODE_84ED65
	JSR.w CODE_84EDB3
	RTS

CODE_84ED65:
	LDA.w #$E528
	STA.l $7FE501,x
	STA.l $7FE504,x
	STA.l $7FE507,x
	STA.l $7FE50A,x
	SEP.b #$20
	LDA.b #$10
	STA.w $014E,y
	LDA.b #$30
	STA.w $017A,y
CODE_84ED84:
	SEP.b #$20
	LDA.b #$FB
	STA.w $0108,y
	REP.b #$20
	INC.w $0D50
	RTS

;--------------------------------------------------------------------

CODE_84ED91:
	JSR.w CODE_84EDB3
	LDX.b $04
	LDA.w #$E524
	STA.l $7FE501,x
	STA.l $7FE504,x
	STA.l $7FE507,x
	STA.l $7FE50A,x
	SEP.b #$20
	LDA.b #$10
	STA.w $017A,y
	REP.b #$20
	RTS

;--------------------------------------------------------------------

CODE_84EDB3:
	SEP.b #$20
	LDA.b #$A0
	STA.w $0108,y
	LDA.b #$10
	STA.w $014E,y
	LDA.b #$30
	STA.w $017A,y
	REP.b #$20
	RTS

;--------------------------------------------------------------------

CODE_84EDC7:
	LDX.b $02
	LDA.w $0174
	CMP.w #$0006
	BNE.b CODE_84EDD7
	LDA.w #$0012
	STA.w $1E88,x
CODE_84EDD7:
	STZ.w $0D50
	LDX.b $04
	SEP.b #$21
	LDA.w DATA_84EB9B,y
	SBC.b #$10
	STA.l $7FE500,x
	LDA.b #$3C
	STA.l $7FE503,x
	REP.b #$20
	LDA.w #$E524
	STA.l $7FE501,x
	STA.l $7FE507,x
	STA.l $7FE50A,x
	LDA.w #$E550
	STA.l $7FE504,x
	SEP.b #$20
	LDA.w $0D52
	CMP.b #$08
	BCS.b CODE_84EE16
	INC
	STA.w $0D52
	LDA.b #$FB
	BRA.b CODE_84EE18

CODE_84EE16:
	LDA.b #$FF
CODE_84EE18:
	STA.w $0108,y
	LDA.b #$1E
	STA.w $014E,y
	LDA.b #$10
	STA.w $017A,y
	LDA.w $0FD0
	CMP.b #$94
	BCC.b CODE_84EE2C
CODE_84EE2C:
	LDA.b #$AD
	STA.w $016A,y
	LDA.b #$FF
	STA.w $016C,y
	STA.w $016E,y
	STA.w $0170,y
	REP.b #$20
	RTS

;--------------------------------------------------------------------

CODE_84EE3F:
	LDA.w #$E528
	STA.b $00
	SEP.b #$20
	LDX.b $04
	LDA.b #$AD
	STA.w $016A,y
	LDA.b #$1F
	BRA.b CODE_84EE80

CODE_84EE51:
	TYX
	SEP.b #$20
	STZ.w $016A,x
	REP.b #$20
	RTS

CODE_84EE5A:
	LDX.b $04
	LDA.w #$E528
	STA.b $00
	SEP.b #$20
	LDA.b #$AD
	STA.w $016A,y
	LDA.l $7FE530,x
	BNE.b CODE_84EE75
	PHX
	LDX.w #$E524
	STX.b $00
	PLX
CODE_84EE75:
	CMP.b #$48
	BCS.b CODE_84EE7E
	INC
	STA.l $7FE530,x
CODE_84EE7E:
	LSR
	LSR
CODE_84EE80:
	ORA.b #$E0
	STA.w $016C,y
	STA.w $016E,y
	STA.w $0170,y
	LDA.w DATA_84EB82,x
	STA.l $7FE500,x
	LDA.w DATA_84EB85,x
	STA.l $7FE503,x
	LDA.w DATA_84EB88,x
	STA.l $7FE506,x
	LDA.w DATA_84EB8B,x
	STA.l $7FE509,x
	REP.b #$20
	LDA.b $00
	STA.l $7FE501,x
	STA.l $7FE504,x
	STA.l $7FE507,x
	STA.l $7FE50A,x
	RTS

;--------------------------------------------------------------------

CODE_84EEBC:
	RTS

;--------------------------------------------------------------------

CODE_84EEBD:
	STY.b $08
	LDX.b $02
	LDA.w $0F8C,x
	BEQ.b CODE_84EEEA
	DEC
	STA.w $0F8C,x
	BNE.b CODE_84EEDE
	LDA.w #$0000
	STA.w $1E88,x
	SEP.b #$20
	LDA.b #$10
	STA.w $017A,y
	REP.b #$20
	JMP.w CODE_84F0F1

CODE_84EEDE:
	JSR.w CODE_84F107
	SEP.b #$20
	LDA.b #$00
	STA.w $017A,x
	REP.b #$20
CODE_84EEEA:
	RTS

;--------------------------------------------------------------------

CODE_84EEEB:
	STY.b $08
	LDX.b $02
	LDY.b $C8,x
	BMI.b CODE_84EF5B
	LDA.w $00C0,y
	CMP.w #$8400
	BCC.b CODE_84EF00
	LDX.b $E6,y
	JSR.w (DATA_84F027,x)
CODE_84EF00:
	LDA.w $0042,y
	BNE.b CODE_84EF1F
	LDA.w $00E6,y
	CMP.w $0040,y
	STA.w $0040,y
	BEQ.b CODE_84EF26
	BCC.b CODE_84EF18
	JSL.l CODE_84D9AB
	BRA.b CODE_84EF1C

CODE_84EF18:
	JSL.l CODE_84D98D
CODE_84EF1C:
	LDA.w #$000B
CODE_84EF1F:
	DEC
	STA.w $0042,y
	JMP.w CODE_84EFA8

CODE_84EF26:
	LDX.b $E6,y
	LDA.w DATA_84EFE7,x
	LDX.b $04
	STA.l $7FE507,x
	SEP.b #$20
	LDA.b #$80
	ORA.l $7FE506,x
	STA.l $7FE506,x
	LDY.b $02
	LDA.w DATA_84ECB8,y
	STA.l $7FE500,x
	LDA.b #$2C
	STA.l $7FE503,x
	LDA.b #$0E
	STA.l $7FE509,x
	REP.b #$20
	LDA.w #$E524
	STA.l $7FE504,x
CODE_84EF5B:
	RTS

;--------------------------------------------------------------------

CODE_84EF5C:
	LDX.b $04
	SEP.b #$20
	LDA.l $7FE530,x
	CMP.b #$48
	BCS.b CODE_84EF6D
	INC
	STA.l $7FE530,x
CODE_84EF6D:
	LSR
	LSR
	ORA.b #$E0
	STA.w $016C,y
	STA.w $016E,y
	STA.w $0170,y
	LDA.b #$AD
	STA.w $016A,y
	LDA.b #$20
	STA.w $017A,y
	REP.b #$20
	LDX.b $02
	LDY.b $C8,x
	BRA.b CODE_84EFA8

CODE_84EF8C:
	STY.b $08
	LDX.b $02
	LDY.b $C8,x
	BMI.b CODE_84EFE6
	LDA.b $2C
	BEQ.b CODE_84EFA3
	LDX.w #$0000
	JSR.w (DATA_84F017,x)
	LDA.w #$0000
	BRA.b CODE_84EFAC

CODE_84EFA3:
	LDX.b $E6,y
	JSR.w (DATA_84F017,x)
CODE_84EFA8:
	LDA.w $00E6,y
	ASL
CODE_84EFAC:
	TAY
	LDA.w DATA_84EFF7,y
	LDX.b $04
	STA.l $7FE504,x
	LDA.w DATA_84EFF9,y
	STA.l $7FE507,x
	SEP.b #$20
	LDY.b $02
	LDA.w DATA_84ECBC,y
	STA.l $7FE500,x
	LDA.b #$AC
	STA.l $7FE503,x
	LDA.b #$94
	STA.l $7FE506,x
	LDA.b #$09
	STA.l $7FE509,x
	LDA.b #$80
	ORA.l $7FE506,x
	STA.l $7FE506,x
	REP.b #$20
CODE_84EFE6:
	RTS

DATA_84EFE7:
	dw $E580,$E5D0,$E620,$E670,$E6C0,$E710,$E760,$E7B0

DATA_84EFF7:
	dw $E800

DATA_84EFF9:
	dw $E8B0,$E900,$E9B0,$EA00,$EAB0,$EB00,$EBB0,$EC00
	dw $ECB0

DATA_84F00B:
	dw $ED00,$EDB0,$EE00,$EEB0,$EF00,$EFB0

;--------------------------------------------------------------------

DATA_84F017:
	dw CODE_84F107
	dw CODE_84F096
	dw CODE_84F096
	dw CODE_84F096
	dw CODE_84F0F1
	dw CODE_84F0F1
	dw CODE_84F0F1
	dw CODE_84F0F1

DATA_84F027:
	dw CODE_84F096
	dw CODE_84F092
	dw CODE_84F096
	dw CODE_84F096
	dw CODE_84F037
	dw CODE_84F037
	dw CODE_84F037
	dw CODE_84F037

CODE_84F037:
	LDX.w $0D6E
	JMP.w (DATA_84F03D,x)

DATA_84F03D:
	dw CODE_84F043
	dw CODE_84F06F
	dw CODE_84F064

CODE_84F043:
	LDX.b $08
	SEP.b #$20
	LDA.w $016C,x
	INC
	INC
	EOR.w $016C,x
	AND.b #$1F
	EOR.w $016C,x
	STA.w $016C,x
	LDA.b #$40
	STA.w $016E,x
	LDA.b #$80
	STA.w $0170,x
	REP.b #$20
	RTS

CODE_84F064:
	LDX.b $08
	SEP.b #$20
	LDA.b #$B7
	STA.w $016A,x
	BRA.b CODE_84F073

CODE_84F06F:
	LDX.b $08
	SEP.b #$20
CODE_84F073:
	LDA.w $016E,x
	INC
	INC
	EOR.w $016E,x
	AND.b #$1F
	EOR.w $016E,x
	STA.w $016E,x
	AND.b #$1E
	ORA.b #$80
	STA.w $0170,x
	LDA.b #$20
	STA.w $016C,x
	REP.b #$20
	RTS

CODE_84F092:
	LDX.b $2C
	BNE.b CODE_84F037
CODE_84F096:
	LDX.w $0D6E
	JMP.w (DATA_84F09C,x)

DATA_84F09C:
	dw CODE_84F0A2
	dw CODE_84F0CE
	dw CODE_84F0C3

CODE_84F0A2:
	LDX.b $08
	SEP.b #$20
	LDA.w $016E,x
	INC
	INC
	EOR.w $016E,x
	AND.b #$1F
	EOR.w $016E,x
	STA.w $016E,x
	LDA.b #$20
	STA.w $016C,x
	LDA.b #$9F
	STA.w $0170,x
	REP.b #$20
	RTS

CODE_84F0C3:
	LDX.b $08
	SEP.b #$20
	LDA.b #$B7
	STA.w $016A,x
	BRA.b CODE_84F0D2

CODE_84F0CE:
	LDX.b $08
	SEP.b #$20
CODE_84F0D2:
	LDA.w $016E,x
	INC
	INC
	EOR.w $016E,x
	AND.b #$1F
	EOR.w $016E,x
	STA.w $016E,x
	AND.b #$1E
	ORA.b #$20
	STA.w $016C,x
	LDA.b #$80
	STA.w $0170,x
	REP.b #$20
	RTS

CODE_84F0F1:
	LDX.b $08
	SEP.b #$20
	LDA.b #$2E
	STA.w $016C,x
	LDA.b #$4E
	STA.w $016E,x
	LDA.b #$8E
	STA.w $0170,x
	REP.b #$20
	RTS

CODE_84F107:
	LDX.b $08
	LDA.w #$0000
	PHY
	SEP.b #$20
	LDA.w $0FC4
	INC
	CMP.b #$18
	BCC.b CODE_84F119
	LDA.b #$00
CODE_84F119:
	STA.w $0FC4
	LSR
	LSR
	TAY
	LDA.w DATA_84F135,y
	STA.w $016C,x
	LDA.w DATA_84F13B,y
	STA.w $016E,x
	LDA.w DATA_84F141,y
	STA.w $0170,x
	REP.b #$20
	PLY
	RTS

DATA_84F135:
	db $32,$32,$20,$20,$20,$32

DATA_84F13B:
	db $40,$52,$52,$52,$40,$40

DATA_84F141:
	db $80,$80,$80,$92,$92,$92

;--------------------------------------------------------------------

CODE_84F147:
	LDA.b $32
	CMP.w #$0010
	BCC.b CODE_84F14F
	RTL

CODE_84F14F:
	PHB
	PHK
	PLB
	LDA.b $2C
	CMP.w #$0004
	BNE.b CODE_84F15B
	PLB
	RTL

CODE_84F15B:
	REP.b #$20
	LDA.w !RAM_SMK_Race_CurrentRacetrack
	XBA
	LSR
	STA.b $11
	LDA.w $0E68
	BEQ.b CODE_84F16F
	LDA.w #$7000
	JMP.w CODE_84F172

CODE_84F16F:
	LDA.w #$D000
CODE_84F172:
	CLC
	ADC.b $11
	STA.b $11
	LDA.w #$0000
	STA.b $0E
	SEP.b #$20
	LDA.b #$7F
	STA.b $10
	LDA.w $0E68
	BEQ.b CODE_84F18C
	LDA.b #$30
	JMP.w CODE_84F18E

CODE_84F18C:
	LDA.b #$85
CODE_84F18E:
	STA.b $13
	STZ.b $00
	STZ.b $01
	STZ.b $02
	STZ.b $03
	LDX.w #$0000
CODE_84F19B:
	STZ.w $1800,x
	INX
	CPX.w #$0020
	BNE.b CODE_84F19B
CODE_84F1A4:
	REP.b #$20
	STZ.b $14
	STZ.b $0C
	STZ.b $04
	STZ.b $06
	LDY.b $00
	INY
	LDA.b [$11],y
	CMP.w #$FFFF
	BEQ.b CODE_84F235
	STA.w $0008
	INY
	SEP.b #$20
	DEY
	DEY
	LDA.b [$11],y
	STA.b $02
	INY
	INY
	INY
	STY.b $00
	REP.b #$30
	LDX.w #$0000
	LDA.b $02
	AND.w #$003F
	ASL
	TAY
	LDA.w DATA_84F23D,y
	TAY
	SEP.b #$20
CODE_84F1DB:
	LDA.w $0000,y
	STA.w $1800,x
	INY
	INX
	CPX.w #$0020
	BNE.b CODE_84F1DB
	REP.b #$20
	LDA.b $02
	AND.w #$00C0
	LSR
	LSR
	LSR
	LSR
	LSR
	TAY
	SEP.b #$20
	LDA.w DATA_84F384,y
	STA.b $04
	INY
	LDA.w DATA_84F384,y
	STA.b $06
	LDX.w #$0000
CODE_84F205:
	LDY.b $08
CODE_84F207:
	LDA.w $1800,x
	CMP.b #$FF
	BEQ.b CODE_84F210
	STA.b [$0E],y
CODE_84F210:
	INY
	INX
	LDA.b $14
	INC
	STA.b $14
	CMP.b $04
	BNE.b CODE_84F207
	STZ.b $14
	LDA.b $0C
	INC
	CMP.b $06
	BEQ.b CODE_84F1A4
	STA.b $0C
	REP.b #$20
	LDA.b $08
	CLC
	ADC.w #$0080
	STA.b $08
	SEP.b #$20
	JMP.w CODE_84F205

CODE_84F235:
	REP.b #$30
	PLB
	JSL.l CODE_81941C
	RTL

DATA_84F23D:
	dw DATA_84F2AD,DATA_84F2B1,DATA_84F2B5,DATA_84F2B9,DATA_84F2BD,DATA_84F2C1,DATA_84F2C5,DATA_84F2C9
	dw DATA_84F2CD,DATA_84F2D1,DATA_84F2D5,DATA_84F2D9,DATA_84F2DD,DATA_84F2DD,DATA_84F2DD,DATA_84F2DD
	dw DATA_84F2E1,DATA_84F2E1,DATA_84F2E1,DATA_84F2E1,DATA_84F2E5,DATA_84F2E5,DATA_84F2E5,DATA_84F2E5
	dw DATA_84F2E8,DATA_84F2E8,DATA_84F2E8,DATA_84F2E8,DATA_84F2EB,DATA_84F2EB,DATA_84F2EB,DATA_84F2EB
	dw DATA_84F304,DATA_84F304,DATA_84F304,DATA_84F304,DATA_84F31D,DATA_84F31D,DATA_84F31D,DATA_84F31D
	dw DATA_84F336,DATA_84F336,DATA_84F336,DATA_84F336,DATA_84F34F,DATA_84F34F,DATA_84F34F,DATA_84F34F
	dw DATA_84F368,DATA_84F368,DATA_84F368,DATA_84F368,DATA_84F381,DATA_84F381,DATA_84F381,DATA_84F381

DATA_84F2AD:
	db $C0,$C1,$C2,$C3

DATA_84F2B1:
	db $C4,$C5,$C6,$C7

DATA_84F2B5:
	db $C8,$C9,$CA,$CB

DATA_84F2B9:
	db $CC,$CD,$CE,$CF

DATA_84F2BD:
	db $D0,$D1,$D2,$D3

DATA_84F2C1:
	db $D4,$D5,$D6,$D7

DATA_84F2C5:
	db $D8,$D9,$DA,$DB

DATA_84F2C9:
	db $DC,$DD,$DE,$DF

DATA_84F2CD:
	db $E0,$E1,$E2,$E3

DATA_84F2D1:
	db $E4,$E5,$E6,$E7

DATA_84F2D5:
	db $E8,$E9,$EA,$EB

DATA_84F2D9:
	db $EC,$ED,$EE,$EF

DATA_84F2DD:
	db $F0,$F1,$F2,$F3

DATA_84F2E1:
	db $FA,$FB,$FC,$FD

DATA_84F2E5:
	db $F4,$F5,$F6

DATA_84F2E8:
	db $F7,$F8,$F9

DATA_84F2EB:
	db $FF,$FF,$FE,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FE,$FF,$FE,$FF,$FE,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FE,$FF
	db $FF

DATA_84F304:
	db $FE,$FF,$FF,$FF,$FE,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FE,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FE,$FF,$FF,$FF
	db $FE

DATA_84F31D:
	db $FF,$FF,$FF,$FF,$FE,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FE,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FE,$FF,$FF,$FF
	db $FF

DATA_84F336:
	db $FE,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FE,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FE

DATA_84F34F:
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FE,$FF,$FE,$FF,$FE,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF

DATA_84F368:
	db $FF,$FF,$FE,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FE,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FE,$FF
	db $FF

DATA_84F381:
	db $FE,$FF,$FF

DATA_84F384:
	db $02,$02,$03,$01,$01,$03,$05,$05

;--------------------------------------------------------------------

CODE_84F38C:
	PHB
	PHK
	PLB
	STZ.w !REGISTER_HDMAEnable
	STZ.w !REGISTER_DMAEnable
	LDA.b #!ScreenDisplayRegister_SetForceBlank|!ScreenDisplayRegister_MinBrightness00
	STA.w !REGISTER_ScreenDisplayRegister
	STZ.w !REGISTER_MainScreenWindowMask
	STZ.w !REGISTER_SubScreenWindowMask
	STZ.w !REGISTER_BG1And2WindowMaskSettings
	STZ.w !REGISTER_BG3And4WindowMaskSettings
	STZ.w !REGISTER_ObjectAndColorWindowSettings
	STZ.w !REGISTER_ColorMathInitialSettings
	STZ.w !REGISTER_ColorMathSelectAndEnable
	LDA.b #$E0
	STA.w !REGISTER_FixedColorData
	LDX.b #$07
CODE_84F3B6:
	STZ.w !REGISTER_BG1HorizScrollOffset,x
	STZ.w !REGISTER_BG1HorizScrollOffset,x
	DEX
	BPL.b CODE_84F3B6
	STZ.w !REGISTER_MosaicSizeAndBGEnable
	STZ.w !REGISTER_InitialScreenSettings
	STZ.w !REGISTER_SubScreenLayers
	REP.b #$30
	LDX.w #$0000
CODE_84F3CD:
	LDA.w #$E0F8
	STA.w $0200,x
	INX
	INX
	CPX.w #$0200
	BNE.b CODE_84F3CD
	SEP.b #$30
	LDX.b #$00
CODE_84F3DE:
	LDA.b #$00
	STA.w $0400,x
	INX
	CPX.b #$20
	BNE.b CODE_84F3DE
	JSR.w CODE_84F3ED
	PLB
	RTL

;--------------------------------------------------------------------

CODE_84F3ED:
	REP.b #$30
	LDX.w #$0000
CODE_84F3F2:
	STZ.w $0060,x
	INX
	INX
	CPX.w #$0040
	BNE.b CODE_84F3F2
	LDX.w #$0000
CODE_84F3FF:
	STZ.w $0180,x
	INX
	INX
	CPX.w #$0080
	BNE.b CODE_84F3FF
	LDX.w #$0000
CODE_84F40C:
	STZ.w $1800,x
	INX
	INX
	CPX.w #$0200
	BNE.b CODE_84F40C
	SEP.b #$30
	RTS

CODE_84F419:
	PHB
	PHK
	PLB
	JSR.w CODE_84F3ED
	PLB
	RTL

;--------------------------------------------------------------------

CODE_84F421:
	REP.b #$30
	LDA.w #$0802
	STA.b $84
	LDA.w #$2713
	STA.b $86
	LDA.w #$2718
	STA.b $88
	LDA.w #$0008
	STA.w $0180
	STA.w $0182
	LDA.w #$0002
	STA.w $0184
	STA.w $0186
	STZ.w $0E66
	LDA.w $10E2
	AND.w #$BFFF
	STA.w $10E2
	LDA.w $11E2
	AND.w #$BFFF
	STA.w $11E2
	RTL

;--------------------------------------------------------------------

CODE_84F45A:
	SEP.b #$30
	LDA.b #!BGModeAndTileSizeSetting_Mode00Enable
	STA.w !REGISTER_BGModeAndTileSizeSetting
	LDA.b #$1F
	STA.w !REGISTER_MainScreenLayers
	LDA.b #$24
	STA.w !REGISTER_BG1AddressAndSize
	LDA.b #$28
	STA.w !REGISTER_BG2AddressAndSize
	LDA.b #$2C
	STA.w !REGISTER_BG3AddressAndSize
	LDA.b #$38
	STA.w !REGISTER_BG4AddressAndSize
	LDA.b #$33
	STA.w !REGISTER_BG1And2TileDataDesignation
	STA.w !REGISTER_BG3And4TileDataDesignation
	LDA.b #!SpriteGFXLocationInVRAMLo_4000|!SpriteGFXLocationInVRAMHi_Add1000|!SpriteSize_8x8_16x16
	STA.w !REGISTER_OAMSizeAndDataAreaDesignation
	LDA.b #$80
	STA.w !REGISTER_VRAMAddressIncrementValue
	RTL

;--------------------------------------------------------------------

CODE_84F48D:
	LDA.b $70
	AND.w #$0003
	BNE.b CODE_84F49B
	LDA.b $98
	CMP.w #$0005
	BEQ.b CODE_84F4A3
CODE_84F49B:
	LDA.w #$1815
	STA.b $9A
	JMP.w CODE_84F4A8

CODE_84F4A3:
	LDA.w #$0802
	STA.b $9A
CODE_84F4A8:
	LDA.w $0E66
	BNE.b CODE_84F4B2
	LDA.w $002E
	BNE.b CODE_84F4DA
CODE_84F4B2:
	LDA.b $72
	AND.w #$0003
	BNE.b CODE_84F4C0
	LDA.b $98
	CMP.w #$0005
	BEQ.b CODE_84F4D5
CODE_84F4C0:
	LDA.w $0E66
	BEQ.b CODE_84F4CD
	LDA.w #$1C4C
	STA.b $9C
	JMP.w CODE_84F4DA

CODE_84F4CD:
	LDA.w #$1C17
	STA.b $9C
	JMP.w CODE_84F4DA

CODE_84F4D5:
	LDA.w #$0802
	STA.b $9C
CODE_84F4DA:
	INC.b $98
	LDA.b $98
	CMP.w #$0006
	BNE.b CODE_84F4E5
	STZ.b $98
CODE_84F4E5:
	RTL

;--------------------------------------------------------------------

CODE_84F4E6:
	LDA.b $2C
	CMP.w #$0004
	BEQ.b CODE_84F562
	CMP.w #$0006
	BEQ.b CODE_84F562
	LDA.w $0020
	AND.w #$4000
	CMP.w #$4000
	BNE.b CODE_84F50A
	LDA.b $6A
	AND.w #$0080
	BEQ.b CODE_84F580
	STZ.w $0190
	JMP.w CODE_84F522

CODE_84F50A:
	LDA.w $0022
	AND.w #$4000
	CMP.w #$4000
	BNE.b CODE_84F580
	LDA.b $6C
	AND.w #$0080
	BEQ.b CODE_84F580
	LDA.w #$0002
	STA.w $0190
CODE_84F522:
	JSL.l CODE_859397
	LDX.b $82
	LDA.b $70,x
	BNE.b CODE_84F580
	LDA.w $0196,x
	BNE.b CODE_84F580
	LDA.w $0190
	BNE.b CODE_84F53C
	LDX.w #$1000
	JMP.w CODE_84F53F

CODE_84F53C:
	LDX.w #$1100
CODE_84F53F:
	LDA.w $00E2,x
	AND.w #$4000
	BNE.b CODE_84F565
	LDA.w $00E2,x
	ORA.w #$4000
	STA.w $00E2,x
	LDX.b $82
	LDA.w #$0001
	STA.w $0192,x
	STA.w $0196,x
	LDA.w #$005D
	JSL.l CODE_81F5A7
CODE_84F562:
	JMP.w CODE_84F580

CODE_84F565:
	LDA.w $00E2,x
	AND.w #$BFFF
	STA.w $00E2,x
	LDX.b $82
	STZ.w $0192,x
	LDA.w #$0001
	STA.w $0196,x
	LDA.w #$005F
	JSL.l CODE_81F5A7
CODE_84F580:
	RTL

;--------------------------------------------------------------------

CODE_84F581:
	LDA.b $2E
	CMP.w #$0004
	BEQ.b CODE_84F58E
	LDY.w #$1000
	JMP.w CODE_84F591

CODE_84F58E:
	LDY.w #$1100
CODE_84F591:
	LDX.w #$0000
	JSR.w CODE_84F5A1
	LDX.w #$0002
	LDY.w #$1100
	JSR.w CODE_84F5A1
	RTL

CODE_84F5A1:
	LDA.w $0196,x
	BEQ.b CODE_84F5F1
	LDA.w $019A,x
	CMP.w #$000D
	BNE.b CODE_84F5CF
	STZ.w $019A,x
	STZ.w $0196,x
	STZ.w $1800,x
	JSR.w CODE_84F613
	LDA.w $00E2,y
	AND.w #$4000
	BNE.b CODE_84F5C7
	STZ.b $92,x
	JMP.w CODE_84F5F1

CODE_84F5C7:
	LDA.w #$0002
	STA.b $92,x
	JMP.w CODE_84F5F1

CODE_84F5CF:
	INC.w $1800,x
	LDA.w $1800,x
	CMP.w #$0006
	BNE.b CODE_84F5F1
	STZ.w $1800,x
	INC.w $019A,x
	JSR.w CODE_84F613
	LDA.b $92,x
	BEQ.b CODE_84F5EC
	STZ.b $92,x
	JMP.w CODE_84F5F1

CODE_84F5EC:
	LDA.w #$0002
	STA.b $92,x
CODE_84F5F1:
	RTS

;--------------------------------------------------------------------

CODE_84F5F2:
	LDX.b $82
	LDA.w $0192,x
	BEQ.b CODE_84F600
	LDX.b $82
	JSR.w CODE_84F613
	STZ.b $92,x
CODE_84F600:
	RTL

CODE_84F601:
	LDX.b $82
	LDA.w $0192,x
	BEQ.b CODE_84F612
	LDX.b $82
	JSR.w CODE_84F613
	LDA.w #$0002
	STA.b $92,x
CODE_84F612:
	RTL

CODE_84F613:
	LDA.b $66,x
	TAX
	LDA.w DATA_85963B,x
	TAX
	RTS

;--------------------------------------------------------------------

CODE_84F61B:
	PHB
	PHK
	PLB
	REP.b #$10
	LDA.b #$00
	STA.w !REGISTER_CGRAMAddress
	LDX.w #$0000
CODE_84F628:
	LDA.l $7FF700,x
	STA.w !REGISTER_WriteToCGRAMPort
	INX
	LDA.l $7FF700,x
	STA.w !REGISTER_WriteToCGRAMPort
	INX
	CPX.w #$0200
	BNE.b CODE_84F628
	REP.b #$30
	LDA.w #$0000
	STA.w !REGISTER_VRAMAddressLo
	LDX.w #$0000
	JSR.w CODE_84FA52
	LDA.w $0030
	BNE.b CODE_84F660
	LDA.w !RAM_SMK_Global_RaceCup
	CMP.w #!Define_SMK_RaceCup_SpecialCup
	BNE.b CODE_84F694
	STZ.w !RAM_SMK_Global_RaceCup
	STZ.b $6E
	JMP.w CODE_84F694

CODE_84F660:
	LDA.w !RAM_SMK_Global_RaceCup
	CMP.w #!Define_SMK_RaceCup_SpecialCup
	BNE.b CODE_84F694
	LDA.l $3067F2
	AND.w #$0003
	CMP.w #$0001
	BNE.b CODE_84F68F
	LDA.l $3067F3
	AND.w #$0003
	CMP.w #$0001
	BNE.b CODE_84F68F
	LDA.l $3067F4
	AND.w #$0003
	CMP.w #$0001
	BNE.b CODE_84F68F
	JMP.w CODE_84F694

CODE_84F68F:
	STZ.w !RAM_SMK_Global_RaceCup
	STZ.b $6E
CODE_84F694:
	LDX.w #$0000
	LDA.w #$2400
	STA.w !REGISTER_VRAMAddressLo
CODE_84F69D:
	LDA.l $7FEF00,x
	CLC
	ADC.w #$F440
	STA.w !REGISTER_WriteToVRAMPortLo
	INX
	INX
	CPX.w #$0800
	BNE.b CODE_84F69D
	LDY.w #$0000
	LDX.w #$0000
	JSR.w CODE_84F97D
	LDY.w #$0000
	LDX.w #$0002
	JSR.w CODE_84F97D
	LDY.w #$0000
	LDX.w #$0004
	JSR.w CODE_84F97D
	LDA.w $0030
	BEQ.b CODE_84F702
	LDA.l $3067F2
	AND.w #$0003
	CMP.w #$0001
	BNE.b CODE_84F6F9
	LDA.l $3067F3
	AND.w #$0003
	CMP.w #$0001
	BNE.b CODE_84F6F9
	LDA.l $3067F4
	AND.w #$0003
	CMP.w #$0001
	BNE.b CODE_84F6F9
	LDY.w #$0000
	JMP.w CODE_84F6FC

CODE_84F6F9:
	LDY.w #$0004
CODE_84F6FC:
	LDX.w #$0006
	JSR.w CODE_84F97D
CODE_84F702:
	LDY.w #$0000
	LDX.w #$0000
	REP.b #$20
CODE_84F70A:
	LDA.w DATA_84F92B,x
	CMP.w #$FFFF
	BEQ.b CODE_84F71D
	STA.w $0200,y
	JSR.w CODE_84FA4D
	INX
	INX
	JMP.w CODE_84F70A

CODE_84F71D:
	JSR.w CODE_84F9FF
	LDA.w $0030
	BNE.b CODE_84F755
	LDX.w #$0000
	LDY.w #$00A0
CODE_84F72B:
	LDA.w DATA_84F825,x
	STA.w $0200,y
	INX
	INX
	JSR.w CODE_84FA4D
	CPY.w #$00AC
	BNE.b CODE_84F72B
	LDX.w #$0000
	LDY.w #$00A2
CODE_84F741:
	PHX
	JSR.w CODE_84FCBD
	JSR.w CODE_84F9EA
	PLX
	INX
	JSR.w CODE_84FA4D
	CPX.w #$0003
	BNE.b CODE_84F741
	JMP.w CODE_84F7A4

CODE_84F755:
	LDY.w #$00A0
	LDX.w #$0000
CODE_84F75B:
	LDA.w DATA_84F82B,x
	STA.w $0200,y
	INX
	INX
	JSR.w CODE_84FA4D
	CPY.w #$00B0
	BNE.b CODE_84F75B
	LDA.w $0030
	CMP.w #$0004
	BEQ.b CODE_84F78D
	LDX.w #$0000
	LDY.w #$00A2
CODE_84F779:
	PHX
	JSR.w CODE_84FCCC
	JSR.w CODE_84F9F1
	PLX
	INX
	JSR.w CODE_84FA4D
	CPX.w #$0004
	BNE.b CODE_84F779
	JMP.w CODE_84F7A4

CODE_84F78D:
	LDX.w #$0000
	LDY.w #$00A2
CODE_84F793:
	PHX
	JSR.w CODE_84FCDB
	JSR.w CODE_84F9F8
	PLX
	INX
	JSR.w CODE_84FA4D
	CPX.w #$0004
	BNE.b CODE_84F793
CODE_84F7A4:
	LDY.w #$0002
	LDA.w !RAM_SMK_Global_RaceCup
	ASL
	TAX
	JSR.w CODE_84F97D
	LDA.w #$1870
	STA.w $0380
	LDA.w #$366A
	STA.w $0382
	LDA.w $0030
	TAX
	LDY.w #$0000
	LDA.w DATA_84F8E9,x
	TAX
CODE_84F7C6:
	LDA.w !ContextDependentTable,x
	INX
	INX
	STA.w $0386,y
	JSR.w CODE_84FA4D
	CMP.w #$00E5
	BEQ.b CODE_84F7D7
	INC
CODE_84F7D7:
	STA.w $0386,y
	JSR.w CODE_84FA4D
	CPY.w #$0050
	BNE.b CODE_84F7C6
	LDY.w #$0000
	LDA.w #$1058
CODE_84F7E8:
	STA.w $0384,y
	PHA
	JSR.w CODE_84FA4D
	CLC
	ADC.w #$0800
	STA.w $0384,y
	PLA
	CLC
	ADC.w #$0008
	JSR.w CODE_84FA4D
	CPY.w #$0050
	BNE.b CODE_84F7E8
	LDX.w #$0000
CODE_84F806:
	LDA.w #$AAAA
	STA.w $0400,x
	INX
	INX
	CPX.w #$0018
	BNE.b CODE_84F806
CODE_84F813:
	STZ.w $0400,x
	INX
	INX
	CPX.w #$0020
	BNE.b CODE_84F813
	PLB
	RTL

DATA_84F81F:
	db $46,$36,$4A,$34,$48,$34

DATA_84F825:
	db $30,$46,$30,$66,$30,$86

DATA_84F82B:
	db $2B,$3F,$2B,$57,$2B,$6F,$2B,$8F

DATA_84F833:
	db $44,$3A,$44,$3C,$44,$38,$44,$0E

DATA_84F83B:
	db $4C,$3A,$4C,$3C,$4C,$38,$4D,$0E

DATA_84F843:
	db $4E,$3A,$4E,$3C,$4E,$38,$4E,$0E

DATA_84F84B:
	db $00,$00,$00,$14,$00,$0C

DATA_84F851:
	db $28,$25,$A8,$25,$28,$26

DATA_84F857:
	db $08,$25,$68,$25,$C8,$25,$48,$26

DATA_84F85F:
	dw DATA_84F867,DATA_84F88B,DATA_84F8AB,DATA_84F8C7

DATA_84F867:
	dw $1498,$14A8,$14A4,$148E,$14A2,$149C,$149C,$1498
	dw $00E5,$1484,$14A8,$149E,$00E5,$14A2,$1480,$1484
	dw $1488,$FFFF

DATA_84F88B:
	dw $148A,$1496,$149C,$14AC,$1488,$14A2,$00E5,$1484
	dw $14A8,$149E,$00E5,$14A2,$1480,$1484,$1488,$FFFF

DATA_84F8AB:
	dw $14A4,$14A6,$1480,$14A2,$00E5,$1484,$14A8,$149E
	dw $00E5,$14A2,$1480,$1484,$1488,$FFFF

DATA_84F8C7:
	dw $14A4,$149E,$1488,$1484,$1490,$1480,$1496,$00E5
	dw $1484,$14A8,$149E,$00E5,$14A2,$1480,$1484,$1488
	dw $FFFF

DATA_84F8E9:
	dw DATA_84F8EF,DATA_84F903,DATA_84F917

DATA_84F8EF:
	dw $00E5,$3712,$3708,$00E5,$00E5,$3684,$3696,$3680
	dw $36A4,$36A4

DATA_84F903:
	dw $370A,$3708,$3708,$00E5,$00E5,$3684,$3696,$3680
	dw $36A4,$36A4

DATA_84F917:
	dw $370A,$3712,$3708,$00E5,$00E5,$3684,$3696,$3680
	dw $36A4,$36A4

DATA_84F92B:
	dw $2818,$2828,$2838,$2848,$2858,$2868,$2878,$2888
	dw $2898,$28A8,$28B8,$28C8,$28D8,$3818,$38D8,$4818
	dw $48D8,$5818,$58D8,$6818,$68D8,$7818,$78D8,$8818
	dw $88D8,$9818,$98D8,$A818,$A828,$A838,$A848,$A858
	dw $A868,$A878,$A888,$A898,$A8A8,$A8B8,$A8C8,$A8D8
	dw $FFFF

CODE_84F97D:
	LDA.w DATA_84F84B,y
	STA.w $0063
	PHX
	LDA.w $0030
	BEQ.b CODE_84F98F
	LDA.w DATA_84F857,x
	JMP.w CODE_84F992

CODE_84F98F:
	LDA.w DATA_84F851,x
CODE_84F992:
	STA.w !REGISTER_VRAMAddressLo
	LDA.w DATA_84F85F,x
	TAX
CODE_84F999:
	LDA.w !ContextDependentTable,x
	CMP.w #$FFFF
	BEQ.b CODE_84F9AD
	SEC
	SBC.w $0063
	STA.w !REGISTER_WriteToVRAMPortLo
	INX
	INX
	JMP.w CODE_84F999

CODE_84F9AD:
	PLX
	LDA.w $0030
	BEQ.b CODE_84F9B9
	LDA.w DATA_84F857,x
	JMP.w CODE_84F9BC

CODE_84F9B9:
	LDA.w DATA_84F851,x
CODE_84F9BC:
	CLC
	ADC.w #$0020
	STA.w !REGISTER_VRAMAddressLo
	LDA.w DATA_84F85F,x
	TAX
CODE_84F9C7:
	LDA.w !ContextDependentTable,x
	CMP.w #$FFFF
	BEQ.b CODE_84F9E1
	CMP.w #$00E5
	BEQ.b CODE_84F9D9
	INC
	SEC
	SBC.w $0063
CODE_84F9D9:
	STA.w !REGISTER_WriteToVRAMPortLo
	INX
	INX
	JMP.w CODE_84F9C7

CODE_84F9E1:
	RTS

CODE_84F9E2:
	PHB
	PHK
	PLB
	JSR.w CODE_84F97D
	PLB
	RTL

CODE_84F9EA:
	LDA.w DATA_84F83B,x
	STA.w $0200,y
	RTS

CODE_84F9F1:
	LDA.w DATA_84F833,x
	STA.w $0200,y
	RTS

CODE_84F9F8:
	LDA.w DATA_84F843,x
	STA.w $0200,y
	RTS

CODE_84F9FF:
	LDA.w !RAM_SMK_Global_RaceCup
	CMP.w #!Define_SMK_RaceCup_SpecialCup
	BEQ.b CODE_84FA21
	LDA.w !RAM_SMK_Global_RaceCup
	ASL
	TAX
	LDA.w DATA_84F81F,x
	LDX.w #$0000
CODE_84FA12:
	STA.w $0202,x
	INX
	INX
	INX
	INX
	CPX.w #$00A0
	BNE.b CODE_84FA12
	JMP.w CODE_84FA4C

CODE_84FA21:
	LDY.w #$0000
	LDX.w #$0004
	STX.b $67
CODE_84FA29:
	LDX.b $67
	LDA.w DATA_84F81F,x
	STA.w $0202,y
	DEC.b $67
	DEC.b $67
	LDA.b $67
	BMI.b CODE_84FA44
CODE_84FA39:
	JSR.w CODE_84FA4D
	CPY.w #$00A0
	BEQ.b CODE_84FA4C
	JMP.w CODE_84FA29

CODE_84FA44:
	LDA.w #$0004
	STA.b $67
	JMP.w CODE_84FA39

CODE_84FA4C:
	RTS

CODE_84FA4D:
	INY
	INY
	INY
	INY
	RTS

CODE_84FA52:
	LDY.w #$0000
CODE_84FA55:
	LDA.l $7FF900,x
	STA.w !REGISTER_WriteToVRAMPortLo
	INX
	INX
	INY
	CPY.w #$0008
	BNE.b CODE_84FA55
	LDY.w #$0000
CODE_84FA67:
	LDA.w #$0000
	STA.w !REGISTER_WriteToVRAMPortLo
	INY
	CPY.w #$0008
	BNE.b CODE_84FA67
	CPX.w #$0600
	BNE.b CODE_84FA52
	RTS

CODE_84FA79:
	PHB
	PHK
	PLB
	JSR.w CODE_84FA52
	PLB
	RTL

CODE_84FA81:
	PHB
	PHK
	PLB
	LDA.b $6A
	ORA.b $6C
	AND.w #$2C00
	CMP.w #$0400
	BEQ.b CODE_84FA9D
	CMP.w #$0800
	BEQ.b CODE_84FAE8
	CMP.w #$2000
	BEQ.b CODE_84FA9D
	JMP.w CODE_84FAFD

CODE_84FA9D:
	LDA.w $0030
	BEQ.b CODE_84FAD7
	LDA.l $3067F2
	AND.w #$0003
	CMP.w #$0001
	BNE.b CODE_84FAD7
	LDA.l $3067F3
	AND.w #$0003
	CMP.w #$0001
	BNE.b CODE_84FAD7
	LDA.l $3067F4
	AND.w #$0003
	CMP.w #$0001
	BNE.b CODE_84FAD7
	LDA.w !RAM_SMK_Global_RaceCup
	STA.b $6E
	INC
	CMP.w #!Define_SMK_RaceCup_SpecialCup+$01
	BEQ.b CODE_84FAFF
	STA.w !RAM_SMK_Global_RaceCup
	JMP.w CODE_84FAF3

CODE_84FAD7:
	LDA.w !RAM_SMK_Global_RaceCup
	STA.b $6E
	INC
	CMP.w #!Define_SMK_RaceCup_StarCup+$01
	BEQ.b CODE_84FAFF
	STA.w !RAM_SMK_Global_RaceCup
	JMP.w CODE_84FAF3

CODE_84FAE8:
	LDA.w !RAM_SMK_Global_RaceCup
	STA.b $6E
	BEQ.b CODE_84FB05
	DEC
	STA.w !RAM_SMK_Global_RaceCup
CODE_84FAF3:
	LDA.w #$002C
	JSL.l CODE_81F5A7
	JSR.w CODE_84F9FF
CODE_84FAFD:
	PLB
	RTL

CODE_84FAFF:
	STZ.w !RAM_SMK_Global_RaceCup					; Note: !Define_SMK_RaceCup_MushroomCup
	JMP.w CODE_84FAF3

CODE_84FB05:
	LDA.w $0030
	BNE.b CODE_84FB13
CODE_84FB0A:
	LDA.w #!Define_SMK_RaceCup_StarCup
	STA.w !RAM_SMK_Global_RaceCup
	JMP.w CODE_84FAF3

CODE_84FB13:
	LDA.l $3067F2
	AND.w #$0003
	CMP.w #$0001
	BNE.b CODE_84FB0A
	LDA.l $3067F3
	AND.w #$0003
	CMP.w #$0001
	BNE.b CODE_84FB0A
	LDA.l $3067F4
	AND.w #$0003
	CMP.w #$0001
	BNE.b CODE_84FB0A
	LDA.w #!Define_SMK_RaceCup_SpecialCup
	STA.w !RAM_SMK_Global_RaceCup
	JMP.w CODE_84FAF3

CODE_84FB40:
	PHB
	PHK
	PLB
	LDA.b $6A
	ORA.b $6C
	AND.w #$9000
	BEQ.b CODE_84FB64
	STZ.w $0158
	LDA.w #$002E
	JSL.l CODE_81F5A7
	LDA.w #$0002
	STA.b $32
	JSL.l CODE_81F4B2
	LDA.w #$8F00
	STA.b $48
CODE_84FB64:
	PLB
	RTL

CODE_84FB66:
	PHB
	PHK
	PLB
	INC.b $65
	LDA.b $65
	CMP.w #$0002
	BNE.b CODE_84FBCB
	STZ.b $65
	LDX.w #$0000
CODE_84FB77:
	LDA.w $0200,x
	CMP.w #$28D8
	BEQ.b CODE_84FBB6
	CMP.w #$A818
	BEQ.b CODE_84FBE0
	AND.w #$FF00
	CMP.w #$2800
	BEQ.b CODE_84FBA4
	CMP.w #$A800
	BEQ.b CODE_84FBCE
	LDA.w $0200,x
	AND.w #$00FF
	CMP.w #$0018
	BEQ.b CODE_84FBE0
	CMP.w #$00D8
	BEQ.b CODE_84FBB6
	JMP.w CODE_84FBEF

CODE_84FBA4:
	LDA.w $0200,x
	CLC
	ADC.w #$0001
	CMP.w #$28D8
	BEQ.b CODE_84FBFA
	STA.w $0200,x
	JMP.w CODE_84FBEF

CODE_84FBB6:
	LDA.w $0200,x
	CLC
	ADC.w #$0100
	CMP.w #$A8D8
	BCS.b CODE_84FC03
	STA.w $0200,x
	JMP.w CODE_84FBEF

CODE_84FBC8:
	JMP.w CODE_84FB77

CODE_84FBCB:
	JMP.w CODE_84FBF8

CODE_84FBCE:
	LDA.w $0200,x
	SEC
	SBC.w #$0001
	CMP.w #$A818
	BCC.b CODE_84FC0C
	STA.w $0200,x
	JMP.w CODE_84FBEF

CODE_84FBE0:
	LDA.w $0200,x
	SEC
	SBC.w #$0100
	CMP.w #$2818
	BCC.b CODE_84FC15
	STA.w $0200,x
CODE_84FBEF:
	INX
	INX
	INX
	INX
	CPX.w #$00A0
	BNE.b CODE_84FBC8
CODE_84FBF8:
	PLB
	RTL

CODE_84FBFA:
	LDA.w #$28D8
	STA.w $0200,x
	JMP.w CODE_84FBEF

CODE_84FC03:
	LDA.w #$A8D8
	STA.w $0200,x
	JMP.w CODE_84FBEF

CODE_84FC0C:
	LDA.w #$A818
	STA.w $0200,x
	JMP.w CODE_84FBEF

CODE_84FC15:
	LDA.w #$2818
	STA.w $0200,x
	JMP.w CODE_84FBEF

CODE_84FC1E:
	PHB
	PHK
	PLB
	LDA.w !RAM_SMK_Global_RaceCup
	TAX
	PHX
	LDA.w $0030
	BEQ.b CODE_84FC3F
	CMP.w #$0004
	BEQ.b CODE_84FC50
	PLX
	PHX
	JSR.w CODE_84FC62
	STA.w $19FC
	PLX
	JSR.w CODE_84FC6F
	JMP.w CODE_84FC60

CODE_84FC3F:
	PLX
	PHX
	JSR.w CODE_84FC62
	ASL
	ASL
	STA.w $19FC
	PLX
	JSR.w CODE_84FC6F
	JMP.w CODE_84FC60

CODE_84FC50:
	PLX
	PHX
	JSR.w CODE_84FC62
	ASL
	ASL
	ASL
	ASL
	STA.w $19FC
	PLX
	JSR.w CODE_84FC6F
CODE_84FC60:
	PLB
	RTL

CODE_84FC62:
	JSL.l CODE_85998A
	TXA
	LSR
	TAX
	SEP.b #$20
	LDA.w CODE_84FE22,x
	RTS

CODE_84FC6F:
	CMP.b #$00
	BEQ.b CODE_84FC94
	LDA.w $0030
	LSR
	TAY
	LDA.l $3067F2,x
	AND.w DATA_84FCB7,y
	BEQ.b CODE_84FC86
	CMP.w $19FC
	BCC.b CODE_84FCB4
CODE_84FC86:
	LDA.l $3067F2,x
	AND.w DATA_84FCBA,y
	ORA.w $19FC
	STA.l $3067F2,x
CODE_84FC94:
	REP.b #$20
	LDA.w #$0000
	STA.l $3067F0
	LDX.w #$0000
CODE_84FCA0:
	LDA.l $3067F2,x
	CLC
	ADC.l $3067F0
	STA.l $3067F0
	INX
	INX
	CPX.w #$0004
	BNE.b CODE_84FCA0
CODE_84FCB4:
	REP.b #$30
	RTS

DATA_84FCB7:
	db $0C,$03,$30

DATA_84FCBA:
	db $33,$3C,$0F

CODE_84FCBD:
	LDA.l $3067F2,x
	AND.w #$00FF
	SEP.b #$20
	AND.b #$0C
	LSR
	JMP.w CODE_84FCE9

CODE_84FCCC:
	LDA.l $3067F2,x
	AND.w #$00FF
	SEP.b #$20
	AND.b #$03
	ASL
	JMP.w CODE_84FCE9

CODE_84FCDB:
	LDA.l $3067F2,x
	AND.w #$00FF
	SEP.b #$20
	AND.b #$30
	LSR
	LSR
	LSR
CODE_84FCE9:
	REP.b #$20
	TAX
	LDA.w DATA_84FE1A,x
	TAX
	RTS

CODE_84FCF1:
	PHB
	PHK
	PLB
	STZ.w $19FE
	LDX.w #$0000
CODE_84FCFA:
	LDA.w $19FE
	CLC
	ADC.l $3067F2,x
	STA.w $19FE
	INX
	INX
	CPX.w #$0004
	BNE.b CODE_84FCFA
	CMP.l $3067F0
	BEQ.b CODE_84FD23
	LDX.w #$0000
	LDA.w #$0000
CODE_84FD18:
	STA.l $3067F0,x
	INX
	INX
	CPX.w #$0006
	BNE.b CODE_84FD18
CODE_84FD23:
	PLB
	RTL

CODE_84FD25:
	PHB
	PHK
	PLB
	LDA.b $7B
	BNE.b CODE_84FD50
	LDA.w $0020
	ORA.w $0022
	CMP.w #$40B0
	BNE.b CODE_84FD4D
	JSL.l CODE_858FD8
	INC.b $7B
	LDX.w #$0000
CODE_84FD40:
	LDA.w DATA_84FDEA,x
	STA.w $03D0,x
	INX
	INX
	CPX.w #$0030
	BNE.b CODE_84FD40
CODE_84FD4D:
	JMP.w CODE_84FDC3

CODE_84FD50:
	LDA.b $6A
	ORA.b $6C
	AND.w #$0300
	CMP.w #$0100
	BEQ.b CODE_84FD6D
	CMP.w #$0200
	BEQ.b CODE_84FD84
	LDA.b $6A
	ORA.b $6C
	AND.w #$9000
	BNE.b CODE_84FD9E
	JMP.w CODE_84FDC3

CODE_84FD6D:
	LDA.b $7B
	DEC
	BEQ.b CODE_84FDC3
	STA.b $7B
	LDA.w #$70B0
	STA.w $03FC
	LDA.w #$002C
	JSL.l CODE_81F5A7
	JMP.w CODE_84FDC3

CODE_84FD84:
	LDA.b $7B
	INC
	CMP.w #$0003
	BEQ.b CODE_84FDC3
	STA.b $7B
	LDA.w #$7088
	STA.w $03FC
	LDA.w #$002C
	JSL.l CODE_81F5A7
	JMP.w CODE_84FDC3

CODE_84FD9E:
	LDA.b $7B
	CMP.w #$0002
	BNE.b CODE_84FDC0
	JSR.w CODE_84FDD7
	LDX.w #$0000
	LDA.w #$0000
CODE_84FDAE:
	STA.l $306000,x
	INX
	INX
	CPX.w #$0800
	BNE.b CODE_84FDAE
	LDA.w #$0029
	JSL.l CODE_81F5A7
CODE_84FDC0:
	JSR.w CODE_84FDC5
CODE_84FDC3:
	PLB
	RTL

CODE_84FDC5:
	LDA.w #$E080
	LDX.w #$0000
CODE_84FDCB:
	STA.w $03D0,x
	INX
	INX
	CPX.w #$0030
	BNE.b CODE_84FDCB
	STZ.b $7B
CODE_84FDD7:
	SEP.b #$20
	LDA.b $85
	AND.b #$06
	CMP.b #$04
	BNE.b CODE_84FDE7
	LDA.b $85
	AND.b #$F9
	STA.b $85
CODE_84FDE7:
	REP.b #$20
	RTS

DATA_84FDEA:
	dw $7030,$380E,$7038,$381B,$7040,$380A,$7048,$381C
	dw $7050,$380E,$7058,$3824,$7090,$3822,$7098,$380E
	dw $70A0,$381C,$70B8,$3817,$70C0,$3818,$70B0,$3AE5

DATA_84FE1A:
	dw $0006,$0004,$0002,$0000

CODE_84FE22:
	dw $0201,$0003,$0000,$0000

;--------------------------------------------------------------------

CODE_84FE2A:
	CPY.w #$0000
CODE_84FE2D:
	BNE.b CODE_84FE3A
	CMP.w #$0100
	BNE.b CODE_84FE3A
	STZ.b $02,x
	STZ.b $04,x
	BRA.b CODE_84FE60

CODE_84FE3A:
	PHA
	SEP.b #$20
	LDA.b #!DSP1_Command04_TrigonometricCalculation
	STA.w !REGISTER_DSP1_DataRegister
	REP.b #$20
	TYA
	STA.w !REGISTER_DSP1_DataRegister
	PLA
	STA.w !REGISTER_DSP1_DataRegister
CODE_84FE4C:
	LDA.l !REGISTER_DSP1_StatusRegister
	BPL.b CODE_84FE4C
	LDA.w !REGISTER_DSP1_DataRegister
	STA.b $02,x
	EOR.w #$FFFF
	INC
	STA.b $04,x
	LDA.w !REGISTER_DSP1_DataRegister
CODE_84FE60:
	STA.b $00,x
	STA.b $06,x
	RTL

;--------------------------------------------------------------------

CODE_84FE65:
	PHB
	PHK
	PLB
	LDX.w #$0000
	LDA.b $8E
	CMP.w #$0260
	BCS.b CODE_84FE77
	JSR.w CODE_84FE94
	PLB
	RTL

CODE_84FE77:
	SEP.b #$20
	LDX.w #$0000
	LDA.b #$00
CODE_84FE7E:
	STA.w $1841,x
	INX
	INX
	CPX.w #$001E
	BNE.b CODE_84FE7E
	REP.b #$20
	PLB
	RTL

CODE_84FE8C:
	PHB
	PHK
	PLB
	JSR.w CODE_84FE94
	PLB
	RTL

;--------------------------------------------------------------------

CODE_84FE94:
	SEP.b #$20
	LDA.b $9E
	CLC
	ADC.w $01FA
	STA.w $01FA
	LDA.w $01FB
	ADC.b #$00
	STA.w $01FC
	LDX.w #$0000
	LDY.w #$0000
CODE_84FEAD:
	LDA.w $1840,x
	SEC
	SBC.w $01FC
	CMP.b #$01
	BCC.b CODE_84FEBE
	STA.w $1840,x
	JMP.w CODE_84FECD

CODE_84FEBE:
	LDA.w $1860,y
	SEC
	SBC.w $01FC
	BCC.b CODE_84FEE6
	STA.w $1860,y
	JMP.w CODE_84FED2

CODE_84FECD:
	LDA.w $1860,y
	BEQ.b CODE_84FEDB
CODE_84FED2:
	CLC
	ADC.w $1840,x
	BCS.b CODE_84FEDB
	STA.w $1841,x
CODE_84FEDB:
	INX
	INX
	INY
	CPY.w #$000F
	BNE.b CODE_84FEAD
	REP.b #$20
	RTS

CODE_84FEE6:
	STZ.w $1841,x
	JMP.w CODE_84FEDB

;--------------------------------------------------------------------

CODE_84FEEC:
	PHB
	PHK
	PLB
	REP.b #$30
	LDA.w #$0A38
	STA.w $008A
	LDA.w #$0001
	STA.w $01A4
	LDA.w #$0001
	STA.w $01B6
	LDA.w #$6040
	STA.w $01B4
	LDA.w #$0080
	STA.b $9E
	LDA.w #$0002
	STA.w $01F4
	LDA.w #$0180
	STA.b $75
	LDA.w #$0160
	STA.b $81
	LDA.w #$0080
	STA.b $73
	LDA.w #$0104
	STA.b $84
	STA.w $0190
	STA.w $0196
	LDA.w #$0018
	STA.w $1900
	LDA.w #$00E0
	STA.w $19C8
	LDA.w #$0006
	STA.w $19CC
	SEP.b #$30
	LDA.b #$00
	STA.w !REGISTER_BG1AddressAndSize
	LDA.b #$64
	STA.w !REGISTER_BG2AddressAndSize
	LDA.b #$6C
	STA.w !REGISTER_BG3AddressAndSize
CODE_84FF51:
	LDA.b #$60
	STA.w !REGISTER_BG1And2TileDataDesignation
	LDA.b #$77
	STA.w !REGISTER_BG3And4TileDataDesignation
	LDA.b #$80
	STA.w !REGISTER_VRAMAddressIncrementValue
	LDA.b #!SpriteGFXLocationInVRAMLo_4000|!SpriteGFXLocationInVRAMHi_Add1000|!SpriteSize_8x8_16x16
	STA.w !REGISTER_OAMSizeAndDataAreaDesignation
	LDA.b #$80
	STA.w !REGISTER_Mode7TilemapSettings
	STZ.w !REGISTER_Mode7MatrixParameterA
	STZ.w !REGISTER_Mode7MatrixParameterB
	STZ.w !REGISTER_Mode7MatrixParameterC
	STZ.w !REGISTER_Mode7MatrixParameterD
	LDA.b #$01
	STA.w !REGISTER_Mode7MatrixParameterA
	STA.w !REGISTER_Mode7MatrixParameterD
CODE_84FF7E:
	STZ.w !REGISTER_Mode7MatrixParameterB
	STZ.w !REGISTER_Mode7MatrixParameterC
	LDA.b #$80
	STA.w !REGISTER_Mode7CenterX
	LDA.b #$01
	STA.w !REGISTER_Mode7CenterX
	STA.w !REGISTER_Mode7CenterY
	LDA.b #$60
	STA.w !REGISTER_Mode7CenterY
	PLB
	RTL

;--------------------------------------------------------------------

CODE_84FF98:
	LDX.w #$0000
	LDA.w #$E010
CODE_84FF9E:
	STA.w $02E0,x
	CLC
	ADC.w #$000A
	INX
	INX
	INX
	INX
	CPX.w #$0060
	BNE.b CODE_84FF9E
	LDX.w #$0000
	LDA.w #$0060
CODE_84FFB4:
	STA.w $1908,x
	CLC
	ADC.w #$0010
	INX
	INX
	CPX.w #$0018
	BNE.b CODE_84FFB4
CODE_84FFC2:
	STA.w $1908,x
	SEC
	SBC.w #$0008
	INX
	INX
	CPX.w #$0030
	BNE.b CODE_84FFC2
	RTL

	%FREE_BYTES(NULLROM, 15, $FF)

;--------------------------------------------------------------------

UNK_C4FFE0:
	dw $0000,$0014,$0008,$0080,$0001,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

%BANK_END(<EndBank>)
endmacro

;#############################################################################################################
;#############################################################################################################

macro SMKBankC5Macros(StartBank, EndBank)
%BANK_START(<StartBank>)

SMK_GFX_Mode7_DonutPlainsTrack:
;$C50000
	incbin "Graphics/Compressed/GFX_Mode7_DonutPlainsTrack.lz5"

SMK_LevelData_MarioCircuit2:
;$C50C45
	incbin "TrackData/MarioCircuit2.lz5"

SMK_GFX_Mode7_KoopaBeachTrack:
;$C51636
	incbin "Graphics/Compressed/GFX_Mode7_KoopaBeachTrack.lz5"

	%FREE_BYTES(NULLROM, 61, $FF)

DATA_C52000:
	incbin "Graphics/GFX_Koopa.bin"

;--------------------------------------------------------------------

%HiROMBankSplit()

;--------------------------------------------------------------------

CODE_858000:
	PHB
	PHK
	PLB
	LDY.w #DATA_859059
	JSL.l CODE_81CB98
	STZ.w $1F2A
	STZ.w $0E60
	LDX.w #$1000
CODE_858013:
	STZ.w $00E2,x
	TXA
	CLC
	ADC.w #$0100
	TAX
	CMP.w #$1800
	BNE.b CODE_858013
	SEP.b #$30
	JSL.l CODE_84F38C
	REP.b #$30
	JSL.l CODE_84FCF1
	SEP.b #$30
	JSR.w CODE_8580B9
	JSR.w CODE_85821C
	REP.b #$30
	JSR.w CODE_858F84
	LDA.w #$3800
	STA.b $8C
	STZ.b $8E
	STZ.b $62
	PLB
	RTL

;--------------------------------------------------------------------

CODE_858045:
	PHB
	PHK
	PLB
	JSL.l CODE_81BB70
	JSR.w CODE_8592F9
	LDA.b $7B
	BNE.b CODE_858086
	SEP.b #$30
	JSR.w CODE_8584D8
	LDA.b $80
	AND.b #$07
	ASL
	TAX
	JMP.w (DATA_85839B,x)

CODE_858061:
	JSR.w CODE_8584D1
	REP.b #$30
	LDA.w #$0200
	STA.b $3C
	JSR.w CODE_858B7A
	JSL.l CODE_81CB44
	SEP.b #$30
	JMP.w CODE_858086

CODE_858077:
	JSR.w CODE_858602
	JSR.w CODE_858718
	JMP.w CODE_858086

CODE_858080:
	JSR.w CODE_858602
	JSR.w CODE_858B2C
CODE_858086:
	REP.b #$30
	LDA.b $80
	BNE.b CODE_858099
	JSL.l CODE_84FD25
	LDA.w $0E68
	BEQ.b CODE_858099
	JSL.l $0889A8
CODE_858099:
	PLB
	RTL

;--------------------------------------------------------------------

CODE_85809B:
	PHB
	PHK
	PLB
	SEP.b #$30
	LDA.b $64
	STA.l !REGISTER_BG2HorizScrollOffset
	LDA.b $65
	STA.l !REGISTER_BG2HorizScrollOffset
	LDA.b #$02
	STA.w !REGISTER_HDMAEnable
	REP.b #$30
	JSL.l CODE_81CB35
	PLB
	RTL

;--------------------------------------------------------------------

CODE_8580B9:
	LDA.b #$80
	STA.l $002115
	LDX.b #$00
	JSR.w CODE_858171
	LDX.b #$02
	JSR.w CODE_858171
	LDX.b #$04
	JSR.w CODE_858171
	LDX.b #$06
	JSR.w CODE_858171
	REP.b #$30
	LDA.w #$1C00
	STA.w !REGISTER_VRAMAddressLo
	LDX.w #$0000
	LDA.w #$1C00
CODE_8580E1:
	STA.l $002118
	INX
	INX
	CPX.w #$0800
	BNE.b CODE_8580E1
	LDX.w #$0000
	LDA.w #$00FF
CODE_8580F2:
	STA.w !REGISTER_WriteToVRAMPortLo
	INX
	INX
	CPX.w #$0400
	BNE.b CODE_8580F2
	SEP.b #$20
	LDA.b #$00
	STA.w !REGISTER_CGRAMAddress
	LDY.w #$0000
	LDX.w #$4000
CODE_858109:
	JSR.w CODE_859EC4
	CPY.w #$0200
	BNE.b CODE_858109
	REP.b #$30
	LDA.w #$8054
	STA.w $0300
	LDA.w #$0C9D
	STA.w $0302
	STA.w $0306
	STA.w $030A
	STA.w $030E
	LDY.w #$0000
	LDX.w #$0000
	LDA.w #$8064
	STA.w $0079
	LDA.w #$8064
	JSR.w CODE_8588CB
	LDX.w #$0002
	LDA.w #$9064
	STA.w $0079
	JSR.w CODE_8588CB
	SEP.b #$30
	RTS

;--------------------------------------------------------------------

CODE_858149:
	TAX
CODE_85814A:
	LDA.w !ContextDependentTable,x
	STA.w $0312,y
	LDA.w $0070
	STA.w $0310,y
	CLC
	ADC.w #$0008
	STA.w $0070
	INX
	INX
	JSR.w CODE_85B945
	INC.w $0077
	LDA.w $0077
	CMP.w $008E
	BNE.b CODE_85814A
	STZ.w $0077
	RTS

;--------------------------------------------------------------------

CODE_858171:
	LDA.b #$01
	STA.w DMA[$00].Parameters
	LDA.b #!REGISTER_WriteToVRAMPortLo
	STA.w DMA[$00].Destination
	LDA.w DATA_8581AA,x
	STA.w DMA[$00].SourceLo
	LDA.w DATA_8581AA+$01,x
	STA.w DMA[$00].SourceHi
	LDA.b #$7F0000>>16
	STA.w DMA[$00].SourceBank
	LDA.w DATA_8581D0,x
	STA.w DMA[$00].SizeLo
	LDA.w DATA_8581D0+$01,x
	STA.w DMA[$00].SizeHi
	LDA.w DATA_8581F6,x
	STA.w !REGISTER_VRAMAddressLo
	LDA.w DATA_8581F6+$01,x
	STA.w !REGISTER_VRAMAddressHi
	LDA.b #$01
	STA.w !REGISTER_DMAEnable
	RTS

DATA_8581AA:
	dw $7F0000,$7F2000,$7F2800,$7FA000,$7FC000,$7FC800,$7FD800,$7FEA00
	dw $7F3800,$7F4400,$7FF8C0,$7F0000,$7F3800,$7FC000,$7F0000,$7F4000
	dw $7F3800,$7FA000,$7FA400

DATA_8581D0:
	dw $2000,$0800,$1000,$2000,$0800,$0800,$0800,$0500
	dw $0800,$1000,$0800,$2000,$0800,$3000,$2800,$0800
	dw $0800,$0600,$1800

DATA_8581F6:
	dw $0000,$1000,$1400,$4000,$2400,$2800,$2C00,$3000
	dw $1000,$0000,$0800,$2000,$1C00,$0000,$4000,$6000
	dw $6400,$5800,$0600

;--------------------------------------------------------------------

CODE_85821C:
	LDA.w $0030
	BEQ.b CODE_85823A
	CMP.b #$04
	BEQ.b CODE_85822C
	LDA.b #$02
	STA.b $85
	JMP.w CODE_85823A

CODE_85822C:
	LDA.l $3067F5
	AND.b #$03
	CMP.b #$01
	BNE.b CODE_85823A
	LDA.b #$04
	STA.b $85
CODE_85823A:
	LDA.b $2E
	BNE.b CODE_85825E
	LDA.b $85
	ORA.b #$01
	STA.b $85
	LDA.b $2C
	BEQ.b CODE_858268
	CMP.b #$02
	BEQ.b CODE_858255
	LDA.b $85
	ORA.b #$10
	STA.b $85
	JMP.w CODE_858268

CODE_858255:
	LDA.b $85
	ORA.b #$08
	STA.b $85
	JMP.w CODE_858268

CODE_85825E:
	LDA.b $2C
	BEQ.b CODE_858268
	LDA.b $85
	ORA.b #$20
	STA.b $85
CODE_858268:
	LDA.b $2E
	CMP.b #$02
	BCS.b CODE_858277
	LDA.b #$01
	STA.b $80
	JSR.w CODE_858865
	STZ.b $80
CODE_858277:
	LDA.b #!BGModeAndTileSizeSetting_Mode01Enable
	STA.w !REGISTER_BGModeAndTileSizeSetting
	LDA.b #$17
	STA.w !REGISTER_MainScreenLayers
	LDA.b #$22
	STA.w !REGISTER_BG1And2WindowMaskSettings
	LDA.b #$03
	STA.w !REGISTER_MainScreenWindowMask
	LDA.b #$10
	STA.w !REGISTER_BG1AddressAndSize
	LDA.b #$15
	STA.w !REGISTER_BG2AddressAndSize
	LDA.b #$1C
	STA.w !REGISTER_BG3AddressAndSize
	LDA.b #$00
	STA.w !REGISTER_BG1And2TileDataDesignation
	LDA.b #$22
	STA.w !REGISTER_BG3And4TileDataDesignation
	LDA.b #!SpriteGFXLocationInVRAMLo_4000|!SpriteGFXLocationInVRAMHi_Add1000|!SpriteSize_8x8_16x16
	STA.w !REGISTER_OAMSizeAndDataAreaDesignation
	LDA.b #$80
	STA.w !REGISTER_VRAMAddressIncrementValue
	LDA.b #$41
	STA.w HDMA[$01].Parameters
	LDA.b #!REGISTER_Window1LeftPositionDesignation
	STA.w HDMA[$01].Destination
	LDA.b #$000180
	STA.w HDMA[$01].SourceLo
	LDA.b #$000180>>8
	STA.w HDMA[$01].SourceHi
	LDA.b #$000180>>16
	STA.w HDMA[$01].SourceBank
	LDA.b #$00
	STA.w HDMA[$01].IndirectSourceLo
	STA.w HDMA[$01].IndirectSourceHi
	LDA.b #$85
	STA.w HDMA[$01].IndirectSourceBank
	LDX.b #$00
CODE_8582D6:
	LDA.w DATA_8582E2,x
	STA.w $0180,x
	INX
	CPX.b #$0D
	BNE.b CODE_8582D6
	RTS

DATA_8582E2:
	db $2C,$09,$83,$60,$09,$83,$28,$09
	db $83,$70,$09,$83,$00

;--------------------------------------------------------------------

DATA_8582EF:
	dw $8309,$830B,$830D,$830F,$8311,$8313,$8315,$8317
	dw $8319,$831B,$831D,$831F,$8321,$0001,$817F,$847C
	dw $8878,$8C74,$9070,$946C,$9868,$A060,$A858,$B050
	dw $B848,$BC40

DATA_858323:
	dw DATA_858333,DATA_858333,DATA_85834D,DATA_858333,DATA_858333,DATA_858367,DATA_858381,DATA_85834D

DATA_858333:
	dw $2C00,$2B02,$2A04,$2808,$260C,$2410,$2214,$2018
	dw $1E1C,$1C20,$1A24,$1828,$1828

DATA_85834D:
	dw $3400,$3204,$3008,$2C10,$2A14,$2818,$2420,$2224
	dw $2028,$1C30,$1A34,$1838,$1838

DATA_858367:
	dw $3B00,$3708,$3310,$2F18,$2B20,$2728,$2330,$1F38
	dw $1B40,$1748,$1350,$1254,$1056

DATA_858381:
	dw $3400,$3004,$2C08,$2410,$2018,$1E20,$1C28,$1A30
	dw $1838,$163C,$1440,$1244,$1048

;--------------------------------------------------------------------

DATA_85839B:
	dw CODE_858061
	dw CODE_858077
	dw CODE_858077
	dw CODE_858077
	dw CODE_858077
	dw CODE_858080
	dw CODE_858080

DATA_8583A9:
	dw CODE_858730
	dw CODE_858756
	dw CODE_8587A2
	dw CODE_8587D2

;--------------------------------------------------------------------

DATA_8583B1:
	dw CODE_858893
	dw CODE_858893
	dw CODE_8588DB
	dw CODE_858939
	dw CODE_858986
	dw CODE_8589E2
	dw CODE_8589E2

;--------------------------------------------------------------------

DATA_8583BF:
	dw $0801,$0819,$002F,$0810,$080A,$0816,$080E

DATA_8583CD:
	dw $0A02,$0A19,$002F,$0A10,$0A0A,$0A16,$0A0E

DATA_8583DB:
	dw $0816,$080A,$081B,$0812,$0818,$0814,$080A,$081B
	dw $081D,$002F,$0810,$0819

DATA_8583F3:
	dw $0A16,$0A0A,$0A1D,$0A0C,$0A11,$002F,$0A1B,$0A0A
	dw $0A0C,$0A0E

DATA_858407:
	dw $0C0B,$0C0A,$0C1D,$0C1D,$0C15,$0C0E,$002F,$0C16
	dw $0C18,$0C0D,$0C0E

DATA_85841D:
	dw $0816,$080A,$081B,$0812,$0818,$0814,$080A,$081B
	dw $081D,$002F,$0810,$0819

DATA_858435:
	dw $0A1D,$0A12,$0A16,$0A0E,$002F,$0A1D,$0A1B,$0A12
	dw $0A0A,$0A15

DATA_858449:
	dw $0805,$0800,$082A,$002F,$080C,$0815,$080A,$081C
	dw $081C

DATA_85845B:
	dw $0A01,$0A00,$0A00,$0A2A,$002F,$0A0C,$0A15,$0A0A
	dw $0A1C,$0A1C

DATA_85846F:
	dw $0C01,$0C05,$0C00,$0C2A,$002F,$0C0C,$0C15,$0C0A
	dw $0C1C,$0C1C

DATA_858483:
	dw $A860,$0A12,$A868,$0A1C,$A878,$0A1D,$A880,$0A11
	dw $A888,$0A12,$A890,$0A1C,$A8A0,$0A18,$A8A8,$0A14
	dw $A8B0,$0A24,$B878,$0A22,$B880,$0A0E,$B888,$0A1C
	dw $B8A0,$0A17,$B8A8,$0A18,$B870,$087D,$B890,$487D
	dw $FFFF

;--------------------------------------------------------------------

CODE_8584C5:
	PHB
	PHK
	PLB
	JSL.l CODE_84F38C
	JSR.w CODE_858277
	PLB
	RTL

;--------------------------------------------------------------------

CODE_8584D1:
	REP.b #$20
	INC.b $64
	SEP.b #$20
	RTS

;--------------------------------------------------------------------

CODE_8584D8:
	LDA.b $80
	AND.b #$30
	BNE.b CODE_8584EE
	LDA.b $6B
	ORA.b $6D
	AND.b #$90
	BNE.b CODE_8584EF
	LDA.b $6A
	ORA.b $6C
	AND.b #$40
	BNE.b CODE_85850B
CODE_8584EE:
	RTS

CODE_8584EF:
	LDA.b $85
	AND.b #$01
	BNE.b CODE_858521
	LDA.b $6D
	AND.b #$90
	BEQ.b CODE_858521
	LDA.b $80
	BEQ.b CODE_858521
	CMP.b #$01
	BEQ.b CODE_85850E
	LDA.w $007D
	BEQ.b CODE_8584EE
	JMP.w CODE_858521

CODE_85850B:
	JMP.w CODE_858586

CODE_85850E:
	LDA.w $007D
	CMP.b #$01
	BEQ.b CODE_858521
	LDA.w $0022
	CMP.b #$30
	BNE.b CODE_8584EE
	LDA.b #$01
	STA.w $007D
CODE_858521:
	REP.b #$30
	LDA.w #$0200
	STA.b $3C
	JSR.w CODE_858F84
	JSL.l CODE_81CB44
	SEP.b #$30
	LDA.b $85
	AND.b #$80
	BNE.b CODE_85855A
	REP.b #$30
	LDA.w #$002E
	JSL.l CODE_81F5A7
	SEP.b #$30
	LDA.b $80
	INC
	CMP.b #$06
	BEQ.b CODE_8585A0
	CMP.b #$07
	BEQ.b CODE_8585A0
	CMP.b #$01
	BEQ.b CODE_85857F
	LDA.b $80
	ORA.b #$60
	STA.b $80
	JMP.w CODE_858585

CODE_85855A:
	REP.b #$30
	LDA.w #$002F
	JSL.l CODE_81F5A7
	SEP.b #$30
	LDA.b $85
	AND.b #$7F
	STA.b $85
	LDA.b $80
	CMP.b #$06
	BEQ.b CODE_858578
	LDA.b #$65
	STA.b $80
	JMP.w CODE_858585

CODE_858578:
	LDA.b #$66
	STA.b $80
	JMP.w CODE_858585

CODE_85857F:
	LDA.b $80
	ORA.b #$51
	STA.b $80
CODE_858585:
	RTS

CODE_858586:
	LDA.b $85
	AND.b #$80
	BNE.b CODE_85859F
	LDA.b $80
	BEQ.b CODE_85859F
	ORA.b #$A0
	STA.b $80
	REP.b #$20
	LDA.w #$002F
	JSL.l CODE_81F5A7
	SEP.b #$20
CODE_85859F:
	RTS

CODE_8585A0:
	LDA.b $85
	PHA
	AND.b #$06
	STA.w $0030
	PLA
	PHA
	AND.b #$01
	BEQ.b CODE_8585CC
	STZ.b $2E
	PLA
	AND.b #$18
	BEQ.b CODE_8585C0
	CMP.b #$08
	BEQ.b CODE_8585C5
	LDA.b #$06
	STA.b $2C
	JMP.w CODE_8585E9

CODE_8585C0:
	STZ.b $2C
	JMP.w CODE_8585E9

CODE_8585C5:
	LDA.b #$02
	STA.b $2C
	JMP.w CODE_8585E9

CODE_8585CC:
	PLA
	AND.b #$20
	BNE.b CODE_8585D6
	STZ.b $2C
	JMP.w CODE_8585DA

CODE_8585D6:
	LDA.b #$04
	STA.b $2C
CODE_8585DA:
	LDA.b $6B
	BNE.b CODE_8585E5
	LDA.b #$04
	STA.b $2E
	JMP.w CODE_8585E9

CODE_8585E5:
	LDA.b #$02
	STA.b $2E
CODE_8585E9:
	REP.b #$20
	JSL.l CODE_81F4B2
	SEP.b #$20
	LDA.b #$06
	STA.w $0032
	LDA.b #$8F
	STA.w $0049
	STZ.w $0158
	STZ.w $0159
	RTS

;--------------------------------------------------------------------

CODE_858602:
	LDA.b $80
	AND.b #$30
	CMP.b #$10
	BEQ.b CODE_85860F
	CMP.b #$20
	BEQ.b CODE_85861D
	RTS

CODE_85860F:
	LDA.b $81
	CMP.b #$0C
	BEQ.b CODE_858675
	INC
	STA.b $81
	ASL
	TAX
	JMP.w CODE_858626

CODE_85861D:
	LDA.b $81
	BEQ.b CODE_85867C
	DEC
	STA.b $81
	ASL
	TAX
CODE_858626:
	REP.b #$20
	LDA.w DATA_8582EF,x
	LDX.b #$07
	STA.w $0180,x
	SEP.b #$20
	LDA.b $80
	AND.b #$07
	CMP.b #$04
	BEQ.b CODE_858661
CODE_85863A:
	ASL
	TAX
	REP.b #$30
	LDA.b $81
	ASL
	CLC
	ADC.w DATA_858323,x
	TAX
	PHX
	SEP.b #$20
	LDA.w !ContextDependentTable,x
	SEP.b #$10
	LDX.b #$06
	STA.w $0180,x
	REP.b #$10
	PLX
	LDA.w !ContextDependentTable+$01,x
	SEP.b #$10
	LDX.b #$00
	STA.w $0180,x
	RTS

CODE_858661:
	LDA.l $3067F5
	AND.b #$03
	CMP.b #$01
	BNE.b CODE_858670
	LDA.b #$07
	JMP.w CODE_85863A

CODE_858670:
	LDA.b #$04
	JMP.w CODE_85863A

CODE_858675:
	LDA.b $80
	AND.b #$07
	STA.b $80
	RTS

CODE_85867C:
	LDA.b $80
	PHA
	AND.b #$07
	BEQ.b CODE_858675
	ORA.b #$10
	STA.b $80
	PLA
	AND.b #$C0
	CMP.b #$40
	BEQ.b CODE_8586C9
	LDA.b $80
	DEC
	AND.b #$17
	STA.b $80
	CMP.b #$10
	BEQ.b CODE_8586C0
	CMP.b #$12
	BEQ.b CODE_8586BB
	CMP.b #$13
	BEQ.b CODE_8586A8
	CMP.b #$15
	BEQ.b CODE_8586B1
	JMP.w CODE_858712

CODE_8586A8:
	LDA.b $85
	AND.b #$01
	BEQ.b CODE_858712
	JMP.w CODE_8586BB

CODE_8586B1:
	DEC.b $80
	LDA.b $85
	AND.b #$01
	BEQ.b CODE_8586BB
	DEC.b $80
CODE_8586BB:
	DEC.b $80
	JMP.w CODE_858712

CODE_8586C0:
	STZ.w $007D
	JSR.w CODE_858865
	JMP.w CODE_858675

CODE_8586C9:
	LDA.b $80
	INC
	AND.b #$17
	STA.b $80
	CMP.b #$12
	BEQ.b CODE_8586EE
	CMP.b #$13
	BEQ.b CODE_8586F7
	CMP.b #$14
	BEQ.b CODE_8586F7
	CMP.b #$16
	BEQ.b CODE_8586E7
	CMP.b #$17
	BEQ.b CODE_8586E7
	JMP.w CODE_858712

CODE_8586E7:
	LDA.b #$11
	STA.b $80
	JMP.w CODE_858712

CODE_8586EE:
	LDA.b $85
	AND.b #$01
	BNE.b CODE_858712
	JMP.w CODE_858710

CODE_8586F7:
	LDA.b $85
	AND.b #$01
	BEQ.b CODE_858708
	INC.b $80
	LDA.b $85
	AND.b #$18
	BEQ.b CODE_858712
	JMP.w CODE_85870E

CODE_858708:
	LDA.b $85
	AND.b #$20
	BEQ.b CODE_858712
CODE_85870E:
	INC.b $80
CODE_858710:
	INC.b $80
CODE_858712:
	LDA.b $80
	JSR.w CODE_858865
	RTS

;--------------------------------------------------------------------

CODE_858718:
	LDA.b $80
	AND.b #$F0
	BNE.b CODE_85872F
	LDA.b $6B
	ORA.b $6D
	AND.b #$2C
	BEQ.b CODE_85872F
	PHA
	LDA.b $80
	DEC
	ASL
	TAX
	JMP.w (DATA_8583A9,x)

CODE_85872F:
	RTS

;--------------------------------------------------------------------

CODE_858730:
	PLA
	CMP.b #$04
	BEQ.b CODE_85873E
	CMP.b #$08
	BEQ.b CODE_85874A
	CMP.b #$20
	BEQ.b CODE_85873E
	RTS

CODE_85873E:
	LDA.b $85
	AND.b #$01
	BNE.b CODE_85874A
	INC.b $85
	JSR.w CODE_858844
	RTS

CODE_85874A:
	LDA.b $85
	AND.b #$01
	BEQ.b CODE_85873E
	DEC.b $85
	JSR.w CODE_858850
	RTS

CODE_858756:
	PLA
	CMP.b #$04
	BEQ.b CODE_858764
	CMP.b #$08
	BEQ.b CODE_858777
	CMP.b #$20
	BEQ.b CODE_858764
	RTS

CODE_858764:
	LDA.b $85
	AND.b #$18
	CMP.b #$10
	BEQ.b CODE_858795
	LDA.b $85
	CLC
	ADC.b #$08
	STA.b $85
	JSR.w CODE_858844
	RTS

CODE_858777:
	LDA.b $85
	AND.b #$18
	BEQ.b CODE_858788
	LDA.b $85
	SEC
	SBC.b #$08
	STA.b $85
	JSR.w CODE_858850
	RTS

CODE_858788:
	LDA.b $85
	ORA.b #$10
	STA.b $85
	JSR.w CODE_858844
	JSR.w CODE_858844
	RTS

CODE_858795:
	LDA.b $85
	AND.b #$E7
	STA.b $85
	JSR.w CODE_858850
	JSR.w CODE_858850
	RTS

CODE_8587A2:
	PLA
	CMP.b #$04
	BEQ.b CODE_8587B0
	CMP.b #$08
	BEQ.b CODE_8587C1
	CMP.b #$20
	BEQ.b CODE_8587B0
	RTS

CODE_8587B0:
	LDA.b $85
	AND.b #$20
	BNE.b CODE_8587C1
	LDA.b $85
	CLC
	ADC.b #$20
	STA.b $85
	JSR.w CODE_858844
	RTS

CODE_8587C1:
	LDA.b $85
	AND.b #$20
	BEQ.b CODE_8587B0
	LDA.b $85
	SEC
	SBC.b #$20
	STA.b $85
	JSR.w CODE_858850
	RTS

CODE_8587D2:
	PLA
	CMP.b #$04
	BEQ.b CODE_8587E0
	CMP.b #$08
	BEQ.b CODE_858806
	CMP.b #$20
	BEQ.b CODE_8587E0
	RTS

CODE_8587E0:
	LDA.l $3067F5
	AND.b #$03
	CMP.b #$01
	BNE.b CODE_8587F5
	LDA.b $85
	AND.b #$06
	CMP.b #$04
	BEQ.b CODE_858837
	JMP.w CODE_8587FB

CODE_8587F5:
	LDA.b $85
	AND.b #$06
	BNE.b CODE_858806
CODE_8587FB:
	LDA.b $85
	CLC
	ADC.b #$02
	STA.b $85
	JSR.w CODE_858844
	RTS

CODE_858806:
	LDA.l $3067F5
	AND.b #$03
	CMP.b #$01
	BNE.b CODE_858819
	LDA.b $85
	AND.b #$06
	BEQ.b CODE_85882A
	JMP.w CODE_85881F

CODE_858819:
	LDA.b $85
	AND.b #$06
	BEQ.b CODE_8587E0
CODE_85881F:
	LDA.b $85
	SEC
	SBC.b #$02
	STA.b $85
	JSR.w CODE_858850
	RTS

CODE_85882A:
	LDA.b $85
	ORA.b #$04
	STA.b $85
	JSR.w CODE_858844
	JSR.w CODE_858844
	RTS

CODE_858837:
	LDA.b $85
	AND.b #$F9
	STA.b $85
	JSR.w CODE_858850
	JSR.w CODE_858850
	RTS

CODE_858844:
	LDA.w $0301
	CLC
	ADC.b #$10
	STA.w $0301
	JMP.w CODE_858859

CODE_858850:
	LDA.w $0301
	SEC
	SBC.b #$10
	STA.w $0301
CODE_858859:
	REP.b #$20
	LDA.w #$002C
	JSL.l CODE_81F5A7
	SEP.b #$20
	RTS

CODE_858865:
	REP.b #$30
	LDY.w #$0000
	LDA.w #$E0F8
CODE_85886D:
	STA.w $0310,y
	INY
	INY
	CPY.w #$00F0
	BNE.b CODE_85886D
	LDY.w #$0000
CODE_85887A:
	STA.w $0300,y
	JSR.w CODE_85B945
	CPY.w #$0010
	BNE.b CODE_85887A
	SEP.b #$30
	LDA.b $80
	AND.b #$07
	ASL
	TAX
	LDA.b $85
	PHA
	JMP.w (DATA_8583B1,x)

CODE_858893:
	LDA.b #$54
	STA.w $0300
	REP.b #$30
	LDY.w #$0000
	LDA.w #$8064
	STA.w $0079
	JSR.w CODE_8588B7
	LDA.w #$9064
	STA.w $0079
	JSR.w CODE_8588C1
	SEP.b #$30
	PLA
	AND.b #$01
	JMP.w CODE_8589E7

CODE_8588B7:
	LDA.w $0079
	LDX.w #$0000
	JSR.w CODE_8588CB
	RTS

CODE_8588C1:
	LDA.w $0079
	LDX.w #$0002
	JSR.w CODE_8588CB
	RTS

CODE_8588CB:
	STA.w $0070
	LDA.w DATA_858AF0,x
	STA.w $008E
	LDA.w DATA_858AEC,x
	JSR.w CODE_858149
	RTS

CODE_8588DB:
	LDA.b #$48
	STA.w $0300
	REP.b #$30
	LDY.w #$0000
	LDA.w #$8058
	STA.w $0079
	JSR.w CODE_85890B
	LDA.w #$9058
	STA.w $0079
	JSR.w CODE_858915
	LDA.w #$A058
	STA.w $0079
	JSR.w CODE_85891F
	SEP.b #$30
	PLA
	AND.b #$18
	LSR
	LSR
	LSR
	JMP.w CODE_8589E7

CODE_85890B:
	LDX.w #$0000
	LDA.w $0079
	JSR.w CODE_858929
	RTS

CODE_858915:
	LDX.w #$0002
	LDA.w $0079
	JSR.w CODE_858929
	RTS

CODE_85891F:
	LDX.w #$0004
	LDA.w $0079
	JSR.w CODE_858929
	RTS

CODE_858929:
	STA.w $0070
	LDA.w DATA_858B06,x
	STA.w $008E
	LDA.w DATA_858B00,x
	JSR.w CODE_858149
	RTS

CODE_858939:
	LDA.b #$48
	STA.w $0300
	REP.b #$30
	LDY.w #$0000
	LDA.w #$8058
	STA.w $0079
	JSR.w CODE_858962
	LDA.w #$9058
	STA.w $0079
	JSR.w CODE_85896C
	SEP.b #$30
	PLA
	AND.b #$20
	LSR
	LSR
	LSR
	LSR
	LSR
	JMP.w CODE_8589E7

CODE_858962:
	LDX.w #$0000
	LDA.w $0079
	JSR.w CODE_858976
	RTS

CODE_85896C:
	LDX.w #$0002
	LDA.w $0079
	JSR.w CODE_858976
	RTS

CODE_858976:
	STA.w $0070
	LDA.w DATA_858B10,x
	STA.w $008E
	LDA.w DATA_858B0C,x
	JSR.w CODE_858149
	RTS

CODE_858986:
	LDA.b #$4C
	STA.w $0300
	REP.b #$30
	LDY.w #$0000
	LDA.w #$805C
	STA.w $0079
	JSR.w CODE_8589B4
	LDA.w #$905C
	STA.w $0079
	JSR.w CODE_8589BE
	LDA.w #$A05C
	STA.w $0079
	JSR.w CODE_8589C8
	SEP.b #$30
	PLA
	AND.b #$06
	LSR
	JMP.w CODE_8589E7

CODE_8589B4:
	LDX.w #$0000
	LDA.w $0079
	JSR.w CODE_8589D2
	RTS

CODE_8589BE:
	LDX.w #$0002
	LDA.w $0079
	JSR.w CODE_8589D2
	RTS

CODE_8589C8:
	LDX.w #$0004
	LDA.w $0079
	JSR.w CODE_8589D2
	RTS

CODE_8589D2:
	STA.w $0070
	LDA.w DATA_858AFA,x
	STA.w $008E
	LDA.w DATA_858AF4,x
	JSR.w CODE_858149
	RTS

;--------------------------------------------------------------------

CODE_8589E2:
	PLA
	JSR.w CODE_8589EF
	RTS

CODE_8589E7:
	TAX
	LDA.w DATA_858B14,x
	STA.w $0301
	RTS

CODE_8589EF:
	LDA.b $85
	AND.b #$01
	ASL
	TAX
	REP.b #$30
	LDY.w #$0000
	LDA.w #$7858
	STA.w $0079
	JSR.w (DATA_858B18,x)
	SEP.b #$30
	LDA.b $85
	AND.b #$01
	BEQ.b CODE_858A20
	LDA.b $85
	AND.b #$18
	LSR
	LSR
	TAX
	REP.b #$30
	LDA.w #$8858
	STA.w $0079
	JSR.w (DATA_858B1C,x)
	JMP.w CODE_858A36

CODE_858A20:
	SEP.b #$30
	LDA.b $85
	AND.b #$20
	LSR
	LSR
	LSR
	LSR
	TAX
	REP.b #$30
	LDA.w #$8858
	STA.w $0079
	JSR.w (DATA_858B22,x)
CODE_858A36:
	SEP.b #$30
	LDA.b $85
	AND.b #$01
	BEQ.b CODE_858A47
	LDA.b $85
	AND.b #$18
	BNE.b CODE_858A5D
	JMP.w CODE_858A4D

CODE_858A47:
	LDA.b $85
	AND.b #$20
	BNE.b CODE_858A5D
CODE_858A4D:
	LDA.b $85
	AND.b #$06
	TAX
	REP.b #$30
	LDA.w #$9858
	STA.w $0079
	JSR.w (DATA_858B26,x)
CODE_858A5D:
	REP.b #$30
	LDY.w #$00B0
	LDX.w #$0000
CODE_858A65:
	LDA.w DATA_858483,x
	CMP.w #$FFFF
	BEQ.b CODE_858A77
	STA.w $0310,y
	INX
	INX
	INY
	INY
	JMP.w CODE_858A65

CODE_858A77:
	SEP.b #$30
	LDY.b #$00
	LDA.b #$08
CODE_858A7D:
	STA.w $0313,y
	JSR.w CODE_85B945
	CPY.b #$B0
	BNE.b CODE_858A7D
	LDA.b $85
	AND.b #$01
	BEQ.b CODE_858A96
	LDA.b $85
	AND.b #$18
	BEQ.b CODE_858AA9
	JMP.w CODE_858A9C

CODE_858A96:
	LDA.b $85
	AND.b #$20
	BEQ.b CODE_858AA9
CODE_858A9C:
	LDA.b #$78
	STA.w $0301
	LDA.b #$88
	STA.w $0305
	JMP.w CODE_858ABB

CODE_858AA9:
	LDA.b #$78
	STA.w $0301
	LDA.b #$88
	STA.w $0305
	LDA.b #$98
	STA.w $0309
	JMP.w CODE_858ADB

CODE_858ABB:
	REP.b #$30
	LDX.w #$0000
	LDY.w #$00B0
CODE_858AC3:
	LDA.w DATA_858483,x
	CMP.w #$FFFF
	BEQ.b CODE_858ADB
	SEC
	SBC.w #$1000
	STA.w $0310,y
	JSR.w CODE_85B945
	JSR.w CODE_85B940
	JMP.w CODE_858AC3

CODE_858ADB:
	SEP.b #$30
	LDX.b #$00
	LDA.b #$48
CODE_858AE1:
	STA.w $0300,x
	JSR.w CODE_85B940
	CPX.b #$10
	BNE.b CODE_858AE1
	RTS

DATA_858AEC:
	dw DATA_8583BF,DATA_8583CD

DATA_858AF0:
	dw $0007,$0007

DATA_858AF4:
	dw DATA_858449,DATA_85845B,DATA_85846F

DATA_858AFA:
	dw $0009,$000A,$000A

DATA_858B00:
	dw DATA_8583DB,DATA_8583F3,DATA_858407

DATA_858B06:
	dw $000C,$000A,$000B

DATA_858B0C:
	dw DATA_85841D,DATA_858435

DATA_858B10:
	dw $000C,$000A

DATA_858B14:
	dw $9080,$78A0

DATA_858B18:
	dw CODE_8588B7
	dw CODE_8588C1

DATA_858B1C:
	dw CODE_85890B
	dw CODE_858915
	dw CODE_85891F

DATA_858B22:
	dw CODE_858962
	dw CODE_85896C

DATA_858B26:
	dw CODE_8589B4
	dw CODE_8589BE
	dw CODE_8589C8

;--------------------------------------------------------------------

CODE_858B2C:
	LDA.b $80
	AND.b #$F0
	BNE.b CODE_858B3E
	LDA.b $6B
	ORA.b $6D
	CMP.b #$02
	BEQ.b CODE_858B3F
	CMP.b #$01
	BEQ.b CODE_858B58
CODE_858B3E:
	RTS

CODE_858B3F:
	LDA.b $85
	AND.b #$80
	BEQ.b CODE_858B3E
	LDA.b $85
	AND.b #$7F
	STA.b $85
	LDA.b #$70
	STA.w $03F8
	LDA.b #$90
	STA.w $03FC
	JMP.w CODE_858B6E

CODE_858B58:
	LDA.b $85
	AND.b #$80
	BNE.b CODE_858B3E
	LDA.b $85
	ORA.b #$80
	STA.b $85
	LDA.b #$98
	STA.w $03F8
	LDA.b #$B0
	STA.w $03FC
CODE_858B6E:
	REP.b #$20
	LDA.w #$002C
	JSL.l CODE_81F5A7
	SEP.b #$20
	RTS

;--------------------------------------------------------------------

CODE_858B7A:
	LDA.w $0048
	BEQ.b CODE_858B80
	RTS

CODE_858B80:
	JSR.w CODE_858EE9
	LDX.w #$1000
	INC.b $40,x
	LDA.b $40,x
	CMP.w #$00D2
	BEQ.b CODE_858BAB
	CMP.w #$01F2
	BEQ.b CODE_858BAB
	CMP.w #$0452
	BEQ.b CODE_858BAB
	CMP.w #$046A
	BEQ.b CODE_858BAB
	CMP.w #$053A
	BEQ.b CODE_858BAB
	CMP.w #$0592
	BEQ.b CODE_858BAB
	JMP.w CODE_858BAD

CODE_858BAB:
	INC.b $42,x
CODE_858BAD:
	LDA.b $42,x
	ASL
	TAX
	JMP.w (DATA_858BB4,x)

DATA_858BB4:
	dw CODE_858C0D
	dw CODE_858BC2
	dw CODE_858BFB
	dw CODE_858BCE
	dw CODE_858BF0
	dw CODE_858BDA
	dw CODE_858BFB

CODE_858BC2:
	LDX.w #$1000
	LDA.w #$0120
	JSR.w CODE_858EE6
	JMP.w CODE_858C0D

CODE_858BCE:
	LDX.w #$1000
	LDA.w #$0200
	JSR.w CODE_858EE6
	JMP.w CODE_858C0D

CODE_858BDA:
	LDX.w #$1000
	LDA.w #$3800
	STA.b $2A,x
	LDA.w #$0300
	JSR.w CODE_858EE6
	LDA.w #$8000
	STA.b $86,x
	JMP.w CODE_858C0D

CODE_858BF0:
	LDX.w #$1000
	STZ.b $22,x
	JSR.w CODE_858F0B
	JMP.w CODE_858C0D

CODE_858BFB:
	LDY.w #$0000
	LDX.w #$1000
	JSR.w CODE_858FB8
	STZ.b $86,x
	LDA.w #$00C0
	STA.b $44,x
	STA.b $1C,x
CODE_858C0D:
	LDX.w #$1100
	INC.b $40,x
	LDA.b $40,x
	CMP.w #$0112
	BEQ.b CODE_858C2B
	CMP.w #$0232
	BEQ.b CODE_858C2B
	CMP.w #$0492
	BEQ.b CODE_858C2B
	CMP.w #$0572
	BEQ.b CODE_858C2B
	JMP.w CODE_858C2D

CODE_858C2B:
	INC.b $42,x
CODE_858C2D:
	LDA.b $42,x
	ASL
	TAX
	JMP.w (DATA_858C34,x)

DATA_858C34:
	dw CODE_858C62
	dw CODE_858C3E
	dw CODE_858C59
	dw CODE_858C3E
	dw CODE_858C4A

CODE_858C3E:
	LDX.w #$1100
	LDA.w #$0120
	JSR.w CODE_858EE6
	JMP.w CODE_858C62

CODE_858C4A:
	LDX.w #$1100
	LDA.w #$FED0
	JSR.w CODE_858EE6
	JSR.w CODE_858F0B
	JMP.w CODE_858C62

CODE_858C59:
	LDX.w #$1100
	LDY.w #$0002
	JSR.w CODE_858FB8
CODE_858C62:
	LDX.w #$1200
	INC.b $40,x
	LDA.b $40,x
	CMP.w #$01F2
	BEQ.b CODE_858C8F
	CMP.w #$0217
	BEQ.b CODE_858C8F
	CMP.w #$0218
	BEQ.b CODE_858C8F
	CMP.w #$023E
	BEQ.b CODE_858C8F
	CMP.w #$0302
	BEQ.b CODE_858C8F
	CMP.w #$04C2
	BEQ.b CODE_858C8F
	CMP.w #$055A
	BEQ.b CODE_858C8F
	JMP.w CODE_858C91

CODE_858C8F:
	INC.b $42,x
CODE_858C91:
	LDA.b $42,x
	ASL
	TAX
	JMP.w (DATA_858C98,x)

DATA_858C98:
	dw CODE_858CF0
	dw CODE_858CA8
	dw CODE_858CCF
	dw CODE_858CD8
	dw CODE_858CDE
	dw CODE_858CE7
	dw CODE_858CB4
	dw CODE_858CC0

CODE_858CA8:
	LDX.w #$1200
	LDA.w #$0140
	JSR.w CODE_858EE6
	JMP.w CODE_858CF0

CODE_858CB4:
	LDX.w #$1200
	LDA.w #$0120
	JSR.w CODE_858EE6
	JMP.w CODE_858CF0

CODE_858CC0:
	LDX.w #$1200
	LDA.w #$FEB0
	JSR.w CODE_858EE6
	JSR.w CODE_858F0B
	JMP.w CODE_858CF0

CODE_858CCF:
	LDA.w #$B028
	STA.w $0284
	JMP.w CODE_858CF0

CODE_858CD8:
	JSR.w CODE_858F2E
	JMP.w CODE_858CF0

CODE_858CDE:
	LDA.w #$F0E0
	STA.w $0284
	JMP.w CODE_858CF0

CODE_858CE7:
	LDX.w #$1200
	LDY.w #$0004
	JSR.w CODE_858FB8
CODE_858CF0:
	LDX.w #$1300
	INC.b $40,x
	LDA.b $40,x
	CMP.w #$0152
	BEQ.b CODE_858D13
	CMP.w #$0272
	BEQ.b CODE_858D13
	CMP.w #$04DA
	BEQ.b CODE_858D13
	CMP.w #$054A
	BEQ.b CODE_858D13
	CMP.w #$05BA
	BEQ.b CODE_858D13
	JMP.w CODE_858D15

CODE_858D13:
	INC.b $42,x
CODE_858D15:
	LDA.b $42,x
	ASL
	TAX
	JMP.w (DATA_858D1C,x)

DATA_858D1C:
	dw CODE_858D5F
	dw CODE_858D28
	dw CODE_858D4F
	dw CODE_858D34
	dw CODE_858D40
	dw CODE_858D4F

CODE_858D28:
	LDX.w #$1300
	LDA.w #$0120
	JSR.w CODE_858EE6
	JMP.w CODE_858D5F

CODE_858D34:
	LDX.w #$1300
	LDA.w #$0120
	JSR.w CODE_858EE6
	JMP.w CODE_858D5F

CODE_858D40:
	LDX.w #$1300
	LDA.w #$FEC0
	JSR.w CODE_858EE6
	JSR.w CODE_858F0B
	JMP.w CODE_858D5F

CODE_858D4F:
	LDX.w #$1300
	LDY.w #$0006
	JSR.w CODE_858FB8
	LDA.w #$00C0
	STA.b $44,x
	STA.b $1C,x
CODE_858D5F:
	LDX.w #$1400
	INC.b $40,x
	LDA.b $40,x
	CMP.w #$02FE
	BEQ.b CODE_858D73
	CMP.w #$0422
	BEQ.b CODE_858D73
	JMP.w CODE_858D75

CODE_858D73:
	INC.b $42,x
CODE_858D75:
	LDA.b $42,x
	ASL
	TAX
	JMP.w (DATA_858D7C,x)

DATA_858D7C:
	dw CODE_858D97
	dw CODE_858D82
	dw CODE_858D8E

CODE_858D82:
	LDX.w #$1400
	LDA.w #$0120
	JSR.w CODE_858EE6
	JMP.w CODE_858D97

CODE_858D8E:
	LDX.w #$1400
	LDY.w #$0008
	JSR.w CODE_858FB8
CODE_858D97:
	LDX.w #$1500
	INC.b $40,x
	LDA.b $40,x
	CMP.w #$04AA
	BEQ.b CODE_858DAB
	CMP.w #$0568
	BEQ.b CODE_858DAB
	JMP.w CODE_858DAD

CODE_858DAB:
	INC.b $42,x
CODE_858DAD:
	LDA.b $42,x
	ASL
	TAX
	JMP.w (DATA_858DB4,x)

DATA_858DB4:
	dw CODE_858DDE
	dw CODE_858DBA
	dw CODE_858DC6

CODE_858DBA:
	LDX.w #$1500
	LDA.w #$0120
	JSR.w CODE_858EE6
	JMP.w CODE_858DDE

CODE_858DC6:
	LDX.w #$1500
	LDA.w #$FEB0
	JSR.w CODE_858EE6
	JSR.w CODE_858F0B
	JMP.w CODE_858DDE

CODE_858DD5:
	LDX.w #$1500
	LDY.w #$000A
	JSR.w CODE_858FB8
CODE_858DDE:
	LDX.w #$1600
	INC.b $40,x
	LDA.b $40,x
	CMP.w #$0192
	BEQ.b CODE_858DFC
	CMP.w #$023C
	BEQ.b CODE_858DFC
	CMP.w #$0245
	BEQ.b CODE_858DFC
	CMP.w #$02C2
	BEQ.b CODE_858DFC
	JMP.w CODE_858DFE

CODE_858DFC:
	INC.b $42,x
CODE_858DFE:
	LDA.b $42,x
	ASL
	TAX
	JMP.w (DATA_858E05,x)

DATA_858E05:
	dw CODE_858E48
	dw CODE_858E0F
	dw CODE_858E1B
	dw CODE_858E30
	dw CODE_858E3F

CODE_858E0F:
	LDX.w #$1600
	LDA.w #$0120
	JSR.w CODE_858EE6
	JMP.w CODE_858E48

CODE_858E1B:
	LDX.w #$1600
	JSR.w CODE_858F0B
	LDA.w #$FE90
	JSR.w CODE_858EE6
	LDA.w #$AD8F
	JSR.w CODE_858F63
	JMP.w CODE_858E48

CODE_858E30:
	LDX.w #$1600
	JSR.w CODE_858F0B
	LDA.w #$F0E0
	STA.w $0288
	JMP.w CODE_858E48

CODE_858E3F:
	LDX.w #$1600
	LDY.w #$000C
	JSR.w CODE_858FB8
CODE_858E48:
	LDX.w #$1700
	INC.b $40,x
	LDA.b $40,x
	CMP.w #$0362
	BEQ.b CODE_858E61
	CMP.w #$03F0
	BEQ.b CODE_858E61
	CMP.w #$0472
	BEQ.b CODE_858E61
	JMP.w CODE_858E63

CODE_858E61:
	INC.b $42,x
CODE_858E63:
	LDA.b $42,x
	ASL
	TAX
	JMP.w (DATA_858E6A,x)

DATA_858E6A:
	dw CODE_858E96
	dw CODE_858E72
	dw CODE_858E7E
	dw CODE_858E8D

CODE_858E72:
	LDX.w #$1700
	LDA.w #$0160
	JSR.w CODE_858EE6
	JMP.w CODE_858E96

CODE_858E7E:
	LDX.w #$1700
	JSR.w CODE_858F0B
	LDA.w #$FDE0
	JSR.w CODE_858EE6
	JMP.w CODE_858E96

CODE_858E8D:
	LDX.w #$1700
	LDY.w #$000E
	JSR.w CODE_858FB8
CODE_858E96:
	LDA.b $8A
	BEQ.b CODE_858E9D
	JSR.w CODE_858F24
CODE_858E9D:
	LDX.w #$1000
	LDA.b $40,x
	CMP.w #$03D2
	BEQ.b CODE_858EBF
	CMP.w #$03F2
	BEQ.b CODE_858EDB
	CMP.w #$0402
	BEQ.b CODE_858ECD
	CMP.w #$046D
	BEQ.b CODE_858EDB
	CMP.w #$0652
	BNE.b CODE_858EBE
	JSR.w CODE_858F84
CODE_858EBE:
	RTS

CODE_858EBF:
	LDA.w #$B0D0
	JSR.w CODE_858F14
	LDA.w #$0001
	STA.b $8A
	JMP.w CODE_858EBE

CODE_858ECD:
	LDA.w #$B08E
	JSR.w CODE_858F14
	LDA.w #$0001
	STA.b $8A
	JMP.w CODE_858EBE

CODE_858EDB:
	LDA.w #$E0F0
	JSR.w CODE_858F14
	STZ.b $8A
	JMP.w CODE_858EBE

CODE_858EE6:
	STA.b $22,x
	RTS

CODE_858EE9:
	LDA.b $75
	TAX
	LDA.w DATA_858FE9,x
	TAX
	LDA.b $1C,x
	CMP.b $44,x
	BNE.b CODE_858EFA
	INC
	JMP.w CODE_858EFB

CODE_858EFA:
	DEC
CODE_858EFB:
	STA.b $1C,x
	INC.b $75
	INC.b $75
	LDA.b $75
	CMP.w #$0010
	BNE.b CODE_858F0A
	STZ.b $75
CODE_858F0A:
	RTS

CODE_858F0B:
	LDA.w #$0800
	CLC
	ADC.b $2A,x
	STA.b $2A,x
	RTS

CODE_858F14:
	STA.w $0280
	LDA.w #$3F00
	STA.w $0282
	LDA.w #$AAAA
	STA.w $0408
	RTS

CODE_858F24:
	DEC.w $0280
	LDA.w #$AAAA
	STA.w $0408
	RTS

CODE_858F2E:
	LDA.w #$AAAA
	STA.w $0408
	LDA.w $0284
	CLC
	ADC.w #$0003
	STA.w $0284
	LDA.b $88
	INC
	CMP.w #$0005
	BEQ.b CODE_858F49
	STA.b $88
	RTS

CODE_858F49:
	STZ.b $88
	LDA.w $0286
	CMP.w #$3F02
	BNE.b CODE_858F5C
	LDA.w #$3F04
	STA.w $0286
	JMP.w CODE_858F62

CODE_858F5C:
	LDA.w #$3F02
	STA.w $0286
CODE_858F62:
	RTS

CODE_858F63:
	STA.w $0288
	LDA.w #$AAAA
	STA.w $0408
	LDA.w $028A
	CMP.w #$3F06
	BNE.b CODE_858F7D
	LDA.w #$BF06
	STA.w $028A
	JMP.w CODE_858F83

CODE_858F7D:
	LDA.w #$3F06
	STA.w $028A
CODE_858F83:
	RTS

CODE_858F84:
	LDY.w #$0000
CODE_858F87:
	LDA.w DATA_858FE9,y
	TAX
	PHY
	JSR.w CODE_858FB8
	STZ.b $40,x
	STZ.b $42,x
	PLY
	INY
	INY
	CPY.w #$0010
	BNE.b CODE_858F87
	LDA.w #$E0F0
	STA.w $0284
	STA.w $0288
	JSR.w CODE_858F14
	LDA.w #$3F02
	STA.w $0286
	LDA.w #$3F06
	STA.w $028A
	STZ.b $88
	STZ.b $8A
	RTS

CODE_858FB8:
	LDA.w DATA_858FF9,y
	TAY
	STZ.b $22,x
	LDA.w $0000,y
	STA.b $18,x
	LDA.w $0002,y
	STA.b $1C,x
	LDA.w $0004,y
	STA.b $2A,x
	LDA.w $0006,y
	STA.b $92,x
	LDA.w $0008,y
	STA.b $44,x
	RTS

CODE_858FD8:
	PHB
	PHK
	PLB
	LDA.w #$0200
	STA.b $3C
	JSR.w CODE_858F84
	JSL.l CODE_81CB44
	PLB
	RTL

DATA_858FE9:
	dw $1000,$1100,$1200,$1300,$1400,$1500,$1600,$1700

DATA_858FF9:
	dw DATA_859009,DATA_859013,DATA_85901D,DATA_859027,DATA_859031,DATA_85903B,DATA_859045,DATA_85904F

DATA_859009:
	dw $FFF0,$00B8,$3800,$0000,$00B8

DATA_859013:
	dw $FFF0,$00C0,$3800,$0000,$00C0

DATA_85901D:
	dw $FFF0,$00C0,$3800,$0000,$00C0

DATA_859027:
	dw $FFF0,$00B8,$3800,$0000,$00B8

DATA_859031:
	dw $FFF0,$00C0,$3800,$0000,$00C0

DATA_85903B:
	dw $FFF0,$00C0,$3800,$0000,$00C0

DATA_859045:
	dw $FFF0,$00C0,$3800,$0000,$00C0

DATA_85904F:
	dw $FFF0,$00C0,$3800,$0000,$00C0

;--------------------------------------------------------------------

DATA_859059:
	dw $1000,$FFF0,$00C8,$3800
	dw $1100,$FFF0,$00C0,$3800
	dw $1200,$FFF0,$00A8,$3800
	dw $1300,$FFF0,$00C8,$3800
	dw $1400,$FFF0,$00C8,$3800
	dw $1500,$FFF0,$00C8,$3800
	dw $1600,$FFF0,$00C8,$3800
	dw $1700,$FFF0,$00C8,$3800
	dw $0000

;--------------------------------------------------------------------

CODE_85909B:
	PHB
	PHK
	PLB
	SEP.b #$30
	JSL.l CODE_84F38C
	JSR.w CODE_8591DE
	JSR.w CODE_85915F
	REP.b #$30
	JSR.w CODE_859239
	PLB
	RTL

;--------------------------------------------------------------------

CODE_8590B1:
	PHB
	PHK
	PLB
	JSR.w CODE_8592F9
	JSR.w CODE_85935B
	JSR.w CODE_859348
	JSR.w CODE_85939F
	JSL.l CODE_84F4E6
	JSL.l CODE_84F581
	JSL.l CODE_84F48D
	JSR.w CODE_859487
	JSR.w CODE_85965B
	JSR.w CODE_859561
	PLB
	RTL

;--------------------------------------------------------------------

CODE_8590D7:
	PHB
	PHK
	PLB
	JSL.l CODE_81CB35
	LDX.w #$0000
	JSR.w CODE_8596D6
	JSR.w CODE_8596EC
	LDX.w #$0002
	JSR.w CODE_8596D6
	JSR.w CODE_8596EC
	LDX.w #$0000
	JSR.w CODE_8596DC
	JSR.w CODE_8596E2
	LDX.w #$0002
	JSR.w CODE_8596DC
	JSR.w CODE_8596E2
	LDX.w #$0000
	JSR.w CODE_8596F6
	JSR.w CODE_8596FC
	LDX.w #$0002
	JSR.w CODE_8596F6
	JSR.w CODE_8596FC
	LDX.w #$0000
	JSR.w CODE_859717
	JSR.w CODE_85971F
	LDX.w #$0002
	JSR.w CODE_859717
	JSR.w CODE_85971F
	LDX.w #$0000
	JSR.w CODE_8596DC
	JSR.w CODE_85978F
	LDA.w $0E66
	BNE.b CODE_859138
	LDA.b $2E
	BNE.b CODE_859141
CODE_859138:
	LDX.w #$0002
	JSR.w CODE_8596DC
	JSR.w CODE_85978F
CODE_859141:
	SEP.b #$20
	LDA.b $61
	STA.l !REGISTER_BG2HorizScrollOffset
	LDA.b $62
	STA.l !REGISTER_BG2HorizScrollOffset
	LDA.b $64
	STA.l $002111
	LDA.b $65
	STA.l $002111
	REP.b #$20
	PLB
	RTL

;--------------------------------------------------------------------

CODE_85915F:
	LDX.b #$08
	JSR.w CODE_858171
	LDX.b #$0A
	JSR.w CODE_858171
	LDX.b #$0C
	JSR.w CODE_858171
	LDX.b #$0E
	JSR.w CODE_858171
	REP.b #$30
	LDA.w #$3800
	STA.w !REGISTER_VRAMAddressLo
	LDX.w #$0000
	LDA.w #$3014
CODE_859181:
	STA.l $002118
	INX
	INX
	CPX.w #$0800
	BNE.b CODE_859181
	SEP.b #$20
	LDA.b #$00
	STA.w !REGISTER_CGRAMAddress
	LDY.w #$0000
	LDX.w #$E800
CODE_859199:
	JSR.w CODE_859EC4
	CPY.w #$0200
	BNE.b CODE_859199
	REP.b #$20
	LDA.b $2E
	BEQ.b CODE_8591AB
	JSR.w CODE_8591B4
	RTS

CODE_8591AB:
	JSR.w CODE_8591B4
	JSR.w CODE_8591BB
	SEP.b #$20
	RTS

CODE_8591B4:
	LDX.w #$0000
	JSR.w CODE_8591C2
	RTS

CODE_8591BB:
	LDX.w #$0002
	JSR.w CODE_8591C2
	RTS

CODE_8591C2:
	PHX
	LDA.b $66,x
	TAX
	LDA.w DATA_8592E5,x
	PLX
	STA.b $74,x
	STA.b $7E,x
	LDA.w DATA_8591DA,x
	STA.b $78,x
	JSR.w CODE_8596D6
	JSR.w CODE_8596E2
	RTS

DATA_8591DA:
	db $15,$18,$17,$1C

CODE_8591DE:
	JSL.l CODE_84F421
	REP.b #$30
	LDA.b $2E
	BNE.b CODE_85920D
	LDA.w $1012
	CMP.w $1112
	BEQ.b CODE_859203
	LDX.w $1012
	LDA.w DATA_859283,x
	STA.b $66
	LDX.w $1112
	LDA.w DATA_859283,x
	STA.b $68
	JMP.w CODE_859234

CODE_859203:
	STZ.b $66
	LDA.w #$0008
	STA.b $68
	JMP.w CODE_859234

CODE_85920D:
	LDA.b $2E
	CMP.w #$0004
	BEQ.b CODE_85921F
	LDX.w $1012
	LDA.w DATA_859283,x
	STA.b $66
	JMP.w CODE_859227

CODE_85921F:
	LDX.w $1112
	LDA.w DATA_859283,x
	STA.b $66
CODE_859227:
	LDX.w #$0002
	LDA.w #$00F0
	STA.b $66,x
	LDA.w #$0002
	STA.b $70,x
CODE_859234:
	JSL.l CODE_84F45A
	RTS

CODE_859239:
	LDY.w #DATA_8592A3
	JSL.l CODE_81CB98
	RTS

DATA_859241:
	dw DATA_85924B,DATA_859253,DATA_85925B,DATA_859263,DATA_85926B

DATA_85924B:
	db $40,$18,$41,$18,$42,$18,$43,$18

DATA_859253:
	db $44,$18,$41,$18,$42,$18,$43,$18

DATA_85925B:
	db $40,$10,$41,$10,$42,$10,$45,$10

DATA_859263:
	db $44,$10,$41,$10,$42,$10,$45,$10

DATA_85926B:
	db $05,$08,$05,$08,$05,$08,$05,$08

DATA_859273:
	db $24,$39,$2A,$39,$30,$39,$36,$39
	db $24,$3A,$2A,$3A,$30,$3A,$36,$3A

DATA_859283:
	dw $0000,$0008,$0004,$0002,$000C,$0006,$000E,$000A

DATA_859293:
	dw $0000,$0006,$0004,$000A,$0002,$000E,$0008,$000C

DATA_8592A3:
	dw $1000,$0038,$0070,$4000,$1100,$0038,$00B1,$4000
	dw $1200,$0098,$0070,$4000,$1300,$0068,$0071,$4000
	dw $1400,$0098,$00B1,$4000,$1500,$00C8,$0071,$4000
	dw $1600,$00C8,$00B0,$4000,$1700,$0068,$00B0,$4000
	dw $0000

DATA_8592E5:
	db $06,$25,$0C,$25,$12,$25,$18,$25
	db $06,$26,$0C,$26,$12,$26,$18,$26
	db $15,$18,$17,$1C

;--------------------------------------------------------------------

CODE_8592F9:
	LDA.b $48
	BNE.b CODE_859331
	SEP.b #$20
	LDA.w !RAM_SMK_Global_ScreenDisplayRegister
	CMP.b #!ScreenDisplayRegister_MaxBrightness0F
	REP.b #$20
	BNE.b CODE_859331
	LDA.b $28
	STA.b $6A
	LDA.b $2A
	STA.b $6C
	LDA.b $36
	CMP.w #$0004
	BEQ.b CODE_85931F
	CMP.w #$0006
	BEQ.b CODE_859320
CODE_85931C:
	JSR.w CODE_859336
CODE_85931F:
	RTS

CODE_859320:
	LDA.b $2C
	CMP.w #$0004
	BNE.b CODE_85931C
	LDA.b $2E
	CMP.w #$0002
	BEQ.b CODE_85931F
	JMP.w CODE_85931C

CODE_859331:
	STZ.b $6A
	STZ.b $6C
	RTS

CODE_859336:
	LDA.w $002E
	BEQ.b CODE_859347
	CMP.w #$0004
	BNE.b CODE_859345
	STZ.b $6A
	JMP.w CODE_859347

CODE_859345:
	STZ.b $6C
CODE_859347:
	RTS

;--------------------------------------------------------------------

CODE_859348:
	LDA.w $0060
	CLC
	ADC.w #$00B0
	STA.w $0060
	LDA.b $63
	CLC
	ADC.w #$0130
	STA.b $63
	RTS

;--------------------------------------------------------------------

CODE_85935B:
	LDA.w $0198
	BNE.b CODE_859396
	LDA.w $0E66
	BNE.b CODE_859396
	LDA.b $2C
	CMP.w #$0004
	BNE.b CODE_859396
	LDA.b $2E
	CMP.w #$0002
	BNE.b CODE_859396
	LDA.b $6C
	BEQ.b CODE_859396
	LDA.b $66
	CLC
	ADC.w #$0002
	CMP.w #$0010
	BNE.b CODE_859385
	LDA.w #$0000
CODE_859385:
	STA.b $68
	STZ.b $72
	DEC.w $0E66
	JSR.w CODE_8591BB
	LDA.w #$1C4C
	STA.b $7A
	STZ.b $6C
CODE_859396:
	RTS

;--------------------------------------------------------------------

CODE_859397:
	PHB
	PHK
	PLB
	JSR.w CODE_8593A9
	PLB
	RTL

CODE_85939F:
	LDA.b $6A
	ORA.b $6C
	AND.w #$0F00
	BNE.b CODE_8593C4
	RTS

CODE_8593A9:
	LDA.w $0E66
	BNE.b CODE_8593B5
	LDA.b $2E
	BEQ.b CODE_8593B5
	JMP.w CODE_8593B9

CODE_8593B5:
	LDA.b $6A
	BEQ.b CODE_8593BE
CODE_8593B9:
	STZ.b $82
	JMP.w CODE_8593C3

CODE_8593BE:
	LDA.w #$0002
	STA.b $82
CODE_8593C3:
	RTS

CODE_8593C4:
	JSR.w CODE_8593A9
	LDX.b $82
	LDA.w $0196,x
	BNE.b CODE_85940B
	LDA.b $70,x
	BNE.b CODE_85940B
	LDA.b $66,x
	TAX
	LDA.w DATA_8592E5,x
	LDX.b $82
	STA.b $74,x
	JSL.l CODE_84F5F2
	LDX.b $82
	LDA.b $6A
	ORA.b $6C
	AND.w #$0F00
	CMP.w #$0100
	BEQ.b CODE_85941F
	CMP.w #$0200
	BEQ.b CODE_859440
	CMP.w #$0800
	BEQ.b CODE_85940C
	LDA.b $66,x
	CLC
	ADC.w #$0008
	JSR.w CODE_85947D
	BEQ.b CODE_859478
	CMP.w #$0010
	BCS.b CODE_859478
	JMP.w CODE_859461

CODE_85940B:
	RTS

CODE_85940C:
	LDA.b $66,x
	SEC
	SBC.w #$0008
	JSR.w CODE_85947D
	BEQ.b CODE_859478
	CMP.w #$FFF8
	BCS.b CODE_859478
	JMP.w CODE_859461

CODE_85941F:
	LDA.b $66,x
	INC
	INC
CODE_859423:
	JSR.w CODE_85947D
	BEQ.b CODE_859430
CODE_859428:
	CMP.w #$0010
	BEQ.b CODE_859435
	JMP.w CODE_859461

CODE_859430:
	INC
	INC
	JMP.w CODE_859428

CODE_859435:
	TXA
	EOR.w #$0002
	TAX
	LDA.w #$0000
	JMP.w CODE_859423

CODE_859440:
	LDA.b $66,x
	DEC
	DEC
CODE_859444:
	JSR.w CODE_85947D
	BEQ.b CODE_859451
CODE_859449:
	CMP.w #$FFFE
	BEQ.b CODE_859456
	JMP.w CODE_859461

CODE_859451:
	DEC
	DEC
	JMP.w CODE_859449

CODE_859456:
	TXA
	EOR.w #$0002
	TAX
	LDA.w #$000E
	JMP.w CODE_859444

CODE_859461:
	LDX.b $82
	STA.b $66,x
	LDA.b $66,x
	TAX
	PHX
	LDA.w #$002C
	JSL.l CODE_81F5A7
	PLX
	LDA.w DATA_8592E5,x
	LDX.b $82
	STA.b $7E,x
CODE_859478:
	JSL.l CODE_84F601
	RTS

;--------------------------------------------------------------------

CODE_85947D:
	PHA
	TXA
	EOR.w #$0002
	TAX
	PLA
	CMP.b $66,x
	RTS

;--------------------------------------------------------------------

CODE_859487:
	LDA.b $6A
	ORA.b $6C
	AND.w #$9000
	BNE.b CODE_85949A
	LDA.b $6A
	ORA.b $6C
	AND.w #$0040
	BNE.b CODE_8594E7
	RTS

CODE_85949A:
	LDA.w $002E
	CMP.w #$0004
	BEQ.b CODE_8594B2
	LDA.b $6A
	AND.w #$9000
	BNE.b CODE_8594B2
	LDA.w #$0002
	STA.w $1810
	JMP.w CODE_8594B5

CODE_8594B2:
	STZ.w $1810
CODE_8594B5:
	LDX.w $1810
	LDA.w $0196,x
	BNE.b CODE_8594E6
	LDA.b $70,x
	CMP.w #$0001
	BEQ.b CODE_85952C
	CMP.w #$0002
	BEQ.b CODE_8594E6
	TXA
	STA.w $0180,x
	LDA.w #$0001
	STA.b $70,x
	LDA.b $66,x
	TAX
	LDA.w DATA_859273,x
	LDX.b $82
	STA.b $8C,x
	STZ.w $0184,x
	LDA.w #$002E
	JSL.l CODE_81F5A7
CODE_8594E6:
	RTS

CODE_8594E7:
	LDA.w $002E
	CMP.w #$0004
	BEQ.b CODE_8594FF
	LDA.b $6A
	AND.w #$0040
	BNE.b CODE_8594FF
	LDA.w #$0002
	STA.w $1810
	JMP.w CODE_859502

CODE_8594FF:
	STZ.w $1810
CODE_859502:
	LDX.w $1810
	LDA.b $70,x
	CMP.w #$0001
	BNE.b CODE_85952B
	LDA.w #$0008
	STA.w $0180,x
	STZ.b $70,x
	LDA.b $66,x
	TAX
	LDA.w DATA_859273,x
	LDX.b $82
	STA.b $8C,x
	LDA.w #$0002
	STA.w $0184,x
	LDA.w #$002F
	JSL.l CODE_81F5A7
CODE_85952B:
	RTS

CODE_85952C:
	LDA.w $002E
	CMP.w #$0004
	BEQ.b CODE_859544
	LDA.b $6A
	AND.w #$9000
	BNE.b CODE_859544
	LDA.w #$0002
	STA.w $1810
	JMP.w CODE_859547

CODE_859544:
	STZ.w $1810
CODE_859547:
	LDX.w $1810
	LDA.w $1810
	CLC
	ADC.w #$0004
	STA.w $0180,x
	LDA.w #$0002
	STA.b $70,x
	LDA.w #$002E
	JSL.l CODE_81F5A7
	RTS

;--------------------------------------------------------------------

CODE_859561:
	LDA.w #$0300
	STA.b $3C
	JSR.w CODE_85956E
	JSL.l CODE_81CB44
	RTS

CODE_85956E:
	LDX.w #$0000
	STX.b $7C
	JSR.w CODE_8595AD
	LDA.w $0E66
	BNE.b CODE_85957F
	LDA.b $2E
	BNE.b CODE_8595E0
CODE_85957F:
	LDX.w #$0002
	STX.b $7C
	JSR.w CODE_8595AD
	JMP.w CODE_8595E0

;--------------------------------------------------------------------

CODE_85958A:
	LDA.w #$0200
	LDY.b $2A,x
	BPL.b CODE_859594
	LDA.w #$FE00
CODE_859594:
	CLC
	ADC.b $2A,x
	CMP.w #$8200
	RTS

CODE_85959B:
	LDA.w DATA_85963B,x
	TAX
	DEC.b $90,x
	RTS

CODE_8595A2:
	REP.b #$30
	LDA.w #$0200
	CLC
	ADC.b $2A,x
	STA.b $2A,x
	RTS

;--------------------------------------------------------------------

CODE_8595AD:
	LDA.b $66,x
	TAX
	LDA.w $963B,x
	TAX
	PHX
	LDX.b $7C
	LDA.b $70,x
	AND.w #$0003
	BEQ.b CODE_8595CA
	CMP.w #$0002
	BEQ.b CODE_8595D7
	PLX
	JSR.w CODE_8595A2
	JMP.w CODE_8595DF

CODE_8595CA:
	PLX
	LDA.w #$4200
	STA.b $2A,x
	LDX.b $7C
	STZ.b $70,x
	JMP.w CODE_8595DF

CODE_8595D7:
	PLX
	JSR.w CODE_85958A
	BEQ.b CODE_8595DF
	STA.b $2A,x
CODE_8595DF:
	RTS

;--------------------------------------------------------------------

CODE_8595E0:
	LDX.b $6E
	LDA.w DATA_85964B,x
	TAX
	LDA.w DATA_85963B,x
	TAX
	LDA.b $1C,x
	PHA
	AND.w #$0001
	BNE.b CODE_8595F9
	PLA
	INC
	STA.b $1C,x
	JMP.w CODE_8595FD

CODE_8595F9:
	PLA
	DEC
	STA.b $1C,x
CODE_8595FD:
	LDA.b $6E
	CLC
	ADC.w #$0002
	CMP.w #$0010
	BEQ.b CODE_85960D
	STA.b $6E
	JMP.w CODE_85960F

CODE_85960D:
	STZ.b $6E
CODE_85960F:
	LDA.w $0070
	BEQ.b CODE_85961A
	LDX.w $0066
	JSR.w CODE_85962F
CODE_85961A:
	LDA.w $0E66
	BNE.b CODE_859623
	LDA.b $2E
	BNE.b CODE_85962E
CODE_859623:
	LDA.w $0072
	BEQ.b CODE_85962E
	LDX.w $0068
	JSR.w CODE_85962F
CODE_85962E:
	RTS

CODE_85962F:
	LDA.w DATA_85963B,x
	TAX
	LDA.b $1C,x
	AND.w #$00F0
	STA.b $1C,x
	RTS

DATA_85963B:
	dw $1000,$1300,$1200,$1500,$1100,$1700,$1400,$1600

DATA_85964B:
	dw $0000,$000A,$0002,$000C,$0004,$000E,$0006,$0008

;--------------------------------------------------------------------

CODE_85965B:
	LDA.b $70
	CMP.w #$0002
	BNE.b CODE_8596D5
	LDA.b $72
	CMP.w #$0002
	BNE.b CODE_8596D5
	INC.b $96
	LDA.b $96
	CMP.w #$0040
	BNE.b CODE_8596D5
	LDA.b $2E
	BNE.b CODE_85968C
CODE_859676:
	LDX.b $66
	LDA.w DATA_859293,x
	STA.w $1012
	LDX.b $68
	LDA.w DATA_859293,x
	STA.w $1112
	STA.w $0E62
	JMP.w CODE_8596AB

CODE_85968C:
	LDA.w $0E66
	BNE.b CODE_859676
	LDA.b $2E
	CMP.w #$0004
	BEQ.b CODE_8596A3
	LDX.b $66
	LDA.w DATA_859293,x
	STA.w $1012
	JMP.w CODE_8596AB

CODE_8596A3:
	LDX.b $66
	LDA.w DATA_859293,x
	STA.w $1112
CODE_8596AB:
	LDA.b $2C
	BEQ.b CODE_8596BF
	CMP.w #$0002
	BEQ.b CODE_8596C5
	CMP.w #$0004
	BEQ.b CODE_8596CB
	LDA.w #$0016
	JMP.w CODE_8596CE

CODE_8596BF:
	LDA.w #$0008
	JMP.w CODE_8596CE

CODE_8596C5:
	LDA.w #$0016
	JMP.w CODE_8596CE

CODE_8596CB:
	LDA.w #$0016
CODE_8596CE:
	STA.b $32
	LDA.w #$8F00
	STA.b $48
CODE_8596D5:
	RTS

CODE_8596D6:
	LDA.b $74,x
	STA.w !REGISTER_VRAMAddressLo
	RTS

;--------------------------------------------------------------------

CODE_8596DC:
	LDA.b $7E,x
	STA.w !REGISTER_VRAMAddressLo
	RTS

;--------------------------------------------------------------------

CODE_8596E2:
	LDA.b $78,x
	STA.w !REGISTER_WriteToVRAMPortLo
	INC
	STA.w !REGISTER_WriteToVRAMPortLo
	RTS

;--------------------------------------------------------------------

CODE_8596EC:
	LDA.b $84
	STA.w !REGISTER_WriteToVRAMPortLo
	INC
	STA.w !REGISTER_WriteToVRAMPortLo
	RTS

;--------------------------------------------------------------------

CODE_8596F6:
	LDA.b $86,x
	STA.w !REGISTER_VRAMAddressLo
	RTS

;--------------------------------------------------------------------

CODE_8596FC:
	LDA.w $0180,x
	TAX
	LDA.w DATA_859241,x
	TAX
	LDY.w #$0000
CODE_859707:
	LDA.w !ContextDependentTable,x
	STA.w !REGISTER_WriteToVRAMPortLo
	INX
	INX
	INY
	INY
	CPY.w #$0008
	BNE.b CODE_859707
	RTS

;--------------------------------------------------------------------

CODE_859717:
	LDA.b $8C,x
	STA.b $92
	STA.w !REGISTER_VRAMAddressLo
	RTS

;--------------------------------------------------------------------

CODE_85971F:
	LDA.w $0184,x
	BNE.b CODE_85976B
	LDY.w #$0000
CODE_859727:
	LDX.w #$0000
CODE_85972A:
	LDA.w #$281C
	STA.w !REGISTER_WriteToVRAMPortLo
	INX
	CPX.w #$0006
	BNE.b CODE_85972A
	LDA.b $92
	CLC
	ADC.w #$0020
	STA.b $92
	STA.w !REGISTER_VRAMAddressLo
	INY
	CPY.w #$0004
	BNE.b CODE_859727
	LDY.w #$0000
CODE_85974A:
	LDX.w #$0000
CODE_85974D:
	LDA.w #$2410
	STA.w !REGISTER_WriteToVRAMPortLo
	INX
	CPX.w #$0006
	BNE.b CODE_85974D
	LDA.b $92
	CLC
	ADC.w #$0020
	STA.b $92
	STA.w !REGISTER_VRAMAddressLo
	INY
	CPY.w #$0003
	BNE.b CODE_85974A
	RTS

CODE_85976B:
	LDY.w #$0000
CODE_85976E:
	LDX.w #$0000
CODE_859771:
	LDA.w #$3014
	STA.w !REGISTER_WriteToVRAMPortLo
	INX
	CPX.w #$0006
	BNE.b CODE_859771
	LDA.b $92
	CLC
	ADC.w #$0020
	STA.b $92
	STA.w !REGISTER_VRAMAddressLo
	INY
	CPY.w #$0007
	BNE.b CODE_85976E
	RTS

;--------------------------------------------------------------------

CODE_85978F:
	LDA.b $9A,x
	STA.w !REGISTER_WriteToVRAMPortLo
CODE_859793:
	INC
	STA.w !REGISTER_WriteToVRAMPortLo
	RTS

;--------------------------------------------------------------------

CODE_859799:
	PHB
	PHK
	PLB
	SEP.b #$30
	JSL.l CODE_84F38C
	JSR.w CODE_8597E7
	JSR.w CODE_8597DD
	REP.b #$30
	PLB
	RTL

CODE_8597AC:
	PHB
	PHK
	PLB
	JSR.w CODE_8592F9
	JSL.l CODE_84FB66
	JSL.l CODE_84FA81
	JSL.l CODE_84FB40
	PLB
	RTL

CODE_8597C0:
	PHB
	PHK
	PLB
	LDY.w #$0000
	LDA.w $006E
	ASL
	TAX
	JSL.l CODE_84F9E2
	LDY.w #$0002
	LDA.w !RAM_SMK_Global_RaceCup
	ASL
	TAX
	JSL.l CODE_84F9E2
	PLB
	RTL

CODE_8597DD:
	LDX.b #$24
	JSR.w CODE_858171
	JSL.l CODE_84F61B
	RTS

;--------------------------------------------------------------------

CODE_8597E7:
	LDA.w !RAM_SMK_Global_RaceCup
	STA.b $6E
	LDA.b #!BGModeAndTileSizeSetting_Mode01Enable
	STA.w !REGISTER_BGModeAndTileSizeSetting
	LDA.b #$11
	STA.w !REGISTER_MainScreenLayers
	STZ.w !REGISTER_OAMSizeAndDataAreaDesignation
	LDA.b #$24
	STA.w !REGISTER_BG1AddressAndSize
	LDA.b #$00
	STA.w !REGISTER_BG1And2TileDataDesignation
	LDA.b #$80
	STA.w !REGISTER_VRAMAddressIncrementValue
	RTS

;--------------------------------------------------------------------

CODE_859809:
	PHB
	PHK
	PLB
	STZ.b $4A
	LDA.w #$016C
	STA.w $1030
	STA.w $1130
	STA.w $1230
	STA.w $1330
	STA.w $1430
	STA.w $1530
	STA.w $1630
	STA.w $1730
	SEP.b #$30
	JSL.l CODE_84F38C
	JSL.l CODE_84FEEC
	JSR.w CODE_859992
	REP.b #$30
	JSL.l CODE_84FC1E
	PLB
	RTL

;--------------------------------------------------------------------

CODE_85983E:
	PHB
	PHK
	PLB
	INC.b $8E
	LDA.b $8E
	CMP.w #$0700
	BNE.b CODE_85984F
	LDA.w #$0600
	STA.b $8E
CODE_85984F:
	JSR.w CODE_8592F9
	JSR.w CODE_85AEBC
	JSR.w CODE_85994E
	CPX.w #$0006
	BCC.b CODE_859866
	JSR.w CODE_85AC5D
	JSR.w CODE_85AE50
	JMP.w CODE_859894

CODE_859866:
	LDA.b $8E
	CMP.w #$0350
	BCC.b CODE_859873
	JSR.w CODE_85ABBD
	JMP.w CODE_859894

CODE_859873:
	JSR.w CODE_85994E
	JMP.w (DATA_859EDB,x)

CODE_859879:
	JSR.w CODE_85A782
	JSL.l CODE_84FE65
	JMP.w CODE_859894

CODE_859883:
	JSR.w CODE_85A8C7
	JSL.l CODE_84FE8C
	JMP.w CODE_859894

CODE_85988D:
	JSR.w CODE_85A923
	JSL.l CODE_84FE8C
CODE_859894:
	JSR.w CODE_85AB8F
	JSR.w CODE_85AA84
	JSR.w CODE_85B8E7
	PLB
	RTL

;--------------------------------------------------------------------

CODE_85989F:
	PHB
	PHK
	PLB
	SEP.b #$20
	LDA.b #$00
	STA.w !REGISTER_CGRAMAddress
	LDX.w #$4800
	LDY.w #$0000
CODE_8598AF:
	JSR.w CODE_859EC4
	CPY.w #$0040
	BNE.b CODE_8598AF
	SEP.b #$30
	LDA.b $73
	STA.w !REGISTER_BG1HorizScrollOffset
	LDA.b $74
	STA.w !REGISTER_BG1HorizScrollOffset
	LDA.b $84
	STA.w !REGISTER_BG1VertScrollOffset
	LDA.b $85
	STA.w !REGISTER_BG1VertScrollOffset
	LDA.w $0190
	STA.w !REGISTER_Mode7MatrixParameterA
	LDA.w $0191
	STA.w !REGISTER_Mode7MatrixParameterA
	LDA.w $0192
	STA.w !REGISTER_Mode7MatrixParameterB
	LDA.w $0193
	STA.w !REGISTER_Mode7MatrixParameterB
	LDA.w $0194
	STA.w !REGISTER_Mode7MatrixParameterC
	LDA.w $0195
	STA.w !REGISTER_Mode7MatrixParameterC
	LDA.w $0196
	STA.w !REGISTER_Mode7MatrixParameterD
	LDA.w $0197
	STA.w !REGISTER_Mode7MatrixParameterD
	LDA.b $75
	STA.w !REGISTER_Mode7CenterX
	LDA.b $76
	STA.w !REGISTER_Mode7CenterX
	LDA.b $81
	STA.w !REGISTER_Mode7CenterY
	LDA.b $82
	STA.w !REGISTER_Mode7CenterY
	LDA.w $19CC
	STA.w !REGISTER_HDMAEnable
	JSR.w CODE_85994E
	CPX.w #$0006
	BCS.b CODE_85994C
	SEP.b #$30
	LDA.b #$28
	STA.w !REGISTER_CGRAMAddress
	LDX.b #$10
CODE_859928:
	LDA.w $01C0,x
	STA.w !REGISTER_WriteToCGRAMPort
	INX
	LDA.w $01C0,x
	STA.w !REGISTER_WriteToCGRAMPort
	INX
	CPX.b #$20
	BNE.b CODE_859928
	REP.b #$30
	LDA.b $8E
	CMP.w #$0350
	BCS.b CODE_859949
	JSR.w CODE_85B9F1
	JMP.w CODE_85994C

CODE_859949:
	JSR.w CODE_85BA16
CODE_85994C:
	PLB
	RTL

;--------------------------------------------------------------------

CODE_85994E:
	REP.b #$30
	LDX.w #$0000
	LDA.w $002E
	BEQ.b CODE_859977
	CMP.w #$0004
	BEQ.b CODE_85996A
CODE_85995D:
	LDA.w $0F70,x
	CMP.w #$1000
	BEQ.b CODE_859989
	INX
	INX
	JMP.w CODE_85995D

CODE_85996A:
	LDA.w $0F70,x
	CMP.w #$1100
	BEQ.b CODE_859989
	INX
	INX
	JMP.w CODE_85996A

CODE_859977:
	LDA.w $0F70,x
	CMP.w #$1000
	BEQ.b CODE_859989
	CMP.w #$1100
	BEQ.b CODE_859989
	INX
	INX
	JMP.w CODE_859977

CODE_859989:
	RTS

CODE_85998A:
	PHB
	PHK
	PLB
	JSR.w CODE_85994E
	PLB
	RTL

;--------------------------------------------------------------------

; Note: Something related to the tournament ending cutscene

CODE_859992:
	LDX.b #$1C
	JSR.w CODE_858171
	LDX.b #$22
	JSR.w CODE_858171
	LDX.b #$1E
	JSR.w CODE_858171
	LDX.b #$20
	JSR.w CODE_858171
	REP.b #$30
	JSR.w CODE_8599AE
	JMP.w CODE_859A7B

CODE_8599AE:
	LDA.w #$5400
	LDX.w #$0000
	LDY.w #$0000
	JSR.w CODE_859A0F
	LDA.w #$5600
	LDX.w #$0003
	LDY.w #$0004
	JSR.w CODE_859A0F
	LDA.w #$5440
	LDX.w #$0006
	LDY.w #$0000
	JSR.w CODE_859A0F
	LDA.w #$5480
	LDX.w #$0009
	LDY.w #$0000
	JSR.w CODE_859A0F
	LDA.w #$54C0
	LDX.w #$000C
	LDY.w #$0000
	JSR.w CODE_859A0F
	LDA.w #$5640
	LDX.w #$000F
	LDY.w #$0000
	JSR.w CODE_859A0F
	LDA.w #$5680
	LDX.w #$0012
	LDY.w #$0000
	JSR.w CODE_859A0F
	LDA.w #$56C0
	LDX.w #$0015
	LDY.w #$0000
	JSR.w CODE_859A0F
	RTS

CODE_859A0F:
	PHA
	STA.w !REGISTER_VRAMAddressLo
	JSR.w CODE_859A4D
	STY.w $01EE
	REP.b #$20
	LDA.w DATA_859A6B,y
	JSR.w CODE_859A5C
	LDY.w $01EE
	LDA.w DATA_859A6B+$02,y
	JSR.w CODE_859A5C
	PLA
	CLC
	ADC.w #$0100
	STA.w !REGISTER_VRAMAddressLo
	LDY.w $01EE
	LDA.w DATA_859A73,y
	JSR.w CODE_859A5C
	LDY.w $01EE
	LDA.w DATA_859A73+$02,y
	JSR.w CODE_859A5C
	RTS

CODE_859A45:
	LDA.b [$60],y
	STA.w !REGISTER_WriteToVRAMPortLo
	INY
	INY
	RTS

CODE_859A4D:
	LDA.w DATA_859EEF,x
	STA.b $60
	SEP.b #$20
	INX
	INX
	LDA.w DATA_859EEF,x
	STA.b $62
	RTS

CODE_859A5C:
	TAY
	LDX.w #$0000
CODE_859A60:
	JSR.w CODE_859A45
	INX
	INX
	CPX.w #$0040
	BNE.b CODE_859A60
	RTS

DATA_859A6B:
	dw $0040,$5900,$0040,$2100

DATA_859A73:
	dw $0240,$5B00,$0240,$2300

;--------------------------------------------------------------------

CODE_859A7B:
	SEP.b #$20
	LDA.b #$00
	STA.w !REGISTER_CGRAMAddress
	LDX.w #$4800
	LDY.w #$0000
CODE_859A88:
	JSR.w CODE_859EC4
	CPY.w #$0200
	BNE.b CODE_859A88
	JSR.w CODE_85994E
	CPX.w #$0006
	BCS.b CODE_859ADF
	PHX
	SEP.b #$20
	LDA.b #$20
	STA.w !REGISTER_CGRAMAddress
	REP.b #$20
	LDY.w #$0000
	LDA.w DATA_859F07,x
	TAX
	SEP.b #$20
CODE_859AAB:
	LDA.l $7F0000,x
	STA.w !REGISTER_WriteToCGRAMPort
	STA.w $01C0,y
	INX
	INY
	LDA.l $7F0000,x
	STA.w !REGISTER_WriteToCGRAMPort
	STA.w $01C0,y
	INX
	INY
	CPY.w #$0020
	BNE.b CODE_859AAB
	PLX
	LDA.b #$F4
	STA.w !REGISTER_CGRAMAddress
	REP.b #$20
	LDY.w #$0000
	LDA.w DATA_859F0D,x
	TAX
CODE_859AD7:
	JSR.w CODE_819EC4
	CPY.w #$0006
	BNE.b CODE_859AD7
CODE_859ADF:
	SEP.b #$20
	STZ.w !REGISTER_VRAMAddressLo
	STZ.w !REGISTER_VRAMAddressHi
	LDX.w #$0000
CODE_859AEA:
	LDA.l $7FC000,x
	STA.w !REGISTER_WriteToVRAMPortHi
	INX
	CPX.w #$4000
	BNE.b CODE_859AEA
	STZ.w !REGISTER_VRAMAddressLo
	STZ.w !REGISTER_VRAMAddressHi
	LDA.b #$00
	STA.w !REGISTER_VRAMAddressIncrementValue
	LDX.w #$0000
	LDA.b #$6F
CODE_859B07:
	STA.w !REGISTER_WriteToVRAMPortLo
	INX
	CPX.w #$4000
	BNE.b CODE_859B07
	REP.b #$30
	LDA.w #$AE6E
	STA.w $0368
	LDA.w #$3CE4
	STA.w $036A
	JSR.w CODE_85AED5
	LDY.w #$0000
	LDX.w #$0000
CODE_859B27:
	LDA.w DATA_85A034,y
	STA.w $03E8,x
	INY
	INY
	JSR.w CODE_85B940
	CPX.w #$0018
	BNE.b CODE_859B27
	LDY.w #$0000
	LDA.w !RAM_SMK_Global_RaceCup
	CMP.w #!Define_SMK_RaceCup_SpecialCup
	BEQ.b CODE_859B55
	ASL
	TAX
	LDA.w DATA_85A040,x
CODE_859B47:
	STA.w $03EA,y
	JSR.w CODE_85B945
	CPY.w #$0018
	BNE.b CODE_859B47
	JMP.w CODE_859B70

CODE_859B55:
	LDX.w #$0000
CODE_859B58:
	LDA.w DATA_85A040,x
	STA.w $03EA,y
	JSR.w CODE_85B945
	INX
	INX
	CPX.w #$0006
	BNE.b CODE_859B6B
	LDX.w #$0000
CODE_859B6B:
	CPY.w #$0018
	BNE.b CODE_859B58
CODE_859B70:
	LDX.w #$0000
CODE_859B73:
	STZ.w $0400,x
	INX
	INX
	CPX.w #$0014
	BNE.b CODE_859B73
CODE_859B7D:
	LDA.w #$AAAA
	STA.w $0400,x
	INX
	INX
	CPX.w #$0020
	BNE.b CODE_859B7D
	LDA.w #$00AA
	STA.w $0414
	LDA.w #$A0A0
	STA.w $0416
	JSR.w CODE_85994E
	CPX.w #$0006
	BCS.b CODE_859BAE
	PHX
	JSR.w CODE_859D6F
	PLX
	CPX.w #$0000
	BNE.b CODE_859BAB
	JSR.w CODE_859E12
CODE_859BAB:
	JMP.w CODE_859CFD

CODE_859BAE:
	REP.b #$20
	LDA.w $0F70,x
	TAX
	LDA.b $12,x
	PHA
	TAX
	LDA.w DATA_80A0AC,x
	STA.w $01F0
	PLA
	LSR
	SEP.b #$20
	STA.w !REGISTER_Multiplicand
	LDA.b #$03
	STA.w !REGISTER_Multiplier
	NOP #4
	REP.b #$20
	LDA.w !REGISTER_ProductOrRemainderLo
	CMP.w #$0003
	BNE.b CODE_859BDB
	LDA.w #$0000
CODE_859BDB:
	TAX
	PHX
	LDA.w #$4AE0
	STA.w !REGISTER_VRAMAddressLo
	STA.w $01BE
	LDA.w #$0020
	STA.w $0198
	LDY.w #$0000
	STY.w $019A
	JSR.w CODE_859CA3
	PLX
	LDA.w #$4A00
	STA.w !REGISTER_VRAMAddressLo
	STA.w $01BE
	LDA.w #$00C0
	STA.w $0198
	LDY.w #$5800
	STY.w $019A
	JSR.w CODE_859CA3
	LDA.w !REGISTER_ProductOrRemainderLo
	CMP.w #$0003
	BNE.b CODE_859C19
	JSR.w CODE_859C3B
CODE_859C19:
	LDX.w #$0000
	LDY.w #$0000
CODE_859C1F:
	LDA.w DATA_85A07C,x
	STA.w $0340,y
	INX
	INX
	JSR.w CODE_85B945
	CPX.w #$0008
	BNE.b CODE_859C1F
	LDY.w #$0000
	LDA.w $019C
	JSR.w CODE_859CE3
	JMP.w CODE_859CFD

CODE_859C3B:
	LDX.w #$0003
	JSR.w CODE_859A4D
	REP.b #$20
	LDX.w #$0000
	JSR.w CODE_859C68
	LDX.w #$0002
	JSR.w CODE_859C68
	LDX.w #$0004
	JSR.w CODE_859C68
	LDX.w #$0006
	JSR.w CODE_859C68
	LDX.w #$0008
	JSR.w CODE_859C68
	LDX.w #$000A
	JSR.w CODE_859C68
	RTS

CODE_859C68:
	LDA.w DATA_859C97,x
	STA.w !REGISTER_VRAMAddressLo
	PHA
	LDA.w DATA_859C8B,x
	STA.w $01EE
	JSR.w CODE_859A5C
	PLA
	CLC
	ADC.w #$0100
	STA.w !REGISTER_VRAMAddressLo
	LDA.w $01EE
	CLC
	ADC.w #$0200
	JSR.w CODE_859A5C
	RTS

DATA_859C8B:
	dw $0000,$2140,$2400,$2440,$2080,$20C0

DATA_859C97:
	dw $4AE0,$4AA0,$4C00,$4C20,$4C40,$4C60

;--------------------------------------------------------------------

CODE_859CA3:
	STZ.w $019C
	JSR.w CODE_859A4D
	LDA.b #$80
	STA.w !REGISTER_VRAMAddressIncrementValue
	REP.b #$20
CODE_859CB0:
	LDX.w #$0000
CODE_859CB3:
	JSR.w CODE_859A45
	INX
	CPX.w $0198
	BNE.b CODE_859CB3
	LDA.w $01BE
	CLC
	ADC.w #$0100
	STA.w $01BE
	STA.w !REGISTER_VRAMAddressLo
	LDA.w $019A
	CLC
	ADC.w #$0200
	STA.w $019A
	TAY
	INC.w $019C
	LDA.w $019C
	CMP.w #$0004
	BNE.b CODE_859CB0
	STZ.w $019C
	RTS

;--------------------------------------------------------------------

CODE_859CE3:
	ASL
	TAX
	LDA.w DATA_85A084,x
	TAX
CODE_859CE9:
	LDA.w !ContextDependentTable,x
	ORA.w $01F0
	STA.w $0342,y
	JSR.w CODE_85B945
	INX
	INX
	CPY.w #$0010
	BNE.b CODE_859CE9
	RTS

;--------------------------------------------------------------------

CODE_859CFD:
	SEP.b #$20
	LDX.w #$0000
CODE_859D02:
	LDA.w DATA_859EE1,x
	STA.w $0180,x
	INX
	CPX.w #$000E
	BNE.b CODE_859D02
	LDA.b #$00
	STA.w HDMA[$01].Parameters
	LDA.b #!REGISTER_BGModeAndTileSizeSetting
	STA.w HDMA[$01].Destination
	LDA.b #$000180
	STA.w HDMA[$01].SourceLo
	LDA.b #$000180>>8
	STA.w HDMA[$01].SourceHi
	LDA.b #$000180>>16
	STA.w HDMA[$01].SourceBank
	LDA.b #$00
	STA.w HDMA[$01].IndirectSourceLo
	STA.w HDMA[$01].IndirectSourceHi
	LDA.b #$85
	STA.w HDMA[$01].IndirectSourceBank
	LDA.b #$00
	STA.w HDMA[$02].Parameters
	LDA.b #!REGISTER_MainScreenLayers
	STA.w HDMA[$02].Destination
	LDA.b #$000187
	STA.w HDMA[$02].SourceLo
	LDA.b #$000187>>8
	STA.w HDMA[$02].SourceHi
	LDA.b #$000187>>16
	STA.w HDMA[$02].SourceBank
	LDA.b #$00
	STA.w HDMA[$02].IndirectSourceLo
	STA.w HDMA[$02].IndirectSourceHi
	LDA.b #$85
	STA.w HDMA[$02].IndirectSourceBank
	RTS

;--------------------------------------------------------------------

CODE_859D5B:
	LDA.w $0000,x
	CMP.w #$FFFF
	BEQ.b CODE_859D6E
	STA.w $0202,y
	JSR.w CODE_85B945
	INX
	INX
	JMP.w CODE_859D5B

CODE_859D6E:
	RTS

;--------------------------------------------------------------------

CODE_859D6F:
	LDA.w DATA_859F13,x
	STA.b $7F
	CLC
	ADC.w #$0002
	STA.w $19CE
	SEC
	SBC.w #$0012
	STA.w $19D0
	LDA.w DATA_85A324,x
	STA.w $0340
	LDA.w #$0104
	STA.w $0342
	LDA.w #$FC00
	STA.w $01AA
	JSL.l CODE_84FF98
	LDA.w #$0080
	STA.w $1968
	STA.w $197A
	STA.w $1978
	STA.w $198C
	LDA.w #$0040
	STA.w $1988
	STA.w $1974
	STA.w $197E
	STA.w $198E
	LDA.w #$0060
	STA.w $1980
	STA.w $1982
	STA.w $1972
	STA.w $1970
	LDA.w #$FF60
	STA.w $196C
	STA.w $1992
	STA.w $1976
	STA.w $1984
	LDA.w #$FFC0
	STA.w $197C
	STA.w $196E
	STA.w $1990
	STA.w $1994
	LDA.w #$FF40
	STA.w $1986
	STA.w $196A
	STA.w $198A
	STA.w $1996
	LDA.w #$12AB
	STA.b $70
	LDA.w #$000C
	STA.b $7B
	LDX.w #$0004
	LDA.w DATA_859F19,x
	SEP.b #$20
	JSR.w CODE_85BA92
	REP.b #$20
	LDA.w #$14B3
	STA.b $70
	JSR.w CODE_85B9F1
	RTS

;--------------------------------------------------------------------

CODE_859E12:
	REP.b #$20
	LDA.w #$000E
	STA.w $19CC
	SEP.b #$20
	LDA.b #$20
	STA.w !REGISTER_ObjectAndColorWindowSettings
	LDA.b #$10
	STA.w !REGISTER_ColorMathInitialSettings
	LDA.b #$A7
	STA.w !REGISTER_ColorMathSelectAndEnable
	LDA.b #$E7
	STA.w !REGISTER_FixedColorData
	LDX.w #$0000
CODE_859E33:
	LDA.w DATA_859E98,x
	STA.w $1800,x
	INX
	CPX.w #$000D
	BNE.b CODE_859E33
	LDX.w #$0000
	LDY.w #$0000
CODE_859E45:
	LDA.w DATA_859EA7,x
	STA.w $1840,y
	INX
	INY
	INY
	CPX.w #$000F
	BNE.b CODE_859E45
	LDX.w #$0000
	LDA.b #$FF
CODE_859E58:
	STA.w $1841,x
	INX
	INX
	CPX.w #$001E
	BNE.b CODE_859E58
	LDX.w #$0000
CODE_859E65:
	LDA.w DATA_859EB6,x
	STA.w $1860,x
	INX
	CPX.w #$000F
	BNE.b CODE_859E65
	LDA.b #$41
	STA.w HDMA[$03].Parameters
	LDA.b #!REGISTER_Window1LeftPositionDesignation
	STA.w HDMA[$03].Destination
	LDA.b #$001800
	STA.w HDMA[$03].SourceLo
	LDA.b #$001800>>8
	STA.w HDMA[$03].SourceHi
	LDA.b #$001800>>16
	STA.w HDMA[$03].SourceBank
	LDA.b #$00
	STA.w HDMA[$03].IndirectSourceLo
	STA.w HDMA[$03].IndirectSourceHi
	LDA.b #DATA_859EA5>>16
	STA.w HDMA[$03].IndirectSourceBank
	RTS

DATA_859E98:
	db $70 : dw DATA_859EA5
	db $40 : dw DATA_859EA5
	db $8E : dw $001840
	db $40 : dw DATA_859EA5
	db $00

DATA_859EA5:
	db $02,$01

DATA_859EA7:
	db $F9,$EE,$E7,$DF,$DB,$D7,$D6,$D6
	db $D7,$DB,$DF,$E6,$ED,$F2,$FA

DATA_859EB6:
	db $14,$2B,$38,$46,$50,$58,$5A,$5A
	db $58,$50,$46,$38,$2A,$1A

;--------------------------------------------------------------------

CODE_859EC4:
	SEP.b #$20
	LDA.l $7F0000,x
	STA.w !REGISTER_WriteToCGRAMPort
	INX
	INY
	LDA.l $7F0000,x
	STA.w !REGISTER_WriteToCGRAMPort
	INX
	INY
	REP.b #$20
	RTS

;--------------------------------------------------------------------

DATA_859EDB:
	dw CODE_859879
	dw CODE_859883
	dw CODE_85988D

DATA_859EE1:
	dw $0780,$0708,$0160,$8000,$0711,$5011,$0012

DATA_859EEF:
	dl DATA_C02000
	dl DATA_84A000
	dl DATA_C12000
	dl DATA_C22000
	dl DATA_C32000
	dl DATA_C52000
	dl DATA_C62000
	dl DATA_C42000

DATA_859F07:
	dw $7F4840,$7F4860,$7F4880

DATA_859F0D:
	dw $49E8,$49F8,$49F0

DATA_859F13:
	dw $0100,$0180,$0200

DATA_859F19:
	dw DATA_859F97,DATA_859FB5,DATA_859F1F

DATA_859F1F:
	db $88,$88,$00,$01,$02,$03,$04,$05,$06,$07,$FF,$88,$88,$10,$11,$12
	db $13,$14,$15,$16,$17,$FF,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F,$20,$21
	db $FF,$18,$19,$1A,$1B,$1C,$1D,$1E,$1F,$30,$31,$FF,$22,$23,$24,$25
	db $26,$27,$28,$29,$FF,$32,$33,$34,$35,$36,$37,$38,$39,$FF,$2E,$2F
	db $40,$41,$42,$43,$44,$45,$FF,$3E,$3F,$50,$51,$52,$53,$54,$55,$FF
	db $4A,$4B,$4C,$4D,$4E,$4F,$60,$61,$FF,$5A,$5B,$5C,$5D,$5E,$5F,$70
	db $71,$FF,$88,$66,$67,$68,$69,$6A,$6B,$6C,$6D,$88,$FF,$88,$76,$77
	db $78,$79,$7A,$7B,$7C,$7D,$88,$FF

DATA_859F97:
	db $2A,$2B,$2C,$2D,$FF,$3A,$3B,$3C,$3D,$FF,$46,$47,$48,$49,$FF,$56
	db $57,$58,$59,$FF,$62,$63,$64,$65,$FF,$72,$73,$74,$75,$FF

DATA_859FB5:
	db $2A,$2B,$6E,$6F,$FF,$3A,$3B,$7E,$7F,$FF,$80,$81,$82,$83,$FF,$90
	db $91,$92,$93,$FF,$84,$85,$86,$87,$FF,$94,$95,$96,$97,$FF

DATA_859FD3:
	dw DATA_859FDB,DATA_859FEC,DATA_859FFD

DATA_859FD9:
	dw DATA_85A00E

DATA_859FDB:
	db $6F,$A6,$A7,$A0,$A1,$A8,$A9,$FF,$CE,$B6,$B7,$B0,$B1,$B8,$B9,$CF
	db $FF

DATA_859FEC:
	db $6F,$A6,$A7,$A2,$A3,$A8,$A9,$FF,$CE,$B6,$B7,$B2,$B3,$B8,$B9,$CF
	db $FF

DATA_859FFD:
	db $6F,$A6,$A7,$A4,$A5,$A8,$A9,$FF,$CE,$B6,$B7,$B4,$B5,$B8,$B9,$CF
	db $FF

DATA_85A00E:
	db $AA,$AB,$AC,$AD,$C0,$C1,$C2,$C3,$C4,$C5,$C6,$C7,$C8,$C9,$CA,$CB
	db $CC,$CD,$FF,$BA,$BB,$BC,$BD,$D0,$D1,$D2,$D3,$D4,$D5,$D6,$D7,$D8
	db $D9,$DA,$DB,$DC,$DD,$FF

DATA_85A034:
	dw $7070,$5800,$60B0,$20F0,$1888,$4040

DATA_85A040:
	dw $082A,$082E,$08CC

DATA_85A046:
	dw DATA_85A04C,DATA_85A05C,DATA_85A06C

DATA_85A04C:
	dw $6034,$38AA,$6044,$38AC,$7034,$F8AC,$7044,$F8AA

DATA_85A05C:
	dw $6034,$78AC,$6044,$78AA,$7034,$B8AA,$7044,$B8AC

DATA_85A06C:
	dw $F0E0,$78AC,$F0E0,$78AA,$F0E0,$B8AA,$F0E0,$B8AC

DATA_85A07C:
	dw $B0B8,$B0C8,$C0B8,$C0C8

DATA_85A084:
	dw DATA_85A08C,DATA_85A094,DATA_85A09C,DATA_85A0A4

DATA_85A08C:
	dw $30AE,$70AE,$30CE,$70CE

DATA_85A094:
	dw $70C2,$70C0,$30CE,$70CE

DATA_85A09C:
	dw $70C6,$70C4,$30CE,$70CE

DATA_85A0A4:
	dw $30AA,$70AA,$30CA,$70CA

DATA_80A0AC:
	dw $0200,$0400,$0000,$0600,$0600,$0400,$0200,$0000

DATA_85A0BC:
	dw $5028,$5030,$5038,$502C

DATA_85A0C4:
	dw DATA_85A0CA,DATA_85A0D6,DATA_85A0E2

DATA_85A0CA:
	dw $0F85,$0F80,$0FAA,$0FAF,$0FAF,$FFFF

DATA_85A0D6:
	dw $0F81,$0F80,$0F80,$0FAA,$0FAF,$FFFF

DATA_85A0E2:
	dw $0F81,$0F85,$0F80,$0FAA,$0FAF,$FFFF

DATA_85A0EE:
	dw DATA_85A0F8,DATA_85A10A,DATA_85A118,DATA_85A122,DATA_85A132

DATA_85A0F8:
	dw $0F96,$0F9E,$0F9C,$0F91,$0F9B,$0F98,$0F98,$0F96
	dw $FFFF

DATA_85A10A:
	dw $0F8F,$0F95,$0F98,$0FA0,$0F8E,$0F9B,$FFFF

DATA_85A118:
	dw $0F9C,$0F9D,$0F8A,$0F9B,$FFFF

DATA_85A122:
	dw $0F9C,$0F99,$0F8E,$0F8C,$0F92,$0F8A,$0F95,$FFFF

DATA_85A132:
	dw $0FAF,$0F8C,$0F9E,$0F99,$0FAF,$0F9B,$0F8A,$0F8C
	dw $0F8E,$0FAD,$FFFF

DATA_85A148:
	dw DATA_85A15C,DATA_85A168,DATA_85A174,DATA_85A182,DATA_85A19C,DATA_85A1AA,DATA_85A1B6,DATA_85A1C0
	dw DATA_85A1CC,DATA_85A1E2

DATA_85A15C:
	dw $0F96,$0F8A,$0F9B,$0F92,$0F98,$FFFF

DATA_85A168:
	dw $0F95,$0F9E,$0F92,$0F90,$0F92,$FFFF

DATA_85A174:
	dw $0F8B,$0F98,$0FA0,$0F9C,$0F8E,$0F9B,$FFFF

DATA_85A182:
	dw $0F9D,$0F91,$0F8E,$0FAF,$0F99,$0F9B,$0F92,$0F97
	dw $0F8C,$0F8E,$0F9C,$0F9C,$FFFF

DATA_85A19C:
	dw $0F8D,$0F94,$0FAF,$0F93,$0F9B,$0FA5,$FFFF

DATA_85A1AA:
	dw $0F94,$0F98,$0F98,$0F99,$0F8A,$FFFF

DATA_85A1B6:
	dw $0F9D,$0F98,$0F8A,$0F8D,$FFFF

DATA_85A1C0:
	dw $0FA2,$0F98,$0F9C,$0F91,$0F92,$FFFF

DATA_85A1CC:
	dw $0FAF,$0FA0,$0F92,$0F97,$0F9C,$0FAF,$0F9D,$0F91
	dw $0F8E,$0FAF,$FFFF

DATA_85A1E2:
	dw $0FAF,$0F8C,$0F8A,$0F96,$0F8E,$0FAF,$0F92,$0F97
	dw $0FAF,$FFFF

DATA_85A1F6:
	dw DATA_85A1FE,DATA_85A20C,DATA_85A21E,DATA_85A230

DATA_85A1FE:
	dw $0F90,$0F98,$0F95,$0F8D,$0FA5,$0FAD,$FFFF

DATA_85A20C:
	dw $0F9C,$0F92,$0F95,$0F9F,$0F8E,$0F9B,$0FA5,$0FAD
	dw $FFFF

DATA_85A21E:
	dw $0F8B,$0F9B,$0F98,$0F97,$0FA3,$0F8E,$0FA5,$0FAD
	dw $FFFF

DATA_85A230:
	dw $0F90,$0F9B,$0F8E,$0F8A,$0F9D,$0FAF,$0F9B,$0F8A
	dw $0F8C,$0F8E,$0FA7,$0000,$FFFF

DATA_85A24A:
	dw DATA_85A256,DATA_85A260,DATA_85A26A,DATA_85A274,DATA_85A27E,DATA_85A288

DATA_85A256:
	dw $0F84,$0F9D,$0F91,$0FAF,$FFFF

DATA_85A260:
	dw $0F85,$0F9D,$0F91,$0FAF,$FFFF

DATA_85A26A:
	dw $0F86,$0F9D,$0F91,$0FAF,$FFFF

DATA_85A274:
	dw $0F87,$0F9D,$0F91,$0FAF,$FFFF

DATA_85A27E:
	dw $0F88,$0F9D,$0F91,$0FAF,$FFFF

DATA_85A288:
	dw $0F99,$0F95,$0F8A,$0F8C,$0F8E,$0FA5,$0FAD,$0F9D
	dw $0F9B,$0FA2,$0FAF,$0F8A,$0F90,$0F8A,$0F92,$0F97
	dw $0FA5,$0000,$FFFF

DATA_85A2AE:
	dw $0F8E,$0FA1,$0F8C,$0F8E,$0F95,$0F95,$0F8E,$0F97
	dw $0F9D,$0FAF,$0F8D,$0F9B,$0F92,$0F9F,$0F92,$0F97
	dw $0F90,$0FA7,$0FAD,$0FA2,$0F98,$0F9E,$0FAF,$0F8A
	dw $0F9B,$0F8E,$0FAF,$0F97,$0F98,$0FA0,$0FAF,$0F8A
	dw $0FAF,$0F9C,$0F9E,$0F99,$0F8E,$0F9B,$0FAD,$0F96
	dw $0F8A,$0F9B,$0F92,$0F98,$0FAF,$0F94,$0F8A,$0F9B
	dw $0F9D,$0FAF,$0F8E,$0FA1,$0F99,$0F8E,$0F9B,$0F9D
	dw $0FA5,$0000,$FFFF

DATA_85A324:
	dw $2878,$3A5A,$4C97

DATA_85A32A:
	dw $0EA2,$0EA0,$0EE0

;--------------------------------------------------------------------

DATA_85A330:
	dw DATA_85A334,DATA_85A34A

DATA_85A334:
	dw $9D70,$3340,$9D80,$7340,$AD70,$3200
	dw $AD80,$7200,$E0E0,$32C2,$FFFF

DATA_85A34A:
	dw $9970,$3342,$9980,$7342,$A970,$3202,$A980,$7202
	dw $AD78,$32C2,$FFFF

DATA_85A360:
	dw DATA_85A36C,DATA_85A372,DATA_85A366

DATA_85A366:
	dw $AC75,$3CE2,$FFFF

DATA_85A36C:
	dw $A773,$3CE4,$FFFF

DATA_85A372:
	dw $9C6D,$3CE6,$FFFF

DATA_85A378:
	dw DATA_85A386,DATA_85A38C,DATA_85A396,DATA_85A3A4,DATA_85A3BE,DATA_85A3D8,DATA_85A3F2

DATA_85A386:
	dw $966D,$38AE,$FFFF

DATA_85A38C:
	dw $886D,$78AE,$976D,$38EE,$FFFF

DATA_85A396:
	dw $8F6D,$38EA,$9871,$38EB,$9F71,$F8EB,$FFFF

DATA_85A3A4:
	dw $8F6D,$B8FA,$8F75,$F8FA,$976E,$B8FB,$9776,$F8FB
	dw $9F6E,$F8FA,$9F73,$B8FA,$FFFF

DATA_85A3BE:
	dw $916D,$B8FA,$9175,$F8FA,$976E,$B8FB,$9776,$F8FB
	dw $A06E,$F8FA,$A073,$B8FA,$FFFF

DATA_85A3D8:
	dw $916B,$B8FB,$9176,$F8FB,$996C,$B8FB,$9973,$F8FB
	dw $A06D,$F8FB,$A073,$B8FB,$FFFF

DATA_85A3F2:
	dw $9B6C,$78FB,$9B73,$38FB,$A16D,$F8FB,$A173,$78FB
	dw $FFFF

DATA_85A404:
	dw DATA_85A40C,DATA_85A426

DATA_85A408:
	dw DATA_85A426,DATA_85A440

DATA_85A40C:
	dw $9970,$3144,$9980,$7144,$A970,$300C,$A980,$700C
	dw $B970,$302C,$B980,$702C,$FFFF

DATA_85A426:
	dw $9970,$3146,$9980,$7146,$A970,$300E,$A980,$700E
	dw $B970,$302C,$B980,$702C,$FFFF

DATA_85A440:
	dw $9A70,$3146,$9A80,$7146,$AA70,$300E,$AA80,$700E
	dw $B970,$302C,$B980,$702C,$FFFF

DATA_85A45A:
	dw DATA_85A464,DATA_85A46A,DATA_85A470

DATA_85A460:
	dw DATA_85A470,DATA_85A464

DATA_85A464:
	dw $9684,$3CE2,$FFFF

DATA_85A46A:
	dw $9784,$3CE2,$FFFF

DATA_85A470:
	dw $A178,$3CE2,$FFFF

DATA_85A476:
	dw DATA_85A47A,DATA_85A494

DATA_85A47A:
	dw $9970,$3748,$9980,$7748,$A970,$3608,$A980,$7608
	dw $B970,$3628,$B980,$7628,$FFFF

DATA_85A494:
	dw $9970,$374A,$9980,$774A,$A970,$360A,$A980,$760A
	dw $B970,$3628,$B980,$7628,$FFFF

DATA_85A4AE:
	dw DATA_85A4BA,DATA_85A4CC,DATA_85A4DE,DATA_85A4F0,DATA_85A502,DATA_85A508

DATA_85A4BA:
	dw $9D70,$374E,$9D80,$774E,$AD70,$3640,$AD80,$7640
	dw $FFFF

DATA_85A4CC:
	dw $9D70,$374C,$9D80,$774C,$AD70,$3642,$AD80,$7642
	dw $FFFF

DATA_85A4DE:
	dw $9E70,$374C,$9D80,$774E,$AD70,$3642,$AD80,$7640
	dw $FFFF

DATA_85A4F0:
	dw $9D70,$374E,$9E80,$774C,$AD70,$3640,$AD80,$7642
	dw $FFFF

DATA_85A502:
	dw $A67C,$36DF,$FFFF

DATA_85A508:
	dw $A67C,$36CF,$FFFF

DATA_85A50E:
	dw DATA_85A51A,DATA_85A520,DATA_85A526,DATA_85A530,DATA_85A53A,DATA_85A544

DATA_85A51A:
	dw $A975,$3CE2,$FFFF

DATA_85A520:
	dw $9670,$BCE2,$FFFF

DATA_85A526:
	dw $9678,$FCE4,$9670,$BCE2,$FFFF

DATA_85A530:
	dw $9680,$FCE2,$9674,$BCE2,$FFFF

DATA_85A53A:
	dw $9670,$BCE2,$9E80,$BCE4,$FFFF

DATA_85A544:
	dw $9E70,$BCE4,$9680,$FCE2,$FFFF

DATA_85A54E:
	dw DATA_85A552,DATA_85A568

DATA_85A552:
	dw $9D70,$3560,$9D80,$7560,$AD70,$3420,$AD80,$7420
	dw $E0E0,$32C2,$FFFF

DATA_85A568:
	dw $9970,$3562,$9980,$7562,$A970,$3422,$A980,$7422
	dw $AD78,$32C2,$FFFF

DATA_85A57E:
	dw DATA_85A58C,DATA_85A592,DATA_85A59C,DATA_85A5A6,DATA_85A5B0,DATA_85A5BA,DATA_85A5C4

DATA_85A58C:
	dw $A975,$3CE2,$FFFF

DATA_85A592:
	dw $A870,$3CE4,$A880,$3CE4,$FFFF

DATA_85A59C:
	dw $A870,$3CE2,$A880,$7CE2,$FFFF

DATA_85A5A6:
	dw $A970,$BCE2,$A980,$FCE2,$FFFF

DATA_85A5B0:
	dw $A870,$BCE4,$A880,$BCE4,$FFFF

DATA_85A5BA:
	dw $A870,$FCE2,$A880,$BCE2,$FFFF

DATA_85A5C4:
	dw $A970,$7CE2,$A980,$3CE2,$FFFF

DATA_85A5CE:
	dw DATA_85A5D8,DATA_85A5E2,DATA_85A5EC,DATA_85A606,DATA_85A620

DATA_85A5D8:
	dw $9970,$38AE,$9980,$38AE,$FFFF

DATA_85A5E2:
	dw $A068,$38EA,$A088,$78EA,$FFFF

DATA_85A5EC:
	dw $A268,$38EB,$A26E,$38FA,$A968,$38FB,$A290,$78EB
	dw $A28A,$78FA,$A992,$78FB,$FFFF

DATA_85A606:
	dw $E0E0,$38EB,$A268,$38FA,$A26E,$38FB,$E0E0,$78EB
	dw $A290,$78FA,$A28A,$78FB,$FFFF

DATA_85A620:
	dw $E0E0,$38EB,$E0E0,$38FA,$A668,$38FB,$E0E0,$78EB
	dw $E0E0,$78FA,$A68E,$78FB,$FFFF

DATA_85A63A:
	dw DATA_85A642,DATA_85A658,DATA_85A66E,DATA_85A684

DATA_85A642:
	dw $9E70,$3564,$9E80,$7564,$AE70,$3424,$AE80,$7424
	dw $E0E0,$32C2,$FFFF

DATA_85A658:
	dw $9A70,$3566,$9A80,$7566,$AA70,$3426,$AA80,$7426
	dw $AD78,$32C2,$FFFF

DATA_85A66E:
	dw $9E6F,$3564,$9E7F,$7564,$AE70,$3424,$AE80,$7424
	dw $E0E0,$32C2,$FFFF

DATA_85A684:
	dw $9E71,$3564,$9E81,$7564,$AE70,$3424,$AE80,$7424
	dw $E0E0,$32C2,$FFFF

DATA_85A69A:
	dw DATA_85A6B2,DATA_85A6B8,DATA_85A6BE,DATA_85A6C8,DATA_85A6D2,DATA_85A6DC,DATA_85A6E6,DATA_85A6F0
	dw DATA_85A6FA,DATA_85A704,DATA_85A70E,DATA_85A714

DATA_85A6B2:
	dw $A975,$3CE2,$FFFF

DATA_85A6B8:
	dw $B276,$3CE2,$FFFF

DATA_85A6BE:
	dw $B276,$3CE2,$B283,$3CE2,$FFFF

DATA_85A6C8:
	dw $B275,$3CE4,$B285,$3CE2,$FFFF

DATA_85A6D2:
	dw $B276,$3CE4,$B283,$3CE2,$FFFF

DATA_85A6DC:
	dw $B272,$3CE4,$B27F,$3CE4,$FFFF

DATA_85A6E6:
	dw $B278,$7CE2,$B272,$3CE4,$FFFF

DATA_85A6F0:
	dw $B26E,$7CE2,$B27F,$3CE4,$FFFF

DATA_85A6FA:
	dw $B26C,$7CE2,$B27D,$3CE4,$FFFF

DATA_85A704:
	dw $B278,$3CE2,$B27D,$3CE4,$FFFF

DATA_85A70E:
	dw $BA76,$38FC,$FFFF

DATA_85A714:
	dw $BA81,$38FC,$FFFF

DATA_85A71A:
	dw DATA_85A71E,DATA_85A734

DATA_85A71E:
	dw $9F70,$3368,$9F80,$7368,$AF70,$3204,$AF80,$7204
	dw $E0E0,$32C2,$FFFF

DATA_85A734:
	dw $9B70,$336A,$9B80,$736A,$AB70,$3206,$AB80,$7206
	dw $AD78,$32C2,$FFFF

DATA_85A74A:
	dw DATA_85A74E,DATA_85A754

DATA_85A74E:
	dw $A975,$3CE2,$FFFF

DATA_85A754:
	dw $A972,$3CE4,$FFFF

DATA_85A75A:
	dw DATA_85A75E,DATA_85A770

DATA_85A75E:
	dw $9D70,$316C,$9D80,$716C,$AD70,$3044,$AD80,$7044
	dw $FFFF

DATA_85A770:
	dw $9D70,$316E,$9D80,$716E,$AD70,$3046,$AD80,$7046
	dw $FFFF

;--------------------------------------------------------------------

CODE_85A782:
	LDA.b $8E
	CMP.w #$0260
	BEQ.b CODE_85A791
	CMP.w #$0260
	BCS.b CODE_85A7F0
	JMP.w CODE_85A7A1

CODE_85A791:
	STZ.b $98
	LDA.w #$0029
	JSL.l CODE_81F5A7
	STZ.w $009C
	JSR.w CODE_85A7F0
	RTS

CODE_85A7A1:
	LDA.b $8E
	CMP.w #$00EE
	BEQ.b CODE_85A7BA
	CMP.w #$0113
	BEQ.b CODE_85A7BA
	CMP.w #$0114
	BEQ.b CODE_85A7BA
	CMP.w #$01D0
	BEQ.b CODE_85A7BA
	JMP.w CODE_85A7BD

CODE_85A7BA:
	INC.w $009C
CODE_85A7BD:
	JSR.w CODE_85A97F
	LDA.w $009C
	ASL
	TAX
	JMP.w (DATA_85A887,x)

CODE_85A7C8:
	JSR.w CODE_85A995
	JMP.w CODE_85A7E6

CODE_85A7CE:
	JSR.w CODE_85AA79
	LDA.w #$CB8B
	STA.w $01BA
	JMP.w CODE_85A7E6

CODE_85A7DA:
	JSR.w CODE_85A9A3
	JMP.w CODE_85A7E6

CODE_85A7E0:
	JSR.w CODE_85A9F4
	JMP.w CODE_85A7E6

CODE_85A7E6:
	LDA.b $9E
	STA.b $88
	JSR.w CODE_85B922
	JMP.w CODE_85A871

CODE_85A7F0:
	JSR.w CODE_85A891
	LDA.w $009C
	ASL
	TAX
	JMP.w (DATA_85A87B,x)

CODE_85A7FB:
	INC.b $84
	LDA.b $73
	CMP.w #$00E0
	BCC.b CODE_85A875
	SEC
	SBC.w #$0004
	STA.b $73
	LDA.w #$0180
	STA.b $75
	LDA.w #$0170
	STA.b $81
	JMP.w CODE_85A85C

CODE_85A817:
	DEC.b $81
	DEC.b $81
	LDA.b $73
	CMP.w #$0147
	BCS.b CODE_85A875
	CLC
	ADC.w #$0003
	STA.b $73
	JMP.w CODE_85A85C

CODE_85A82B:
	DEC.b $84
	LDA.b $84
	CMP.w #$0110
	BCC.b CODE_85A875
	JMP.w CODE_85A85C

CODE_85A837:
	LDA.b $73
	CMP.w #$00A0
	BCC.b CODE_85A875
	SEC
	SBC.w #$0003
	STA.b $73
	DEC.b $84
	JMP.w CODE_85A85C

CODE_85A849:
	INC.b $84
	LDA.b $84
	CMP.w #$0108
	BCS.b CODE_85A875
	JMP.w CODE_85A85C

CODE_85A855:
	DEC.b $84
	DEC.b $84
	JMP.w CODE_85A871

CODE_85A85C:
	LDA.b $7D
	CLC
	ADC.w #$F800
	STA.b $7D
	LDA.b $7F
	CLC
	ADC.w #$0010
	CMP.w #$0800
	BEQ.b CODE_85A871
	STA.b $7F
CODE_85A871:
	JSR.w CODE_85B934
	RTS

CODE_85A875:
	INC.w $009C
	JMP.w CODE_85A85C

DATA_85A87B:
	dw CODE_85A7FB
	dw CODE_85A817
	dw CODE_85A82B
	dw CODE_85A837
	dw CODE_85A849
	dw CODE_85A855

DATA_85A887:
	dw CODE_85A7E6
	dw CODE_85A7C8
	dw CODE_85A7CE
	dw CODE_85A7DA
	dw CODE_85A7E0

;--------------------------------------------------------------------

CODE_85A891:
	INC.w $01A4
	LDA.w $01A4
	CMP.w #$0002
	BNE.b CODE_85A8C6
	STZ.w $01A4
	LDY.w #$0000
	LDX.w $01A2
	LDA.w DATA_85A046,x
	TAX
CODE_85A8A9:
	LDA.w !ContextDependentTable,x
	STA.w $03C0,y
	INY
	INY
	INX
	INX
	CPY.w #$0010
	BNE.b CODE_85A8A9
	LDA.w $01A2
	CMP.w #$0004
	BEQ.b CODE_85A8C6
	INC.w $01A2
	INC.w $01A2
CODE_85A8C6:
	RTS

;--------------------------------------------------------------------

CODE_85A8C7:
	LDA.b $8E
	CMP.w #$013A
	BEQ.b CODE_85A8E0
	CMP.w #$0160
	BEQ.b CODE_85A8E0
	CMP.w #$0161
	BEQ.b CODE_85A8E0
	CMP.w #$020C
	BEQ.b CODE_85A8E0
	JMP.w CODE_85A8E3

CODE_85A8E0:
	INC.w $009C
CODE_85A8E3:
	JSR.w CODE_85A97F
	LDA.w $009C
	ASL
	TAX
	JMP.w (CODE_85A917,x)

CODE_85A8EE:
	JSR.w CODE_85A995
	JMP.w CODE_85A90C

CODE_85A8F4:
	JSR.w CODE_85AA79
	LDA.w #$B898
	STA.w $01BA
	JMP.w CODE_85A90C

CODE_85A900:
	JSR.w CODE_85A9A3
	JMP.w CODE_85A90C

CODE_85A906:
	JSR.w CODE_85A9F4
	JMP.w CODE_85A90C

CODE_85A90C:
	LDA.b $9E
	STA.b $88
	JSR.w CODE_85B922
	JSR.w CODE_85B934
	RTS

CODE_85A917:
	dw CODE_85A90C
	dw CODE_85A8EE
	dw CODE_85A8F4
	dw CODE_85A900
	dw CODE_85A906
	dw CODE_85A90C

;--------------------------------------------------------------------

CODE_85A923:
	LDA.b $8E
	CMP.w #$009F
	BEQ.b CODE_85A93C
	CMP.w #$00C1
	BEQ.b CODE_85A93C
	CMP.w #$00C2
	BEQ.b CODE_85A93C
	CMP.w #$016D
	BEQ.b CODE_85A93C
	JMP.w CODE_85A93F

CODE_85A93C:
	INC.w $009C
CODE_85A93F:
	JSR.w CODE_85A97F
	LDA.w $009C
	ASL
	TAX
	JMP.w (DATA_85A973,x)

CODE_85A94A:
	JSR.w CODE_85A995
	JMP.w CODE_85A968

CODE_85A950:
	JSR.w CODE_85AA79
	LDA.w #$C09C
	STA.w $01BA
	JMP.w CODE_85A968

CODE_85A95C:
	JSR.w CODE_85A9A3
	JMP.w CODE_85A968

CODE_85A962:
	JSR.w CODE_85A9F4
	JMP.w CODE_85A968

CODE_85A968:
	LDA.b $9E
	STA.b $88
	JSR.w CODE_85B922
	JSR.w CODE_85B934
	RTS

DATA_85A973:
	dw CODE_85A968
	dw CODE_85A94A
	dw CODE_85A950
	dw CODE_85A95C
	dw CODE_85A962
	dw CODE_85A968

;--------------------------------------------------------------------

CODE_85A97F:
	INC.w $01E8
	LDA.w $01E8
	CMP.w #$001A
	BNE.b CODE_85A994
	STZ.w $01E8
	LDA.w #$0064
	JSL.l CODE_81F5A7
CODE_85A994:
	RTS

;--------------------------------------------------------------------

CODE_85A995:
	LDA.b $9E
	CMP.w #$0010
	BCC.b CODE_85A9A2
	SEC
	SBC.w #$0004
	STA.b $9E
CODE_85A9A2:
	RTS

;--------------------------------------------------------------------

CODE_85A9A3:
	STZ.w $01E8
	STZ.b $77
	STZ.b $9E
	LDA.w $01F6
	CMP.w #$000B
	BNE.b CODE_85A9B8
	JSR.w CODE_85AA05
	JMP.w CODE_85A9CA

CODE_85A9B8:
	LDA.b $7F
	CLC
	ADC.w $01F4
	STA.b $7F
	CMP.w $19CE
	BEQ.b CODE_85A9CB
	CMP.w $19D0
	BEQ.b CODE_85A9CB
CODE_85A9CA:
	RTS

CODE_85A9CB:
	LDA.w $01F4
	EOR.w #$FFFF
	INC
	STA.w $01F4
	INC.w $01F6
	LDA.w $01F6
	CMP.w #$000B
	BEQ.b CODE_85A9EA
	LDA.w #$0023
	JSL.l CODE_81F5A7
	JMP.w CODE_85A9B8

CODE_85A9EA:
	LDA.w #$004A
	JSL.l CODE_81F5A7
	JMP.w CODE_85A9B8

;--------------------------------------------------------------------

CODE_85A9F4:
	JSR.w CODE_85AA05
	LDA.b $9E
	CLC
	ADC.w #$0004
	CMP.w #$0084
	BCS.b CODE_85AA04
	STA.b $9E
CODE_85AA04:
	RTS

;--------------------------------------------------------------------

CODE_85AA05:
	LDA.w $01AA
	BEQ.b CODE_85AA6A
	CMP.w #$0600
	BEQ.b CODE_85AA16
CODE_85AA0F:
	CLC
	ADC.w #$0040
	STA.w $01AA
CODE_85AA16:
	SEP.b #$20
	LDA.w $01BB
	CMP.w $01BA
	BNE.b CODE_85AA23
	JSR.w CODE_85AB6D
CODE_85AA23:
	LDA.w $0341
	CLC
	ADC.w $01AB
	CMP.w $01BA
	BEQ.b CODE_85AA3A
	CMP.w $01BA
	BCS.b CODE_85AA3A
	STA.w $0341
	REP.b #$20
	RTS

CODE_85AA3A:
	LDA.w $01AB
	LSR
	CMP.b #$02
	BCC.b CODE_85AA64
	EOR.b  #$FF
	INC
	STA.w $01AB
	LDA.w $01BB
	STA.w $01BA
	REP.b #$20
	LDA.w $0340
	CLC
	ADC.w #$1000
	STA.w $0348
	LDA.w #$0037
	JSL.l CODE_81F5A7
	JMP.w CODE_85AA16

CODE_85AA64:
	REP.b #$20
	STZ.w $01AA
	RTS

CODE_85AA6A:
	LDA.w $0342
	ORA.w #$3000
	STA.w $0342
	LDA.w $01AA
	JMP.w CODE_85AA0F

;--------------------------------------------------------------------

CODE_85AA79:
	LDA.w $0030
	TAX
	LDA.w DATA_85A32A,x
	STA.w $0342
	RTS

;--------------------------------------------------------------------

CODE_85AA84:
	LDA.w $01F6
	CMP.w #$000B
	BEQ.b CODE_85AA8D
	RTS

CODE_85AA8D:
	INC.w $1906
	LDA.w $1906
	CMP.w #$0006
	BNE.b CODE_85AAC7
	STZ.w $1906
	LDX.w $19C8
CODE_85AA9E:
	LDY.w $1904
CODE_85AAA1:
	LDA.w DATA_85AB43,y
	BEQ.b CODE_85AA9E
	STA.w $0202,x
	JSR.w CODE_85B945
	JSR.w CODE_85B940
	INY
	INY
	CPX.w #$0140
	BNE.b CODE_85AAA1
	INC.w $1904
	INC.w $1904
	LDA.w $1904
	CMP.w #$0006
	BNE.b CODE_85AAC7
	STZ.w $1904
CODE_85AAC7:
	SEP.b #$20
	LDX.w $19C8
	LDY.w $19CA
CODE_85AACF:
	LDA.w $1938,y
	CLC
	ADC.w $1908,y
	STA.w $1938,y
	LDA.w $1909,y
	ADC.b #$00
	STA.w $1939,y
	LDA.w $1998,y
	CLC
	ADC.w $1968,y
	STA.w $1998,y
	LDA.w $1969,y
	ADC.b #$00
	STA.w $1999,y
	LDA.w $1999,y
	BMI.b CODE_85AB0E
	STZ.b $96
	LDA.w $0200,x
	CLC
	ADC.w $1999,y
	STA.w $0200,x
	BCC.b CODE_85AB23
	PHY
	JSR.w CODE_85B94A
	PLY
	JMP.w CODE_85AB23

CODE_85AB0E:
	LDA.b #$02
	STA.b $96
	LDA.w $0200,x
	CLC
	ADC.w $1999,y
	STA.w $0200,x
	BCS.b CODE_85AB23
	PHY
	JSR.w CODE_85B94A
	PLY
CODE_85AB23:
	LDA.w $0201,x
	CLC
	ADC.w $1939,y
	STA.w $0201,x
	CMP.b #$F0
	BCC.b CODE_85AB36
	LDA.b #$FF
	STA.w $0201,x
CODE_85AB36:
	INY
	INY
	JSR.w CODE_85B940
	CPY.w #$0030
	BNE.b CODE_85AACF
	REP.b #$20
	RTS

DATA_85AB43:
	dw $3AA4,$3AA5,$7AA4,$3AB6,$3AB7,$7AB6,$3AA8,$3AA9
	dw $7AA9,$3AB8,$3AB9,$7AB8,$3AA6,$3AA7,$7AA6,$3AB4
	dw $3AB5,$7AB4,$0000,$0000,$0000

;--------------------------------------------------------------------

CODE_85AB6D:
	REP.b #$20
	LDA.w $01F8
	CMP.w #$0006
	BEQ.b CODE_85AB86
	LDX.w $01F8
	LDA.w DATA_85AB89,x
	STA.w $034A
	INC.w $01F8
	INC.w $01F8
CODE_85AB86:
	SEP.b #$20
	RTS

DATA_85AB89:
	dw $386E,$786E,$38C4

;--------------------------------------------------------------------

CODE_85AB8F:
	INC.w $01AE
	LDA.w $01AE
	CMP.w #$0007
	BNE.b CODE_85ABBA
	STZ.b $96
	STZ.w $01AE
	SEP.b #$20
	LDX.w #$01E8
CODE_85ABA4:
	INC.w $0200,x
	LDA.w $0200,x
	BEQ.b CODE_85ABAF
	JMP.w CODE_85ABB2

CODE_85ABAF:
	JSR.w CODE_85B94A
CODE_85ABB2:
	JSR.w CODE_85B940
	CPX.w #$0200
	BNE.b CODE_85ABA4
CODE_85ABBA:
	REP.b #$20
	RTS

;--------------------------------------------------------------------

CODE_85ABBD:
	INC.w $01B8
	LDA.w $01B8
	CMP.w #$0003
	BNE.b CODE_85ABF5
	STZ.w $01B8
	LDX.w #$0010
	LDA.w $01C0,x
	PHA
CODE_85ABD2:
	INX
	INX
	LDA.w $01C0,x
	DEX
	DEX
	STA.w $01C0,x
	INX
	INX
	CPX.w #$001E
	BNE.b CODE_85ABD2
	PLA
	STA.w $01C0,x
	LDA.b $8E
	CMP.w #$0358
	BNE.b CODE_85ABF5
	LDA.w #$004B
	JSL.l CODE_81F5A7
CODE_85ABF5:
	LDA.w #$0080
	STA.b $75
	LDA.w #$0080
	STA.b $81
	STZ.b $73
	LDA.w #$0038
	STA.b $84
	STZ.b $7D
	LDA.b $8A
	CMP.w #$00A8
	BEQ.b CODE_85AC33
	CMP.w #$00A8
	BCC.b CODE_85AC33
CODE_85AC14:
	SEC
	SBC.w $1900
	STA.b $8A
	STA.b $7F
	LDA.w $1900
	CMP.w #$0018
	BEQ.b CODE_85AC2B
	CLC
	ADC.w #$0001
	STA.w $1900
CODE_85AC2B:
	JSR.w CODE_85B934
	RTS

CODE_85AC2F:
	JSR.w CODE_85AC5D
	RTS

CODE_85AC33:
	LDA.w $1900
	CMP.w #$0001
	BEQ.b CODE_85AC2F
	LSR
	LSR
	LSR
	SEP.b #$20
	STA.w !REGISTER_Multiplicand
	LDA.b #$05
	STA.w !REGISTER_Multiplier
	NOP #4
	REP.b #$20
	LDA.w !REGISTER_ProductOrRemainderLo
	EOR.w #$FFFF
	INC
	STA.w $1900
	LDA.b $8A
	JMP.w CODE_85AC14

;--------------------------------------------------------------------

CODE_85AC5D:
	LDA.w $01B2
	AND.w #$8000
	BNE.b CODE_85AC96
	STZ.w $040E
	STZ.w $040F
	STZ.w $0412
	STZ.w $1902
	LDA.w #$0110
	STA.w $19C8
	LDA.w #$0018
	STA.w $19CA
	LDX.w #$0000
	LDA.w #$E0F8
CODE_85AC83:
	STA.w $0200,x
	INX
	INX
	CPX.w #$0110
	BNE.b CODE_85AC83
	LDA.w #$8000
	STA.w $01B2
	JSR.w CODE_85ACE2
CODE_85AC96:
	INC.w $01B2
	LDA.w $01B2
	AND.w #$00FF
	CMP.w #$0002
	BNE.b CODE_85ACCD
	LDA.w #$8000
	STA.w $01B2
	LDX.w $01B0
	LDA.w $0202,x
	BEQ.b CODE_85ACCD
	CMP.w #$0FAD
	BEQ.b CODE_85ACCE
	LDA.w $01B4
	STA.w $0200,x
	LDA.w $01B4
	CLC
	ADC.w #$0008
	STA.w $01B4
CODE_85ACC7:
	JSR.w CODE_85B940
	STX.w $01B0
CODE_85ACCD:
	RTS

CODE_85ACCE:
	LDA.w $01B4
	AND.w #$FF00
	CLC
	ADC.w #$1000
	CLC
	ADC.w $01BC
	STA.w $01B4
	JMP.w CODE_85ACC7

;--------------------------------------------------------------------

CODE_85ACE2:
	LDY.w #$0000
	JSR.w CODE_85994E
	CPX.w #$0006
	BCS.b CODE_85AD5C
	LDA.w !RAM_SMK_Global_RaceCup
	CMP.w #!Define_SMK_RaceCup_SpecialCup
	BNE.b CODE_85ACFA
	CPX.w #$0000
	BEQ.b CODE_85AD5F
CODE_85ACFA:
	PHX
	JSR.w CODE_85AE44
	JSR.w CODE_85AE18
	PLX
	PHX
	JSR.w CODE_85ADF9
	LDX.w #$0010
	LDA.w DATA_85A148,x
	TAX
	JSR.w CODE_859D5B
	LDA.w $1902
	CMP.w #$0001
	BNE.b CODE_85AD21
	LDA.w #$0FAD
	STA.w $0202,y
	JSR.w CODE_85B945
CODE_85AD21:
	PLX
	LDA.w DATA_85A1F6,x
	TAX
	JSR.w CODE_859D5B
	LDA.w $1902
	CMP.w #$0001
	BNE.b CODE_85AD3E
	DEY
	DEY
	DEY
	DEY
	LDA.w #$0FAF
	STA.w $0202,y
	JSR.w CODE_85B945
CODE_85AD3E:
	LDX.w #$0006
	LDA.w DATA_85A1F6,x
	TAX
	JSR.w CODE_859D5B
	LDA.w !RAM_SMK_Global_RaceCup
	ASL
	TAX
	LDA.w DATA_85A0BC,x
	STA.w $01B4
	AND.w #$00FF
	STA.w $01BC
	JMP.w CODE_85ADF8

CODE_85AD5C:
	JMP.w CODE_85AD82

CODE_85AD5F:
	LDA.w #$503C
	STA.w $01B4
	AND.w #$00FF
	STA.w $01BC
	LDX.w #$0000
CODE_85AD6E:
	LDA.w DATA_85A2AE,x
	CMP.w #$FFFF
	BEQ.b CODE_85AD81
	STA.w $0202,y
	JSR.w CODE_85B945
	INX
	INX
	JMP.w CODE_85AD6E

CODE_85AD81:
	RTS

CODE_85AD82:
	PHX
	JSR.w CODE_85AE44
	JSR.w CODE_85AE18
	PLX
	PHX
	JSR.w CODE_85ADF9
	LDX.w #$0012
	LDA.w DATA_85A148,x
	TAX
	JSR.w CODE_859D5B
	LDA.w $1902
	CMP.w #$0001
	BNE.b CODE_85ADA9
	LDA.w #$0FAD
	STA.w $0202,y
	JSR.w CODE_85B945
CODE_85ADA9:
	PLX
	TXA
	SEC
	SBC.w #$0006
	TAX
	LDA.w DATA_85A24A,x
	TAX
	JSR.w CODE_859D5B
	LDA.w $1902
	CMP.w #$0002
	BNE.b CODE_85ADC8
	LDA.w #$0FAD
	STA.w $0202,y
	JSR.w CODE_85B945
CODE_85ADC8:
	LDX.w #$000A
	LDA.w DATA_85A24A,x
	TAX
	JSR.w CODE_859D5B
	LDA.w $1902
	BEQ.b CODE_85ADE3
	TYA
	SEC
	SBC.w #$0030
	TAY
	LDA.w #$0FAF
	STA.w $0202,y
CODE_85ADE3:
	LDA.w !RAM_SMK_Global_RaceCup
	ASL
	TAX
	LDA.w DATA_85A0BC,x
	SEC
	SBC.w #$1400
	STA.w $01B4
	AND.w #$00FF
	STA.w $01BC
CODE_85ADF8:
	RTS

CODE_85ADF9:
	LDA.w $0F70,x
	TAX
	LDA.b $12,x
	PHA
	CMP.w #$0006
	BEQ.b CODE_85AE0F
CODE_85AE05:
	PLA
	TAX
	LDA.w DATA_85A148,x
	TAX
	JSR.w CODE_859D5B
	RTS

CODE_85AE0F:
	LDA.w #$0001
	STA.w $1902
	JMP.w CODE_85AE05

CODE_85AE18:
	LDA.w !RAM_SMK_Global_RaceCup
	PHA
	CMP.w #!Define_SMK_RaceCup_FlowerCup
	BEQ.b CODE_85AE3B
	CMP.w #!Define_SMK_RaceCup_StarCup
	BEQ.b CODE_85AE3B
CODE_85AE26:
	PLA
	ASL
	TAX
	LDA.w DATA_85A0EE,x
	TAX
	JSR.w CODE_859D5B
	LDX.w #$0008
	LDA.w DATA_85A0EE,x
	TAX
	JSR.w CODE_859D5B
	RTS

CODE_85AE3B:
	LDA.w #$0002
	STA.w $1902
	JMP.w CODE_85AE26

CODE_85AE44:
	LDA.w $0030
	TAX
	LDA.w DATA_85A0C4,x
	TAX
	JSR.w CODE_859D5B
	RTS

;--------------------------------------------------------------------

CODE_85AE50:
	INC.w $019E
	LDA.w $019E
	CMP.w #$000D
	BEQ.b CODE_85AE61
	LDA.w $019C
	JMP.w CODE_85AE70

CODE_85AE61:
	STZ.w $019E
	LDA.w $019C
	CMP.w #$0010
	BEQ.b CODE_85AE75
	INC
	STA.w $019C
CODE_85AE70:
	ASL
	TAX
	JMP.w (DATA_85AE9A,x)

CODE_85AE75:
	STZ.w $019C
	JMP.w CODE_85AE70

CODE_85AE7B:
	LDA.w #$0000
	JMP.w CODE_85AE93

CODE_85AE81:
	LDA.w #$0001
	JMP.w CODE_85AE93

CODE_85AE87:
	LDA.w #$0002
	JMP.w CODE_85AE93

CODE_85AE8D:
	LDA.w #$0003
	JMP.w CODE_85AE93

CODE_85AE93:
	LDY.w #$0000
	JSR.w CODE_859CE3
	RTS

DATA_85AE9A:
	dw CODE_85AE7B
	dw CODE_85AE81
	dw CODE_85AE87
	dw CODE_85AE87
	dw CODE_85AE87
	dw CODE_85AE81
	dw CODE_85AE7B
	dw CODE_85AE81
	dw CODE_85AE87
	dw CODE_85AE87
	dw CODE_85AE87
	dw CODE_85AE81
	dw CODE_85AE7B
	dw CODE_85AE8D
	dw CODE_85AE8D
	dw CODE_85AE8D
	dw CODE_85AE8D

;--------------------------------------------------------------------

; Note: Routine that handles the animations of the winners in the cutscene at the end of the Mariokart GP mode.

CODE_85AEBC:
	LDA.w $01F6
	CMP.w #$0007
	BCC.b CODE_85AF25
	INC.b $65
	LDA.b $65
	CMP.w #$0010
	BNE.b CODE_85AF25
	STZ.b $65
	JSR.w CODE_85AED5
	JMP.w CODE_85AF17

CODE_85AED5:
	LDY.w #$0178
CODE_85AED8:
	LDX.w $01A8
	CPX.w #$0006
	BEQ.b CODE_85AF13
	LDA.w $0F70,x
	TAX
	LDA.b $12,x
	TAX
	JSR.w (DATA_85AF63,x)
	INC.w $01A8
	INC.w $01A8
	JMP.w CODE_85AED8

CODE_85AEF3:
	JSR.w CODE_85AF83
	RTS

CODE_85AEF7:
	JSR.w CODE_85B37F
	RTS

CODE_85AEFB:
	JSR.w CODE_85B0B8
	RTS

CODE_85AEFF:
	JSR.w CODE_85B18B
	RTS

CODE_85AF03:
	JSR.w CODE_85B26F
	RTS

CODE_85AF07:
	JSR.w CODE_85B4C4
	RTS

CODE_85AF0B:
	JSR.w CODE_85B602
	RTS

CODE_85AF0F:
	JSR.w CODE_85B781
	RTS

CODE_85AF13:
	STZ.w $01A8
	RTS

CODE_85AF17:
	STZ.w $01A8
	INC.b $63
	INC.b $63
	LDA.b $63
	CMP.w #$0004
	BEQ.b CODE_85AF5E
CODE_85AF25:
	JSR.w CODE_85994E
	CPX.w #$0000
	BEQ.b CODE_85AF2E
	RTS

CODE_85AF2E:
	LDY.w #$0178
	LDX.w #$0000
	LDA.w $0F70,x
	TAX
	LDA.b $12,x
	TAX
	JMP.w (DATA_85AF73,x)

CODE_85AF3E:
	JSR.w CODE_85AFA4
	RTS

CODE_85AF42:
	JSR.w CODE_85B3A0
	RTS

CODE_85AF46:
	JSR.w CODE_85B0D9
	RTS

CODE_85AF4A:
	JSR.w CODE_85B1AC
	RTS

CODE_85AF4E:
	JSR.w CODE_85B290
	RTS

CODE_85AF52:
	JSR.w CODE_85B4E5
	RTS

CODE_85AF56:
	JSR.w CODE_85B623
	RTS

CODE_85AF5A:
	JSR.w CODE_85B7A2
	RTS

CODE_85AF5E:
	STZ.b $63
	JMP.w CODE_85AF25

DATA_85AF63:
	dw CODE_85AEF3
	dw CODE_85AEF7
	dw CODE_85AEFB
	dw CODE_85AEFF
	dw CODE_85AF03
	dw CODE_85AF07
	dw CODE_85AF0B
	dw CODE_85AF0F

DATA_85AF73:
	dw CODE_85AF3E
	dw CODE_85AF42
	dw CODE_85AF46
	dw CODE_85AF4A
	dw CODE_85AF4E
	dw CODE_85AF52
	dw CODE_85AF56
	dw CODE_85AF5A

;--------------------------------------------------------------------

CODE_85AF83:
	PHY
	LDX.b $63
	LDA.w DATA_85A330,x
	TAX
	PHX
	JSR.w CODE_85B999
	LDX.w $01A8
	LDA.w DATA_85AF9C,x
	STA.b $60
	PLX
	PLY
	JSR.w CODE_85B9AC
	RTS

DATA_85AF9C:
	dw $0000,$F81D,$F0E1,$FD0E

;--------------------------------------------------------------------

CODE_85AFA4:
	LDA.b $8E
	CMP.w #$01B0
	BEQ.b CODE_85AFBA
	CMP.w #$0240
	BEQ.b CODE_85AFBA
	CMP.w #$0260
	BEQ.b CODE_85AFBA
	LDA.b $67
	JMP.w CODE_85AFBF

CODE_85AFBA:
	LDA.b $67
	INC
	STA.b $67
CODE_85AFBF:
	ASL
	TAX
	JMP.w (DATA_85B06E,x)

CODE_85AFC4:
	LDX.w #$0000
	JSR.w CODE_85B092
	LDX.w #$0004
	JSR.w CODE_85B099
	JMP.w CODE_85B06D

CODE_85AFD3:
	LDA.w #$A873
	STA.w $0350
	LDX.w #$0000
	JSR.w CODE_85B092
	JSR.w CODE_85B726
	JMP.w CODE_85B06D

CODE_85AFE5:
	JSR.w CODE_85B4B3
	INC.w $01A0
	LDA.w $01A0
	CMP.w #$0004
	BEQ.b CODE_85AFFA
	LDA.b $6E
	ASL
	TAX
	JMP.w CODE_85B008

CODE_85AFFA:
	STZ.w $01A0
CODE_85AFFD:
	LDA.b $6E
	CMP.w #$000D
	BEQ.b CODE_85B00B
	ASL
	TAX
	INC.b $6E
CODE_85B008:
	JMP.w (DATA_85B076,x)

CODE_85B00B:
	STZ.b $6E
	JMP.w CODE_85AFFD

CODE_85B010:
	LDX.w #$0000
	JSR.w CODE_85B092
	LDX.w #$0000
	JSR.w CODE_85B099
	JMP.w CODE_85B06D

CODE_85B01F:
	LDY.w #$0148
	LDX.w #$0000
	JMP.w CODE_85B05E

CODE_85B028:
	LDY.w #$0148
	LDX.w #$0002
	JMP.w CODE_85B05E

CODE_85B031:
	LDY.w #$014C
	LDX.w #$0004
	JMP.w CODE_85B05E

CODE_85B03A:
	LDY.w #$0150
	LDX.w #$0006
	JMP.w CODE_85B05E

CODE_85B043:
	LDY.w #$0150
	LDX.w #$0008
	JMP.w CODE_85B05E

CODE_85B04C:
	LDY.w #$0150
	LDX.w #$000A
	JMP.w CODE_85B05E

CODE_85B055:
	LDY.w #$0150
	LDX.w #$000C
	JMP.w CODE_85B05E

CODE_85B05E:
	JSR.w CODE_85B0B0
	LDX.w #$0002
	JSR.w CODE_85B092
	LDX.w #$0002
	JSR.w CODE_85B099
CODE_85B06D:
	RTS

DATA_85B06E:
	dw CODE_85B06D
	dw CODE_85AFC4
	dw CODE_85AFD3
	dw CODE_85AFE5

DATA_85B076:
	dw CODE_85B010
	dw CODE_85B01F
	dw CODE_85B028
	dw CODE_85B031
	dw CODE_85B03A
	dw CODE_85B043
	dw CODE_85B04C
	dw CODE_85B055
	dw CODE_85B010
	dw CODE_85B010
	dw CODE_85B010
	dw CODE_85B010
	dw CODE_85B010
	dw CODE_85B010

CODE_85B092:
	LDY.w #$0178
	JSR.w CODE_85B0A8
	RTS

CODE_85B099:
	LDY.w #$0168
	JSR.w CODE_85B0A0
	RTS

CODE_85B0A0:
	LDA.w DATA_85A360,x
	TAX
	JSR.w CODE_85B999
	RTS

CODE_85B0A8:
	LDA.w DATA_85A330,x
	TAX
	JSR.w CODE_85B999
	RTS

CODE_85B0B0:
	LDA.w DATA_85A378,x
	TAX
	JSR.w CODE_85B999
	RTS

;--------------------------------------------------------------------

CODE_85B0B8:
	PHY
	LDX.b $63
	LDA.w DATA_85A404,x
	TAX
	PHX
	JSR.w CODE_85B999
	LDX.w $01A8
	LDA.w DATA_85B0D1,x
	STA.b $60
	PLX
	PLY
	JSR.w CODE_85B9AC
	RTS

DATA_85B0D1:
	dw $0000,$F81E,$F0E0,$FD62

;--------------------------------------------------------------------

CODE_85B0D9:
	LDA.b $8E
	CMP.w #$01B0
	BEQ.b CODE_85B0EF
	CMP.w #$0244
	BEQ.b CODE_85B0EF
	CMP.w #$025A
	BEQ.b CODE_85B0EF
	LDA.b $67
	JMP.w CODE_85B0F4

CODE_85B0EF:
	LDA.b $67
	INC
	STA.b $67
CODE_85B0F4:
	ASL
	TAX
	JMP.w (DATA_85B12C,x)

CODE_85B0F9:
	LDY.w #$0168
	LDX.w #$0004
	JSR.w CODE_85B183
	JMP.w CODE_85B128

CODE_85B105:
	LDA.b $8E
	CMP.w #$0244
	BNE.b CODE_85B113
	LDA.w #$0049
	JSL.l CODE_81F5A7
CODE_85B113:
	LDA.w #$9E74
	STA.w $0350
	JSR.w CODE_85B726
	JMP.w CODE_85B128

CODE_85B11F:
	JSR.w CODE_85B4B3
	JSR.w CODE_85B142
	JMP.w CODE_85B12B

CODE_85B128:
	JSR.w CODE_85B134
CODE_85B12B:
	RTS

DATA_85B12C:
	dw CODE_85B12B
	dw CODE_85B0F9
	dw CODE_85B105
	dw CODE_85B11F

CODE_85B134:
	LDY.w #$0178
	LDX.w #$0000
	LDA.w DATA_85A404,x
	TAX
	JSR.w CODE_85B999
	RTS

CODE_85B142:
	INC.w $01A0
	LDA.w $01A0
	CMP.w #$0081
	BCC.b CODE_85B16A
	CMP.w #$0120
	BNE.b CODE_85B155
	STZ.w $01A0
CODE_85B155:
	LDX.b $63
	LDY.w #$0168
	JSR.w CODE_85B183
	LDY.w #$0178
	LDX.b $63
	LDA.w DATA_85A408,x
	TAX
	JSR.w CODE_85B999
	RTS

CODE_85B16A:
	LDY.w #$0168
	LDX.b $63
	LDA.w DATA_85A460,x
	TAX
	JSR.w CODE_85B999
	LDY.w #$0178
	LDX.b $63
	LDA.w DATA_85A404,x
	TAX
	JSR.w CODE_85B999
	RTS

CODE_85B183:
	LDA.w DATA_85A45A,x
	TAX
	JSR.w CODE_85B999
	RTS

;--------------------------------------------------------------------

CODE_85B18B:
	PHY
	LDX.b $63
	LDA.w DATA_85A476,x
	TAX
	PHX
	JSR.w CODE_85B999
	LDX.w $01A8
	LDA.w DATA_85B1A4,x
	STA.b $60
	PLX
	PLY
	JSR.w CODE_85B9AC
	RTS

DATA_85B1A4:
	dw $0000,$F81D,$F0E1,$FD44

;--------------------------------------------------------------------

CODE_85B1AC:
	LDA.b $8E
	CMP.w #$01B0
	BEQ.b CODE_85B1C7
	CMP.w #$0244
	BEQ.b CODE_85B1C7
	CMP.w #$0260
	BEQ.b CODE_85B1C7
	CMP.w #$0261
	BEQ.b CODE_85B1C7
	LDA.b $67
	JMP.w CODE_85B1CC

CODE_85B1C7:
	LDA.b $67
	INC
	STA.b $67
CODE_85B1CC:
	ASL
	TAX
	JMP.w (DATA_85B24A,x)

CODE_85B1D1:
	LDA.w #$A677
	STA.w $0368
	LDA.w #$3CE2
	STA.w $036A
	JMP.w CODE_85B218

CODE_85B1E0:
	LDA.b $8E
	CMP.w #$0244
	BNE.b CODE_85B1EE
	LDA.w #$0049
	JSL.l CODE_81F5A7
CODE_85B1EE:
	LDA.w #$9E74
	STA.w $0350
	JSR.w CODE_85B726
	JMP.w CODE_85B218

CODE_85B1FA:
	JSR.w CODE_85B4B3
	LDA.w #$0500
	STA.w $01E0
	LDA.w #$A878
	STA.w $0368
	LDA.w #$3CE4
	STA.w $036A
	LDA.w #$0000
	STA.w $01E2
	STZ.w $01E4
CODE_85B218:
	LDX.w #$0000
	JSR.w CODE_85B254
CODE_85B21E:
	RTS

CODE_85B21F:
	INC.w $01E6
	LDA.w $01E6
	CMP.w #$000A
	BCS.b CODE_85B231
	LDX.w #$0000
	JSR.w CODE_85B254
	RTS

CODE_85B231:
	JSR.w CODE_85B853
	REP.b #$20
	LDX.w #$0000
	LDA.w $01E6
	BEQ.b CODE_85B246
	CMP.w #$0168
	BCS.b CODE_85B246
	LDX.w #$0002
CODE_85B246:
	JSR.w CODE_85B254
	RTS

DATA_85B24A:
	dw CODE_85B21E
	dw CODE_85B1D1
	dw CODE_85B1E0
	dw CODE_85B1FA
	dw CODE_85B21F

CODE_85B254:
	LDY.w #$0178
	LDA.w DATA_85A476,x
	TAX
	JSR.w CODE_85B999
	RTS

DATA_85B25F:
	dw $3CE4,$3CE6,$3CE8,$BCE6,$BCE4,$BCE6,$3CE8,$3CE6

;--------------------------------------------------------------------

CODE_85B26F:
	PHY
	LDX.b $63
	LDA.w DATA_85A4AE,x
	TAX
	PHX
	JSR.w CODE_85B999
	LDX.w $01A8
	LDA.w DATA_85B288,x
	STA.b $60
	PLX
	PLY
	JSR.w CODE_85B9AC
	RTS

DATA_85B288:
	dw $0000,$F81E,$F0E1,$FD9C

;--------------------------------------------------------------------

CODE_85B290:
	LDA.b $8E
	CMP.w #$01B0
	BEQ.b CODE_85B2A6
	CMP.w #$0240
	BEQ.b CODE_85B2A6
	CMP.w #$0260
	BEQ.b CODE_85B2A6
	LDA.b $67
	JMP.w CODE_85B2AB

CODE_85B2A6:
	LDA.b $67
	INC
	STA.b $67
CODE_85B2AB:
	ASL
	TAX
	JMP.w (DATA_85B35D,x)

CODE_85B2B0:
	LDY.w #$0168
	LDX.w #$0000
	JSR.w CODE_85B36F
	JMP.w CODE_85B2C5

CODE_85B2BC:
	LDA.w #$A873
	STA.w $0350
	JSR.w CODE_85B726
CODE_85B2C5:
	LDX.w #$0000
	LDY.w #$0178
	JSR.w CODE_85B377
	JMP.w CODE_85B35C

CODE_85B2D1:
	JSR.w CODE_85B4B3
	INC.w $01A0
	LDA.w $01A0
	CMP.w #$000C
	BEQ.b CODE_85B2EB
CODE_85B2DF:
	LDA.b $6E
	CMP.w #$0005
	BEQ.b CODE_85B2F7
	ASL
	TAX
	JMP.w (DATA_85B365,x)

CODE_85B2EB:
	STZ.w $01A0
	LDA.b $6E
	ASL
	TAX
	INC.b $6E
	JMP.w (DATA_85B365,x)

CODE_85B2F7:
	LDA.w #$0001
	STA.b $6E
	JMP.w CODE_85B2DF

CODE_85B2FF:
	LDY.w #$0168
	LDX.w #$0002
	JMP.w CODE_85B317

CODE_85B308:
	LDY.w #$0168
	LDX.w #$0004
	JMP.w CODE_85B317

CODE_85B311:
	LDY.w #$0168
	LDX.w #$0006
CODE_85B317:
	JSR.w CODE_85B36F
	LDY.w #$0178
	LDX.w #$0002
	JSR.w CODE_85B377
	JMP.w CODE_85B35C

CODE_85B326:
	LDY.w #$0178
	LDX.w #$0004
	JSR.w CODE_85B377
	LDY.w #$0150
	LDX.w #$0008
	JSR.w CODE_85B377
	LDY.w #$0168
	LDX.w #$0008
	JMP.w CODE_85B359

CODE_85B341:
	LDY.w #$0178
	LDX.w #$0006
	JSR.w CODE_85B377
	LDY.w #$0150
	LDX.w #$000A
	JSR.w CODE_85B377
	LDY.w #$0168
	LDX.w #$000A
CODE_85B359:
	JSR.w CODE_85B36F
CODE_85B35C:
	RTS

DATA_85B35D:
	dw CODE_85B35C
	dw CODE_85B2B0
	dw CODE_85B2BC
	dw CODE_85B2D1

DATA_85B365:
	dw CODE_85B2FF
	dw CODE_85B308
	dw CODE_85B311
	dw CODE_85B326
	dw CODE_85B341

CODE_85B36F:
	LDA.w DATA_85A50E,x
	TAX
	JSR.w CODE_85B999
	RTS

CODE_85B377:
	LDA.w DATA_85A4AE,x
	TAX
	JSR.w CODE_85B999
	RTS

;--------------------------------------------------------------------

CODE_85B37F:
	PHY
	LDX.b $63
	LDA.w DATA_85A54E,x
	TAX
	PHX
	JSR.w CODE_85B999
	LDX.w $01A8
	LDA.w DATA_85B398,x
	STA.b $60
	PLX
	PLY
	JSR.w CODE_85B9AC
	RTS

DATA_85B398:
	dw $0000,$F81D,$F0E1,$FDF2

;--------------------------------------------------------------------

CODE_85B3A0:
	LDA.b $8E
	CMP.w #$01B0
	BEQ.b CODE_85B3BE
	CMP.w #$0240
	BEQ.b CODE_85B3BE
	CMP.w #$0260
	BEQ.b CODE_85B3BE
	CMP.w #$0270
	BEQ.b CODE_85B3BE
	CMP.w #$0280
	LDA.b $67
	JMP.w CODE_85B3C3

CODE_85B3BE:
	LDA.b $67
	INC
	STA.b $67
CODE_85B3C3:
	ASL
	TAX
	JMP.w (DATA_85B485,x)

CODE_85B3C8:
	LDY.w #$0168
	LDX.w #$0000
	JMP.w CODE_85B478

CODE_85B3D1:
	LDA.w #$A873
	STA.w $0350
	JSR.w CODE_85B726
	JMP.w CODE_85B478

CODE_85B3DD:
	JSR.w CODE_85B4B3
	LDY.w #$0168
	LDX.w #$0002
	JMP.w CODE_85B478

CODE_85B3E9:
	INC.w $01A0
	LDA.w $01A0
	CMP.w #$0007
	BEQ.b CODE_85B3FB
	LDA.b $6E
	ASL
	TAX
	JMP.w CODE_85B40C

CODE_85B3FB:
	STZ.w $01A0
	JSR.w CODE_85B4B3
	LDA.b $6E
	CMP.w #$0005
	BEQ.b CODE_85B40F
	ASL
	TAX
	INC.b $6E
CODE_85B40C:
	JMP.w (DATA_85B48F,x)

CODE_85B40F:
	STZ.b $6E
	RTS

CODE_85B412:
	LDY.w #$0148
	LDX.w #$0002
	JSR.w CODE_85B4AB
	LDY.w #$0168
	LDX.w #$0004
	JMP.w CODE_85B478

CODE_85B424:
	JSR.w CODE_85B4B3
	LDY.w #$0150
	LDX.w #$0004
	JSR.w CODE_85B4AB
	LDY.w #$0168
	LDX.w #$0006
	JMP.w CODE_85B478

CODE_85B439:
	LDY.w #$0150
	LDX.w #$0006
	JSR.w CODE_85B4AB
	LDY.w #$0168
	LDX.w #$0008
	JMP.w CODE_85B478

CODE_85B44B:
	LDY.w #$0150
	LDX.w #$0008
	JSR.w CODE_85B4AB
	LDY.w #$0168
	LDX.w #$000A
	JMP.w CODE_85B478

CODE_85B45D:
	JSR.w CODE_85B4B3
	LDY.w #$0168
	LDX.w #$000C
	JMP.w CODE_85B478

CODE_85B469:
	LDY.w #$0168
	LDX.w #$0000
	JSR.w CODE_85B4AB
	LDY.w #$0168
	LDX.w #$0002
CODE_85B478:
	JSR.w CODE_85B4A3
	LDX.w #$0000
	LDY.w #$0178
	JSR.w CODE_85B49B
CODE_85B484:
	RTS

DATA_85B485:
	dw CODE_85B484
	dw CODE_85B3C8
	dw CODE_85B3D1
	dw CODE_85B3DD
	dw CODE_85B3E9

DATA_85B48F:
	dw CODE_85B412
	dw CODE_85B424
	dw CODE_85B439
	dw CODE_85B44B
	dw CODE_85B45D
	dw CODE_85B469

CODE_85B49B:
	LDA.w DATA_85A54E,x
	TAX
	JSR.w CODE_85B999
	RTS

CODE_85B4A3:
	LDA.w DATA_85A57E,x
	TAX
	JSR.w CODE_85B999
	RTS

CODE_85B4AB:
	LDA.w DATA_85A5CE,x
	TAX
	JSR.w CODE_85B999
	RTS

;--------------------------------------------------------------------

CODE_85B4B3:
	LDX.w #$0000
	LDA.w #$E0F8
CODE_85B4B9:
	STA.w $0344,x
	INX
	INX
	CPX.w #$0034
	BNE.b CODE_85B4B9
	RTS

;--------------------------------------------------------------------

CODE_85B4C4:
	PHY
	LDX.b $63
	LDA.w DATA_85A63A,x
	TAX
	PHX
	JSR.w CODE_85B999
	LDX.w $01A8
	LDA.w DATA_85B4DD,x
	STA.b $60
	PLX
	PLY
	JSR.w CODE_85B9AC
	RTS

DATA_85B4DD:
	dw $0000,$F81E,$F0E1,$FD2A

;--------------------------------------------------------------------

CODE_85B4E5:
	LDA.b $8E
	CMP.w #$01B0
	BEQ.b CODE_85B4F9
	CMP.w #$0240
	BEQ.b CODE_85B4F9
	CMP.w #$0260
	BEQ.b CODE_85B4F9
	JMP.w CODE_85B4FE

CODE_85B4F9:
	LDA.b $67
	INC
	STA.b $67
CODE_85B4FE:
	LDA.b $67
	ASL
	TAX
	JMP.w (DATA_85B5D0,x)

CODE_85B505:
	LDY.w #$0168
	LDX.w #$0000
	JMP.w CODE_85B5C3

CODE_85B50E:
	LDA.w #$A873
	STA.w $0350
	JSR.w CODE_85B726
	JMP.w CODE_85B5C6

CODE_85B51A:
	JSR.w CODE_85B4B3
	INC.w $01A0
	LDA.w $01A0
	CMP.w #$0008
	BEQ.b CODE_85B534
CODE_85B528:
	LDA.b $6E
	CMP.w #$000D
	BEQ.b CODE_85B540
	ASL
	TAX
	JMP.w (DATA_85B5D8,x)

CODE_85B534:
	STZ.w $01A0
	LDA.b $6E
	ASL
	TAX
	INC.b $6E
	JMP.w (DATA_85B5D8,x)

CODE_85B540:
	LDA.w #$0001
	STA.b $6E
	JMP.w CODE_85B528

CODE_85B548:
	LDY.w #$0168
	LDX.w #$0002
	JMP.w CODE_85B5C3

CODE_85B551:
	LDY.w #$0168
	LDX.w #$0004
	JMP.w CODE_85B5C3

CODE_85B55A:
	LDY.w #$0168
	LDX.w #$0006
	JSR.w CODE_85B5F2
	LDX.w #$0004
	LDY.w #$0178
	JSR.w CODE_85B5FA
	JMP.w CODE_85B5CF

CODE_85B56F:
	LDY.w #$0168
	LDX.w #$0008
	JMP.w CODE_85B5C3

CODE_85B578:
	LDY.w #$0168
	LDX.w #$000A
	JMP.w CODE_85B5C3

CODE_85B581:
	LDY.w #$0168
	LDX.w #$000C
	JSR.w CODE_85B5F2
	LDY.w #$0150
	LDX.w #$0014
	JMP.w CODE_85B5C3

CODE_85B593:
	JSR.w CODE_85B4B3
	LDY.w #$0168
	LDX.w #$000E
	JMP.w CODE_85B5C3

CODE_85B59F:
	LDY.w #$0168
	LDX.w #$0010
	JSR.w CODE_85B5F2
	LDX.w #$0006
	LDY.w #$0178
	JSR.w CODE_85B5FA
	JMP.w CODE_85B5CF

CODE_85B5B4:
	LDY.w #$0168
	LDX.w #$0012
	JSR.w CODE_85B5F2
	LDY.w #$0150
	LDX.w #$0016
CODE_85B5C3:
	JSR.w CODE_85B5F2
CODE_85B5C6:
	LDX.w #$0000
	LDY.w #$0178
	JSR.w CODE_85B5FA
CODE_85B5CF:
	RTS

DATA_85B5D0:
	dw CODE_85B5CF
	dw CODE_85B505
	dw CODE_85B50E
	dw CODE_85B51A

DATA_85B5D8:
	dw CODE_85B548
	dw CODE_85B551
	dw CODE_85B55A
	dw CODE_85B55A
	dw CODE_85B55A
	dw CODE_85B56F
	dw CODE_85B578
	dw CODE_85B581
	dw CODE_85B593
	dw CODE_85B59F
	dw CODE_85B59F
	dw CODE_85B59F
	dw CODE_85B5B4

CODE_85B5F2:
	LDA.w DATA_85A69A,x
	TAX
	JSR.w CODE_85B999
	RTS

CODE_85B5FA:
	LDA.w DATA_85A63A,x
	TAX
	JSR.w CODE_85B999
	RTS

;--------------------------------------------------------------------

CODE_85B602:
	PHY
	LDX.b $63
	LDA.w DATA_85A71A,x
	TAX
	PHX
	JSR.w CODE_85B999
	LDX.w $01A8
	LDA.w DATA_85B61B,x
	STA.b $60
	PLX
	PLY
	JSR.w CODE_85B9AC
	RTS

DATA_85B61B:
	dw $0000,$F81E,$F0E1,$FDD6

;--------------------------------------------------------------------

CODE_85B623:
	LDA.b $8E
	CMP.w #$01B0
	BEQ.b CODE_85B63E
	CMP.w #$0240
	BEQ.b CODE_85B63E
	CMP.w #$0260
	BEQ.b CODE_85B63E
	CMP.w #$0268
	BEQ.b CODE_85B63E
	LDA.b $67
	JMP.w CODE_85B643

CODE_85B63E:
	LDA.b $67
	INC
	STA.b $67
CODE_85B643:
	ASL
	TAX
	JMP.w (DATA_85B66A,x)

CODE_85B648:
	JSR.w CODE_85B682
	JMP.w CODE_85B666

CODE_85B64E:
	LDA.w #$A873
	STA.w $0350
	JSR.w CODE_85B726
	JMP.w CODE_85B666

CODE_85B65A:
	JSR.w CODE_85B696
	JSR.w CODE_85B68C
	JMP.w CODE_85B666

CODE_85B663:
	JSR.w CODE_85B6C5
CODE_85B666:
	JSR.w CODE_85B674
CODE_85B669:
	RTS

DATA_85B66A:
	dw CODE_85B669
	dw CODE_85B648
	dw CODE_85B64E
	dw CODE_85B65A
	dw CODE_85B663

CODE_85B674:
	LDY.w #$0178
	LDX.w #$0000
	LDA.w DATA_85A71A,x
	TAX
	JSR.w CODE_85B999
	RTS

CODE_85B682:
	LDY.w #$0168
	LDX.w #$0000
	JSR.w CODE_85B71E
	RTS

CODE_85B68C:
	LDY.w #$0168
	LDX.w #$0002
	JSR.w CODE_85B71E
	RTS

CODE_85B696:
	JSR.w CODE_85B4B3
	LDA.w #$9A72
	STA.w $03D0
	STA.w $0344
	LDA.w #$3100
	STA.w $03D2
	LDX.w #$0000
	LDA.w #$3102
CODE_85B6AE:
	STA.w $03D6,x
	JSR.w CODE_85B940
	CPX.w #$0010
	BNE.b CODE_85B6AE
	STA.w $0346
	STZ.w $01F2
	LDA.w #$0001
	STA.b $6E
	RTS

CODE_85B6C5:
	LDA.b $6E
	CMP.w #$0010
	BEQ.b CODE_85B6FE
CODE_85B6CC:
	INC.b $6E
	LDA.w $03D0
	SEC
	SBC.w #$0100
	STA.w $03D0
CODE_85B6D8:
	INC.w $01A0
	LDA.w $01A0
	CMP.w #$000A
	BNE.b CODE_85B6FD
	STZ.w $01A0
	LDX.w #$0000
CODE_85B6E9:
	LDA.w $03D2,x
	EOR.w #$4000
	STA.w $03D2,x
	JSR.w CODE_85B940
	CPX.w #$0014
	BNE.b CODE_85B6E9
	STA.w $0346
CODE_85B6FD:
	RTS

CODE_85B6FE:
	LDX.w $01F2
	CPX.w #$0010
	BEQ.b CODE_85B6D8
	LDA.w $03D0
	AND.w #$FF00
	CLC
	ADC.w #$0072
	STA.w $03D4,x
	JSR.w CODE_85B940
	STX.w $01F2
	STZ.b $6E
	JMP.w CODE_85B6CC

CODE_85B71E:
	LDA.w DATA_85A74A,x
	TAX
	JSR.w CODE_85B999
	RTS

CODE_85B726:
	LDA.b $8E
	CMP.w #$0240
	BNE.b CODE_85B734
	LDA.w #$0049
	JSL.l CODE_81F5A7
CODE_85B734:
	LDA.w $01A6
	CLC
	ADC.w #$0202
	STA.w $01A6
	LDA.w $0350
	SEC
	SBC.w $01A6
	STA.w $0350
	LDA.w #$38DE
	STA.w $0352
	LDA.w $01AC
	CMP.w #$000A
	BEQ.b CODE_85B774
	LDX.w $01AC
	LDA.w DATA_85B775,x
	STA.w $0352
	LDA.w $01AC
	BNE.b CODE_85B76E
	LDA.w $0368
	CLC
	ADC.w #$0202
	STA.w $0368
CODE_85B76E:
	INC.w $01AC
	INC.w $01AC
CODE_85B774:
	RTS

DATA_85B775:
	dw $38EC,$38ED,$38EA,$38EB,$38FA,$38FB

;--------------------------------------------------------------------

CODE_85B781:
	PHY
	LDX.b $63
	LDA.w DATA_85A75A,x
	TAX
	PHX
	JSR.w CODE_85B999
	LDX.w $01A8
	LDA.w DATA_85B79A,x
	STA.b $60
	PLX
	PLY
	JSR.w CODE_85B9AC
	RTS

DATA_85B79A:
	dw $0000,$F81E,$F0E1,$FDBC

;--------------------------------------------------------------------

CODE_85B7A2:
	LDA.b $8E
	CMP.w #$01B0
	BEQ.b CODE_85B7BD
	CMP.w #$0240
	BEQ.b CODE_85B7BD
	CMP.w #$025F
	BEQ.b CODE_85B7BD
	CMP.w #$0260
	BEQ.b CODE_85B7BD
	LDA.b $67
	JMP.w CODE_85B7C2

CODE_85B7BD:
	LDA.b $67
	INC
	STA.b $67
CODE_85B7C2:
	ASL
	TAX
	JMP.w (DATA_85B7F2,x)

CODE_85B7C7:
	JSR.w CODE_85B7FC
	LDA.w #$A678
	STA.w $0368
	LDA.w #$3CE2
	STA.w $036A
	JMP.w CODE_85B7F1

CODE_85B7D9:
	LDA.w #$A873
	STA.w $0350
	JSR.w CODE_85B7FC
	JSR.w CODE_85B726
	JMP.w CODE_85B7F1

CODE_85B7E8:
	JSR.w CODE_85B803
	JMP.w CODE_85B7F1

CODE_85B7EE:
	JSR.w CODE_85B828
CODE_85B7F1:
	RTS

DATA_85B7F2:
	dw CODE_85B7F1
	dw CODE_85B7C7
	dw CODE_85B7D9
	dw CODE_85B7E8
	dw CODE_85B7EE

CODE_85B7FC:
	LDX.w #$0000
	JSR.w CODE_85B8DC
	RTS

CODE_85B803:
	JSR.w CODE_85B4B3
	LDA.w #$0500
	STA.w $01E0
	LDA.w #$A872
	STA.w $0368
	LDA.w #$3CE4
	STA.w $036A
	LDA.w #$00FF
	STA.w $01E2
	STZ.w $01E4
	LDX.w #$0000
	JSR.w CODE_85B8DC
	RTS

CODE_85B828:
	INC.w $01E6
	LDA.w $01E6
	CMP.w #$000A
	BCS.b CODE_85B83A
	LDX.w #$0000
	JSR.w CODE_85B8DC
	RTS

CODE_85B83A:
	JSR.w CODE_85B853
	REP.b #$20
	LDX.w #$0000
	LDA.w $01E6
	BEQ.b CODE_85B84F
	CMP.w #$0028
	BCS.b CODE_85B84F
	LDX.w #$0002
CODE_85B84F:
	JSR.w CODE_85B8DC
	RTS

CODE_85B853:
	LDA.w $01E0
	CMP.w #$0500
	BEQ.b CODE_85B862
	CLC
	ADC.w #$0040
	STA.w $01E0
CODE_85B862:
	SEP.b #$20
	LDA.w $0369
	CLC
	ADC.w $01E1
	CMP.b #$A8
	BEQ.b CODE_85B8BB
	CMP.b #$A8
	BCS.b CODE_85B8BB
	STA.w $0369
	INC.w $01E4
	LDA.w $01E4
	CMP.b #$03
	BNE.b CODE_85B88D
	STZ.w $01E4
	LDA.w $0368
	CLC
	ADC.w $01E2
	STA.w $0368
CODE_85B88D:
	REP.b #$20
	INC.w $01A0
	LDA.w $01A0
	CMP.w #$0003
	BNE.b CODE_85B8BA
	STZ.w $01A0
	LDA.w $006E
	TAX
	LDA.w DATA_85B25F,x
	STA.w $036A
	LDA.w $006E
	CLC
	ADC.w #$0002
	CMP.w #$0010
	BEQ.b CODE_85B8B7
	STA.w $006E
	RTS

CODE_85B8B7:
	STZ.w $006E
CODE_85B8BA:
	RTS

CODE_85B8BB:
	LDA.w $01E1
	EOR.w #$1AFF
	STA.w $01E1
	LDA.w $01E2
	EOR.w #$1AFF
	STA.w $01E2
	STZ.w $01E6
	STZ.w $01E7
	REP.b #$20
	LDA.w #$3CE4
	STA.w $036A
	RTS

CODE_85B8DC:
	LDY.w #$0178
	LDA.w DATA_85A75A,x
	TAX
	JSR.w CODE_85B999
	RTS

;--------------------------------------------------------------------

CODE_85B8E7:
	LDA.b $8E
	CMP.w #$04B0
	BCC.b CODE_85B921
	LDA.b $6A
	ORA.b $6C
	AND.w #$9000
	BEQ.b CODE_85B921
	LDA.w #$8F00
	STA.b $48
	LDA.w #$0040
	STA.w $015E
	JSL.l CODE_81F4B2
	LDA.w !RAM_SMK_Global_RaceCup
	CMP.w #!Define_SMK_RaceCup_SpecialCup
	BNE.b CODE_85B91C
	JSR.w CODE_85994E
	CPX.w #$0000
	BNE.b CODE_85B91C
	LDA.w #$000C
	JMP.w CODE_85B91F

CODE_85B91C:
	LDA.w #$0004
CODE_85B91F:
	STA.b $32
CODE_85B921:
	RTS

;--------------------------------------------------------------------

CODE_85B922:
	LDA.b $72
	CLC
	ADC.b $88
	STA.b $72
	SEP.b #$20
	LDA.b $74
	ADC.b #$00
	STA.b $74
	REP.b #$20
	RTS

;--------------------------------------------------------------------

CODE_85B934:
	LDA.b $7F
	LDY.b $7D
	LDX.w #$0190
	JSL.l CODE_84FE2A
	RTS

;--------------------------------------------------------------------

CODE_85B940:
	INX
	INX
	INX
	INX
	RTS

CODE_85B945:
	INY
	INY
	INY
	INY
	RTS

;--------------------------------------------------------------------

CODE_85B94A:
	REP.b #$20
	PHX
	TXA
	AND.w #$000C
	LSR
	LSR
	TAY
	TXA
	LSR
	LSR
	LSR
	LSR
	TAX
	SEP.b #$20
	LDA.w $0400,x
	AND.w DATA_85B9E9,y
	BNE.b CODE_85B98C
	LDA.w $0400,x
	ORA.w DATA_85B9E9,y
	STA.w $0400,x
	PLX
	LDA.b $96
	BEQ.b CODE_85B986
	CMP.b #$02
	BEQ.b CODE_85B97E
	LDA.b #$FF
	STA.w $0200,x
	JMP.w CODE_85B98B

CODE_85B97E:
	LDA.b #$08
	STA.w $0200,x
	JMP.w CODE_85B98B

CODE_85B986:
	LDA.b #$F0
	STA.w $0200,x
CODE_85B98B:
	RTS

CODE_85B98C:
	LDA.w $0400,x
	AND.w DATA_85B9ED,y
	STA.w $0400,x
	PLX
	JMP.w CODE_85B98B

;--------------------------------------------------------------------

CODE_85B999:
	LDA.w !ContextDependentTable,x
	CMP.w #$FFFF
	BEQ.b CODE_85B9AB
	STA.w $0200,y
	INX
	INX
	INY
	INY
	JMP.w CODE_85B999

CODE_85B9AB:
	RTS

;--------------------------------------------------------------------

CODE_85B9AC:
	PHY
	PHX
	SEP.b #$20
	JSR.w CODE_85B9BB
	PLX
	PLY
	JSR.w CODE_85B9D2
	REP.b #$20
	RTS

CODE_85B9BB:
	LDA.w !ContextDependentTable,x
	CMP.b #$FF
	BEQ.b CODE_85B9D1
	SEC
	SBC.b $60
	STA.w $0200,y
	JSR.w CODE_85B940
	JSR.w CODE_85B945
	JMP.w CODE_85B9BB

CODE_85B9D1:
	RTS

;--------------------------------------------------------------------

CODE_85B9D2:
	LDA.w $0001,x
	CMP.b #$FF
	BEQ.b CODE_85B9E8
	SEC
	SBC.b $61
	STA.w $0201,y
	JSR.w CODE_85B940
	JSR.w CODE_85B945
	JMP.w CODE_85B9D2

CODE_85B9E8:
	RTS

;--------------------------------------------------------------------

DATA_85B9E9:
	db $01,$04,$10,$40

DATA_85B9ED:
	db $FE,$FB,$EF,$BF

;--------------------------------------------------------------------

CODE_85B9F1:
	INC.b $77
	LDA.b $77
	CMP.w #$0007
	BNE.b CODE_85BA15
	STZ.b $77
	LDA.w #$0006
	STA.b $7B
	LDX.b $79
	LDA.w DATA_859F19,x
	SEP.b #$20
	JSR.w CODE_85BA92
	REP.b #$20
	LDA.w #$14B3
	STA.b $70
	JSR.w CODE_85BA81
CODE_85BA15:
	RTS

;--------------------------------------------------------------------

CODE_85BA16:
	REP.b #$20
	LDA.w #$12AB
	STA.b $70
	SEP.b #$20
	LDY.w #$0000
CODE_85BA22:
	LDX.w #$0000
	LDA.b $70
	STA.w !REGISTER_VRAMAddressLo
	LDA.b $71
	STA.w !REGISTER_VRAMAddressHi
	STZ.w !REGISTER_VRAMAddressIncrementValue
CODE_85BA32:
	LDA.b #$6F
	STA.w !REGISTER_WriteToVRAMPortLo
	INX
	CPX.w #$000C
	BEQ.b CODE_85BA40
	JMP.w CODE_85BA32

CODE_85BA40:
	REP.b #$20
	LDA.b $70
	CLC
	ADC.w #$0080
	STA.b $70
	SEP.b #$20
	INY
	CPY.w #$000C
	BNE.b CODE_85BA22
	REP.b #$20
	LDA.w #$0002
	STA.b $7B
	LDA.w #$060C
	STA.b $70
	JSR.w CODE_85994E
	LDA.w DATA_859FD3,x
	SEP.b #$20
	JSR.w CODE_85BA92
	REP.b #$20
	LDA.w #$0002
	STA.b $7B
	LDA.w #$0707
	STA.b $70
	LDA.w DATA_859FD9
	SEP.b #$20
	JSR.w CODE_85BA92
	REP.b #$20
	RTS

;--------------------------------------------------------------------

CODE_85BA80:
	RTS

;--------------------------------------------------------------------

CODE_85BA81:
	LDX.b $79
	INX
	INX
	STX.b $79
	CPX.w #$0004
	BEQ.b CODE_85BA8D
CODE_85BA8C:
	RTS

CODE_85BA8D:
	STZ.b $79
	JMP.w CODE_85BA8C

;--------------------------------------------------------------------

CODE_85BA92:
	TAX
	LDY.w #$0000
CODE_85BA96:
	LDA.b $70
	STA.w !REGISTER_VRAMAddressLo
	LDA.b $71
	STA.w !REGISTER_VRAMAddressHi
	LDA.b #$00
	STA.w !REGISTER_VRAMAddressIncrementValue
CODE_85BAA5:
	LDA.w !ContextDependentTable,x
	CMP.b #$FF
	BEQ.b CODE_85BAB3
	STA.w !REGISTER_WriteToVRAMPortLo
	INX
	JMP.w CODE_85BAA5

CODE_85BAB3:
	REP.b #$20
	LDA.w $0070
	CLC
	ADC.w #$0080
	STA.w $0070
	SEP.b #$20
	INX
	INY
	CPY.b $7B
	BNE.b CODE_85BA96
	RTS

;--------------------------------------------------------------------

CODE_85BAC8:
	PHB
	PHK
	PLB
	JSR.w CODE_8599AE
	PLB
	RTL

;--------------------------------------------------------------------

CODE_85BAD0:
	PHB
	PHK
	PLB
	LDY.w #$0000
	LDX.w #$0006
	STX.w $01A8
	LDA.w $18F0
	STA.w $0063
	JSR.w CODE_85B0B8
	LDA.w $18F2
	STA.w $0063
	JSR.w CODE_85B18B
	LDA.w $18F4
	STA.w $0063
	JSR.w CODE_85B4C4
	LDA.w $18F6
	STA.w $0063
	JSR.w CODE_85AF83
	LDA.w $18F8
	STA.w $0063
	JSR.w CODE_85B37F
	LDA.w $18FA
	STA.w $0063
	JSR.w CODE_85B602
	LDA.w $18FC
	STA.w $0063
	JSR.w CODE_85B781
	LDA.w $18FE
	STA.w $0063
	JSR.w CODE_85B26F
	LDA.w #$E0F8
	STA.w $0240
	STA.w $0254
	STA.w $0268
	STA.w $027C
	PLB
	RTL

;--------------------------------------------------------------------

CODE_85BB35:
	PHB
	PHK
	PLB
	LDY.w #DATA_85BE72
	JSL.l CODE_81CB98
	SEP.b #$30
	JSL.l CODE_84F38C
	JSR.w CODE_85BC14
	JSR.w CODE_85BC55
	REP.b #$30
	PLB
	RTL

;--------------------------------------------------------------------

CODE_85BB4F:
	PHB
	PHK
	PLB
	JSR.w CODE_8592F9
	JSR.w CODE_85C6A1
	LDA.b $80
	BEQ.b CODE_85BB8A
	LDA.b $9E
	ASL
	TAX
	JMP.w (DATA_85BB9E,x)

CODE_85BB63:
	JSR.w CODE_85BFC2
	JMP.w CODE_85BB9C

CODE_85BB69:
	JSR.w CODE_85C10A
	JMP.w CODE_85BB9C

CODE_85BB6F:
	JSR.w CODE_85C1C2
	JMP.w CODE_85BB9C

CODE_85BB75:
	JSR.w CODE_85C1FE
	JSR.w CODE_85C6AA
	LDA.w #$0200
	STA.b $3C
	JSR.w CODE_85C61A
	JSL.l CODE_81CB44
	JMP.w CODE_85BB9C

CODE_85BB8A:
	LDA.w #$0200
	STA.b $3C
	JSR.w CODE_85C592
	JSL.l CODE_81CB44
	JSR.w CODE_85C329
	JSR.w CODE_85C6ED
CODE_85BB9C:
	PLB
	RTL

DATA_85BB9E:
	dw CODE_85BB63
	dw CODE_85BB69
	dw CODE_85BB6F
	dw CODE_85BB75

;--------------------------------------------------------------------

DATA_85BBA6:
	dw CODE_85BBDE
	dw CODE_85BBE4
	dw CODE_85BBED
	dw CODE_85BBF3

CODE_85BBAE:
	PHB
	PHK
	PLB
	LDA.b $80
	BNE.b CODE_85BBC5
	LDA.b $8E
	BNE.b CODE_85BBBF
	JSR.w CODE_85C726
	JMP.w CODE_85BBFE

CODE_85BBBF:
	JSR.w CODE_85C741
	JMP.w CODE_85BBFE

CODE_85BBC5:
	LDA.b $80
	CMP.w #$0001
	BNE.b CODE_85BBD5
	INC.b $80
	SEP.b #$20
	LDA.b #$10
	STA.w !REGISTER_BG3AddressAndSize
CODE_85BBD5:
	REP.b #$30
	LDA.b $9E
	ASL
	TAX
	JMP.w (DATA_85BBA6,x)

CODE_85BBDE:
	JSR.w CODE_85C726
	JMP.w CODE_85BBFE

CODE_85BBE4:
	JSR.w CODE_85C726
	JSR.w CODE_85C78F
	JMP.w CODE_85BBFE

CODE_85BBED:
	JSR.w CODE_85C726
	JMP.w CODE_85BBFE

CODE_85BBF3:
	JSR.w CODE_85C726
	LDA.w $1904
	BEQ.b CODE_85BBFE
	JSR.w CODE_85C78F
CODE_85BBFE:
	SEP.b #$20
	LDA.b $7E
	STA.l !REGISTER_BG2HorizScrollOffset
	LDA.b $7F
	STA.l !REGISTER_BG2HorizScrollOffset
	REP.b #$20
	JSL.l CODE_81CB35
	PLB
	RTL

;--------------------------------------------------------------------

CODE_85BC14:
	REP.b #$30
	JSR.w CODE_85C42B
	LDA.w #$1D23
	STA.b $64
	LDA.w #$01A8
	STA.b $86
	LDA.w #$0027
	STA.b $72
	SEP.b #$30
	SEP.b #$20
	LDA.b #!BGModeAndTileSizeSetting_Mode01Enable|!BGModeAndTileSizeSetting_Mode01Layer3Priority
	STA.w !REGISTER_BGModeAndTileSizeSetting
	LDA.b #$16
	STA.w !REGISTER_MainScreenLayers
	LDA.b #$15
	STA.w !REGISTER_BG2AddressAndSize
	LDA.b #$1C
	STA.w !REGISTER_BG3AddressAndSize
	LDA.b #$22
	STA.w !REGISTER_BG1And2TileDataDesignation
	LDA.b #$00
	STA.w !REGISTER_BG3And4TileDataDesignation
	LDA.b #$80
	STA.w !REGISTER_VRAMAddressIncrementValue
	LDA.b #!SpriteGFXLocationInVRAMLo_4000|!SpriteGFXLocationInVRAMHi_Add1000|!SpriteSize_8x8_16x16
	STA.w !REGISTER_OAMSizeAndDataAreaDesignation
	RTS

;--------------------------------------------------------------------

CODE_85BC55:
	LDX.b #$18
	JSR.w CODE_858171
	LDX.b #$10
	JSR.w CODE_858171
	LDX.b #$04
	JSR.w CODE_858171
	LDX.b #$12
	JSR.w CODE_858171
	LDX.b #$14
	JSR.w CODE_858171
	LDX.b #$16
	JSR.w CODE_858171
	REP.b #$30
	LDA.w #$1C62
	STA.w !REGISTER_VRAMAddressLo
	LDX.w #$0000
	LDA.w #$202F
CODE_85BC81:
	STA.w !REGISTER_WriteToVRAMPortLo
	INX
	CPX.w #$0013
	BNE.b CODE_85BC81
	LDA.w #$1C82
	STA.w !REGISTER_VRAMAddressLo
	LDX.w #$0000
	LDA.w #$202F
CODE_85BC96:
	STA.w !REGISTER_WriteToVRAMPortLo
	INX
	CPX.w #$0013
	BNE.b CODE_85BC96
	LDA.w #$1C6D
	STA.w !REGISTER_VRAMAddressLo
	LDX.w #$0000
CODE_85BCA8:
	LDA.w DATA_85BE24,x
	CMP.w #$FFFF
	BEQ.b CODE_85BCB8
	STA.w !REGISTER_WriteToVRAMPortLo
	INX
	INX
	JMP.w CODE_85BCA8

CODE_85BCB8:
	LDA.w #$1C8D
	STA.w !REGISTER_VRAMAddressLo
	LDX.w #$0000
CODE_85BCC1:
	LDA.w DATA_85BE34,x
	CMP.w #$FFFF
	BEQ.b CODE_85BCD1
	STA.w !REGISTER_WriteToVRAMPortLo
	INX
	INX
	JMP.w CODE_85BCC1

CODE_85BCD1:
	LDA.w #$1CC2
	STA.w !REGISTER_VRAMAddressLo
	JSR.w CODE_85BD8D
	LDA.w #$1D02
	STA.w !REGISTER_VRAMAddressLo
	JSR.w CODE_85BD8D
	LDY.w #$0008
	LDA.w #$1CE8
	STA.w !REGISTER_VRAMAddressLo
	JSR.w CODE_85BD9D
	LDA.w #$1CF6
	STA.w !REGISTER_VRAMAddressLo
	JSR.w CODE_85BDAA
	LDA.w #$1CE3
	STA.w !REGISTER_VRAMAddressLo
	JSR.w CODE_85BDB8
	LDY.w #$0014
	LDA.w #$10E8
	STA.w !REGISTER_VRAMAddressLo
	JSR.w CODE_85BD9D
	LDA.w #$10F6
	STA.w !REGISTER_VRAMAddressLo
	JSR.w CODE_85BDAA
	LDA.w #$10E3
	STA.w !REGISTER_VRAMAddressLo
	JSR.w CODE_85BDB8
	LDA.w #$5000
	STA.w !REGISTER_VRAMAddressLo
	LDX.w #$0400
	JSL.l CODE_84FA79
	LDY.w #$0000
	JSR.w CODE_85BDD8
	LDX.w #$0000
	LDA.w #$00FF
	STA.w $0410
	LDY.w #$0000
	LDX.w #$0000
CODE_85BD41:
	LDA.w DATA_85BE68,x
	CMP.w #$FFFF
	BEQ.b CODE_85BD54
	STA.w $0300,y
	INX
	INX
	JSR.w CODE_85B945
	JMP.w CODE_85BD41

CODE_85BD54:
	LDX.w #$0000
	JSR.w CODE_85BD72
	SEP.b #$20
	LDA.b #$00
	STA.w !REGISTER_CGRAMAddress
	LDY.w #$0000
	LDX.w #$4200
CODE_85BD67:
	JSR.w CODE_859EC4
	CPY.w #$0200
	BNE.b CODE_85BD67
	SEP.b #$30
	RTS

CODE_85BD72:
	LDY.w #$0000
	LDA.w DATA_85BE44,x
	TAX
CODE_85BD79:
	LDA.w !ContextDependentTable,x
	CMP.w #$FFFF
	BEQ.b CODE_85BD8C
	STA.w $0302,y
	INX
	INX
	JSR.w CODE_85B945
	JMP.w CODE_85BD79

CODE_85BD8C:
	RTS

CODE_85BD8D:
	LDX.w #$0000
	LDA.w #$289E
CODE_85BD93:
	STA.w !REGISTER_WriteToVRAMPortLo
	INX
	CPX.w #$001C
	BNE.b CODE_85BD93
	RTS

CODE_85BD9D:
	LDA.w !RAM_SMK_Global_RaceCup
	ASL
	TAX
	LDA.w DATA_85BEC4,x
	TAX
	JSR.w CODE_85BDC4
	RTS

CODE_85BDAA:
	LDA.w !RAM_SMK_Global_CurrentRound
	DEC
	ASL
	TAX
	LDA.w DATA_85BF26,x
	TAX
	JSR.w CODE_85BDC4
	RTS

CODE_85BDB8:
	LDA.w $0030
	TAX
	LDA.w DATA_85BFA0,x
	TAX
	JSR.w CODE_85BDC4
	RTS

CODE_85BDC4:
	LDA.w !ContextDependentTable,x
	ORA.w DATA_85C2FD,y
	CMP.w #$FFFF
	BEQ.b CODE_85BDD7
	STA.w !REGISTER_WriteToVRAMPortLo
	INX
	INX
	JMP.w CODE_85BDC4

CODE_85BDD7:
	RTS

CODE_85BDD8:
	LDA.w #$AAAA
	STA.w $0412
	LDX.w #$0000
CODE_85BDE1:
	LDA.w DATA_85BF7C,y
	STA.w $0320,x
	JSR.w CODE_85B940
	INY
	INY
	CPX.w #$0018
	BNE.b CODE_85BDE1
	LDY.w #$0000
	LDA.w !RAM_SMK_Global_RaceCup
	CMP.w #!Define_SMK_RaceCup_SpecialCup
	BEQ.b CODE_85BE0D
	ASL
	TAX
	LDA.w DATA_85BF94,x
CODE_85BE01:
	STA.w $0322,y
	JSR.w CODE_85B945
	CPY.w #$0018
	BNE.b CODE_85BE01
	RTS

CODE_85BE0D:
	LDX.w #$0000
	LDY.w #$0000
CODE_85BE13:
	LDA.w DATA_85BF94,x
	STA.w $0322,y
	INX
	INX
	JSR.w CODE_85B945
	CPY.w #$0018
	BNE.b CODE_85BE13
	RTS

;--------------------------------------------------------------------

DATA_85BE24:
	dw $3462,$3448,$3464,$3468,$347C,$3466,$3464,$FFFF

DATA_85BE34:
	dw $3463,$3449,$3465,$3469,$3457,$3467,$3465,$FFFF

DATA_85BE44:
	dw DATA_85BE4A,DATA_85BE54,DATA_85BE5E

DATA_85BE4A:
	dw $2000,$2004,$2002,$2006,$FFFF

DATA_85BE54:
	dw $2008,$200C,$200A,$200E,$FFFF

DATA_85BE5E:
	dw $2020,$2024,$2022,$2026,$FFFF

DATA_85BE68:
	dw $9830,$A830,$9840,$A840,$FFFF
	
DATA_85BE72:
	dw $1000,$0130,$00C0,$C000
	dw $1100,$0130,$00C1,$C000
	dw $1200,$0130,$00C0,$C000
	dw $1300,$0130,$00C1,$C000
	dw $1400,$0130,$00C0,$C000
	dw $1500,$0130,$00C1,$C000
	dw $1600,$0130,$00C0,$C000
	dw $1700,$0130,$00C1,$C000
	dw $0000

DATA_85BEB4:
	dw $0009,$0006,$0003,$0001,$0000,$0000,$0000,$0000

DATA_85BEC4:
	dw DATA_85BECC,DATA_85BEE6,DATA_85BEFC,DATA_85BF0E

DATA_85BECC:
	dw $2016,$201E,$201C,$2011,$201B,$2018,$2018,$2016
	dw $202F,$200C,$201E,$2019,$FFFF

DATA_85BEE6:
	dw $200F,$2015,$2018,$2020,$200E,$201B,$202F,$200C
	dw $201E,$2019,$FFFF

DATA_85BEFC:
	dw $201C,$201D,$200A,$201B,$202F,$200C,$201E,$2019
	dw $FFFF

DATA_85BF0E:
	dw $201C,$2019,$200E,$200C,$2012,$200A,$2015
	dw $202F,$200C,$201E,$2019,$FFFF

DATA_85BF26:
	dw DATA_85BF30,DATA_85BF40,DATA_85BF50,DATA_85BF60,DATA_85BF70

DATA_85BF30:
	dw $201B,$2018,$201E,$2017,$200D,$202F,$2001,$FFFF

DATA_85BF40:
	dw $201B,$2018,$201E,$2017,$200D,$202F,$2002,$FFFF

DATA_85BF50:
	dw $201B,$2018,$201E,$2017,$200D,$202F,$2003,$FFFF

DATA_85BF60:
	dw $201B,$2018,$201E,$2017,$200D,$202F,$2004,$FFFF

DATA_85BF70:
	dw $200F,$2012,$2017,$200A,$2015,$FFFF

DATA_85BF7C:
	dw $1830,$1840,$1850,$18A8,$18B8,$18C8,$1820,$1830
	dw $1840,$18A8,$18B8,$18C8

DATA_85BF94:
	dw $2B06,$290A,$2908,$2908,$290A,$2B06

DATA_85BFA0:
	dw DATA_85BFA6,DATA_85BFAE,DATA_85BFB8

DATA_85BFA6:
	dw $2005,$2000,$202A,$FFFF

DATA_85BFAE:
	dw $2001,$2000,$2000,$202A,$FFFF

DATA_85BFB8:
	dw $2001,$2005,$2000,$202A,$FFFF

;--------------------------------------------------------------------

CODE_85BFC2:
	LDA.b $66
	CMP.w #$0010
	BEQ.b CODE_85BFE2
	JSR.w CODE_85C426
	CMP.w #$0004
	BNE.b CODE_85BFE1
	STZ.b $68
	JSR.w CODE_85BFEF
	JSR.w CODE_85C0AD
	LDA.b $66
	CLC
	ADC.w #$0002
	STA.b $66
CODE_85BFE1:
	RTS

CODE_85BFE2:
	INC.b $9E
	LDA.w #$0010
	STA.b $66
	JSR.w CODE_85C10A
	JMP.w CODE_85BFE1

CODE_85BFEF:
	JSR.w CODE_85C42B
	LDX.b $66
	JSR.w CODE_85C43C
	LDA.b $64
	SEC
	SBC.w #$0BFE
	STA.b $64
CODE_85BFFF:
	LDX.b $66
	LDY.w #$0000
	LDA.w $18D0,x
	TAX
	LDA.w DATA_85C23B,x
	STA.w $0180,y
	LDY.w #$0004
	LDX.b $66
	LDA.w $0F70,x
	TAX
	LDA.b $12,x
	TAX
	JSR.w CODE_85C443
CODE_85C01D:
	JSR.w CODE_85C45A
	CPY.w #$0028
	BNE.b CODE_85C01D
	LDX.b $66
	LDA.w $0F70,x
	TAX
	LDA.b $F0,x
	STA.w !REGISTER_DividendLo
	LDA.w #$000A
	STA.w !REGISTER_Divisor
	NOP #8
	LDA.w !REGISTER_QuotientLo
	ASL
	TAX
	LDA.w DATA_85C227,x
	STA.w $0180,y
	INY
	INY
	LDA.w !REGISTER_ProductOrRemainderLo
	ASL
	TAX
	LDA.w DATA_85C227,x
	STA.w $0180,y
CODE_85C056:
	LDA.b $2E
	CMP.w #$0004
	BEQ.b CODE_85C06A
	LDX.b $66
	LDA.w $0F70,x
	CMP.w #$1000
	BNE.b CODE_85C07F
	JMP.w CODE_85C074

CODE_85C06A:
	LDX.b $66
	LDA.w $0F70,x
	CMP.w #$1100
	BNE.b CODE_85C07F
CODE_85C074:
	LDX.w #$0010
	JSR.w CODE_85C099
	LDX.b $66
	JSR.w CODE_85C468
CODE_85C07F:
	LDA.b $2E
	BNE.b CODE_85C098
	LDX.b $66
	LDA.w $0F70,x
	CMP.w #$1100
	BNE.b CODE_85C098
	LDX.w #$0012
	JSR.w CODE_85C099
	LDX.b $66
	JSR.w CODE_85C47F
CODE_85C098:
	RTS

;--------------------------------------------------------------------

CODE_85C099:
	LDY.w #$0000
CODE_85C09C:
	LDA.w $0180,y
	ORA.w DATA_85C2FD,x
	STA.w $0180,y
	INY
	INY
	CPY.w #$0034
	BNE.b CODE_85C09C
	RTS

CODE_85C0AD:
	LDX.b $66
	LDA.w $0F70,x
	TAX
	LDA.b $C0,x
	BEQ.b CODE_85C0BE
	LDA.b $F6,x
	CMP.w #$FFFF
	BNE.b CODE_85C0C6
CODE_85C0BE:
	LDA.w #$000E
	STA.b $92
	JMP.w CODE_85C109

CODE_85C0C6:
	LDY.w #$0000
	LDX.b $66
CODE_85C0CB:
	LDA.w $0F70,x
	CMP.w $010E,y
	BEQ.b CODE_85C0D8
	INY
	INY
	JMP.w CODE_85C0CB

CODE_85C0D8:
	CPY.w #$0008
	BCS.b CODE_85C109
	LDA.w DATA_85BEB4,y
	ASL
	TAX
	LDY.w #$0030
	LDA.w DATA_85C227,x
	STA.w $0180,y
	LDY.w #$002C
	LDA.w #$207D
	STA.w $0180,y
	LDY.w #$002E
	LDA.w #$207E
	STA.w $0180,y
	LDY.w #$0032
	LDA.w #$607D
	STA.w $0180,y
	JSR.w CODE_85C056
CODE_85C109:
	RTS

;--------------------------------------------------------------------

CODE_85C10A:
	LDA.b $98
	BNE.b CODE_85C15B
	JSR.w CODE_85C42B
	LDA.b $66
	BEQ.b CODE_85C17C
	SEC
	SBC.w #$0002
	STA.b $66
	TAX
	LDA.w $0F70,x
	STA.b $90
	LDX.b $66
	JSR.w CODE_85C43C
	LDA.b $64
	SEC
	SBC.w #$0BFE
	STA.b $64
	LDX.b $90
	LDA.b $C0,x
	BEQ.b CODE_85C13B
	LDA.b $F6,x
	CMP.w #$FFFF
	BNE.b CODE_85C145
CODE_85C13B:
	LDA.w #$000E
	STA.b $92
	STZ.b $88
	JMP.w CODE_85C1BB

CODE_85C145:
	LDY.w #$0000
CODE_85C148:
	LDA.w $010E,y
	CMP.b $90
	BEQ.b CODE_85C154
	INY
	INY
	JMP.w CODE_85C148

CODE_85C154:
	STY.b $92
	INC.b $98
	JMP.w CODE_85C1BB

CODE_85C15B:
	INC.b $9C
	LDA.b $9C
	CMP.w #$0006
	BNE.b CODE_85C1C1
	STZ.b $9C
	LDX.b $92
	LDA.b $9A
	CMP.w DATA_85BEB4,x
	BNE.b CODE_85C184
	STZ.b $98
	STZ.b $9A
	LDA.b $66
	BNE.b CODE_85C1BB
	STZ.b $88
	JMP.w CODE_85C1BB

CODE_85C17C:
	INC.b $9E
	STZ.b $66
	JSR.w CODE_85C1D3
	RTS

CODE_85C184:
	LDA.b $66
	LDX.b $90
	LDA.b $F0,x
	INC
	STA.b $F0,x
	INC.b $9A
	LDA.w $002E
	CMP.w #$0004
	BNE.b CODE_85C1A1
	LDA.b $90
	CMP.w #$1100
	BEQ.b CODE_85C1B4
	JMP.w CODE_85C1BB

CODE_85C1A1:
	LDA.b $90
	CMP.w #$1000
	BEQ.b CODE_85C1B4
	LDA.w $002E
	BNE.b CODE_85C1BB
	LDA.b $90
	CMP.w #$1100
	BNE.b CODE_85C1BB
CODE_85C1B4:
	LDA.w #$0020
	JSL.l CODE_81F5A7
CODE_85C1BB:
	JSR.w CODE_85BFFF
	JSR.w CODE_85C0AD
CODE_85C1C1:
	RTS

;--------------------------------------------------------------------

CODE_85C1C2:
	LDA.b $66
	CMP.w #$0010
	BEQ.b CODE_85C1EE
	JSR.w CODE_85C426
	CMP.w #$0006
	BNE.b CODE_85C1ED
	STZ.b $68
CODE_85C1D3:
	LDX.b $66
	JSR.w CODE_85C42B
	LDX.b $66
	JSR.w CODE_85C43C
	LDA.b $64
	SEC
	SBC.w #$0BFE
	STA.b $64
	LDA.b $66
	CLC
	ADC.w #$0002
	STA.b $66
CODE_85C1ED:
	RTS

CODE_85C1EE:
	JSR.w CODE_85C496
	JSR.w CODE_85C512
	STZ.b $68
	INC.b $9E
	LDA.w #$000E
	STA.b $66
	RTS

;--------------------------------------------------------------------

CODE_85C1FE:
	JSR.w CODE_85C426
	CMP.w #$0006
	BNE.b CODE_85C1ED
	STZ.b $68
	LDA.w $1980
	CMP.w #$000F
	BEQ.b CODE_85C213
	INC.w $1980
CODE_85C213:
	JSR.w CODE_85BFEF
	LDA.b $66
	BEQ.b CODE_85C221
	SEC
	SBC.w #$0002
	STA.b $66
CODE_85C220:
	RTS

CODE_85C221:
	INC.w $1904
	JMP.w CODE_85C220

;--------------------------------------------------------------------

DATA_85C227:
	dw $2000,$2001,$2002,$2003,$2004,$2005,$2006,$2007
	dw $2008,$2009

DATA_85C23B:
	dw $2001,$2002,$2003,$2004,$2005,$2006,$2007,$2008

DATA_85C24B:
	dw $1D43,$1D83,$1DC3,$1E03,$1E43,$1E83,$1EC3,$1F03

DATA_85C25B:
	dw DATA_85C277,DATA_85C283,DATA_85C28F,DATA_85C29D,DATA_85C2AF,DATA_85C2CD,DATA_85C2E7,DATA_85C2F1

DATA_85C26B:
	dw $202F,$202F,$2018,$201E,$201D,$FFFF

DATA_85C277:
	dw $2016,$200A,$201B,$2012,$2018,$FFFF

DATA_85C283:
	dw $2015,$201E,$2012,$2010,$2012,$FFFF

DATA_85C28F:
	dw $200B,$2018,$2020,$201C,$200E,$201B,$FFFF

DATA_85C29D:
	dw $2019,$201B,$2012,$2017,$200C,$200E,$201C,$201C
	dw $FFFF

DATA_85C2AF:
	dw $200D,$2018,$2017,$2014,$200E,$2022,$202F,$2014
	dw $2018,$2017,$2010,$202F,$2013,$201B,$FFFF

DATA_85C2CD:
	dw $2014,$2018,$2018,$2019,$200A,$202F,$201D,$201B
	dw $2018,$2018,$2019,$200A,$FFFF

DATA_85C2E7:
	dw $201D,$2018,$200A,$200D,$FFFF

DATA_85C2F1:
	dw $2022,$2018,$201C,$2011,$2012,$FFFF

DATA_85C2FD:
	dw $0C00,$1000,$1800,$1400,$0800,$0800,$0800,$0800
	dw $0400,$0800,$0000,$0C00,$E3FF,$FFFF

DATA_85C319:
	dw $1000,$1100,$1200,$1300,$1400,$1500,$1600,$1700

CODE_85C329:
	LDA.w $0048
	BEQ.b CODE_85C32F
CODE_85C32E:
	RTS

CODE_85C32F:
	JSR.w CODE_85C426
	CMP.w #$0009
	BNE.b CODE_85C32E
	STZ.b $68
	LDA.b $8E
	BNE.b CODE_85C32E
	LDA.b $66
	CMP.w #$0010
	BNE.b CODE_85C346
	INC.b $8E
CODE_85C346:
	LDA.b $8E
	BNE.b CODE_85C32E
	JSR.w CODE_85C42B
	LDX.b $66
	JSR.w CODE_85C43C
	LDX.b $66
	LDY.w #$0000
	LDA.w DATA_85C23B,x
	STA.w $0180,y
	JSR.w CODE_85B945
	PHY
	LDX.b $66
	LDA.w $010E,x
	TAX
	LDA.b $12,x
	TAX
	PLY
	JSR.w CODE_85C443
CODE_85C36E:
	JSR.w CODE_85C45A
	CPY.w #$0022
	BNE.b CODE_85C36E
	INY
	INY
	LDX.b $66
	LDA.w $010E,x
	TAX
	LDA.b $C0,x
	BEQ.b CODE_85C3CE
	LDA.b $F6,x
	CMP.w #$FFFF
	BEQ.b CODE_85C3CE
	INY
	INY
	JSR.w CODE_85C3C5
	LDA.w #$2028
	JSR.w CODE_85C3C5
	LDA.b $F4,x
	AND.w #$00F0
	LSR
	LSR
	LSR
	LSR
	JSR.w CODE_85C3C5
	LDA.b $F4,x
	AND.w #$000F
	JSR.w CODE_85C3C5
	LDA.w #$2029
	JSR.w CODE_85C3C5
	LDA.b $F3,x
	AND.w #$00F0
	LSR
	LSR
	LSR
	LSR
	JSR.w CODE_85C3C5
	LDA.b $F3,x
	AND.w #$000F
	JSR.w CODE_85C3C5
	JMP.w CODE_85C3E3

CODE_85C3C5:
	ORA.w #$2000
	STA.w $0180,y
	INY
	INY
	RTS

CODE_85C3CE:
	LDX.w #$0000
CODE_85C3D1:
	INY
	INY
	LDA.w DATA_85C26B,x
	CMP.w #$FFFF
	BEQ.b CODE_85C3E3
	STA.w $0180,y
	INX
	INX
	JMP.w CODE_85C3D1

CODE_85C3E3:
	LDX.b $66
	JSR.w CODE_85C099
	LDA.w $002E
	CMP.w #$0004
	BNE.b CODE_85C3FD
	LDX.b $66
	LDA.w $010E,x
	CMP.w #$1100
	BEQ.b CODE_85C41A
	JMP.w CODE_85C416

CODE_85C3FD:
	LDX.b $66
	LDA.w $010E,x
	CMP.w #$1000
	BEQ.b CODE_85C41A
	LDA.w $002E
	BNE.b CODE_85C416
	LDX.b $66
	LDA.w $010E,x
	CMP.w #$1100
	BEQ.b CODE_85C420
CODE_85C416:
	JSR.w CODE_85C463
	RTS

CODE_85C41A:
	JSR.w CODE_85C468
	JMP.w CODE_85C416

CODE_85C420:
	JSR.w CODE_85C47F
	JMP.w CODE_85C416

CODE_85C426:
	INC.b $68
	LDA.b $68
	RTS

CODE_85C42B:
	LDY.w #$0000
	LDA.w #$202F
CODE_85C431:
	STA.w $0180,y
	INY
	INY
	CPY.w #$0080
	BNE.b CODE_85C431
	RTS

CODE_85C43C:
	LDA.w DATA_85C24B,x
	STA.w $0064
	RTS

CODE_85C443:
	LDA.w DATA_85C25B,x
	TAX
CODE_85C447:
	LDA.w !ContextDependentTable,x
	CMP.w #$FFFF
	BEQ.b CODE_85C459
	STA.w $0180,y
	INX
	INX
	INY
	INY
	JMP.w CODE_85C447

CODE_85C459:
	RTS

CODE_85C45A:
	INY
	INY
	LDA.w #$20A4
	STA.w $0180,y
	RTS

CODE_85C463:
	INC.b $66
	INC.b $66
	RTS

CODE_85C468:
	LDA.w DATA_85C24B,x
	STA.w $008A
	LDX.w #$0000
CODE_85C471:
	LDA.w $0180,x
	STA.w $1800,x
	INX
	INX
	CPX.w #$0034
	BNE.b CODE_85C471
	RTS

CODE_85C47F:
	LDA.w DATA_85C24B,x
	STA.w $008C
	LDX.w #$0000
CODE_85C488:
	LDA.w $0180,x
	STA.w $1840,x
	INX
	INX
	CPX.w #$0034
	BNE.b CODE_85C488
	RTS

CODE_85C496:
	STZ.w $1906
	STZ.b $66
	STZ.w $190A
	LDA.w #$002D
	STA.w $1908
CODE_85C4A4:
	LDX.b $66
	LDA.w $0F70,x
	TAX
	LDA.b $F0,x
	CMP.w $1908
	BEQ.b CODE_85C4C7
CODE_85C4B1:
	LDA.b $66
	INC
	INC
	CMP.w #$0010
	BEQ.b CODE_85C4BF
	STA.b $66
	JMP.w CODE_85C4A4

CODE_85C4BF:
	DEC.w $1908
	STZ.b $66
	JMP.w CODE_85C4A4

CODE_85C4C7:
	LDX.b $66
	LDA.w $0F70,x
	LDX.w $1906
	STA.w $18C0,x
	LDX.w $1906
	DEX
	DEX
	BMI.b CODE_85C4F3
	LDA.w $18C0,x
	TAX
	LDA.b $F0,x
	CMP.w $1908
	BEQ.b CODE_85C4F3
	LDX.w $1906
	LDA.w $1906
	STA.w $190A
	STA.w $18D0,x
	JMP.w CODE_85C4FC

CODE_85C4F3:
	LDX.w $1906
	LDA.w $190A
	STA.w $18D0,x
CODE_85C4FC:
	LDA.w $1906
	CLC
	ADC.w #$0002
	CMP.w #$0010
	BEQ.b CODE_85C50E
	STA.w $1906
	JMP.w CODE_85C4B1

CODE_85C50E:
	JSR.w CODE_85C581
	RTS

CODE_85C512:
	LDX.w #$0000
	LDA.w $002E
	BEQ.b CODE_85C539
	CMP.w #$0004
	BEQ.b CODE_85C52C
CODE_85C51F:
	LDA.w $18C0,x
	CMP.w #$1000
	BEQ.b CODE_85C54B
	INX
	INX
	JMP.w CODE_85C51F

CODE_85C52C:
	LDA.w $18C0,x
	CMP.w #$1100
	BEQ.b CODE_85C54B
	INX
	INX
	JMP.w CODE_85C52C

CODE_85C539:
	LDA.w $18C0,x
	CMP.w #$1000
	BEQ.b CODE_85C54B
	CMP.w #$1100
	BEQ.b CODE_85C54B
	INX
	INX
	JMP.w CODE_85C539

CODE_85C54B:
	STA.w $190C
	STX.w $190A
	LDA.w $18D0,x
	STA.w $1908
	LDX.w #$0000
CODE_85C55A:
	LDA.w $18D0,x
	CMP.w $1908
	BEQ.b CODE_85C56C
	INX
	INX
	CPX.w #$0010
	BNE.b CODE_85C55A
	JMP.w CODE_85C57D

CODE_85C56C:
	LDA.w $18C0,x
	PHA
	LDA.w $190C
	STA.w $18C0,x
	LDX.w $190A
	PLA
	STA.w $18C0,x
CODE_85C57D:
	JSR.w CODE_85C581
	RTS

CODE_85C581:
	LDX.w #$0000
CODE_85C584:
	LDA.w $18C0,x
	STA.w $0F70,x
	INX
	INX
	CPX.w #$0010
	BNE.b CODE_85C584
	RTS

;--------------------------------------------------------------------

CODE_85C592:
	LDA.w #$0008
	STA.b $70
CODE_85C597:
	LDX.b $70
	LDA.w $010E,x
	TAX
	LDA.b $12,x
	JSR.w CODE_85C644
	LDX.b $70
	INX
	INX
	CPX.w #$0010
	BEQ.b CODE_85C5B0
	STX.b $70
	JMP.w CODE_85C597

CODE_85C5B0:
	STZ.b $70
	LDX.b $74
	LDA.w $010E,x
	TAX
	JSR.w CODE_85C652
	INC.b $72
	LDA.b $72
	CMP.w #$0028
	BNE.b CODE_85C5DB
	STZ.b $72
	LDX.b $6E
	LDA.w $010E,x
	TAX
	JSR.w CODE_85C66E
	LDX.w #$1000
	JSR.w CODE_85C68B
	LDX.w #$1100
	JSR.w CODE_85C68B
CODE_85C5DB:
	INC.b $84
	LDA.b $84
	CMP.w #$0004
	BNE.b CODE_85C5F8
	STZ.b $84
	LDX.b $82
	JSR.w CODE_85BD72
	LDX.b $82
	INX
	INX
	STX.b $82
	CPX.w #$0006
	BNE.b CODE_85C5F8
	STZ.b $82
CODE_85C5F8:
	LDA.w #$0001
	STA.b $96
	LDX.w #$0100
	SEP.b #$20
CODE_85C602:
	DEC.w $0200,x
	LDA.w $0200,x
	CMP.b #$FF
	BNE.b CODE_85C60F
	JSR.w CODE_85B94A
CODE_85C60F:
	JSR.w CODE_85B940
	CPX.w #$0110
	BNE.b CODE_85C602
	REP.b #$20
	RTS

;--------------------------------------------------------------------

CODE_85C61A:
	LDX.b $74
	LDA.w $0F70,x
	TAX
	JSR.w CODE_85C652
	INC.b $72
	LDA.b $72
	CMP.w #$0028
	BNE.b CODE_85C643
	STZ.b $72
	LDX.b $6E
	LDA.w $0F70,x
	TAX
	JSR.w CODE_85C66E
	LDX.w #$1000
	JSR.w CODE_85C68B
	LDX.w #$1100
	JSR.w CODE_85C68B
CODE_85C643:
	RTS

;--------------------------------------------------------------------

CODE_85C644:
	TAX
	LDA.w DATA_85C319,x
	TAX
	LDA.w #$0800
	CLC
	ADC.b $2A,x
	STA.b $2A,x
	RTS

;--------------------------------------------------------------------

CODE_85C652:
	LDA.b $1C,x
	CMP.w #$00C0
	BNE.b CODE_85C65D
	INC
	JMP.w CODE_85C65E

CODE_85C65D:
	DEC
CODE_85C65E:
	STA.b $1C,x
	INC.b $74
	INC.b $74
	LDA.b $74
	CMP.w #$0010
	BNE.b CODE_85C66D
	STZ.b $74
CODE_85C66D:
	RTS

;--------------------------------------------------------------------

CODE_85C66E:
	LDA.b $12,x
	TAX
	LDA.w DATA_85C319,x
	TAX
	LDA.w #$FF00
	STA.b $22,x
	LDX.b $6E
	INX
	INX
	CPX.w #$0010
	BEQ.b CODE_85C688
	STX.b $6E
	JMP.w CODE_85C68A

CODE_85C688:
	STZ.b $6E
CODE_85C68A:
	RTS

;--------------------------------------------------------------------

CODE_85C68B:
	LDA.w $00E2,x
	AND.w #$4000
	BEQ.b CODE_85C6A0
	LDA.w $0012,x
	TAX
	LDA.w DATA_85C319,x
	TAX
	LDA.w #$0002
	STA.b $92,x
CODE_85C6A0:
	RTS

;--------------------------------------------------------------------

CODE_85C6A1:
	LDA.b $7E
	SEC
	SBC.w #$0001
	STA.b $7E
	RTS

;--------------------------------------------------------------------

CODE_85C6AA:
	LDA.w $1980
	CMP.w #$000F
	BNE.b CODE_85C6BB
	LDA.b $6A
	ORA.b $6C
	AND.w #$9000
	BNE.b CODE_85C6BC
CODE_85C6BB:
	RTS

CODE_85C6BC:
	LDA.w !RAM_SMK_Global_CurrentRound
	CMP.w #$0005
	BNE.b CODE_85C6DE
	JSR.w CODE_85994E
	CPX.w #$0006
	BCC.b CODE_85C6D2
	LDA.w #$0001
	STA.w $190E
CODE_85C6D2:
	LDA.w #$0018
	JMP.w CODE_85C6E1

CODE_85C6D8:
	LDA.w #$0008
	JMP.w CODE_85C6E1

CODE_85C6DE:
	LDA.w #$0002
CODE_85C6E1:
	STA.b $32
	LDA.w #$8F00
	STA.b $48
	JSL.l $81F4B2
	RTS

;--------------------------------------------------------------------

CODE_85C6ED:
	LDA.b $8E
	CMP.w #$0001
	BNE.b CODE_85C6FD
	LDA.b $6A
	ORA.b $6C
	AND.w #$9000
	BNE.b CODE_85C6FE
CODE_85C6FD:
	RTS

CODE_85C6FE:
	JSL.l CODE_84F419
	REP.b #$30
	LDY.w #DATA_85BE72
	JSL.l CODE_81CB98
	LDA.w #$0027
	STA.b $72
	LDA.w #$1125
	STA.b $64
	LDA.w #$0001
	STA.b $80
	LDY.w #$000C
	JSR.w CODE_85BDD8
	JSR.w CODE_85C496
	STZ.b $66
	RTS

;--------------------------------------------------------------------

CODE_85C726:
	LDA.w $0048
	BNE.b CODE_85C740
	LDA.b $64
	STA.w !REGISTER_VRAMAddressLo
	LDX.w #$0000
CODE_85C733:
	LDA.w $0180,x
	STA.w !REGISTER_WriteToVRAMPortLo
	INX
	INX
	CPX.w #$0034
	BNE.b CODE_85C733
CODE_85C740:
	RTS

;--------------------------------------------------------------------

CODE_85C741:
	INC.b $88
	LDA.b $88
	CMP.w #$0006
	BCS.b CODE_85C750
	LDY.w #$0018
	JMP.w CODE_85C75A

CODE_85C750:
	LDY.w #$001A
	CMP.w #$000A
	BNE.b CODE_85C75A
	STZ.b $88
CODE_85C75A:
	LDA.b $8A
	STA.w !REGISTER_VRAMAddressLo
	LDX.w #$0000
CODE_85C762:
	LDA.w $1800,x
	AND.w DATA_85C2FD,y
	STA.w !REGISTER_WriteToVRAMPortLo
	INX
	INX
	CPX.w #$0034
	BNE.b CODE_85C762
	LDA.b $2E
	BNE.b CODE_85C78E
	LDA.b $8C
	STA.w !REGISTER_VRAMAddressLo
	LDX.w #$0000
CODE_85C77E:
	LDA.w $1840,x
	AND.w DATA_85C2FD,y
	STA.w !REGISTER_WriteToVRAMPortLo
	INX
	INX
	CPX.w #$0034
	BNE.b CODE_85C77E
CODE_85C78E:
	RTS

;--------------------------------------------------------------------

CODE_85C78F:
	INC.b $88
	LDA.b $88
	CMP.w #$0006
	BCS.b CODE_85C79E
	LDY.w #$0014
	JMP.w CODE_85C7A8

CODE_85C79E:
	LDY.w #$0016
	CMP.w #$000A
	BNE.b CODE_85C7A8
	STZ.b $88
CODE_85C7A8:
	LDA.b $8A
	SEC
	SBC.w #$0BFE
	STA.w !REGISTER_VRAMAddressLo
	LDX.w #$0000
CODE_85C7B4:
	LDA.w $1800,x
	ORA.w DATA_85C2FD,y
	STA.w !REGISTER_WriteToVRAMPortLo
	INX
	INX
	CPX.w #$0034
	BNE.b CODE_85C7B4
	LDA.b $2E
	BNE.b CODE_85C7E4
	LDA.b $8C
	SEC
	SBC.w #$0BFE
	STA.w !REGISTER_VRAMAddressLo
	LDX.w #$0000
CODE_85C7D4:
	LDA.w $1840,x
	ORA.w DATA_85C2FD,y
	STA.w !REGISTER_WriteToVRAMPortLo
	INX
	INX
	CPX.w #$0034
	BNE.b CODE_85C7D4
CODE_85C7E4:
	RTS

	%FREE_BYTES(NULLROM, 27, $00)

;--------------------------------------------------------------------

DATA_85C800:
	dw $10B8,$10C8,$0821,$0959,$15F0,$17ED,$1CEF,$1D6B
	dw $2AB6,$2AB8,$2ABA,$2ABC,$3A19,$37D4,$35C6,$35BD
	dw $799D,$65E2,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

.DATA_85C840:
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

.DATA_85C880:
	dw $1416,$151C,$190B,$131F,$3AA7,$3A1D,$369A,$3C2C
	dw $0D5F,$0FE3,$0D3B,$10B8,$39EB,$39E5,$3973,$37F0
	dw $26D4,$2756,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

.DATA_85C8C0:
	dw $03C1,$0565,$05E5,$0341,$2C29,$2C28,$2C27,$2C26
	dw $25E0,$2660,$26E0,$2560,$3DAD,$3CAD,$3BAD,$3B09
	dw $2BA3,$2285,$2308,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

.DATA_85C900:
	dw $0FAD,$0C29,$0E26,$0D21,$31B5,$362F,$3144,$34CE
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $AA12,$AA16,$AA14,$AA18,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

.DATA_85C940:
	dw $03CB,$01CB,$024B,$034B,$29EA,$28DC,$296A,$285C
	dw $3824,$3BA4,$3C24,$37A4,$2B88,$2B87,$2B86,$2B89
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

.DATA_85C980:
	dw $1F12,$2E90,$33D4,$1796,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

.DATA_85C9C0:
	dw $05A1,$0814,$0317,$079F,$27BF,$2A12,$2E20,$2E9E
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $2783,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

.DATA_85CA00:
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

.DATA_85CA40:
	dw $03AB,$04AB,$05AB,$02AB,$199B,$1A92,$259A,$2F17
	dw $18B7,$18B6,$18B8,$18B5,$2870,$2871,$3558,$394E
	dw $2A6A,$351F,$42C2,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

.DATA_85CA80:
	dw $1528,$2293,$1698,$0A91,$03C2,$0252,$0559,$06CA
	dw $1DE9,$1F62,$22DC,$226C,$3798,$3E17,$3786,$3156
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

.DATA_85CAC0:
	dw $043C,$09B5,$0B3F,$03C4,$1B50,$13C8,$1A40,$1556
	dw $35F3,$366B,$3665,$3470,$3B17,$3510,$3A9C,$3892
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

.DATA_85CB00:
	dw $1D72,$1AEC,$1868,$1AE5,$3329,$34A6,$3724,$339C
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $2D76,$2890,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

.DATA_85CB40:
	dw $14D4,$1FE6,$2F57,$2E12,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

.DATA_85CB80:
	dw $1A46,$1A2E,$16A0,$14AC,$0912,$0810,$070E,$060C
	dw $22BA,$21BA,$23BA,$24BA,$35E5,$36E5,$37E5,$3443
	dw $7140,$60BC,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

.DATA_85CBC0:
	dw $0ED5,$1053,$0A45,$15E8,$1C10,$1D93,$1EC4,$1FC6
	dw $3515,$3415,$3D16,$3D1A,$2A61,$2B61,$2861,$2961
	dw $27C8,$3051,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

.DATA_85CC00:
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

.DATA_85CC40:
	dw $0430,$0330,$0230,$0530,$359F,$371B,$3614,$3996
	dw $2038,$203A,$2036,$203C,$38D9,$3A55,$3BDA,$3CD6
	dw $42B1,$0977,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

.DATA_85CC80:
	dw $1817,$1B26,$102B,$13E9,$3556,$349A,$3E98,$3937
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

.DATA_85CCC0:
	dw $0432,$08B2,$08CC,$044C,$1CE9,$20E9,$19DC,$225C
	dw $1444,$12B5,$14AA,$1AB8,$3E9A,$3C90,$380A,$3287
	dw $1EEF,$44C4,$1F76,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

.DATA_85CD00:
	dw $BF1C,$E4BF,$1BE4,$BF1A,$E4EB,$11E4,$EB12,$E458
	dw $2BE4,$BB3C,$E4BB,$3BE4,$1A01,$9A19,$018F,$2201
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

.DATA_85CD40:
	dw $9B10,$0099,$100A,$4D39,$E430,$36E4,$3735,$E4C1
	dw $38E4,$CD37,$E4D2,$37E4,$0403,$C903,$03C6,$0403
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

.DATA_85CD80:
	dw $3E0B,$E410,$38E4,$103A,$E423,$33E4,$A335,$E4AF
	dw $34E4,$3931,$E4A6,$37E4,$2A58,$8828,$0234,$3A02
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

.DATA_85CDC0:
	dw $9F36,$1007,$1AE4,$1921,$E435,$22E4,$B923,$E43D
	dw $21E4,$4D22,$E452,$21E4,$0502,$3206,$0232,$0402
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

.DATA_85CE00:
	dw $430D,$E444,$0CE4,$480C,$E4BE,$0BE4,$3E2E,$E4C2
	dw $2DE4,$9B30,$E49D,$2EE4,$0302,$E603,$02CF,$0202
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

.DATA_85CE40:
	dw $183C,$E49A,$3AE4,$1738,$E414,$37E4,$113B,$E45A
	dw $39E4,$DA37,$E4E1,$37E4,$1B00,$8D1A,$008C,$1B00
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

.DATA_85CE80:
	dw $4C27,$1845,$1418,$C510,$1821,$1A18,$9219,$1812
	dw $1114,$E123,$1460,$2C14,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

.DATA_85CEC0:
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

.DATA_85CF00:
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

.DATA_85CF40:
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

.DATA_85CF80:
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

.DATA_85CFC0:
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

;--------------------------------------------------------------------

DATA_85D000:
	dw $0B08,$0030,$0C0B,$8700,$000C,$0D8C,$0900,$000E
	dw $0F06,$0C00,$000F,$1009,$8C00,$0011,$1086,$8800
	dw $E811,$32B8,$49E4,$DC33,$23B0,$AADC,$F023,$26D0
	dw $B3E4,$E820,$26B3,$6310,$F003,$26E0,$C310,$F031
	dw $0398,$8DE8,$E805,$114B,$F274,$7415,$17F0,$EC74
	dw $0018,$0D86,$0800,$EC0B,$1308,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF

.DATA_85D080:
	dw $1A03,$0306,$0497,$E303,$030B,$0DE7,$71EC,$EC1B
	dw $1B77,$F0EC,$EC1D,$1DF6,$F8EC,$F01D,$28DD,$DDF0
	dw $EC29,$2071,$77EC,$F020,$349E,$9EF0,$5435,$2A0D
	dw $8E08,$002F,$288E,$9E03,$0305,$089D,$A003,$0307
	dw $05A4,$9503,$0306,$071C,$8AE0,$0307,$08A3,$4774
	dw $7439,$3A49,$4B74,$743B,$3C4D,$3EF0,$F014,$153E
	dw $9803,$0307,$0621,$9C03,$FF04,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF

.DATA_85D100:
	dw $EE00,$0009,$0AF1,$F400,$000B,$0D75,$6F00,$000C
	dw $0CF2,$F300,$000E,$0FF6,$7000,$000E,$10F1,$47E4
	dw $E803,$02BF,$8AEC,$E01B,$0E4D,$53E8,$E40F,$0F47
	dw $0EF0,$F036,$2520,$20F0,$EC26,$1472,$DC74,$742B
	dw $2E5F,$DE74,$7422,$22DA,$F400,$0011,$12F1,$F3EC
	dw $FF18,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF

.DATA_85D180:
	dw $0F03,$0304,$0292,$06EC,$030B,$0514,$9103,$0305
	dw $0315,$9703,$0305,$0418,$9D03,$0305,$0318,$DAE0
	dw $E012,$1153,$4FE0,$E00F,$0FC8,$F1E4,$0103,$2DDC
	dw $3E0B,$EC25,$2F62,$D274,$743D,$3BCB,$BB74,$743B
	dw $3DBB,$AE74,$743D,$3BAE,$A074,$743C,$3B5A,$1203
	dw $0304,$041C,$9D03,$EC02,$0F85,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF

.DATA_85D200:
	dw $4502,$020B,$0DC0,$3D02,$020B,$0DBA,$B802,$020A
	dw $0BC1,$BC02,$020C,$0A3B,$C702,$020C,$0CC3,$E9EC
	dw $E817,$3813,$12E8,$E83A,$390C,$8AE8,$E834,$2C10
	dw $14E8,$742E,$3166,$E074,$7431,$32E3,$EA74,$7430
	dw $2EEC,$E874,$7433,$30E3,$E174,$0234,$0A43,$BA02
	dw $EC0B,$19ED,$27E8,$FF0D,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF

.DATA_85D280:
	dw $2203,$0303,$01A5,$2803,$0303,$019F,$AB03,$0201
	dw $37B1,$AA02,$0337,$031C,$C8F0,$EC27,$2BF5,$B098
	dw $9801,$033D,$4F98,$981B,$1A43,$5BEC,$9815,$18D2
	dw $F6EC,$0332,$0122,$2203,$0302,$03A5,$A503,$EC02
	dw $1706,$85EC,$F013,$0193,$B6F0,$E401,$02DB,$D5F0
	dw $EC19,$24A4,$B7F0,$EC3A,$3386,$A4EC,$F01D,$38EF
	dw $14F0,$9839,$3A37,$B798,$F038,$01CB,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF

.DATA_85D300:
	dw $3802,$0204,$0739,$3202,$0208,$04B1,$BC02,$0107
	dw $200D,$B602,$0206,$05AE,$AF02,$EC07,$0CD2,$3602
	dw $F005,$3836,$97E8,$E809,$071C,$2DF0,$F037,$363C
	dw $94EC,$EC33,$3398,$D3F0,$F02D,$2A9F,$9FF0,$022B
	dw $053A,$3602,$0208,$0632,$CFEC,$FF09,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF

.DATA_85D380:
	dw $8A01,$0111,$1206,$0C01,$0113,$1388,$0601,$0115
	dw $150C,$0901,$0116,$170C,$0601,$0117,$1888,$47DC
	dw $DC0E,$24BF,$86EC,$EC1B,$1F89,$2DE0,$DC07,$09B6
	dw $BFE0,$EC0B,$3A61,$63EC,$013A,$1108,$0601,$FF10
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF

.DATA_85D400:
	dw $D9F0,$0314,$06BA,$B103,$0304,$02AE,$4103,$0303
	dw $0438,$3403,$0303,$0238,$AF03,$0305,$053B,$E20A
	dw $033C,$0347,$CEF0,$F019,$0FE3,$42F0,$F027,$3A38
	dw $ABDC,$EC1F,$0909,$59EC,$742D,$2B8E,$0F74,$742F
	dw $2B8A,$0D74,$7430,$310B,$0774,$030A,$05B5,$AC03
	dw $EC03,$0E07,$0D74,$FF0F,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF

.DATA_85D480:
	dw $1101,$011A,$199A,$9001,$0122,$1F1F,$9A01,$0125
	dw $290D,$9601,$012E,$2BA0,$8B01,$012E,$3423,$1201
	dw $0813,$3536,$D809,$091D,$1F4E,$4D54,$E01E,$123B
	dw $47E0,$E012,$0F41,$36EC,$EC30,$07F2,$69F0,$5403
	dw $2DD2,$56F0,$F019,$2157,$D301,$E42F,$0471,$8D01
	dw $F021,$2252,$51F0,$011C,$2ED3,$D354,$F029,$03B8
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF

.DATA_85D500:
	dw $0D00,$000C,$0B0A,$8D00,$0009,$080B,$0E00,$0007
	dw $0988,$8900,$000C,$0E13,$1000,$000D,$0A8F,$8F00
	dw $F008,$21E6,$A9F0,$E834,$0464,$8BE0,$DC1F,$11D9
	dw $E3DC,$F02B,$039C,$89E0,$E423,$09E6,$0E00,$F00E
	dw $3994,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF

.DATA_85D580:
	dw $D903,$0305,$06D7,$5D03,$0305,$065E,$E003,$0305
	dw $06E3,$6303,$0305,$0666,$E603,$0307,$04E0,$B2E0
	dw $E02C,$2932,$6BE0,$EC35,$0A17,$4BE8,$EC24,$0E71
	dw $1B74,$7436,$3621,$9874,$7433,$3792,$1674,$743A
	dw $3A1B,$E003,$0306,$065B,$8CE0,$741A,$188D,$72EC
	dw $FF13,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF

.DATA_85D600:
	dw $6CDC,$031F,$083E,$BE03,$030B,$0A3B,$BA03,$030C
	dw $0D36,$3703,$030B,$08B6,$3303,$030A,$0C32,$3D03
	dw $E00D,$17E7,$E5DC,$E01B,$3421,$23F0,$EC0B,$1315
	dw $C574,$7436,$35C1,$4774,$0334,$0C41,$BA03,$740B
	dw $1B12,$9774,$7416,$0D1E,$1574,$7419,$1097,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF

.DATA_85D680:
	dw $B702,$0238,$3930,$B402,$023A,$3AB8,$BB02,$0237
	dw $2C3A,$3302,$022C,$26BB,$3602,$022B,$2AB1,$2AF0
	dw $F007,$05BD,$CBF0,$DC07,$2DEB,$EEE0,$E02A,$30E7
	dw $6654,$5414,$15ED,$8A54,$F029,$2EA0,$23EC,$0237
	dw $2ABE,$3F02,$E437,$071B,$1074,$7420,$1E92,$8E74
	dw $011E,$13D2,$E674,$7412,$13EC,$1674,$FF1D,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF

.DATA_85D700:
	dw $BA02,$021B,$1D3B,$BA02,$021E,$1EC0,$BE02,$021D
	dw $1BBF,$B602,$021B,$1BC2,$3402,$021D,$1E31,$0710
	dw $F01A,$2123,$A7F0,$F022,$21AB,$AFF0,$F022,$2133
	dw $5774,$F028,$31C5,$57E8,$EC08,$0F72,$33E4,$7405
	dw $2655,$D574,$742A,$0969,$7074,$7409,$07E2,$5574
	dw $FF0F,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF

.DATA_85D780:
	dw $2402,$0203,$042E,$2E02,$0203,$052E,$2E02,$0206
	dw $03A9,$A902,$E405,$0F4F,$2402,$0204,$0524,$2402
	dw $EC06,$0CCB,$A6E8,$E436,$37AC,$B2E8,$E436,$37B8
	dw $BEE8,$E436,$37C4,$4E10,$1036,$1586,$04F0,$E418
	dw $2E0C,$C274,$741D,$1E46,$C874,$741F,$2148,$E1EC
	dw $022C,$04A7,$AB02,$E404,$13EB,$5E74,$7411,$135E
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF

.DATA_85D800:
	dw $7600,$000C,$0B79,$F500,$000A,$0E75,$7800,$000D
	dw $0C7B,$FB00,$000E,$0FF8,$F600,$0010,$107A,$CBF0
	dw $EC07,$0941,$8554,$011D,$1E85,$8D54,$011D,$1E8E
	dw $58E0,$E03A,$3ADE,$E4E0,$E439,$1975,$6074,$EC2D
	dw $2C62,$88E0,$7419,$1A8E,$7400,$740D,$1A86,$F700
	dw $E409,$1478,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF

.DATA_85D880:
	dw $E202,$0203,$0260,$5F02,$0204,$04DC,$DC02,$0202
	dw $0459,$5802,$0202,$03D6,$DA02,$0201,$01D4,$DE02
	dw $E001,$12BF,$9909,$090F,$1712,$C4E0,$E011,$12C9
	dw $C4DC,$E40E,$0F3E,$4AE8,$090F,$1E19,$71EC,$F007
	dw $01C5,$C5F0,$F002,$0333,$33F0,$0202,$04E1,$72EC
	dw $EC10,$1771,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF

.DATA_85D900:
	dw $D602,$0204,$05CB,$5202,$0204,$0862,$D802,$0206
	dw $055A,$5802,$0203,$045C,$C502,$0208,$074F,$6174
	dw $F013,$2807,$0CF0,$E02E,$3524,$A2E0,$E038,$3429
	dw $1CE0,$023A,$075D,$BF02,$DC07,$1E90,$1CEC,$EC15
	dw $1520,$DF02,$0205,$09E0,$E402,$E00A,$1865,$E174
	dw $E016,$1DEC,$6474,$FF15,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF

.DATA_85D980:
	dw $0D00,$0012,$1190,$8E00,$0013,$130B,$0C00,$0015
	dw $150F,$1000,$0017,$168D,$0C00,$0018,$188F,$2CE4
	dw $F01E,$05CB,$73E0,$E00D,$1DE0,$43E4,$E419,$1B47
	dw $B474,$DC33,$38EF,$CADC,$741D,$331E,$A774,$7437
	dw $37AE,$2874,$0035,$100E,$9300,$E010,$1B0C,$9B74
	dw $7409,$0A9E,$2374,$7407,$08A7,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF

;--------------------------------------------------------------------

DATA_85DA00:
	dw $8400,$0029,$1EBD,$0600,$0010,$0AFA,$C100,$0020
	dw $2AF8,$8D00,$0014,$2F8C,$1700,$0025,$1915,$2000
	dw $0017,$221F,$7000,$0010,$2BF1,$EA00,$0025,$19E7
	dw $6000,$001C,$26E0,$1903,$0302,$0730,$3603,$030B
	dw $3DA0,$2903,$0338,$34B2,$BE03,$032F,$0F38,$4103
	dw $022B,$025A,$5602,$0207,$0BD2,$DC02,$023D,$3953
	dw $5302,$0233,$304C,$CA02,$000F,$1F28,$5700,$0220
	dw $143E,$BD00,$0020,$1EC1,$FFFF,$FFFF,$FFFF,$FFFF
	dw $0600,$030C,$1331,$9303,$0202,$02DA,$4D03,$002B
	dw $0E7A,$7A00,$0025,$2504,$8D00,$0027,$140D,$9500
	dw $0011,$149F,$1F00,$002A,$3015,$6000,$0016,$1069
	dw $5702,$020B,$06D6,$AC03,$0306,$0C21,$2C03,$0210
	dw $0FD1,$6900,$002E,$2BEF,$5E00,$032B,$3D59,$5C03
	dw $0339,$3451,$2602,$0234,$3821,$1C02,$003E,$27A8
	dw $5700,$FF18,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $1800,$0017,$1AA2,$9800,$000C,$1964,$DB00,$0016
	dw $02B4,$7803,$0121,$2CE4,$5701,$0128,$2817,$9901
	dw $0133,$2724,$B103,$0233,$33D7,$4902,$023D,$114D
	dw $5702,$030B,$0B29,$2E03,$0012,$11E8,$6801,$022B
	dw $2CD0,$2F03,$002E,$1AAF,$4E00,$0018,$0B3F,$2F01
	dw $0128,$25CC,$C301,$0033,$11BD,$3D01,$022D,$1FA6
	dw $9802,$0320,$1FD9,$E803,$FF20,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $0400,$0006,$1B83,$F900,$003C,$3797,$EE00,$0224
	dw $02C8,$6500,$0008,$160D,$6700,$0039,$2DFA,$7A00
	dw $0018,$1C3A,$4800,$011B,$2948,$C000,$011E,$23B4
	dw $D201,$0023,$2FBF,$B603,$033D,$3D8F,$D100,$0037
	dw $0799,$9F03,$0301,$159F,$1F03,$002A,$0A3E,$2E00
	dw $0333,$2019,$7302,$0202,$2069,$5400,$0011,$10E8
	dw $D300,$003D,$0D29,$C100,$FF0E,$FFFF,$FFFF,$FFFF
	dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
	dw $DDA0,$F034,$0220,$DDC7,$0000,$0000,$0080,$0004
	dw $0100,$0100,$DDEF,$DE4A,$FFC0,$DE77,$DE30,$0040
	dw $DDEF,$DE3A,$DD82,$DF4A,$DDA0,$F026,$0620,$DDC7
	dw $0100,$0001,$01A0,$0004,$0080,$0080,$DDEF,$DC44
	dw $DE8D,$DC56,$0AA6,$A0B5,$0CC9,$D000,$C806,$BBC8
	dw $007C,$A600,$60B4,$DF4A,$DD82,$DF4A,$DDA0,$F026
	dw $0820,$DDC7,$0000,$0002,$0000,$0004,$0100,$0100
	dw $DDEF,$DF47,$DF4A,$DDA0,$F871,$0E20,$DDC7,$0000
	dw $0000,$0100,$0000,$0000,$0000,$DDEF,$DE59,$4000
	dw $DDC7,$0000,$0000,$0000,$0000,$0000,$0000,$DDEF
	dw $DF47,$DDC7,$0000,$0000,$FF00,$0000,$0000,$0000
	dw $DDEF,$DE68,$DD82,$DEBB,$DCC4,$DCBE,$DCDE,$DE94
	dw $DCC4,$DCFE,$DF4A,$DDA0,$F871,$0E20,$DDC7,$0000
	dw $0000,$0300,$0008,$0000,$0300,$DE8D,$DCF2,$DE94
	dw $DCE4,$DCFE,$DDC7,$0000,$0000,$0100,$0000,$0000
	dw $0000,$DDEF,$DE59,$6000,$DECB,$DEEF,$DF47,$DF4A
	dw $DDA0,$F871,$0E20,$DDC7,$0000,$0000,$0100,$0000
	dw $0000,$0000,$DDEF,$DE59,$4800,$DECB,$DEEF,$DF47
	dw $DEBB,$DD28,$DD2E,$DD2E,$DDA0,$F871,$0E20,$DEEF
	dw $DEDF,$DD74,$DDC7,$0000,$0000,$FF00,$0000,$0000
	dw $0000,$DDEF,$DE68,$DD82,$DF4A,$DDA0,$F816,$0C20
	dw $DE8D,$DD5C,$DF4A,$DDA0,$F816,$0A20,$DDC7,$0200
	dw $0006,$0240,$0008,$0200,$0240,$DE30,$00A0,$DDEF
	dw $DE3A,$DD82,$B8A6,$0BA9,$9D00,$0FC0,$C8C8,$7CBB
	dw $0000,$B4A6,$0274,$3074,$1E74,$2074,$2274,$2274
	dw $2674,$2874,$2A74,$2C74,$00A9,$9580,$9408,$6004
	dw $B4A6,$20E2,$02B9,$9500,$741F,$B91E,$0003,$2195
	dw $2074,$04B9,$9500,$B915,$0005,$3095,$0874,$21C2
	dw $6998,$0006,$0495,$A660,$B9B4,$0002,$2295,$04B9
	dw $9500,$B926,$0006,$2495,$08B9,$9500,$B928,$000A
	dw $2A95,$0CB9,$9500,$982C,$6918,$000E,$0495,$A660
	dw $20B4,$DDFF,$E8E8,$FF20,$C8DD,$BBC8,$007C,$1800
	dw $26B5,$1110,$2275,$2295,$1E10,$FF49,$1AFF,$2ADD
	dw $B000,$900D,$7513,$9522,$3022,$DD0D,$002A,$0890
	dw $26B5,$FF49,$1AFF,$2695,$22B5,$7518,$951E,$601E
	dw $B4A6,$02B9,$9500,$4C0C,$DE86,$B4A6,$0CB5,$06D0
	dw $C8C8,$7CBB,$0000,$953A,$600C,$B4A6,$24B5,$0810
	dw $02D9,$B000,$4C03,$DE86,$A660,$B5B4,$3020,$D908
	dw $0002,$0390,$864C,$60DE,$B4A6,$20B5,$0810,$00C9
	dw $B0F0,$4C03,$DE88,$A660,$B5B4,$103A,$7408,$C83A
	dw $BBC8,$007C,$6000,$C8C8,$C8C8,$0494,$BE60,$0002
	dw $7C9B,$0000,$0AA6,$10B5,$904A,$B509,$C968,$0022
	dw $02F0,$C8C8,$02BE,$9B00,$007C,$0000,$0400,$0400
	dw $0400,$0400,$0400,$0200,$0000,$9800,$26AE,$1801
	dw $AB7D,$A8DE,$02BE,$9B00,$007C,$A600,$B50A,$C91F
	dw $0700,$05B0,$4069,$9500,$C81F,$BBC8,$007C,$5A00
	dw $B4A6,$0EB4,$1FB9,$D000,$7A04,$884C,$7ADE,$5A60
	dw $00A9,$E200,$A620,$B4B4,$B90E,$0020,$18C9,$2EB0
	dw $84B9,$1900,$0085,$04F0,$08A9,$0980,$12B9,$A800
	dw $37B9,$A4DF,$C00A,$1000,$08D0,$7918,$002E,$E269
	dw $0680,$7918,$0034,$7269,$2195,$71A9,$1F95,$20C2
	dw $C87A,$BBC8,$007C,$FF00,$FE00,$FD00,$FE00,$FE00
	dw $0200,$FF00,$0000,$A600,$60B4,$B4A6,$0834,$2030
	dw $2674,$2874,$2A74,$2C74,$00A9,$95FE,$2024,$DDFF
	dw $E8E8,$FF20,$CADD,$B5CA,$1020,$C90A,$F000,$05B0
	dw $0874,$884C,$60DE,$E21B,$DC00,$DC74,$DC26,$DC5A
	dw $DC56,$DD54,$DD48,$DD20,$DCB6,$DCA2,$DCFE

;--------------------------------------------------------------------

DATA_85DF8E:
	dw CODE_85E0A5
	dw CODE_85E0E7
	dw CODE_85E124
	dw CODE_85E197
	dw $1000
	dw $1100

DATA_85DF9A:
	dw $1C00,$1C80

CODE_85DF9E:
	LDY.w #$0001
	STY.w $0F80
	TAY
	LDA.w $0F9E
	TRB.b $AC
	TYA
	LDY.w #$0002
	AND.w #$0000
	JMP.w CODE_85E056

CODE_85DFB4:
	LDY.w $1DC0,x
	BMI.b CODE_85E02B
	LDY.w DATA_85DF9A,x
	STY.b $B4
	BIT.w $0F94,x
	BMI.b CODE_85E02F
	ORA.w $000A,y
	CMP.w #$0000
	BEQ.b CODE_85E000
	BIT.w #$4000
	BNE.b CODE_85E02F
	BIT.w #$8000
	BNE.b CODE_85DF9E
	BIT.w #$0040
	BNE.b CODE_85E046
	BIT.w #$0020
	BNE.b CODE_85E041
	BIT.w #$0010
	BNE.b CODE_85E03C
	BIT.w #$0200
	BNE.b CODE_85E04E
	BIT.w #$0400
	BNE.b CODE_85E037
	BIT.w #$0100
	BNE.b CODE_85E05B
	BIT.w #$0080
	BNE.b CODE_85E066
	BIT.w #$1000
	BNE.b CODE_85E071
	STZ.w $010A,x
CODE_85E000:
	LDA.w !ContextDependentTable+$02,y
	CMP.w #$DC26
	BNE.b CODE_85E016
	LDX.b $0E,y
	LDA.b $10,x
	AND.w #$0400
	BNE.b CODE_85E016
	LDY.w #$000A
	BRA.b CODE_85E019

CODE_85E016:
	LDY.w #$0000
CODE_85E019:
	LDX.b $B4
	LDA.b $0E,x
	STA.b $0A
	LDX.w #DATA_85DF8E
	JSR.w (!ContextDependentTable,x)
	BCC.b CODE_85E02A
	JSR.w CODE_85E185
CODE_85E02A:
	RTL

CODE_85E02B:
	JSR.w CODE_85E185
	RTL

CODE_85E02F:
	DEC.w $0F94,x
	LDY.w #$0008
	BRA.b CODE_85E019

CODE_85E037:
	LDY.w #$0004
	BRA.b CODE_85E019

CODE_85E03C:
	LDY.w #$0012
	BRA.b CODE_85E019

CODE_85E041:
	LDY.w #$0016
	BRA.b CODE_85E019

CODE_85E046:
	LDY.w #$0010
	AND.w #$0180
	BRA.b CODE_85E056

CODE_85E04E:
	LDY.w #$0014
	AND.w #$1980
	BRA.b CODE_85E056

CODE_85E056:
	STA.w $010A,x
	BRA.b CODE_85E019

CODE_85E05B:
	JSR.w CODE_85E084
	LDY.w #$000C
	LDA.w #$0000
	BRA.b CODE_85E056

CODE_85E066:
	JSR.w CODE_85E084
	LDY.w #$000E
	LDA.w #$0000
	BRA.b CODE_85E056

CODE_85E071:
	BIT.w #$0800
	BNE.b CODE_85E07C
	LDY.w #$0006
	JMP.w CODE_85E019

CODE_85E07C:
	LDY.w #$000A
	AND.w #$0180
	BRA.b CODE_85E056

CODE_85E084:
	STA.w !ContextDependentTable+$0A,y
	LDA.w !ContextDependentTable+$02,y
	BNE.b CODE_85E0A1
	LDA.w !ContextDependentTable+$0E,y
	TAY
	LDA.w $00A0,y
	CMP.w #$000C
	BEQ.b CODE_85E0A1
	LDY.b $B4
	LDA.w #$0000
	STA.w !ContextDependentTable+$0A,y
	RTS

CODE_85E0A1:
	PLX
	JMP.w CODE_85E000

CODE_85E0A5:
	PHX
	LDX.b $B4
	LDA.b $00,x
	STA.b $02
	TYA
	BEQ.b CODE_85E0B9
	LDA.b ($02),y
	CMP.b $02,x
	BEQ.b CODE_85E0B9
	STA.b $02,x
	STA.b $04,x
CODE_85E0B9:
	LDY.b $04,x
	BNE.b CODE_85E0C0
	PLX
	SEC
	RTS

CODE_85E0C0:
	TYX
	JSR.w (!ContextDependentTable,x)
	LDA.b ($02)
	STA.b $02
	LDY.b $30,x
	BNE.b CODE_85E0D1
	STZ.b $34,x
	PLX
	SEC
	RTS

CODE_85E0D1:
	LDA.b ($02),y
	CMP.b $34,x
	BEQ.b CODE_85E0E1
	STA.b $34,x
	STA.b $36,x
	STZ.b $38,x
	LDA.b ($02)
	STA.b $32,x
CODE_85E0E1:
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

CODE_85E0E7:
	PHX
	LDX.b $B4
	LDY.b $36,x
	DEC.b $38,x
	BPL.b CODE_85E10C
	INY
	INY
	STY.b $36,x
	LDA.w !ContextDependentTable,y
	BIT.w #$0080
	BEQ.b CODE_85E107
	DEC.b $3A,x
	LDA.w !ContextDependentTable+$01,y
	TAY
	STY.b $36,x
	LDA.w !ContextDependentTable,y
CODE_85E107:
	AND.w #$00FF
	STA.b $38,x
CODE_85E10C:
	LDA.w !ContextDependentTable+$01,y
	AND.w #$00FF
	ASL
	ADC.b $32,x
	TAY
	LDA.w !ContextDependentTable,y
	CLC
	ADC.b $32,x
	STA.b $14
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

CODE_85E124:
	PHX
	LDX.b $B4
	SEP.b #$21
	LDA.b $21,x
	XBA
	LDA.b $1F,x
	SBC.b #$20
	REP.b #$21
	TAY
	LDA.b $14,x
	TAX
	LDA.w #$0020
	JSL.l CODE_80BDC8
	LDY.b $B4
	LDX.b $30,y
	CPX.w #$000A
	BNE.b CODE_85E162
	LDX.b $0E,y
	LDA.w #$002C
	CLC
	ADC.b $CE
	TAY
	SEP.b #$20
	LDA.b $C1,x
	BMI.b CODE_85E159
	LDA.b #$A1
	BRA.b CODE_85E15D

CODE_85E159:
	AND.b #$07
	ADC.b #$A2
CODE_85E15D:
	STA.w !ContextDependentTable+$02,y
	REP.b #$20
CODE_85E162:
	PLX
	INX
	INX
	JMP.w (!ContextDependentTable,x)

CODE_85E168:
	LDY.w #$DF76
	LDX.w #$1C00
	LDA.w #$1000
	JSL.l CODE_85E17B
	LDX.w #$1C80
	LDA.w #$1100
CODE_85E17B:
	STA.b $0E,x
	STY.b $00,x
	LDA.w #$2000
	STA.b $14,x
	RTL

CODE_85E185:
	SEP.b #$20
	LDA.b #$55
	LDY.b $CE
	STA.w $0202,y
	STA.w $0203,y
	STA.w $021F,y
	REP.b #$20
	RTS

;--------------------------------------------------------------------

CODE_85E197:
	LDX.b $B4
	SEP.b #$20
	LDY.w #DATA_85E214
	LDA.b $21,x
	BMI.b CODE_85E1AC
	LDY.w #DATA_85E20D
	CMP.b #$20
	BCC.b CODE_85E1AC
	LDY.w #DATA_85E206
CODE_85E1AC:
	LDA.b $38
	LSR
	LDA.b $1F,x
	TYX
	LDY.b $B8
	BEQ.b CODE_85E1C6
	BCC.b CODE_85E200
	CLC
	ADC.w !ContextDependentTable,x
	REP.b #$21
	AND.w #$00FF
	ORA.w #$CA00
	BRA.b CODE_85E1D3

CODE_85E1C6:
	BCS.b CODE_85E200
	ADC.w !ContextDependentTable,x
	REP.b #$21
	AND.w #$00FF
	ORA.w #$5A00
CODE_85E1D3:
	LDY.b $CE
	STA.w $01F0,y
	ADC.w #$0006
	STA.w $01F4,y
	ADC.w #$0006
	STA.w $01F8,y
	LDA.w !ContextDependentTable+$01,x
	STA.w $01F2,y
	LDA.w !ContextDependentTable+$03,x
	STA.w $01F6,y
	LDA.w !ContextDependentTable+$05,x
	STA.w $01FA,y
	SEP.b #$20
	LDA.b #$00
CODE_85E1FA:
	STA.w $021F,y
	REP.b #$21
	RTS

CODE_85E200:
	LDA.b #$55
	LDY.b $CE
	BRA.b CODE_85E1FA

DATA_85E206:
	db $F2 : dw $3AEB,$3AEC,$7AEB

DATA_85E20D:
	db $F5 : dw $3AEB,$7AEB,$0044

DATA_85E214:
	db $F8 : dw $3AED,$0044,$0044

;--------------------------------------------------------------------

DATA_85E21B:
	dw $E264,$E229,$E236,$E23D,$E244,$E253,$E258,$E25F
	dw $0070,$0040,$0140,$0240,$0340,$3380,$10E2,$1004
	dw $8005,$E238,$0610,$0710,$3F80,$10E2,$1009,$1008
	dw $100A,$1008,$100A,$8008,$E246,$0B10,$5580,$10E2
	dw $800C,$E25A,$0D10,$5F80,$33E2,$5200,$7100,$9000
	dw $AF00,$C600,$DD00,$F400,$0B00,$2201,$3401,$4B01
	dw $5D01,$1C01,$0500,$E010,$4A42,$E020,$4A40,$F010
	dw $4A46,$F020,$4A44,$F020,$4A48,$02AA,$2B07,$FDF0
	dw $2B08,$FDF8,$2B08,$FB00,$1008,$42E0,$204A,$40E0
	dw $104A,$46F0,$204A,$44F0,$804A,$07AA,$F02B,$08FE
	dw $F82B,$08FD,$002B,$08FB,$E010,$4A42,$E020,$4A40
	dw $F010,$4A46,$F020,$4A44,$AA80,$2B07,$FEF0,$2B08
	dw $FEF8,$2B08,$FB00,$1008,$42E0,$204A,$40E0,$104A
	dw $46F0,$204A,$44F0,$804A,$07AA,$F02B,$08FE,$F82B
	dw $08FE,$002B,$08FC,$E010,$4A4A,$E020,$4A40,$F010
	dw $4A4C,$F020,$4A44,$AA80,$2805,$4EE8,$104A,$62E0
	dw $204A,$60E0,$104A,$4CF0,$204A,$44F0,$AA4A,$05AA
	dw $E828,$4A84,$E010,$4A64,$E020,$4A86,$F010,$4A66
	dw $F020,$4A44,$AAAA,$2805,$68E8,$104A,$62E0,$204A
	dw $6AE0,$104A,$4CF0,$204A,$44F0,$AA4A,$05AA,$E828
	dw $4A88,$E010,$4A64,$E020,$4A8A,$F010,$4A66,$F020
	dw $4A44,$AAAA,$2805,$6CE8,$104A,$4AE0,$204A,$6EE0
	dw $104A,$4CF0,$204A,$44F0,$AA4A,$04AA,$E010,$4A4A
	dw $E020,$4A80,$F010,$4A4C,$F020,$4A82,$05AA,$E828
	dw $4A8C,$E010,$4A4A,$E020,$4A8E,$F010,$4A4C,$F020
	dw $4A44,$AAAA,$1004,$46F0,$204A,$44F0,$0F4A,$A0E0
	dw $170A,$A2E0,$AA0A,$1004,$46F0,$204A,$44F0,$084A
	dw $ACE0,$180A,$AEE0,$AA0A

;--------------------------------------------------------------------

CODE_85E3D3:
	PEA.w $807F
	PLB
	ASL
	TAX
	JSR.w (DATA_85E3DE,x)
	PLB
	RTL

DATA_85E3DE:
	dw $0000
DATA_85E3E0:
	dw CODE_85E412 : dw DATA_85E40A
	dw CODE_85E432
	dw CODE_85E4DA
	dw DATA_85E48D
	dw DATA_85E4A5
	dw DATA_85E49F
	dw DATA_85E499
	dw DATA_85E493
	dw CODE_85E51A
	dw CODE_85E563
	dw CODE_85E588
	dw CODE_85E412 : dw DATA_85E404
	dw CODE_85E457
	dw CODE_85E4AF : dw DATA_85E4A7
	dw CODE_85E51A


DATA_85E404:
	dw $FA00,$0000,$0008

DATA_85E40A:
	dw $FA00,$0000,$0000,$0000

CODE_85E412:
	STX.b $02
	TYX
	LDA.l $000FC0,x
	INC
	INC
	STA.l $000FC0,x
	LDA.l $000FE2
	TAY
	LDA.w #$0060
	STA.w !ContextDependentTable+$0E,y
	LDX.b $02
	JSR.w CODE_85E5E3
	JMP.w CODE_85E675

CODE_85E432:
	JSR.w CODE_85E685
	JSR.w CODE_85E6B3
	JSR.w CODE_85E6C8
	JSR.w CODE_85E6F3
	LDX.b $B4
	LDA.b $20,x
	BEQ.b CODE_85E449
	LDA.w !ContextDependentTable+$08,y
	BPL.b CODE_85E451
CODE_85E449:
	LDA.w !ContextDependentTable+$04,y
	CMP.b #$01
	PHA
	BCC.b CODE_85E454
CODE_85E451:
	JSR.w CODE_85E69F
CODE_85E454:
	JMP.w CODE_85E728

CODE_85E457:
	JSR.w CODE_85E685
	LDA.w !ContextDependentTable+$0E,y
	DEC
	STA.w !ContextDependentTable+$0E,y
	BEQ.b CODE_85E48A
CODE_85E463:
	JSR.w CODE_85E6A9
	BEQ.b CODE_85E470
	DEC
	BNE.b CODE_85E481
	JSR.w CODE_85E675
	BRA.b CODE_85E481

CODE_85E470:
	LDA.w !ContextDependentTable+$04,y
	CMP.b #$01
	PHA
	BCS.b CODE_85E481
	JSR.w CODE_85E6B3
	JSR.w CODE_85E6C8
	JSR.w CODE_85E6F3
CODE_85E481:
	LDA.w !ContextDependentTable,y
	TAY
	BNE.b CODE_85E463
	JMP.w CODE_85E728

CODE_85E48A:
	JMP.w CODE_85E69F

DATA_85E48D:
	dw $FA40,$0100,$0012

DATA_85E493:
	dw $FB00,$FDE0,$0014

DATA_85E499:
	dw $FA00,$FE80,$001C

DATA_85E49F:
	dw $FBC0,$0200,$000E

DATA_85E4A5:
	dw $0000

DATA_85E4A7:
	dw $FBC0,$0200,$0004,$0000

CODE_85E4AF:
	STX.b $02
	TYX
	LDA.l $000E00,x
	BEQ.b CODE_85E4D7
	DEC
	STA.l $000E00,x
	LDA.l $000FC0,x
	INC
	INC
	STA.l $000FC0,x
	LDA.l $000FE2
	TAY
	LDA.w #$0030
	STA.w !ContextDependentTable+$0E,y
	LDX.b $02
	JMP.w CODE_85E5E3

CODE_85E4D7:
	JMP.w CODE_85E69F

CODE_85E4DA:
	LDA.b $2C
	CMP.w #$0006
	BNE.b CODE_85E4E2
	RTS

CODE_85E4E2:
	STX.b $02
	TYX
	LDA.l $000E00,x
	SEC
	SBC.w #$0004
	BPL.b CODE_85E4FA
	ADC.w #$0005
	ASL
	ADC.b $02
	STA.b $02
	LDA.w #$0000
CODE_85E4FA:
	STA.l $000E00,x
	LDA.l $000FC0,x
	CLC
	ADC.w #$0006
	STA.l $000FC0,x
	LDA.l $000FE2
	TAY
	LDA.w #$0080
	STA.w !ContextDependentTable+$0E,y
	LDX.b $02
	JMP.w CODE_85E5E3

CODE_85E51A:
	JSR.w CODE_85E685
	LDA.w !ContextDependentTable+$0E,y
	DEC
	STA.w !ContextDependentTable+$0E,y
	BEQ.b CODE_85E552
CODE_85E526:
	JSR.w CODE_85E6A9
	BEQ.b CODE_85E533
	DEC
	BNE.b CODE_85E549
	JSR.w CODE_85E675
	BRA.b CODE_85E549

CODE_85E533:
	JSR.w CODE_85E6B3
	JSR.w CODE_85E6C8
	JSR.w CODE_85E6F3
	LDA.w !ContextDependentTable+$04,y
	BMI.b CODE_85E549
	CMP.w #$7000
	BCC.b CODE_85E549
	JSR.w CODE_85E6D3
CODE_85E549:
	LDA.w !ContextDependentTable,y
	TAY
	BNE.b CODE_85E526
	JMP.w CODE_85E728

CODE_85E552:
	JMP.w CODE_85E69F

DATA_85E555:
	dw $0078,$0048

DATA_85E559:
	dw $0078,$0048

DATA_85E55D:
	dw $0078,$0048,$0000

CODE_85E563:
	TYX
	LDA.l $000FC0,x
	INC
	STA.l $000FC0,x
	LDA.l $000E00,x
	BEQ.b CODE_85E585
	LDY.w #DATA_85E55D
	DEC
	BEQ.b CODE_85E57D
	LDY.w #DATA_85E559
	DEC
CODE_85E57D:
	STA.l $000E00,x
	TYX
	JMP.w CODE_85E63D

CODE_85E585:
	JMP.w CODE_85E69F

CODE_85E588:
	JSR.w CODE_85E685
	LDA.w !ContextDependentTable+$0E,y
	BEQ.b CODE_85E5E0
	DEC
	STA.w !ContextDependentTable+$0E,y
	LDA.l $000FE4
	TAX
	LDA.b $02,x
	CMP.w #$DD20
	BNE.b CODE_85E5E0
	LDA.b $1E,x
	CLC
	ADC.w #$0700
	STA.w $0002,y
	LDA.b $20,x
	BPL.b CODE_85E5B2
	CMP.w #$F400
	BCC.b CODE_85E5E0
CODE_85E5B2:
	SEC
	SBC.w #$0200
	STA.w !ContextDependentTable+$04,y
	JSR.w CODE_85E6F3
CODE_85E5BC:
	TYX
	LDA.w !ContextDependentTable,y
	BEQ.b CODE_85E5DD
	TAY
	LDA.w !ContextDependentTable+$02,x
	STA.w !ContextDependentTable+$02,y
	LDA.w !ContextDependentTable+$04,x
	CLC
	ADC.w #$0D00
	STA.w !ContextDependentTable+$04,y
	CMP.w #$5000
	BCS.b CODE_85E5BC
	JSR.w CODE_85E6F3
	BRA.b CODE_85E5BC

CODE_85E5DD:
	JMP.w CODE_85E728

CODE_85E5E0:
	JMP.w CODE_85E69F

CODE_85E5E3:
	LDA.l DATA_85E3E0,x
	TAX
	LDA.l $000FE2
	TAY
	LDA.l $001EE4
	BEQ.b CODE_85E5F6
	LDA.w #$FFFF
CODE_85E5F6:
	STA.b $08
	LDA.l !ContextDependentTable+(CODE_85E63D&$FF0000),x
	BNE.b CODE_85E608
	LDA.w #$0000
	LDX.b $B8
	STA.l $000FC0,x
	RTS

CODE_85E608:
	LDA.l !ContextDependentTable+(CODE_85E63D&$FF0000),x
	BEQ.b CODE_85E668
	STA.w !ContextDependentTable+$08,y
	LDA.l !ContextDependentTable+(CODE_85E63D&$FF0000)+$02,x
	EOR.b $08
	STA.w !ContextDependentTable+$06,y
	LDA.l !ContextDependentTable+(CODE_85E63D&$FF0000)+$04,x
	STA.w !ContextDependentTable+$0C,y
	LDA.w #$7800
	STA.w !ContextDependentTable+$02,y
	LDA.w #$4800
	STA.w !ContextDependentTable+$04,y
	TYA
	CLC
	ADC.w #$0010
	STA.w !ContextDependentTable,y
	TAY
	TXA
	ADC.w #$0006
	TAX
	BRA.b CODE_85E608

CODE_85E63D:
	LDA.l $000FE2
	TAY
	LDA.w #$0080
	STA.w !ContextDependentTable+$0E,y
CODE_85E648:
	LDA.l !ContextDependentTable+(CODE_85E63D&$FF0000),x
	BEQ.b CODE_85E668
	STA.w !ContextDependentTable+$02,y
	LDA.l !ContextDependentTable+(CODE_85E63D&$FF0000)+$02,x
	STA.w !ContextDependentTable+$04,y
	TYA
	CLC
	ADC.w #$0010
	STA.w !ContextDependentTable+$00,y
	TAY
	TXA
	ADC.w #$0004
	TAX
	BRA.b CODE_85E648

CODE_85E668:
	TYA
	SEC
	SBC.w #$0010
	TAY
	LDA.w #$0000
	STA.w !ContextDependentTable+$00,y
	RTS

;--------------------------------------------------------------------

CODE_85E675:
	PEA.w $7F80
	PLB
	JSL.l CODE_84D93D
	PLB
	RTS

;--------------------------------------------------------------------

DATA_85E67F:
	dw $2C60,$2C86,$2CA2

CODE_85E685:
	LDA.l $001EE6
	LSR
	LSR
	AND.w #$0006
	TAX
	LDA.l DATA_85E67F,x
	STA.b $04
	LDA.b $3C
	STA.b $06
	LDA.l $000FE2
	TAY
	RTS

;--------------------------------------------------------------------

CODE_85E69F:
	LDX.b $B8
	LDA.w #$0000
	STA.l $000FC0,x
	RTS

;--------------------------------------------------------------------

CODE_85E6A9:
	LDA.w !ContextDependentTable+$0C,y
	BEQ.b CODE_85E6B2
	DEC
	STA.w !ContextDependentTable+$0C,y
CODE_85E6B2:
	RTS

;--------------------------------------------------------------------

CODE_85E6B3:
	LDA.w !ContextDependentTable+$02,y
	CLC
	ADC.w !ContextDependentTable+$06,y
	STA.w !ContextDependentTable+$02,y
	LDA.w !ContextDependentTable+$04,y
	CLC
	ADC.w !ContextDependentTable+$08,y
	STA.w !ContextDependentTable+$04,y
	RTS

;--------------------------------------------------------------------

CODE_85E6C8:
	LDA.w #$0060
	CLC
	ADC.w !ContextDependentTable+$08,y
	STA.w !ContextDependentTable+$08,y
	RTS

;--------------------------------------------------------------------

CODE_85E6D3:
	SEP.b #$20
	LDA.b #!DSP1_Command00_16BitMultiplication
	STA.l !REGISTER_DSP1_DataRegister
	REP.b #$20
	LDA.w !ContextDependentTable+$08,y
	STA.l !REGISTER_DSP1_DataRegister
	LDA.w #$BFFF
	STA.l !REGISTER_DSP1_DataRegister
	LDA.l !REGISTER_DSP1_DataRegister
	STA.w !ContextDependentTable+$08,y
	RTS

;--------------------------------------------------------------------

CODE_85E6F3:
	LDX.b $3C
	SEP.b #$20
	LDA.w !ContextDependentTable+$05,y
	XBA
	LDA.w !ContextDependentTable+$03,y
	REP.b #$21
	ADC.b $BA
	STA.b $00,x
	LDA.b $04
	STA.b $02,x
	CMP.w #$2C60
	BEQ.b CODE_85E717
	CMP.w #$2C86
	BEQ.b CODE_85E71C
	LDA.w #$2C60
	BRA.b CODE_85E71F

CODE_85E717:
	LDA.w #$2C86
	BRA.b CODE_85E71F

CODE_85E71C:
	LDA.w #$2CA2
CODE_85E71F:
	STA.b $04
	INX
	INX
	INX
	INX
	STX.b $3C
	RTS

;--------------------------------------------------------------------

CODE_85E728:
	LDX.b $3C
	CPX.b $06
	BEQ.b CODE_85E74E
	LDY.w #$E080
	BRA.b CODE_85E739

CODE_85E733:
	STY.b $00,x
	INX
	INX
	INX
	INX
CODE_85E739:
	TXA
	BIT.w #$000F
	BNE.b CODE_85E733
	STA.b $3C
	LSR
	LSR
	LSR
	LSR
	DEC
	ADC.b $CC
	TAX
	LDA.w #$00AA
	STA.b $00,x
CODE_85E74E:
	RTS

	%FREE_BYTES(NULLROM, 17, $FF)

UNK_C5E760:
	dw $0000,$0000,$0000,$0000,$0400,$0000,$0000,$0000

;--------------------------------------------------------------------

; Note: Seems to be the position number HDMA data.

DATA_85E770:
	incbin "UnsortedData/DATA_85E770.lz5"

	%FREE_BYTES(NULLROM, 11, $00)

;--------------------------------------------------------------------

DATA_85EE00:
	incbin "UnsortedData/DATA_85EE00.lz5"

UNK_C5FF7D:											; Note: Most likely garbage data.
	db $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$00,$00,$02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$12
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$00,$00,$00,$00,$20,$00,$00,$00,$00,$00,$04,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00
%BANK_END(<EndBank>)
endmacro

;#############################################################################################################
;#############################################################################################################

macro SMKBankC6Macros(StartBank, EndBank)
%BANK_START(<StartBank>)

SMK_GFX_Sprite_AngryFace:
;$C60000
	incbin "Graphics/Compressed/GFX_Sprite_AngryFace.lz5"

SMK_GFX_Mode7_GhostValleyTrack:
;$C60189
	incbin "Graphics/Compressed/GFX_Mode7_GhostValleyTrack.lz5"

	%FREE_BYTES(NULLROM, 4, $FF)

DATA_C60526:
	db $00,$00,$10,$0B,$0B,$00,$00,$0A,$0B,$06,$08,$01,$09,$0A,$04,$0B
	db $00,$0A,$00,$0C,$00,$05,$0A,$00,$11,$00,$0C,$0A,$00,$11,$0A,$0C
	db $05,$00,$12,$0F,$0B,$08,$00,$1D,$0E,$07,$0A,$00,$24,$0E,$08,$09
	db $00,$24,$09,$0B,$05,$00,$24,$00,$0B,$09,$00,$2F,$00,$07,$0B,$00
	db $36,$00,$0A,$0B,$00,$36,$0B,$0A,$0A,$00,$36,$15,$0A,$0A,$00,$2E
	db $17,$08,$09,$00,$26,$1A,$08,$08,$00,$1E,$1A,$08,$09,$00,$12,$1C
	db $0C,$08,$00,$12,$24,$0A,$0A,$00,$1C,$25,$09,$09,$00,$25,$24,$09
	db $0A,$00,$2E,$23,$07,$0B,$00,$35,$23,$0A,$0B,$00,$35,$2E,$0B,$07
	db $00,$35,$35,$0B,$0A,$00,$2F,$34,$06,$0B,$00,$2B,$34,$04,$0B,$00
	db $27,$30,$04,$10,$00,$22,$30,$05,$10,$00,$1D,$30,$05,$08,$00,$17
	db $30,$06,$10,$00,$11,$33,$06,$0D,$00,$0B,$39,$06,$07,$00,$01,$39
	db $0A,$07,$00,$00,$31,$0B,$08,$00,$00,$29,$0B,$08,$00,$00,$22,$0B
	db $07,$00,$00,$1B,$0B,$07,$FF

	%FREE_BYTES(NULLROM, 82 ,$FF)

DATA_C6063F:
	db $0B,$18,$02,$0F,$0F,$02,$16,$0B,$01,$1D,$0B,$01,$25,$0E,$02,$2C
	db $17,$03,$32,$20,$02,$3B,$25,$02,$4B,$23,$01,$53,$17,$02,$59,$0D
	db $01,$63,$09,$02,$70,$0F,$02,$76,$1A,$03,$74,$2C,$03,$6B,$34,$01
	db $57,$39,$02,$45,$3E,$03,$39,$42,$01,$35,$49,$00,$3A,$4E,$00,$4E
	db $4F,$01,$64,$4F,$02,$75,$56,$01,$77,$64,$01,$73,$6E,$02,$64,$74
	db $03,$5A,$74,$03,$50,$71,$01,$49,$68,$01,$3F,$67,$02,$35,$6C,$02
	db $29,$76,$03,$1D,$78,$01,$11,$74,$02,$0D,$6A,$02,$0C,$5D,$03,$0B
	db $4B,$02,$0B,$3C,$03,$0A,$2B,$02,$FF,$FF,$03,$FF,$FF,$03,$FF,$FF
	db $03,$FF,$FF,$03,$FF,$FF,$03,$FF,$FF,$03,$FF,$FF,$03,$FF,$FF,$03
	db $FF,$FF,$03,$FF,$FF,$03,$FF,$FF,$03,$FF,$FF,$03,$FF,$FF,$03,$FF
	db $FF,$03,$FF,$FF,$03,$FF,$FF,$03,$FF,$FF,$03,$FF,$FF,$03,$FF,$FF
	db $03,$FF,$FF,$03

DATA_C606F3:
	db $00,$02,$0E,$07,$04,$00,$02,$0A,$09,$04,$08,$02,$09,$09,$04,$0B
	db $01,$09,$00,$0C,$04,$04,$06,$00,$10,$04,$04,$08,$02,$14,$04,$09
	db $06,$1C,$0D,$09,$00,$14,$0E,$08,$05,$02,$14,$13,$09,$06,$1D,$1B
	db $09,$00,$1E,$13,$05,$09,$00,$23,$13,$06,$09,$00,$29,$11,$02,$0B
	db $00,$2B,$09,$04,$13,$00,$2F,$09,$05,$13,$00,$34,$09,$03,$0C,$00
	db $37,$09,$09,$0C,$00,$37,$15,$09,$05,$00,$37,$1A,$09,$06,$00,$37
	db $20,$09,$05,$04,$3F,$25,$0A,$08,$35,$2E,$0A,$00,$31,$27,$04,$06
	db $00,$2D,$27,$04,$06,$00,$29,$27,$04,$08,$04,$28,$27,$09,$08,$20
	db $30,$09,$00,$23,$31,$06,$05,$04,$28,$36,$09,$08,$1F,$3E,$09,$00
	db $1B,$38,$04,$07,$00,$17,$38,$04,$07,$00,$15,$34,$02,$0B,$00,$12
	db $33,$03,$0C,$00,$0D,$33,$05,$07,$00,$09,$32,$04,$08,$06,$08,$39
	db $09,$02,$00,$30,$09,$00,$02,$2B,$07,$05,$00,$02,$26,$07,$05,$00
	db $02,$21,$07,$05,$00,$02,$1B,$07,$06,$00,$02,$16,$07,$05,$00,$02
	db $12,$07,$04,$FF

DATA_C607C7:
	db $0C,$17,$02,$10,$11,$01,$15,$0E,$02,$1B,$0E,$03,$24,$10,$02,$2B
	db $14,$01,$2D,$1B,$02,$2F,$23,$02,$33,$28,$01,$38,$2B,$02,$40,$2D
	db $02,$49,$2D,$03,$53,$2B,$02,$59,$27,$01,$61,$24,$00,$6D,$24,$00
	db $73,$27,$01,$74,$2E,$01,$74,$37,$03,$74,$43,$01,$71,$4D,$01,$6B
	db $50,$00,$65,$51,$01,$5D,$52,$01,$55,$56,$00,$4F,$5A,$00,$4D,$5E
	db $01,$4B,$66,$02,$49,$6E,$00,$45,$73,$01,$39,$78,$01,$2F,$76,$02
	db $2A,$73,$02,$24,$6D,$02,$1C,$6C,$02,$15,$6C,$01,$0F,$69,$01,$0B
	db $61,$02,$0A,$58,$02,$0A,$51,$02,$0A,$48,$03,$0A,$3F,$03,$0A,$33
	db $03,$0A,$29,$03,$0A,$1F,$01

DATA_C6084E:
	db $00,$35,$1C,$0B,$08,$00,$35,$14,$0B,$08,$00,$35,$0C,$0B,$08,$06
	db $3F,$0B,$0B,$02,$35,$00,$0B,$00,$2E,$00,$07,$09,$00,$27,$00,$07
	db $09,$00,$20,$00,$07,$09,$00,$1A,$00,$06,$09,$00,$13,$00,$07,$0D
	db $00,$03,$03,$10,$0A,$00,$05,$0D,$14,$08,$00,$02,$15,$14,$08,$00
	db $02,$1D,$0F,$05,$00,$02,$22,$0C,$08,$00,$0E,$22,$0D,$08,$00,$13
	db $2A,$07,$03,$00,$04,$2D,$15,$05,$00,$04,$32,$10,$06,$00,$04,$38
	db $11,$08,$00,$15,$36,$06,$0A,$00,$1B,$32,$0C,$0D,$00,$1D,$2A,$0C
	db $08,$00,$21,$22,$08,$08,$00,$21,$1C,$08,$06,$00,$1C,$14,$0C,$08
	db $00,$1C,$0B,$0C,$09,$00,$28,$0B,$0B,$08,$00,$2A,$13,$0A,$07,$00
	db $2A,$1A,$0A,$07,$00,$2A,$21,$0A,$08,$00,$2A,$29,$0A,$0A,$00,$2A
	db $33,$0A,$0C,$00,$34,$34,$03,$0B,$00,$37,$33,$09,$0C,$00,$35,$2C
	db $0B,$07,$00,$35,$24,$0B,$08,$FF

	%FREE_BYTES(NULLROM, 5, $FF)

DATA_C6090B:
	db $74,$2D,$02,$73,$1F,$02,$70,$13,$01,$6C,$0D,$00,$65,$0A,$01,$55
	db $08,$02,$44,$08,$03,$35,$0A,$02,$2B,$0D,$01,$1F,$14,$00,$20,$20
	db $00,$12,$2F,$01,$0C,$3D,$02,$14,$47,$00,$24,$4F,$01,$2B,$55,$01
	db $23,$5E,$00,$1D,$6A,$00,$25,$75,$00,$33,$73,$01,$3D,$6B,$02,$43
	db $5F,$02,$49,$4F,$03,$4B,$40,$02,$42,$2F,$01,$46,$22,$01,$52,$1E
	db $00,$5D,$29,$00,$5E,$37,$01,$5C,$48,$01,$5C,$57,$01,$62,$68,$00
	db $6A,$6D,$01,$72,$69,$01,$73,$5B,$02,$73,$4D,$03,$73,$40,$02,$FF
	db $FF,$03

DATA_C6097D:
	db $00,$00,$11,$08,$05,$00,$00,$0C,$08,$05,$00,$00,$07,$08,$05,$08
	db $01,$06,$07,$04,$08,$00,$07,$00,$09,$01,$05,$07,$00,$0E,$01,$07
	db $07,$00,$15,$01,$07,$07,$00,$1C,$01,$07,$07,$00,$23,$01,$07,$07
	db $00,$2A,$01,$08,$07,$00,$32,$01,$05,$07,$02,$37,$01,$07,$06,$3D
	db $08,$07,$00,$37,$09,$07,$04,$00,$37,$0D,$07,$05,$00,$37,$12,$06
	db $09,$00,$31,$12,$06,$09,$00,$2D,$0D,$04,$0E,$00,$29,$0D,$04,$0E
	db $00,$20,$0D,$09,$06,$00,$1B,$11,$05,$02,$00,$1B,$0D,$05,$04,$00
	db $1A,$13,$06,$08,$00,$15,$0D,$06,$06,$04,$14,$0D,$07,$08,$0E,$14
	db $07,$00,$0E,$15,$08,$08,$00,$0E,$1D,$08,$07,$00,$0E,$24,$08,$07
	db $02,$10,$2B,$07,$06,$17,$31,$07,$00,$18,$2C,$07,$03,$00,$18,$2F
	db $07,$03,$00,$1A,$29,$05,$03,$00,$1A,$24,$05,$05,$00,$1F,$24,$04
	db $05,$00,$1F,$2D,$04,$05,$00,$23,$29,$04,$09,$00,$23,$24,$04,$05
	db $00,$27,$24,$06,$05,$00,$2D,$27,$03,$02,$00,$2D,$24,$03,$03,$00
	db $2D,$29,$04,$04,$00,$2D,$2D,$03,$06,$00,$30,$2F,$05,$04,$00,$30
	db $24,$05,$05,$00,$35,$24,$09,$05,$00,$35,$29,$05,$0A,$00,$34,$33
	db $06,$04,$00,$35,$37,$04,$08,$00,$30,$3A,$05,$05,$00,$2B,$3A,$05
	db $03,$00,$2B,$3D,$05,$02,$00,$25,$3A,$06,$03,$00,$25,$3D,$06,$02
	db $00,$1C,$3A,$09,$03,$00,$1C,$3D,$09,$03,$00,$16,$3A,$06,$06,$00
	db $0C,$3A,$0A,$06,$00,$07,$3A,$05,$06,$06,$06,$3F,$07,$02,$00,$38
	db $07,$00,$00,$2F,$07,$09,$00,$00,$24,$07,$0B,$00,$00,$16,$07,$0E
	db $FF

DATA_C60ABE:
	db $08,$1B,$01,$08,$11,$01,$0B,$0B,$00,$11,$0A,$00,$17,$0A,$00,$27
	db $0A,$02,$30,$0A,$02,$42,$0C,$01,$50,$08,$01,$63,$07,$01,$6D,$06
	db $00,$73,$0A,$00,$75,$10,$01,$75,$18,$02,$75,$1E,$02,$71,$28,$01
	db $69,$2A,$02,$5E,$2A,$01,$55,$23,$01,$4B,$21,$01,$3A,$1F,$02,$32
	db $22,$01,$2F,$20,$01,$36,$22,$02,$28,$23,$00,$27,$28,$01,$26,$2E
	db $02,$26,$40,$02,$25,$4E,$02,$24,$5A,$00,$2D,$5E,$01,$36,$5D,$02
	db $38,$53,$01,$40,$5F,$01,$3B,$4E,$01,$41,$4C,$01,$49,$4D,$01,$48
	db $5B,$01,$4D,$4E,$01,$53,$4E,$00,$5A,$4E,$00,$5D,$56,$00,$67,$4E
	db $00,$5E,$5E,$01,$65,$60,$00,$6D,$63,$01,$6C,$50,$00,$6D,$5A,$02
	db $6D,$6C,$02,$6D,$78,$00,$65,$79,$02,$5A,$76,$01,$4C,$76,$01,$52
	db $7B,$01,$3A,$77,$02,$3A,$7B,$02,$2F,$7A,$03,$2F,$79,$03,$1F,$79
	db $03,$0E,$78,$01,$0A,$75,$00,$07,$71,$01,$07,$6C,$01,$08,$59,$02
	db $07,$40,$03,$07,$27,$03

DATA_C60B84:
	db $00,$30,$19,$10,$06,$00,$2D,$12,$13,$07,$00,$36,$08,$0A,$0A,$00
	db $2E,$00,$08,$12,$00,$2A,$00,$04,$11,$00,$25,$00,$05,$12,$00,$20
	db $00,$05,$16,$00,$1B,$00,$05,$19,$00,$16,$00,$05,$1A,$00,$08,$00
	db $0E,$0D,$00,$00,$0D,$16,$05,$00,$00,$12,$15,$06,$00,$00,$18,$14
	db $06,$00,$00,$1E,$15,$05,$00,$00,$23,$14,$05,$00,$00,$28,$14,$06
	db $00,$00,$2E,$0F,$06,$00,$00,$34,$0A,$0C,$00,$0A,$34,$05,$0C,$00
	db $0F,$33,$04,$0D,$00,$13,$2E,$06,$12,$00,$19,$2D,$03,$13,$00,$1C
	db $27,$06,$19,$00,$22,$28,$07,$18,$00,$29,$2A,$07,$16,$00,$30,$34
	db $08,$0C,$00,$30,$2A,$10,$0A,$00,$2D,$24,$13,$06,$00,$2D,$1F,$13
	db $05,$FF

DATA_C60C16:
	db $6B,$28,$01,$66,$1E,$00,$67,$1A,$00,$5A,$16,$00,$4D,$15,$01,$41
	db $1A,$01,$36,$1A,$00,$2C,$1A,$01,$22,$1E,$01,$20,$1A,$01,$1B,$24
	db $01,$15,$31,$01,$12,$3B,$00,$14,$4B,$00,$14,$56,$01,$0D,$61,$00
	db $10,$69,$01,$1A,$72,$02,$25,$6E,$00,$2D,$6B,$01,$37,$70,$01,$3F
	db $6F,$02,$4D,$6F,$01,$5A,$6F,$01,$64,$61,$00,$65,$65,$00,$6D,$53
	db $02,$6D,$45,$02,$6D,$38,$02

DATA_C60C6D:
	db $00,$00,$16,$07,$05,$00,$00,$11,$07,$05,$00,$00,$0B,$07,$06,$00
	db $00,$05,$07,$06,$00,$00,$00,$07,$05,$00,$07,$00,$0A,$06,$00,$11
	db $00,$0A,$06,$00,$1B,$00,$0B,$06,$00,$26,$00,$06,$06,$02,$2C,$00
	db $07,$06,$32,$07,$07,$00,$2C,$08,$06,$08,$00,$2C,$10,$06,$06,$04
	db $34,$16,$0A,$08,$2A,$1F,$0A,$00,$21,$17,$09,$07,$00,$18,$17,$09
	db $07,$04,$17,$17,$0A,$08,$0E,$21,$0A,$02,$0E,$22,$0A,$06,$18,$2B
	db $0A,$00,$19,$26,$0A,$06,$00,$23,$26,$0A,$06,$00,$2D,$26,$07,$06
	db $00,$34,$26,$06,$06,$02,$3A,$26,$06,$06,$3F,$2C,$06,$00,$3A,$2D
	db $06,$08,$04,$3F,$35,$09,$08,$37,$3E,$09,$00,$2F,$37,$08,$05,$00
	db $27,$37,$08,$05,$00,$21,$37,$06,$05,$00,$1B,$36,$06,$04,$00,$1B
	db $3A,$06,$04,$00,$15,$36,$06,$04,$00,$15,$3A,$06,$04,$00,$0F,$36
	db $06,$04,$00,$0F,$3A,$06,$04,$00,$0A,$36,$05,$08,$00,$06,$37,$04
	db $07,$00,$00,$37,$06,$07,$00,$00,$30,$07,$07,$00,$00,$29,$07,$07
	db $00,$00,$22,$07,$07,$00,$00,$1B,$07,$07,$FF

DATA_C60D48:
	db $07,$26,$02,$08,$1B,$02,$08,$0E,$01,$0C,$09,$00,$11,$06,$01,$24
	db $05,$02,$3B,$05,$02,$51,$06,$01,$5B,$08,$00,$5C,$0D,$00,$5E,$13
	db $02,$5E,$21,$03,$5C,$2D,$01,$5A,$32,$00,$4B,$35,$02,$3F,$35,$02
	db $2E,$35,$00,$26,$3C,$00,$26,$49,$01,$29,$50,$00,$33,$52,$01,$4B
	db $53,$02,$61,$54,$02,$71,$50,$01,$76,$54,$00,$77,$59,$00,$78,$64
	db $02,$78,$6D,$01,$73,$73,$00,$6A,$74,$01,$59,$74,$01,$4B,$73,$02
	db $3A,$74,$00,$31,$6F,$01,$33,$78,$01,$28,$6F,$02,$28,$79,$01,$1A
	db $72,$00,$1A,$76,$00,$0F,$74,$00,$0A,$71,$00,$07,$6B,$01,$05,$5B
	db $01,$06,$4F,$02,$07,$3F,$03,$07,$30,$02

DATA_C60DD2:
	db $00,$26,$0D,$1A,$05,$00,$26,$00,$13,$0D,$00,$1E,$00,$08,$0D,$00
	db $15,$00,$09,$0D,$00,$0D,$00,$08,$0F,$00,$01,$01,$0C,$0E,$00,$01
	db $0F,$0C,$05,$00,$01,$14,$1C,$08,$00,$01,$1C,$1C,$07,$00,$01,$23
	db $1C,$07,$02,$10,$2A,$0A,$00,$01,$2A,$0F,$0A,$00,$01,$34,$0F,$0C
	db $00,$10,$34,$07,$0C,$00,$17,$31,$09,$0F,$00,$20,$2B,$0A,$15,$00
	db $2A,$2B,$07,$11,$00,$31,$2B,$05,$12,$00,$36,$2B,$0A,$11,$00,$36
	db $21,$0A,$0A,$00,$32,$1B,$0E,$06,$00,$26,$1B,$0C,$06,$00,$31,$16
	db $0F,$05,$00,$26,$16,$0B,$05,$00,$26,$12,$1A,$04,$FF

	%FREE_BYTES(NULLROM, 31, $FF)

DATA_C60E6E:
	db $50,$15,$01,$45,$0C,$02,$32,$0F,$01,$1F,$10,$02,$16,$16,$02,$12
	db $1F,$01,$0D,$31,$00,$0D,$3C,$00,$0A,$4C,$00,$10,$55,$00,$1A,$6A
	db $01,$17,$6A,$01,$25,$70,$02,$35,$72,$01,$44,$68,$02,$55,$61,$01
	db $67,$63,$02,$72,$5E,$01,$73,$4D,$02,$70,$3C,$02,$6A,$30,$03,$58
	db $30,$01,$5D,$25,$03,$58,$25,$01,$57,$1D,$02,$FF,$FF,$03,$FF,$FF
	db $03,$FF,$FF,$03,$FF,$FF,$03,$FF,$FF,$03,$FF,$FF,$03

DATA_C60ECB:
	db $00,$33,$1D,$0D,$06,$06,$3F,$1C,$0D,$02,$33,$0F,$0D,$00,$2D,$0C
	db $06,$0E,$00,$28,$0A,$05,$10,$00,$24,$06,$04,$12,$00,$1D,$03,$07
	db $14,$00,$15,$01,$08,$15,$00,$0E,$00,$07,$13,$00,$0A,$00,$04,$0C
	db $04,$09,$01,$0A,$08,$00,$0B,$0A,$00,$00,$0C,$0B,$07,$00,$00,$13
	db $0B,$09,$00,$00,$1C,$09,$09,$00,$00,$25,$09,$05,$02,$00,$2A,$0B
	db $06,$0B,$34,$0B,$00,$0C,$25,$06,$11,$00,$12,$21,$07,$12,$00,$19
	db $1F,$06,$15,$00,$1F,$20,$06,$17,$00,$25,$23,$05,$1B,$00,$2A,$2C
	db $05,$14,$00,$2F,$32,$05,$0E,$08,$34,$3F,$0C,$04,$3F,$33,$0C,$00
	db $34,$2D,$0C,$06,$00,$33,$28,$0D,$05,$00,$33,$23,$0D,$05,$FF

DATA_C60F5A:
	db $70,$35,$01,$68,$2D,$01,$60,$29,$02,$57,$24,$03,$4A,$1E,$03,$3E
	db $18,$03,$2F,$11,$02,$22,$0D,$01,$17,$0C,$01,$10,$10,$00,$0C,$16
	db $01,$0A,$1E,$02,$0A,$28,$02,$0A,$39,$03,$0B,$4A,$01,$0F,$55,$00
	db $14,$57,$00,$1E,$56,$01,$29,$51,$02,$3A,$4C,$02,$45,$4F,$01,$4A
	db $57,$01,$55,$68,$02,$60,$71,$02,$69,$70,$03,$72,$6B,$03,$75,$63
	db $02,$75,$55,$03,$75,$48,$03,$75,$3D,$03

DATA_C60FB4:
	db $00,$02,$0A,$07,$08,$08,$02,$09,$09,$04,$0B,$01,$09,$00,$0C,$01
	db $07,$09,$00,$13,$01,$07,$09,$00,$1A,$01,$07,$09,$00,$21,$01,$07
	db $09,$00,$28,$01,$07,$09,$00,$2F,$01,$08,$09,$02,$37,$02,$09,$06
	db $3F,$0B,$09,$00,$37,$0C,$09,$08,$00,$33,$0E,$04,$06,$00,$2D,$0E
	db $06,$06,$00,$2D,$14,$06,$05,$00,$28,$13,$05,$0B,$00,$22,$18,$06
	db $06,$00,$1A,$18,$08,$07,$00,$12,$18,$08,$08,$00,$12,$20,$09,$04
	db $00,$12,$24,$09,$07,$00,$1B,$23,$06,$08,$00,$21,$23,$05,$0E,$00
	db $26,$28,$06,$08,$00,$2C,$28,$06,$08,$00,$32,$28,$05,$08,$02,$37
	db $28,$09,$06,$3F,$31,$09,$00,$37,$32,$09,$07,$00,$37,$39,$08,$05
	db $00,$33,$39,$04,$05,$00,$2F,$39,$04,$05,$00,$2B,$39,$04,$05,$00
	db $27,$39,$04,$05,$00,$22,$39,$05,$05,$00,$1C,$39,$06,$05,$00,$17
	db $33,$05,$0C,$00,$12,$33,$05,$08,$00,$0D,$2E,$05,$0C,$00,$08,$2E
	db $05,$07,$06,$07,$34,$07,$02,$01,$2D,$07,$00,$03,$26,$05,$07,$00
	db $03,$1F,$05,$07,$00,$03,$18,$05,$07,$00,$03,$12,$05,$06,$FF

DATA_C61093:
	db $0E,$10,$01,$17,$0D,$01,$20,$09,$02,$2C,$08,$03,$37,$08,$03,$4B
	db $0C,$03,$57,$0C,$02,$65,$0C,$02,$70,$0F,$01,$75,$16,$01,$73,$1E
	db $02,$66,$21,$02,$60,$26,$01,$59,$2D,$02,$54,$34,$01,$48,$35,$02
	db $3C,$36,$02,$31,$39,$01,$2F,$40,$01,$32,$48,$01,$3A,$4C,$02,$45
	db $51,$03,$53,$54,$03,$63,$54,$02,$6C,$56,$01,$72,$5A,$00,$74,$5F
	db $01,$74,$6F,$02,$70,$75,$00,$68,$78,$01,$60,$78,$01,$56,$74,$00
	db $50,$73,$00,$49,$75,$00,$40,$77,$02,$33,$71,$03,$27,$6C,$02,$1E
	db $67,$02,$13,$62,$03,$0E,$5F,$02,$0B,$59,$03,$0A,$52,$03,$0A,$47
	db $03,$0A,$3A,$03,$0A,$2D,$03,$0A,$1B,$03

DATA_C6111D:
	db $00,$38,$0C,$04,$07,$00,$38,$07,$04,$05,$00,$38,$02,$04,$05,$00
	db $31,$02,$07,$05,$00,$29,$02,$08,$05,$00,$21,$02,$08,$06,$00,$18
	db $02,$09,$06,$00,$10,$02,$08,$06,$00,$02,$02,$0E,$05,$00,$02,$07
	db $0C,$05,$00,$02,$0C,$0C,$06,$00,$06,$12,$0C,$05,$00,$04,$17,$07
	db $09,$00,$0B,$17,$0A,$09,$00,$04,$20,$07,$08,$00,$0B,$20,$0A,$08
	db $00,$04,$28,$05,$08,$00,$09,$28,$05,$08,$00,$0E,$28,$07,$08,$00
	db $04,$30,$05,$0E,$00,$09,$30,$05,$0E,$00,$0E,$30,$06,$0D,$00,$14
	db $38,$05,$05,$00,$19,$38,$06,$05,$00,$1A,$2E,$05,$0A,$00,$1A,$24
	db $03,$0A,$00,$1A,$1D,$03,$07,$00,$1A,$17,$03,$06,$00,$1A,$0D,$09
	db $09,$00,$23,$0D,$0B,$05,$00,$23,$12,$08,$02,$00,$23,$14,$06,$03
	db $00,$26,$17,$03,$09,$00,$29,$14,$02,$0C,$00,$2B,$12,$03,$0E,$00
	db $26,$20,$03,$0D,$00,$29,$20,$02,$0D,$00,$2B,$20,$03,$0D,$00,$26
	db $2D,$03,$09,$00,$29,$2D,$02,$09,$00,$2B,$2D,$03,$09,$00,$26,$36
	db $03,$09,$00,$29,$36,$02,$09,$00,$2B,$36,$03,$09,$00,$2E,$35,$06
	db $0A,$00,$34,$35,$05,$0A,$00,$35,$2D,$04,$08,$00,$35,$28,$08,$05
	db $00,$37,$1E,$05,$0A,$00,$37,$19,$05,$05,$00,$37,$13,$05,$06,$FF

DATA_C6121D:
	db $74,$14,$01,$70,$0B,$00,$69,$0A,$01,$59,$0A,$01,$4A,$09,$01,$3A
	db $09,$02,$2B,$09,$02,$19,$0B,$01,$16,$16,$02,$17,$20,$02,$16,$28
	db $01,$16,$32,$02,$0F,$44,$02,$1D,$40,$02,$0C,$54,$02,$17,$54,$02
	db $0D,$6E,$02,$16,$6C,$02,$24,$64,$02,$17,$73,$01,$21,$74,$01,$28
	db $77,$01,$36,$73,$01,$3A,$68,$01,$36,$54,$02,$37,$44,$02,$36,$31
	db $01,$3C,$27,$01,$4E,$2A,$02,$59,$28,$01,$54,$2A,$02,$4E,$3A,$01
	db $4E,$4B,$02,$54,$44,$03,$59,$44,$02,$4E,$60,$02,$54,$60,$03,$59
	db $60,$01,$4F,$76,$00,$54,$76,$00,$59,$6D,$00,$55,$78,$01,$5A,$78
	db $01,$62,$73,$02,$6C,$6C,$01,$6D,$5D,$02,$73,$53,$02,$75,$3C,$03
	db $74,$35,$03,$74,$28,$03,$74,$1B,$02

DATA_C612B6:
	db $00,$00,$24,$0B,$05,$00,$00,$1D,$14,$07,$00,$06,$17,$0F,$06,$00
	db $0D,$14,$08,$03,$00,$0D,$0C,$08,$08,$00,$09,$0C,$04,$09,$00,$01
	db $0C,$08,$08,$00,$01,$01,$08,$0B,$00,$09,$01,$0A,$08,$00,$13,$02
	db $0A,$08,$00,$1D,$02,$0B,$08,$00,$28,$01,$0A,$06,$00,$32,$01,$0D
	db $06,$00,$32,$07,$0C,$03,$00,$2A,$0A,$13,$06,$00,$24,$10,$11,$06
	db $00,$23,$16,$0B,$08,$00,$2E,$16,$0F,$08,$00,$22,$1E,$1D,$09,$00
	db $26,$27,$16,$08,$00,$29,$2F,$0D,$10,$00,$23,$33,$06,$0C,$00,$1C
	db $2D,$07,$11,$00,$15,$2C,$07,$13,$00,$0E,$30,$07,$0F,$00,$0A,$38
	db $04,$07,$00,$02,$38,$08,$08,$00,$00,$2F,$0B,$09,$00,$00,$29,$0B
	db $06,$FF

DATA_C61348:
	db $0F,$40,$01,$1D,$34,$00,$1D,$2A,$00,$1B,$25,$00,$15,$1F,$01,$0F
	db $1A,$01,$0C,$14,$00,$14,$0B,$00,$28,$0D,$02,$3F,$0C,$02,$55,$06
	db $01,$68,$0B,$00,$6B,$12,$00,$64,$1A,$01,$5E,$27,$01,$61,$31,$00
	db $61,$41,$00,$6B,$41,$00,$5F,$57,$00,$5C,$66,$01,$4F,$6E,$01,$40
	db $6C,$01,$33,$66,$01,$25,$70,$02,$15,$74,$00,$0F,$71,$00,$0C,$69
	db $01,$0C,$57,$03,$0C,$4A,$02

DATA_C6139F:
	db $00,$00,$18,$10,$09,$00,$00,$10,$10,$08,$00,$00,$0B,$11,$05,$08
	db $06,$0A,$0B,$04,$11,$00,$0B,$00,$12,$00,$09,$0C,$00,$1B,$00,$09
	db $0E,$00,$24,$00,$08,$0F,$00,$2C,$00,$05,$0E,$02,$31,$01,$0D,$06
	db $3E,$0D,$0D,$04,$3E,$0E,$0D,$08,$32,$1B,$0D,$00,$27,$12,$0B,$0A
	db $00,$1E,$12,$09,$0A,$00,$11,$12,$0D,$0A,$00,$11,$1C,$0B,$0B,$00
	db $1C,$1D,$08,$0A,$00,$24,$1F,$06,$0D,$00,$2A,$21,$07,$0D,$00,$31
	db $25,$06,$0A,$00,$37,$27,$08,$09,$00,$37,$30,$08,$0F,$00,$2F,$30
	db $08,$0F,$00,$26,$30,$09,$0F,$00,$21,$2D,$05,$10,$00,$1D,$28,$04
	db $12,$00,$12,$28,$0B,$09,$00,$11,$31,$09,$03,$00,$11,$34,$08,$0B
	db $06,$10,$3F,$0C,$02,$04,$34,$0C,$00,$00,$2D,$10,$07,$00,$00,$28
	db $10,$05,$00,$00,$21,$10,$07,$FF

DATA_C61447:
	db $0F,$28,$01,$18,$1A,$02,$1B,$0E,$00,$22,$0B,$01,$2E,$0D,$01,$3E
	db $0D,$03,$4E,$0D,$02,$61,$0C,$02,$6B,$12,$01,$70,$1A,$00,$70,$24
	db $01,$6B,$2D,$02,$5A,$2E,$02,$40,$2F,$02,$35,$2F,$01,$31,$38,$00
	db $3A,$44,$01,$4C,$49,$02,$5A,$54,$01,$6C,$58,$01,$72,$5F,$00,$6F
	db $65,$00,$67,$6A,$02,$59,$6B,$01,$48,$69,$02,$3E,$60,$01,$36,$58
	db $01,$2C,$62,$02,$26,$71,$01,$1A,$6F,$00,$16,$69,$01,$13,$5D,$02
	db $12,$53,$03,$12,$49,$03,$10,$3B,$02

DATA_C614B0:
	db $00,$00,$17,$10,$0A,$00,$00,$10,$12,$07,$00,$05,$01,$0D,$0F,$00
	db $12,$01,$0A,$0F,$00,$1C,$01,$06,$0F,$00,$22,$01,$07,$0F,$00,$29
	db $01,$06,$0F,$00,$2F,$01,$10,$0F,$00,$2F,$10,$10,$08,$00,$2F,$18
	db $10,$06,$00,$30,$1E,$0F,$05,$00,$31,$23,$0E,$08,$04,$3D,$2B,$0D
	db $08,$31,$38,$0D,$00,$2B,$2E,$06,$11,$00,$26,$2E,$05,$11,$00,$20
	db $33,$06,$06,$00,$19,$2E,$07,$11,$00,$10,$30,$09,$0F,$00,$00,$30
	db $10,$0F,$00,$00,$2A,$10,$06,$00,$08,$27,$08,$03,$00,$00,$21,$10
	db $06,$FF

	%FREE_BYTES(NULLROM, 6, $FF)

DATA_C61528:
	db $18,$24,$01,$1E,$1B,$00,$2C,$16,$00,$3B,$18,$01,$4B,$16,$02,$58
	db $15,$01,$68,$1C,$00,$67,$28,$01,$6C,$37,$02,$6E,$41,$02,$6C,$4D
	db $01,$6F,$58,$01,$67,$63,$00,$56,$65,$01,$4D,$6A,$02,$41,$6A,$01
	db $34,$68,$02,$23,$69,$01,$16,$65,$00,$15,$5B,$01,$15,$4E,$02,$15
	db $44,$02,$14,$39,$01,$FF,$FF,$03,$FF,$FF,$03

DATA_C61573:
	db $00,$06,$0A,$0C,$06,$08,$08,$09,$0A,$04,$12,$00,$0A,$00,$13,$03
	db $06,$0C,$00,$19,$02,$06,$0C,$00,$1F,$02,$06,$0E,$00,$25,$03,$08
	db $0D,$00,$2D,$06,$0B,$0A,$00,$26,$10,$07,$07,$00,$2D,$10,$11,$07
	db $00,$27,$17,$17,$04,$00,$28,$1B,$12,$04,$00,$29,$1F,$16,$04,$00
	db $2F,$23,$10,$05,$00,$31,$28,$0E,$04,$00,$31,$2C,$0E,$0B,$00,$2C
	db $2B,$05,$10,$00,$24,$2A,$08,$06,$00,$24,$30,$08,$09,$00,$1F,$26
	db $05,$0B,$00,$1F,$31,$05,$0D,$00,$1B,$25,$04,$0C,$00,$1B,$34,$04
	db $0B,$00,$16,$25,$05,$0E,$00,$16,$35,$05,$0B,$00,$10,$29,$06,$0B
	db $00,$10,$34,$06,$0B,$00,$0C,$2D,$04,$07,$00,$0C,$34,$04,$09,$00
	db $08,$2D,$04,$10,$00,$01,$2D,$07,$0F,$00,$01,$27,$0D,$06,$00,$01
	db $21,$11,$06,$00,$02,$1A,$11,$07,$00,$02,$14,$13,$06,$00,$02,$10
	db $13,$04,$FF

DATA_C61626:
	db $1C,$12,$00,$24,$0E,$00,$2F,$0F,$01,$3A,$0D,$01,$44,$0D,$00,$50
	db $12,$00,$5F,$17,$00,$67,$22,$02,$6B,$2C,$01,$6C,$31,$00,$6C,$3A
	db $00,$6B,$42,$00,$70,$4E,$00,$6F,$58,$01,$68,$60,$02,$5B,$63,$00
	db $4E,$5F,$00,$41,$58,$01,$44,$6B,$02,$39,$55,$00,$3B,$72,$02,$2F
	db $59,$01,$30,$72,$03,$24,$5E,$02,$21,$70,$03,$1B,$63,$00,$19,$6E
	db $01,$13,$63,$00,$10,$68,$01,$0B,$5B,$00,$0C,$4E,$00,$0E,$45,$00
	db $0F,$3A,$01,$14,$30,$02,$15,$23,$02,$15,$18,$01

DATA_C61692:
	db $00,$35,$19,$0B,$0A,$00,$35,$0E,$0B,$0B,$06,$3E,$0D,$0D,$02,$31
	db $01,$0D,$00,$23,$01,$0E,$0D,$00,$23,$0E,$0B,$08,$00,$23,$16,$0B
	db $04,$00,$23,$1A,$0B,$06,$00,$19,$19,$0A,$07,$00,$0F,$19,$0A,$07
	db $00,$0F,$13,$0A,$06,$00,$0F,$0C,$11,$07,$00,$17,$07,$09,$05,$00
	db $17,$01,$09,$06,$00,$0D,$01,$0A,$07,$00,$01,$01,$0C,$07,$00,$01
	db $08,$09,$0C,$00,$01,$14,$09,$0A,$00,$01,$1E,$09,$09,$00,$0A,$20
	db $03,$07,$00,$0D,$21,$0B,$06,$00,$18,$21,$0E,$06,$00,$26,$21,$0E
	db $06,$00,$29,$27,$0B,$04,$00,$29,$2B,$0B,$05,$00,$21,$29,$08,$06
	db $00,$18,$28,$09,$07,$00,$0F,$28,$09,$07,$00,$04,$29,$0B,$08,$00
	db $02,$31,$0A,$05,$00,$02,$36,$0A,$0A,$00,$0C,$36,$04,$0A,$00,$10
	db $34,$06,$0B,$00,$16,$31,$07,$0D,$00,$1D,$30,$07,$06,$00,$24,$31
	db $08,$0D,$00,$2C,$32,$07,$0D,$00,$33,$32,$04,$0D,$00,$37,$32,$09
	db $0D,$00,$35,$2A,$0B,$08,$00,$35,$23,$0B,$07,$FF

DATA_C6175E:
	db $75,$29,$02,$72,$17,$01,$69,$10,$01,$5E,$11,$02,$52,$21,$03,$4D
	db $2F,$02,$4A,$37,$01,$3D,$39,$02,$2F,$39,$01,$27,$2F,$01,$2B,$23
	db $02,$33,$15,$01,$31,$0D,$01,$2B,$0B,$01,$15,$0A,$02,$0C,$13,$01
	db $09,$2A,$02,$0C,$3E,$01,$17,$46,$02,$23,$48,$03,$34,$47,$03,$52
	db $48,$01,$5A,$50,$00,$54,$59,$00,$48,$57,$01,$37,$55,$02,$29,$55
	db $03,$1A,$5B,$02,$10,$66,$01,$12,$6F,$01,$1B,$72,$01,$27,$70,$02
	db $32,$6B,$03,$41,$63,$02,$52,$6C,$03,$62,$6F,$02,$6A,$6E,$01,$71
	db $68,$02,$73,$5D,$03,$73,$4C,$03,$74,$3E,$03

DATA_C617D9:
	db $00,$30,$16,$10,$04,$06,$3C,$15,$0D,$02,$30,$08,$0D,$00,$2A,$0D
	db $06,$09,$00,$21,$0D,$09,$09,$00,$21,$09,$0A,$04,$00,$21,$01,$0A
	db $08,$00,$18,$01,$09,$09,$00,$0F,$01,$09,$09,$00,$09,$01,$06,$09
	db $00,$00,$01,$09,$09,$00,$01,$0A,$09,$09,$00,$01,$13,$08,$09,$02
	db $01,$1C,$0A,$06,$0B,$25,$0A,$00,$0C,$1A,$09,$0B,$00,$15,$19,$07
	db $0C,$00,$1C,$18,$07,$08,$00,$23,$18,$08,$08,$00,$22,$20,$09,$07
	db $00,$24,$27,$05,$0A,$00,$22,$31,$08,$0E,$00,$1A,$33,$08,$0C,$00
	db $11,$33,$09,$0C,$00,$0B,$35,$06,$0A,$00,$01,$35,$0A,$0B,$08,$01
	db $34,$0B,$04,$0B,$29,$0B,$00,$0C,$28,$04,$0B,$00,$10,$28,$0A,$08
	db $00,$1A,$28,$09,$08,$00,$2A,$28,$09,$08,$00,$33,$27,$0B,$0A,$00
	db $30,$1E,$10,$09,$00,$30,$1A,$10,$04,$FF

DATA_C61883:
	db $6C,$28,$01,$61,$24,$02,$55,$23,$01,$50,$1E,$01,$4C,$16,$03,$47
	db $10,$02,$3C,$0B,$01,$2C,$0B,$02,$16,$0C,$02,$0E,$12,$01,$0B,$18
	db $02,$09,$28,$03,$0B,$3C,$01,$12,$42,$01,$1E,$42,$02,$2F,$3C,$03
	db $3F,$38,$02,$49,$3B,$01,$4B,$44,$02,$4C,$50,$03,$4B,$68,$81,$3E
	db $6E,$01,$2E,$6E,$02,$1A,$72,$01,$10,$6C,$00,$11,$64,$01,$16,$5F
	db $02,$1C,$59,$01,$2A,$57,$03,$3A,$57,$03,$5A,$56,$03,$6B,$54,$02
	db $72,$45,$03,$72,$35,$03,$6F,$2D,$02

DATA_C618EC:
	db $00,$39,$1E,$07,$06,$00,$39,$17,$07,$07,$00,$39,$10,$07,$07,$00
	db $39,$0B,$07,$05,$06,$3F,$0A,$0B,$02,$34,$00,$0B,$00,$2B,$00,$09
	db $0B,$00,$26,$01,$05,$10,$00,$1E,$03,$08,$0F,$00,$19,$01,$05,$11
	db $00,$14,$01,$05,$0A,$00,$0E,$01,$06,$0B,$00,$09,$01,$05,$0C,$00
	db $01,$01,$08,$0C,$00,$01,$0D,$08,$08,$00,$01,$15,$08,$09,$00,$01
	db $1E,$08,$09,$02,$01,$27,$0C,$06,$0D,$32,$0C,$00,$0E,$2B,$08,$08
	db $00,$16,$2B,$07,$08,$00,$1D,$2B,$05,$09,$00,$22,$2B,$07,$09,$00
	db $21,$34,$0A,$05,$00,$21,$39,$0A,$06,$00,$29,$2B,$08,$04,$00,$2B
	db $38,$06,$07,$00,$31,$2B,$09,$04,$00,$31,$37,$09,$08,$00,$3A,$37
	db $06,$08,$00,$3A,$30,$06,$07,$00,$3A,$28,$06,$08,$00,$39,$24,$07
	db $04,$FF

DATA_C6198E:
	db $78,$33,$01,$78,$25,$02,$77,$18,$02,$74,$13,$00,$6E,$0D,$01,$62
	db $0D,$01,$52,$10,$02,$46,$13,$01,$38,$10,$00,$2C,$0E,$01,$1F,$0C
	db $02,$12,$10,$02,$0D,$14,$00,$0A,$1B,$01,$0A,$2B,$02,$09,$3D,$02
	db $0B,$4F,$01,$11,$59,$00,$1D,$5E,$01,$2E,$5E,$03,$3E,$5E,$01,$48
	db $65,$00,$4E,$6E,$00,$54,$74,$01,$5E,$76,$02,$63,$5B,$01,$6E,$76
	db $02,$77,$56,$03,$78,$71,$03,$78,$67,$02,$79,$59,$03,$79,$4B,$03
	db $79,$40,$02

DATA_C619F1:
	db $00,$37,$1F,$06,$0A,$00,$37,$12,$06,$0D,$00,$37,$06,$06,$0C,$00
	db $37,$01,$06,$05,$00,$2E,$01,$09,$05,$00,$26,$01,$08,$05,$00,$1C
	db $01,$0A,$05,$00,$0F,$01,$0D,$05,$00,$08,$01,$07,$05,$00,$08,$06
	db $07,$08,$00,$05,$0E,$0C,$07,$00,$05,$15,$0C,$07,$00,$05,$1C,$0C
	db $0B,$00,$05,$27,$0C,$0A,$00,$05,$31,$0C,$04,$00,$05,$35,$0C,$08
	db $00,$11,$34,$09,$09,$00,$1A,$34,$06,$09,$00,$1A,$2D,$06,$07,$00
	db $1A,$25,$06,$08,$00,$1A,$1D,$06,$08,$00,$1A,$16,$06,$07,$00,$1A
	db $0D,$06,$09,$00,$20,$0D,$08,$09,$00,$28,$0D,$06,$09,$00,$28,$16
	db $06,$0B,$00,$28,$21,$06,$0A,$00,$28,$2B,$06,$08,$00,$28,$33,$06
	db $05,$00,$28,$38,$06,$07,$00,$2E,$38,$09,$07,$00,$37,$38,$06,$07
	db $00,$37,$31,$06,$07,$00,$37,$2C,$06,$05,$00,$37,$29,$06,$03,$FF

DATA_C61AA1:
	db $73,$36,$02,$75,$1E,$01,$75,$0B,$00,$6C,$08,$00,$54,$08,$01,$41
	db $05,$02,$27,$04,$01,$18,$06,$00,$17,$12,$00,$16,$1F,$02,$16,$2D
	db $03,$16,$3E,$02,$16,$52,$03,$16,$66,$01,$1D,$6F,$00,$2B,$73,$01
	db $38,$6D,$00,$39,$60,$02,$39,$4F,$02,$39,$3F,$02,$39,$31,$01,$3D
	db $26,$00,$4A,$24,$01,$54,$2A,$00,$55,$3A,$01,$55,$4B,$01,$55,$5C
	db $01,$55,$6B,$01,$5A,$75,$00,$66,$75,$01,$74,$70,$01,$74,$66,$02
	db $74,$5F,$00,$74,$53,$03,$74,$48,$02

DATA_C61B0A:
	db $00,$28,$1C,$18,$07,$00,$28,$14,$17,$08,$00,$2A,$0E,$14,$06,$00
	db $2E,$09,$11,$05,$00,$2E,$00,$10,$09,$00,$29,$00,$05,$0A,$00,$20
	db $01,$09,$0D,$00,$16,$02,$0A,$0E,$00,$09,$06,$0D,$0A,$00,$09,$10
	db $0B,$05,$00,$09,$15,$0E,$06,$00,$02,$1B,$14,$08,$00,$01,$23,$09
	db $0A,$00,$01,$2D,$09,$07,$00,$01,$34,$09,$0C,$00,$0A,$34,$06,$0B
	db $00,$10,$2E,$06,$11,$00,$16,$2B,$07,$14,$00,$1D,$2B,$0A,$14,$00
	db $27,$31,$0A,$0E,$00,$31,$30,$0D,$0F,$00,$32,$2A,$0D,$06,$00,$34
	db $26,$0C,$04,$00,$28,$23,$18,$03,$FF

	%FREE_BYTES(NULLROM, 19, $FF)

DATA_C61B96:
	db $62,$2D,$01,$64,$1F,$00,$64,$13,$00,$5D,$0C,$00,$53,$0C,$01,$45
	db $0F,$02,$36,$13,$01,$25,$1C,$00,$20,$24,$01,$1C,$32,$01,$12,$3D
	db $01,$0B,$4D,$01,$0C,$60,$01,$10,$6C,$00,$16,$70,$00,$28,$6F,$01
	db $36,$65,$01,$46,$6E,$01,$56,$75,$01,$66,$6E,$00,$6E,$5C,$00,$6E
	db $4E,$02,$6E,$47,$02,$6D,$3C,$01,$FF,$FF,$03,$FF,$FF,$03,$FF,$FF
	db $03,$FF,$FF,$03,$FF,$FF,$03

DATA_C61BED:
	db $00,$00,$18,$0F,$08,$00,$00,$0F,$0F,$09,$00,$01,$02,$0E,$0D,$00
	db $0F,$01,$05,$0E,$00,$14,$01,$07,$0C,$00,$1B,$04,$07,$05,$00,$22
	db $04,$04,$05,$00,$26,$01,$08,$0A,$00,$2E,$01,$06,$0B,$00,$34,$01
	db $0B,$0B,$00,$33,$0C,$0D,$07,$00,$2E,$13,$11,$06,$00,$2E,$19,$11
	db $05,$00,$2D,$1E,$07,$03,$00,$2E,$21,$11,$07,$00,$32,$28,$0D,$04
	db $00,$35,$2C,$0B,$06,$00,$34,$32,$0B,$0D,$00,$31,$31,$03,$0F,$00
	db $25,$2F,$0C,$10,$00,$25,$2A,$0A,$05,$00,$24,$23,$08,$07,$00,$22
	db $1D,$0A,$06,$00,$20,$13,$0C,$0A,$00,$1C,$12,$04,$0A,$00,$10,$12
	db $0C,$0A,$00,$10,$1C,$0B,$04,$00,$10,$20,$0F,$05,$00,$12,$25,$11
	db $07,$00,$18,$2C,$0B,$07,$00,$18,$33,$0B,$0C,$00,$14,$33,$04,$0C
	db $00,$0E,$30,$06,$0F,$00,$01,$30,$0D,$0F,$00,$00,$2A,$0F,$06,$00
	db $00,$24,$0F,$06,$00,$00,$20,$0F,$04,$FF

	%FREE_BYTES(NULLROM, 2, $FF)

DATA_C61CA9:
	db $0E,$28,$01,$15,$1C,$01,$21,$11,$01,$2D,$0D,$01,$3A,$0C,$01,$47
	db $0C,$02,$55,$0C,$01,$65,$0E,$01,$6D,$14,$01,$71,$1C,$01,$6F,$29
	db $01,$63,$37,$01,$62,$3F,$01,$66,$46,$01,$72,$54,$01,$73,$60,$01
	db $6E,$67,$00,$64,$6A,$00,$5B,$64,$01,$54,$56,$02,$50,$48,$01,$4B
	db $3B,$01,$45,$33,$02,$3A,$2F,$01,$31,$32,$00,$2F,$39,$00,$31,$42
	db $01,$38,$4F,$02,$3A,$60,$01,$37,$6D,$01,$2C,$71,$02,$1D,$6C,$01
	db $14,$63,$01,$0F,$56,$02,$0F,$49,$02,$0F,$42,$03,$0E,$38,$02,$FF
	db $FF,$03,$FF,$FF,$03

DATA_C61D1E:
	db $00,$00,$00,$0C,$05,$00,$0C,$00,$0A,$05,$00,$16,$00,$13,$05,$00
	db $29,$00,$0D,$05,$00,$36,$00,$0A,$05,$00,$3B,$05,$05,$0A,$00,$3B
	db $0F,$05,$0B,$00,$3B,$1A,$05,$0D,$00,$3B,$27,$05,$0E,$00,$3B,$35
	db $05,$0B,$00,$31,$3B,$0A,$05,$00,$25,$3B,$0C,$05,$00,$19,$3B,$0C
	db $05,$00,$0F,$3B,$0A,$05,$00,$05,$3B,$0A,$05,$00,$00,$33,$05,$0D
	db $00,$00,$23,$05,$10,$00,$00,$16,$05,$0D,$00,$00,$0B,$05,$0B,$00
	db $00,$05,$05,$06,$FF

DATA_C61D83:
	db $25,$05,$03,$3B,$05,$03,$5C,$05,$03,$7A,$05,$03,$7A,$18,$03,$7A
	db $2B,$03,$7A,$40,$03,$7A,$56,$03,$7A,$79,$03,$6B,$7A,$03,$56,$7A
	db $03,$3E,$7A,$03,$24,$7A,$03,$14,$7A,$03,$04,$7A,$03,$04,$5E,$03
	db $04,$3E,$03,$04,$24,$03,$04,$0E,$03,$08,$04,$03

DATA_C61DBF:
	db $00,$09,$09,$0E,$06,$00,$17,$00,$0C,$0F,$00,$23,$09,$0E,$06,$00
	db $31,$09,$06,$14,$00,$31,$1D,$0F,$06,$00,$31,$23,$06,$0E,$00,$2C
	db $31,$0B,$06,$00,$23,$31,$09,$0F,$00,$1D,$31,$06,$0F,$00,$09,$31
	db $14,$06,$00,$09,$23,$06,$0E,$00,$07,$1D,$08,$06,$00,$09,$0F,$06
	db $0E,$FF

DATA_C61E01:
	db $3F,$18,$03,$54,$18,$03,$68,$19,$03,$68,$3F,$03,$68,$59,$03,$63
	db $66,$03,$4F,$66,$03,$40,$66,$03,$33,$66,$03,$18,$57,$03,$18,$40
	db $03,$18,$2D,$03,$26,$17,$03

SMK_MusicData_CharacterSelect:
;$C61E28
	incbin "SPC700/Music/Music_CharacterSelect.lz5"

DATA_C61F46:
	incbin "UnsortedData/DATA_C61F46.lz5"

	%FREE_BYTES(NULLROM, 119, $FF)

DATA_C62000:
	incbin "Graphics/GFX_Toad.bin"

;--------------------------------------------------------------------

%HiROMBankSplit()

;--------------------------------------------------------------------

SMK_LevelData_MarioCircuit3:
;$868000
	incbin "TrackData/MarioCircuit3.lz5"

SMK_LevelData_MarioCircuit1:
;$868D2C
	incbin "TrackData/MarioCircuit1.lz5"

SMK_LevelData_MarioCircuit4:
;$86952B
	incbin "TrackData/MarioCircuit4.lz5"

SMK_LevelData_GhostValley3:
;$86A245
	incbin "TrackData/GhostValley3.lz5"

SMK_LevelData_DonutPlains2:
;$86A823
	incbin "TrackData/DonutPlains2.lz5"

SMK_LevelData_VanillaLake2:
;$86BF68
	incbin "TrackData/VanillaLake2.lz5"

SMK_LevelData_ChocoIsland2:
;$86CFC4
	incbin "TrackData/ChocoIsland2.lz5"

SMK_LevelData_KoopaBeach1:
;$86E1AE
	incbin "TrackData/KoopaBeach1.lz5"

	%FREE_BYTES(NULLROM, 6, $FF)

SMK_LevelData_BattleCourse1:
;$86F338
	incbin "TrackData/BattleCourse1.lz5"

SMK_LevelData_GhostValley1:
;$86F5BF
	incbin "TrackData/GhostValley1.lz5"

SMK_MusicData_RainbowRoad:
;$86FA73
	incbin "SPC700/Music/Music_RainbowRoad.lz5"

	%FREE_BYTES(NULLROM, 61 ,$FF)
%BANK_END(<EndBank>)
endmacro

;#############################################################################################################
;#############################################################################################################

macro SMKBankC7Macros(StartBank, EndBank)
%BANK_START(<StartBank>)

SMK_GFX_Sprite_Letters:
;$C70000
	incbin "Graphics/Compressed/GFX_Sprite_Letters.lz5"

	%FREE_BYTES(NULLROM, 125 , $FF)

SMK_GFX_CharacterSelectScreen:
;$C70B29
	incbin "Graphics/Compressed/GFX_CharacterSelectScreen.lz5"

	%FREE_BYTES(NULLROM, 26, $FF)

SMK_GFX_TitleScreen:
;$C71996
	incbin "Graphics/Compressed/GFX_TitleScreen.lz5"

SMK_GFX_TournamentEndCutscene:					;\ Note: This includes all the graphics used on this screen, including the mode 7 graphics.
;$C737DA							;/ It also has the palette data.
	incbin "Graphics/Compressed/GFX_TournamentEndCutscene.lz5"

	%FREE_BYTES(NULLROM, 724, $FF)

SMK_MusicData_MarioCircut:
;$C76301
	incbin "SPC700/Music/Music_MarioCircut.lz5"

SMK_MusicData_BattleMode:
;$C76876
	incbin "SPC700/Music/Music_BattleMode.lz5"

SMK_MusicData_VanillaLake:
;$C76D16
	incbin "SPC700/Music/Music_VanillaLake.lz5"

	%FREE_BYTES(NULLROM, 1, $FF)

SMK_Tilemap_RainbowRoadBGs:
;$C7718A
	incbin "Tilemaps/Tilemap_RainbowRoadBGs.lz5"

SMK_LevelData_ChocoIsland1:
;$C77251
	incbin "TrackData/ChocoIsland1.lz5"

	%FREE_BYTES(NULLROM, 2, $FF)

;--------------------------------------------------------------------

%HiROMBankSplit()

;--------------------------------------------------------------------

SMK_GFX_Mode7_ChocoIslandTrack:
;$878000
	incbin "Graphics/Compressed/GFX_Mode7_ChocoIslandTrack.lz5"

SMK_LevelData_DonutPlains3:
;$878A6B
	incbin "TrackData/DonutPlains3.lz5"

SMK_LevelData_DonutPlains1:
;$87A181
	incbin "TrackData/DonutPlains1.lz5"

SMK_LevelData_BowserCastle1:
;$87B825
	incbin "TrackData/BowserCastle1.lz5"

SMK_LevelData_BowserCastle2:
;$87C527
	incbin "TrackData/BowserCastle2.lz5"

SMK_LevelData_BowserCastle3:
;$87D5FF
	incbin "TrackData/BowserCastle3.lz5"

SMK_LevelData_GhostValley2:
;$87E821
	incbin "TrackData/GhostValley2.lz5"

SMK_LevelData_BattleCourse4:
;$87ED3B
	incbin "TrackData/BattleCourse4.lz5"

SMK_MusicData_StaffRoll:
;$87F18D
	incbin "SPC700/Music/Music_StaffRoll.lz5"

SMK_MusicData_TournamentLose:
;$87FBE1
	incbin "SPC700/Music/Music_TournamentLose.lz5"

DATA_87FDBA:
	incbin "UnsortedData/TileBehaviorData.lz5"

DATA_87FF45:
	db $1D,$1F,$1D,$16,$00,$00,$34,$12,$1A,$47,$1D,$16,$17,$00,$00,$00
	db $1D,$1D,$1E,$15,$12,$12,$12,$13,$6F,$01,$7E,$40,$12,$50,$1C,$40
	db $13,$50,$11,$40,$08,$50,$53,$40,$05,$50,$1E,$40,$05,$50,$1B,$40
	db $01,$50,$11,$D0,$19,$50,$09,$40,$17,$50,$01,$40,$00,$48,$09,$C8
	db $08,$48,$0B,$40,$0E,$50,$0B,$40,$08,$48,$07,$40,$08,$48,$0F,$40
	db $0F,$D0,$39,$50,$01,$40,$06,$C8,$09,$48,$0E,$40,$1E,$00,$15,$40
	db $14,$48,$01,$08,$17,$48,$11,$40,$08,$48,$15,$40,$08,$50,$0F,$D0
	db $0C,$50,$05,$40,$29,$50,$0B,$40,$04,$48,$04,$40,$01,$50,$00,$54
	db $0B,$50,$19,$40,$16,$50,$00,$10,$13,$50,$0F,$40,$10,$48,$27,$40
	db $05,$50,$2A,$40,$0A,$50,$02,$40,$08,$50,$02,$40,$04,$C0,$07,$D0
	db $FF,$FF

	%FREE_BYTES(NULLROM, 25 ,$FF)
%BANK_END(<EndBank>)
endmacro

;--------------------------------------------------------------------

;#############################################################################################################
;#############################################################################################################
