
macro SMK_GameSpecificAssemblySettings()
	!ROM_SMK_U1 = $0001							;\ These defines assign each ROM version with a different bit so version difference checks will work. Do not touch them!
	!ROM_SMK_U2 = $0002							;|
	!ROM_SMK_E = $0004							;|
	!ROM_SMK_J = $0008							;/

	%SetROMToAssembleForHack(SMK_U1, !ROMID)
endmacro

macro SMK_LoadGameSpecificMainSNESFiles()
	incsrc ../Misc_Defines_SMK.asm
	incsrc ../RAM_Map_SMK.asm
	incsrc ../Routine_Macros_SMK.asm
	incsrc ../SNES_Macros_SMK.asm
endmacro

macro SMK_LoadGameSpecificMainSPC700Files()
	incsrc ../SPC700/ARAM_Map_SMK.asm
	incsrc ../Misc_Defines_SMK.asm
	incsrc ../SPC700/SPC700_Macros_SMK.asm
endmacro

macro SMK_LoadGameSpecificMainExtraHardwareFiles()
endmacro

macro SMK_LoadGameSpecificMSU1Files()
endmacro

macro SMK_GlobalAssemblySettings()
	!Define_Global_ApplyAsarPatches = !FALSE
	!Define_Global_InsertRATSTags = !TRUE
	!Define_Global_IgnoreCodeAlignments = !FALSE
	!Define_Global_IgnoreOriginalFreespace = !FALSE
	!Define_Global_CompatibleControllers = !Controller_StandardJoypad
	!Define_Global_DisableROMMirroring = !FALSE
	!Define_Global_CartridgeHeaderVersion = $00
	!Define_Global_FixIncorrectChecksumHack = !FALSE
	!Define_Global_ROMFrameworkVer = 1
	!Define_Global_ROMFrameworkSubVer = 0
	!Define_Global_ROMFrameworkSubSubVer = 0
	!Define_Global_AsarChecksum = $0000
	!Define_Global_LicenseeName = "Nintendo"
	!Define_Global_DeveloperName = "Nintendo EAD"
	!Define_Global_ReleaseDate = "September 1, 1992"
	!Define_Global_BaseROMMD5Hash = "7f25ce5a283d902694c52fb1152fa61a"

	!Define_Global_MakerCode = "01"
	!Define_Global_GameCode = "xxxx"
	!Define_Global_ReservedSpace = $00,$00,$00,$00,$00,$00
	!Define_Global_ExpansionFlashSize = !ExpansionMemorySize_0KB
	!Define_Global_ExpansionRAMSize = !ExpansionMemorySize_0KB
	!Define_Global_IsSpecialVersion = $00
	!Define_Global_InternalName = "SUPER MARIO KART"
	!Define_Global_ROMLayout = !ROMLayout_HiROM_FastROM
	!Define_Global_ROMType = !ROMType_ROM_RAM_SRAM_Chip
	!Define_Global_CustomChip = !Chip_DSP1
	!Define_Global_ROMSize = !ROMSize_512KB
	!Define_Global_SRAMSize = !SRAMSize_2KB
	!Define_Global_Region = !Region_NorthAmerica
	!Define_Global_LicenseeID = $01
	!Define_Global_VersionNumber = $00
	!Define_Global_ChecksumCompliment = !Define_Global_Checksum^$FFFF
	!Define_Global_Checksum = $EB44
	!UnusedNativeModeVector1 = $0020
	!UnusedNativeModeVector2 = $0000
	!NativeModeCOPVector = CODE_80FF8F
	!NativeModeBRKVector = CODE_80B900
	!NativeModeAbortVector = $0010
	!NativeModeNMIVector = SMK_VBlankRoutine_Main
	!NativeModeResetVector = $0008
	!NativeModeIRQVector = SMK_IRQRoutine_Main
	!UnusedEmulationModeVector1 = $A802
	!UnusedEmulationModeVector2 = $0000
	!EmulationModeCOPVector = CODE_808009
	!EmulationModeBRKVector = CODE_80B900
	!EmulationModeAbortVector = $488A
	!EmulationModeNMIVector = $0000
	!EmulationModeResetVector = CODE_80FF70
	!EmulationModeIRQVector = $0000
	%LoadExtraRAMFile("SRAM_Map_SMK.asm")
endmacro

macro SMK_LoadROMMap()
	%SMKBankC0Macros(!BANK_00, !BANK_00)
	%SMKBankC1Macros(!BANK_01, !BANK_01)
	%SMKBankC2Macros(!BANK_02, !BANK_02)
	%SMKBankC3Macros(!BANK_03, !BANK_03)
	%SMKBankC4Macros(!BANK_04, !BANK_04)
	%SMKBankC5Macros(!BANK_05, !BANK_05)
	%SMKBankC6Macros(!BANK_06, !BANK_06)
	%SMKBankC7Macros(!BANK_07, !BANK_07)
endmacro
