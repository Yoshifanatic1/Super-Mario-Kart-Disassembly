; Note: This file is used by the ExtractAssets.bat batch script to define where each file is, how large they are, and their filenames.

hirom
;!ROMVer = $0000						; Note: This is set within the batch script
!SMK_U = $0001
!SMK_J = $0002
!SMK_E = $0004

org $C00000
MainPointerTableStart:
	dl MainPointerTableStart,MainPointerTableEnd-MainPointerTableStart
	dl UncompressedGFXPointersStart,(UncompressedGFXPointersEnd-UncompressedGFXPointersStart)/$0C
	dl CompressedGFXPointersStart,(CompressedGFXPointersEnd-CompressedGFXPointersStart)/$0C
	dl MusicPointersStart,(MusicPointersEnd-MusicPointersStart)/$0C
	dl BRRPointersStart,(BRRPointersEnd-BRRPointersStart)/$0C
MainPointerTableEnd:

;--------------------------------------------------------------------

UncompressedGFXPointersStart:
	dl $C02000,$C08000,GFX_Mario,GFX_MarioEnd
	dl $C12000,$C18000,GFX_Bowser,GFX_BowserEnd
	dl $C22000,$C28000,GFX_Peach,GFX_PeachEnd
	dl $C32000,$C38000,GFX_DK,GFX_DKEnd
	dl $C42000,$C48000,GFX_Yoshi,GFX_YoshiEnd
	dl $C4A000,$C4C800,GFX_Luigi,GFX_LuigiEnd
	dl $C52000,$C58000,GFX_Koopa,GFX_KoopaEnd
	dl $C62000,$C68000,GFX_Toad,GFX_ToadEnd
UncompressedGFXPointersEnd:

;--------------------------------------------------------------------

CompressedGFXPointersStart:
	dl $C00000,$C00334,GFX_Sprite_GhostValleySupports,GFX_Sprite_GhostValleySupportsEnd
	dl $C005D6,$C00903,GFX_Sprite_DonutPlainsMoles,GFX_Sprite_DonutPlainsMolesEnd
	dl $C00903,$C00BB7,GFX_Sprite_TerrainEffects,GFX_Sprite_TerrainEffectsEnd
	dl $C00BB7,$C00E96,GFX_Sprite_CheckeredFlag,GFX_Sprite_CheckeredFlagEnd
	dl $C00E96,$C01070,GFX_Sprite_BattleModeBalloons,GFX_Sprite_BattleModeBalloonsEnd
	dl $C01070,$C01499,GFX_Sprite_BowserCastleThwomps,GFX_Sprite_BowserCastleThwompsEnd
	dl $C01499,$C014EE,GFX_BG_RainbowRoad,GFX_BG_RainbowRoadEnd
	dl $C014EE,$C01F4C,GFX_Mode7_VanillaLakeTrack,GFX_Mode7_VanillaLakeTrackEnd
	dl $C10000,$C10AA5,GFX_Sprite_LakituAndSpriteHUD,GFX_Sprite_LakituAndSpriteHUDEnd
	dl $C10AA5,$C10F9B,GFX_Sprite_ChocoIslandPiranhaPlants,GFX_Sprite_ChocoIslandPiranhaPlantsEnd
	dl $C10F9B,$C112F8,GFX_Sprite_MarioCircuitPipes,GFX_Sprite_MarioCircuitPipesEnd
	dl $C11706,$C11BED,GFX_Sprite_KoopaBeachCheepCheeps,GFX_Sprite_KoopaBeachCheepCheepsEnd
	dl $C11C0E,$C11F71,GFX_Sprite_FlattenedDrivers,GFX_Sprite_FlattenedDriversEnd
	dl $C20000,$C20148,GFX_BG_MarioCicuit,GFX_BG_MarioCicuitEnd
	dl $C20148,$C20356,GFX_BG_GhostValley,GFX_BG_GhostValleyEnd
	dl $C20356,$C20523,GFX_BG_DonutPlains,GFX_BG_DonutPlainsEnd
	dl $C20523,$C205EB,GFX_BG_BowserCastle,GFX_BG_BowserCastleEnd
	dl $C205EB,$C206B5,GFX_BG_VanillaLake,GFX_BG_VanillaLakeEnd
	dl $C206B5,$C208A2,GFX_BG_ChocoIsland,GFX_BG_ChocoIslandEnd
	dl $C208A2,$C20946,GFX_BG_KoopaBeach,GFX_BG_KoopaBeachEnd
	dl $C30000,$C30B9D,GFX_Sprite_CharacterIcons,GFX_Sprite_CharacterIconsEnd
	dl $C40000,$C40594,GFX_Mode7_GlobalTrackTiles,GFX_Mode7_GlobalTrackTilesEnd
	dl $C40594,$C4117F,GFX_Sprite_Items,GFX_Sprite_ItemsEnd
	dl $C41EBB,$C41FCF,GFX_Mode7_RainbowRoadTrack,GFX_Mode7_RainbowRoadTrackEnd
	dl $C48000,$C481C9,GFX_Sprite_GiveUpSmoke,GFX_Sprite_GiveUpSmokeEnd
	dl $C481C9,$C48F6A,GFX_Mode7_MarioCircuitTrack,GFX_Mode7_MarioCircuitTrackEnd
	dl $C48F6A,$C49801,GFX_Mode7_BowserCastleTrack,GFX_Mode7_BowserCastleTrackEnd
	dl $C49C19,$C49E72,GFX_Sprite_DirtAndTireSmoke,GFX_Sprite_DirtAndTireSmokeEnd
	dl $C50000,$C50C45,GFX_Mode7_DonutPlainsTrack,GFX_Mode7_DonutPlainsTrackEnd
	dl $C51636,$C51FC3,GFX_Mode7_KoopaBeachTrack,GFX_Mode7_KoopaBeachTrackEnd
	dl $C60000,$C60189,GFX_Sprite_AngryFace,GFX_Sprite_AngryFaceEnd
	dl $C60189,$C60522,GFX_Mode7_GhostValleyTrack,GFX_Mode7_GhostValleyTrackEnd
	dl $C70000,$C70AAC,GFX_Sprite_Letters,GFX_Sprite_LettersEnd
	dl $C70B29,$C7197C,GFX_CharacterSelectScreen,GFX_CharacterSelectScreenEnd
	dl $C71996,$C737DA,GFX_TitleScreen,GFX_TitleScreenEnd
	dl $C737DA,$C7602D,GFX_TournamentEndCutscene,GFX_TournamentEndCutsceneEnd
	dl $C78000,$C78A6B,GFX_Mode7_ChocoIslandTrack,GFX_Mode7_ChocoIslandTrackEnd
CompressedGFXPointersEnd:

;--------------------------------------------------------------------

MusicPointersStart:
	dl $C00334,$C005D6,Music_GhostValley,Music_GhostValleyEnd
	dl $C21A83,$C21C93,Music_TournamentWin,Music_TournamentWinEnd
	dl $C30B9D,$C3103C,Music_DonutPlains,Music_DonutPlainsEnd
	dl $C49801,$C49C19,Music_TitleScreen,Music_TitleScreenEnd
	dl $C4C800,$C4CC3A,Music_KoopaBeach,Music_KoopaBeachEnd
	dl $C4CC3A,$C4CFAF,Music_BowserCastle,Music_BowserCastleEnd
	dl $C4CFAF,$C4D4D5,Music_ChocoIsland,Music_ChocoIslandEnd
	dl $C61E28,$C61F46,Music_CharacterSelect,Music_CharacterSelectEnd
	dl $C6FA73,$C6FFC3,Music_RainbowRoad,Music_RainbowRoadEnd
	dl $C76301,$C76876,Music_MarioCircut,Music_MarioCircutEnd
	dl $C76876,$C76D16,Music_BattleMode,Music_BattleModeEnd
	dl $C76D16,$C77189,Music_VanillaLake,Music_VanillaLakeEnd
	dl $C7F18D,$C7FBE1,Music_StaffRoll,Music_StaffRollEnd
	dl $C7FBE1,$C7FDBA,Music_TournamentLose,Music_TournamentLoseEnd
MusicPointersEnd:

;--------------------------------------------------------------------

BRRPointersStart:
	dl $C2C44C,$C2CA19,BRRFile00,BRRFile00End
	dl $C2CA19,$C2CF68,BRRFile01,BRRFile01End
	dl $C2CF68,$C2D3BB,BRRFile02,BRRFile02End
	dl $C2D3BB,$C2D85F,BRRFile03,BRRFile03End
	dl $C2D85F,$C2DCC4,BRRFile04,BRRFile04End
	dl $C2DCC4,$C2F9BC,BRRFile05,BRRFile05End
	dl $C2F9BC,$C2FA94,BRRFile06,BRRFile06End
	dl $C2FA94,$C30000,BRRFile07,BRRFile07End
	dl $C38000,$C38637,BRRFile07_02,BRRFile07_02End
	dl $C38637,$C38DFC,BRRFile08,BRRFile08End
	dl $C38DFC,$C38E32,BRRFile09,BRRFile09End
	dl $C38E32,$C39DD7,BRRFile0A,BRRFile0AEnd
	dl $C39DD7,$C3A54B,BRRFile0B,BRRFile0BEnd
	dl $C3A54B,$C3AA0A,BRRFile0C,BRRFile0CEnd
	dl $C3AA0A,$C3AB45,BRRFile0D,BRRFile0DEnd
	dl $C3AB45,$C3AB96,BRRFile0E,BRRFile0EEnd
	dl $C3AB96,$C3AFA1,BRRFile0F,BRRFile0FEnd
	dl $C3AFA1,$C3B460,BRRFile10,BRRFile10End
	dl $C3B460,$C3B766,BRRFile11,BRRFile11End
	dl $C3B766,$C3BB4D,BRRFile12,BRRFile12End
	dl $C3BB4D,$C3BE38,BRRFile13,BRRFile13End
	dl $C3BE38,$C3BE5C,BRRFile14,BRRFile14End
	dl $C3BE5C,$C3C231,BRRFile15,BRRFile15End
	dl $C3C231,$C3C6CC,BRRFile16,BRRFile16End
	dl $C3C6CC,$C3CB5E,BRRFile17,BRRFile17End
	dl $C3CB5E,$C3CD9E,BRRFile18,BRRFile18End
	dl $C3CD9E,$C3D44C,BRRFile19,BRRFile19End
BRRPointersEnd:

;--------------------------------------------------------------------

GFX_Mario:
	db "GFX_Mario.bin"
GFX_MarioEnd:
GFX_Bowser:
	db "GFX_Bowser.bin"
GFX_BowserEnd:
GFX_Peach:
	db "GFX_Peach.bin"
GFX_PeachEnd:
GFX_DK:
	db "GFX_DK.bin"
GFX_DKEnd:
GFX_Yoshi:
	db "GFX_Yoshi.bin"
GFX_YoshiEnd:
GFX_Luigi:
	db "GFX_Luigi.bin"
GFX_LuigiEnd:
GFX_Koopa:
	db "GFX_Koopa.bin"
GFX_KoopaEnd:
GFX_Toad:
	db "GFX_Toad.bin"
GFX_ToadEnd:

;--------------------------------------------------------------------

GFX_Sprite_GhostValleySupports:
	db "GFX_Sprite_GhostValleySupports.lz5"
GFX_Sprite_GhostValleySupportsEnd:
GFX_Sprite_DonutPlainsMoles:
	db "GFX_Sprite_DonutPlainsMoles.lz5"
GFX_Sprite_DonutPlainsMolesEnd:
GFX_Sprite_TerrainEffects:
	db "GFX_Sprite_TerrainEffects.lz5"
GFX_Sprite_TerrainEffectsEnd:
GFX_Sprite_CheckeredFlag:
	db "GFX_Sprite_CheckeredFlag.lz5"
GFX_Sprite_CheckeredFlagEnd:
GFX_Sprite_BattleModeBalloons:
	db "GFX_Sprite_BattleModeBalloons.lz5"
GFX_Sprite_BattleModeBalloonsEnd:
GFX_Sprite_BowserCastleThwomps:
	db "GFX_Sprite_BowserCastleThwomps.lz5"
GFX_Sprite_BowserCastleThwompsEnd:
GFX_BG_RainbowRoad:
	db "GFX_BG_RainbowRoad.lz5"
GFX_BG_RainbowRoadEnd:
GFX_Mode7_VanillaLakeTrack:
	db "GFX_Mode7_VanillaLakeTrack.lz5"
GFX_Mode7_VanillaLakeTrackEnd:
GFX_Sprite_LakituAndSpriteHUD:
	db "GFX_Sprite_LakituAndSpriteHUD.lz5"
GFX_Sprite_LakituAndSpriteHUDEnd:
GFX_Sprite_ChocoIslandPiranhaPlants:
	db "GFX_Sprite_ChocoIslandPiranhaPlants.lz5"
GFX_Sprite_ChocoIslandPiranhaPlantsEnd:
GFX_Sprite_MarioCircuitPipes:
	db "GFX_Sprite_MarioCircuitPipes.lz5"
GFX_Sprite_MarioCircuitPipesEnd:
GFX_Sprite_KoopaBeachCheepCheeps:
	db "GFX_Sprite_KoopaBeachCheepCheeps.lz5"
GFX_Sprite_KoopaBeachCheepCheepsEnd:
GFX_Sprite_FlattenedDrivers:
	db "GFX_Sprite_FlattenedDrivers.lz5"
GFX_Sprite_FlattenedDriversEnd:
GFX_BG_MarioCicuit:
	db "GFX_BG_MarioCicuit.lz5"
GFX_BG_MarioCicuitEnd:
GFX_BG_GhostValley:
	db "GFX_BG_GhostValley.lz5"
GFX_BG_GhostValleyEnd:
GFX_BG_DonutPlains:
	db "GFX_BG_DonutPlains.lz5"
GFX_BG_DonutPlainsEnd:
GFX_BG_BowserCastle:
	db "GFX_BG_BowserCastle.lz5"
GFX_BG_BowserCastleEnd:
GFX_BG_VanillaLake:
	db "GFX_BG_VanillaLake.lz5"
GFX_BG_VanillaLakeEnd:
GFX_BG_ChocoIsland:
	db "GFX_BG_ChocoIsland.lz5"
GFX_BG_ChocoIslandEnd:
GFX_BG_KoopaBeach:
	db "GFX_BG_KoopaBeach.lz5"
GFX_BG_KoopaBeachEnd:
GFX_Sprite_CharacterIcons:
	db "GFX_Sprite_CharacterIcons.lz5"
GFX_Sprite_CharacterIconsEnd:
GFX_Mode7_GlobalTrackTiles:
	db "GFX_Mode7_GlobalTrackTiles.lz5"
GFX_Mode7_GlobalTrackTilesEnd:
GFX_Sprite_Items:
	db "GFX_Sprite_Items.lz5"
GFX_Sprite_ItemsEnd:
GFX_Mode7_RainbowRoadTrack:
	db "GFX_Mode7_RainbowRoadTrack.lz5"
GFX_Mode7_RainbowRoadTrackEnd:
GFX_Sprite_GiveUpSmoke:
	db "GFX_Sprite_GiveUpSmoke.lz5"
GFX_Sprite_GiveUpSmokeEnd:
GFX_Mode7_MarioCircuitTrack:
	db "GFX_Mode7_MarioCircuitTrack.lz5"
GFX_Mode7_MarioCircuitTrackEnd:
GFX_Mode7_BowserCastleTrack:
	db "GFX_Mode7_BowserCastleTrack.lz5"
GFX_Mode7_BowserCastleTrackEnd:
GFX_Sprite_DirtAndTireSmoke:
	db "GFX_Sprite_DirtAndTireSmoke.lz5"
GFX_Sprite_DirtAndTireSmokeEnd:
GFX_Mode7_DonutPlainsTrack:
	db "GFX_Mode7_DonutPlainsTrack.lz5"
GFX_Mode7_DonutPlainsTrackEnd:
GFX_Mode7_KoopaBeachTrack:
	db "GFX_Mode7_KoopaBeachTrack.lz5"
GFX_Mode7_KoopaBeachTrackEnd:
GFX_Sprite_AngryFace:
	db "GFX_Sprite_AngryFace.lz5"
GFX_Sprite_AngryFaceEnd:
GFX_Mode7_GhostValleyTrack:
	db "GFX_Mode7_GhostValleyTrack.lz5"
GFX_Mode7_GhostValleyTrackEnd:
GFX_Sprite_Letters:
	db "GFX_Sprite_Letters.lz5"
GFX_Sprite_LettersEnd:
GFX_CharacterSelectScreen:
	db "GFX_CharacterSelectScreen.lz5"
GFX_CharacterSelectScreenEnd:
GFX_TitleScreen:
	db "GFX_TitleScreen.lz5"
GFX_TitleScreenEnd:
GFX_TournamentEndCutscene:
	db "GFX_TournamentEndCutscene.lz5"
GFX_TournamentEndCutsceneEnd:
GFX_Mode7_ChocoIslandTrack:
	db "GFX_Mode7_ChocoIslandTrack.lz5"
GFX_Mode7_ChocoIslandTrackEnd:

;--------------------------------------------------------------------

Music_GhostValley:
	db "Music_GhostValley.lz5"
Music_GhostValleyEnd:
Music_TournamentWin:
	db "Music_TournamentWin.lz5"
Music_TournamentWinEnd:
Music_DonutPlains:
	db "Music_DonutPlains.lz5"
Music_DonutPlainsEnd:
Music_TitleScreen:
	db "Music_TitleScreen.lz5"
Music_TitleScreenEnd:
Music_KoopaBeach:
	db "Music_KoopaBeach.lz5"
Music_KoopaBeachEnd:
Music_BowserCastle:
	db "Music_BowserCastle.lz5"
Music_BowserCastleEnd:
Music_ChocoIsland:
	db "Music_ChocoIsland.lz5"
Music_ChocoIslandEnd:
Music_CharacterSelect:
	db "Music_CharacterSelect.lz5"
Music_CharacterSelectEnd:
Music_RainbowRoad:
	db "Music_RainbowRoad.lz5"
Music_RainbowRoadEnd:
Music_MarioCircut:
	db "Music_MarioCircut.lz5"
Music_MarioCircutEnd:
Music_BattleMode:
	db "Music_BattleMode.lz5"
Music_BattleModeEnd:
Music_VanillaLake:
	db "Music_VanillaLake.lz5"
Music_VanillaLakeEnd:
Music_StaffRoll:
	db "Music_StaffRoll.lz5"
Music_StaffRollEnd:
Music_TournamentLose:
	db "Music_TournamentLose.lz5"
Music_TournamentLoseEnd:

;--------------------------------------------------------------------

BRRFile00:
	db "00.brr"
BRRFile00End:
BRRFile01:
	db "01.brr"
BRRFile01End:
BRRFile02:
	db "02.brr"
BRRFile02End:
BRRFile03:
	db "03.brr"
BRRFile03End:
BRRFile04:
	db "04.brr"
BRRFile04End:
BRRFile05:
	db "05.brr"
BRRFile05End:
BRRFile06:
	db "06.brr"
BRRFile06End:
BRRFile07:
	db "07.brr"
BRRFile07End:
BRRFile07_02:
	db "07_02.brr"
BRRFile07_02End:
BRRFile08:
	db "08.brr"
BRRFile08End:
BRRFile09:
	db "09.brr"
BRRFile09End:
BRRFile0A:
	db "0A.brr"
BRRFile0AEnd:
BRRFile0B:
	db "0B.brr"
BRRFile0BEnd:
BRRFile0C:
	db "0C.brr"
BRRFile0CEnd:
BRRFile0D:
	db "0D.brr"
BRRFile0DEnd:
BRRFile0E:
	db "0E.brr"
BRRFile0EEnd:
BRRFile0F:
	db "0F.brr"
BRRFile0FEnd:
BRRFile10:
	db "10.brr"
BRRFile10End:
BRRFile11:
	db "11.brr"
BRRFile11End:
BRRFile12:
	db "12.brr"
BRRFile12End:
BRRFile13:
	db "13.brr"
BRRFile13End:
BRRFile14:
	db "14.brr"
BRRFile14End:
BRRFile15:
	db "15.brr"
BRRFile15End:
BRRFile16:
	db "16.brr"
BRRFile16End:
BRRFile17:
	db "17.brr"
BRRFile17End:
BRRFile18:
	db "18.brr"
BRRFile18End:
BRRFile19:
	db "19.brr"
BRRFile19End:

;--------------------------------------------------------------------
