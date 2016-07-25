
local addonName, addon = ...
local _G = _G

-- GLOBALS: UIDropDownMenu_AddButton

addon.hiddenOptions = {
	["UnitNameOwn"] = { prettyName = UNIT_NAME_OWN, description = OPTION_TOOLTIP_UNIT_NAME_OWN, type = "boolean" },
	["UnitNameNPC"] = { prettyName = UNIT_NAME_NPC, description = OPTION_TOOLTIP_UNIT_NAME_NPC, type = "boolean" },
	["UnitNameNonCombatCreatureName"] = { prettyName = UNIT_NAME_NONCOMBAT_CREATURE, description = OPTION_TOOLTIP_UNIT_NAME_NONCOMBAT_CREATURE, type = "boolean" },
	["UnitNamePlayerGuild"] = { prettyName = UNIT_NAME_GUILD, description = OPTION_TOOLTIP_UNIT_NAME_GUILD, type = "boolean" },
	["UnitNameGuildTitle"] = { prettyName = UNIT_NAME_GUILD_TITLE, description = OPTION_TOOLTIP_UNIT_NAME_GUILD_TITLE , type = "boolean" },
	["UnitNamePlayerPVPTitle"] = { prettyName = UNIT_NAME_PLAYER_TITLE, description = OPTION_TOOLTIP_UNIT_NAME_PLAYER_TITLE, type = "boolean" },

	["UnitNameFriendlyPlayerName"] = { prettyName = UNIT_NAME_FRIENDLY, description = OPTION_TOOLTIP_UNIT_NAME_FRIENDLY, type = "boolean" },
	["UnitNameFriendlyPetName"] = { prettyName = UNIT_NAME_FRIENDLY_PETS, description = OPTION_TOOLTIP_UNIT_NAME_FRIENDLY_PETS, type = "boolean" },
	["UnitNameFriendlyGuardianName"] = { prettyName = UNIT_NAME_FRIENDLY_GUARDIANS, description = OPTION_TOOLTIP_UNIT_NAME_FRIENDLY_GUARDIANS, type = "boolean" },
	["UnitNameFriendlyTotemName"] = { prettyName = UNIT_NAME_FRIENDLY_TOTEMS, description = OPTION_TOOLTIP_UNIT_NAME_FRIENDLY_TOTEMS, type = "boolean" },

	["UnitNameEnemyPlayerName"] = { prettyName = UNIT_NAME_ENEMY, description = OPTION_TOOLTIP_UNIT_NAME_ENEMY, type = "boolean" },
	["UnitNameEnemyPetName"] = { prettyName = UNIT_NAME_ENEMY_PETS, description = OPTION_TOOLTIP_UNIT_NAME_ENEMY_PETS, type = "boolean" },
	["UnitNameEnemyGuardianName"] = { prettyName = UNIT_NAME_ENEMY_GUARDIANS, description = OPTION_TOOLTIP_UNIT_NAME_ENEMY_GUARDIANS, type = "boolean" },
	["UnitNameEnemyTotemName"] = { prettyName = UNIT_NAME_ENEMY_TOTEMS, description = OPTION_TOOLTIP_UNIT_NAME_ENEMY_TOTEMS, type = "boolean" },
	["UnitNameForceHideMinus"] = { prettyName = UNIT_NAME_HIDE_MINUS, description = OPTION_TOOLTIP_UNIT_NAME_HIDE_MINUS, type = "boolean" },

	["nameplateShowFriends"] = { prettyName = UNIT_NAMEPLATES_SHOW_FRIENDS, description = OPTION_TOOLTIP_UNIT_NAMEPLATES_SHOW_FRIENDS, type = "boolean" },
	["nameplateShowFriendlyPets"] = { prettyName = UNIT_NAMEPLATES_SHOW_FRIENDLY_PETS, description = OPTION_TOOLTIP_UNIT_NAMEPLATES_SHOW_FRIENDLY_PETS, type = "boolean" },
	["nameplateShowFriendlyGuardians"] = { prettyName = UNIT_NAMEPLATES_SHOW_FRIENDLY_GUARDIANS, description = OPTION_TOOLTIP_UNIT_NAMEPLATES_SHOW_FRIENDLY_GUARDIANS, type = "boolean" },
	["nameplateShowFriendlyTotems"] = { prettyName = UNIT_NAMEPLATES_SHOW_FRIENDLY_TOTEMS, description = OPTION_TOOLTIP_UNIT_NAMEPLATES_SHOW_FRIENDLY_TOTEMS, type = "boolean" },
	["nameplateShowEnemies"] = { prettyName = UNIT_NAMEPLATES_SHOW_ENEMIES, description = OPTION_TOOLTIP_UNIT_NAMEPLATES_SHOW_ENEMIES, type = "boolean" },
	["nameplateShowEnemyPets"] = { prettyName = UNIT_NAMEPLATES_SHOW_ENEMY_PETS, description = OPTION_TOOLTIP_UNIT_NAMEPLATES_SHOW_ENEMY_PETS, type = "boolean" },
	["nameplateShowEnemyGuardians"] = { prettyName = UNIT_NAMEPLATES_SHOW_ENEMY_GUARDIANS, description = OPTION_TOOLTIP_UNIT_NAMEPLATES_SHOW_ENEMY_GUARDIANS, type = "boolean" },
	["nameplateShowEnemyTotems"] = { prettyName = UNIT_NAMEPLATES_SHOW_ENEMY_TOTEMS, description = OPTION_TOOLTIP_UNIT_NAMEPLATES_SHOW_ENEMY_TOTEMS, type = "boolean" },
	["nameplateShowEnemyMinus"] = { prettyName = UNIT_NAMEPLATES_SHOW_ENEMY_MINUS, description = OPTION_TOOLTIP_UNIT_NAMEPLATES_SHOW_ENEMY_MINUS, type = "boolean" },
	["ShowClassColorInNameplate"] = { prettyName = SHOW_CLASS_COLOR_IN_V_KEY, description = OPTION_TOOLTIP_SHOW_CLASS_COLOR_IN_V_KEY, type = "boolean" },
	["nameplateOtherAtBase"] = { prettyName = "Nameplate at Base", description = "Position other nameplates at the base, rather than overhead. 2=under unit, 0=over unit", type = "boolean" },
	["nameplateOverlapH"] = { prettyName = "Nameplate Overlap (Horizontal)", description = "Percentage amount for horizontal overlap of nameplates", type = "number" },
	["nameplateOverlapV"] = { prettyName = "Nameplate Overlap (Vertical)", description = "Percentage amount for vertical overlap of nameplates", type = "number" },
	["nameplateMaxDistance"] = { prettyName = "Nameplate Distance", description = "The max distance to show nameplates.", type = "number" },
	["nameplateTargetBehindMaxDistance"] = { prettyName = "Nameplate Target Behind Distance", description = "The max distance to show the target nameplate when the target is behind the camera.", type = "number" },
	["nameplateGlobalScale"] = { prettyName = "Nameplate Global Scale", description = "Applies global scaling to non-self nameplates, this is applied AFTER selected, min, and max scale.", type = "number" },
	["nameplateMinScale"] = { prettyName = "Nameplate Min Scale", description = "The minimum scale of nameplates.", type = "number" },
	["nameplateMaxScale"] = { prettyName = "Nameplate Max Scale", description = "The max scale of nameplates.", type = "number" },
	["nameplateLargerScale"] = { prettyName = "Nameplate Larger Scale", description = "An additional scale modifier for important monsters.", type = "number" },
	["nameplateMinScaleDistance"] = { prettyName = "Nameplate Min Scale Distance", description = "The distance from the max distance that nameplates will reach their minimum scale.", type = "number" },
	["nameplateMaxScaleDistance"] = { prettyName = "Nameplate Max Scale Distance", description = "The distance from the camera that nameplates will reach their maximum scale", type = "number" },
	["nameplateMinAlpha"] = { prettyName = "Nameplate Min Alpha", description = "The minimum alpha of nameplates.", type = "number" },
	["nameplateMaxAlpha"] = { prettyName = "Nameplate Max Alpha", description = "The max alpha of nameplates.", type = "number" },
	["nameplateMinAlphaDistance"] = { prettyName = "Nameplate Min Alpha Distance", description = "The distance from the max distance that nameplates will reach their minimum alpha.", type = "number" },
	["nameplateMaxAlphaDistance"] = { prettyName = "Nameplate Max Alpha Distance", description = "The distance from the camera that nameplates will reach their maximum alpha.", type = "number" },
	["nameplateSelectedScale"] = { prettyName = "Nameplate Selected Scale", description = "The scale of the selected nameplate.", type = "number" },
	["nameplateSelectedAlpha"] = { prettyName = "Nameplate Selected Alpha", description = "The alpha of the selected nameplate.", type = "number" },
	["nameplateSelfScale"] = { prettyName = "Nameplate Self Scale", description = "The scale of the self nameplate.", type = "number" },
	["nameplateSelfAlpha"] = { prettyName = "Nameplate Self Alpha", description = "The alpha of the self nameplate.", type = "number" },
	["nameplateSelfBottomInset"] = { prettyName = "Nameplate Self Bottom Inset", description = "The inset from the bottom (in screen percent) that the self nameplate is clamped to.", type = "number" },
	["nameplateSelfTopInset"] = { prettyName = "Nameplate Self Top Inset", description = "The inset from the top (in screen percent) that the self nameplate is clamped to.", type = "number" },
	["nameplateOtherBottomInset"] = { prettyName = "Nameplate Other Bottom Inset", description = "The inset from the bottom (in screen percent) that the non-self nameplates are clamped to.", type = "number" },
	["nameplateOtherTopInset"] = { prettyName = "Nameplate Other Top Inset", description = "The inset from the top (in screen percent) that the non-self nameplates are clamped to.", type = "number" },
	["nameplateLargeBottomInset"] = { prettyName = "Nameplate Large Bottom Inset", description = "The inset from the bottom (in screen percent) that large nameplates are clamped to.", type = "number" },
	["nameplateLargeTopInset"] = { prettyName = "Nameplate Large Top Inset", description = "The inset from the top (in screen percent) that large nameplates are clamped to.", type = "number" },
	["nameplateClassResourceTopInset"] = { prettyName = "Nameplate Class Resource Top Inset", description = "The inset from the top (in screen percent) that nameplates are clamped to when class resources are being displayed on them.", type = "number" },
	["NamePlateHorizontalScale"] = { prettyName = "Nameplate Horizontal Scale", description = "Applied to horizontal size of all nameplates.", type = "number" },
	["NamePlateVerticalScale"] = { prettyName = "Nameplate Vertical Scale", description = "Applied to vertical size of all nameplates.", type = "number" },
	["nameplateResourceOnTarget"] = { prettyName = "Nameplate Resource On Target", description = "Nameplate class resource overlay mode. 0=self, 1=target", type = "number" },
	["nameplateShowSelf"] = { prettyName = "Show Nameplate Resource Bar", description = "Display class resource bar. 0=off 1=on", type = "number" },
	["nameplateShowAll"] = { prettyName = "Always Show Nameplates", description = "Show nameplates at all times.", type = "number" },

	["reverseCleanupBags"] = { prettyName = REVERSE_CLEAN_UP_BAGS_TEXT, description = OPTION_TOOLTIP_REVERSE_CLEAN_UP_BAGS, type = "boolean" },
	["lootLeftmostBag"] = { prettyName = REVERSE_NEW_LOOT_TEXT, description = OPTION_TOOLTIP_REVERSE_NEW_LOOT, type = "boolean" },
	["stopAutoAttackOnTargetChange"] = { prettyName = STOP_AUTO_ATTACK, description = OPTION_TOOLTIP_STOP_AUTO_ATTACK, type = "boolean" },
	["assistAttack"] = { prettyName = ASSIST_ATTACK, description = OPTION_TOOLTIP_ASSIST_ATTACK, type = "boolean" },
	["autoSelfCast"] = { prettyName = AUTO_SELF_CAST_TEXT, description = OPTION_TOOLTIP_SELF_CAST_TEXT, type = "boolean" },
	["ActionButtonUseKeyDown"] = { prettyName = ACTION_BUTTON_USE_KEY_DOWN, description = OPTION_TOOLTIP_ACTION_BUTTON_USE_KEY_DOWN, type = "boolean" },
	["mapFade"] = { prettyName = MAP_FADE_TEXT, description = OPTION_TOOLTIP_MAP_FADE, type = "boolean" },
	["trackQuestSorting"] = { type = "table", options = {"proximity", "top" } },
	["removeChatDelay"] = { prettyName = REMOVE_CHAT_DELAY_TEXT, description = OPTION_TOOLTIP_REMOVE_CHAT_DELAY_TEXT, type = "boolean" },
	["secureAbilityToggle"] = { prettyName = SECURE_ABILITY_TOGGLE, description = OPTION_TOOLTIP_SECURE_ABILITY_TOGGLE, type = "boolean" },
	["scriptErrors"] = { prettyName = SHOW_LUA_ERRORS, description = OPTION_TOOLTIP_SHOW_LUA_ERRORS, type = "boolean" },
	["lootUnderMouse"] = { prettyName = LOOT_UNDER_MOUSE_TEXT, description = OPTION_TOOLTIP_LOOT_UNDER_MOUSE_TEXT, type = "boolean" },

	["autoLootDefault"] = { prettyName = AUTO_LOOT_DEFAULT_TEXT, description = OPTION_TOOLTIP_AUTO_LOOT_DEFAULT, type = "boolean" },
	["threatShowNumeric"] = { prettyName = SHOW_NUMERIC_THREAT, description = OPTION_TOOLTIP_SHOW_NUMERIC_THREAT, type = "boolean" },
	["showLootSpam"] = { prettyName = SHOW_LOOT_SPAM, description = OPTION_TOOLTIP_SHOW_LOOT_SPAM, type = "boolean" },
	["advancedWatchFrame"] = { prettyName = ADVANCED_OBJECTIVES_TEXT, description = OPTION_TOOLTIP_ADVANCED_OBJECTIVES_TEXT, type = "" },
	["watchFrameIgnoreCursor"] = { prettyName = OBJECTIVES_IGNORE_CURSOR_TEXT, description = OPTION_TOOLTIP_OBJECTIVES_IGNORE_CURSOR, type = "boolean" },
	["guildMemberNotify"] = { prettyName = GUILDMEMBER_ALERT, description = OPTION_TOOLTIP_GUILDMEMBER_ALERT, type = "boolean" },
	["showArenaEnemyFrames"] = { prettyName = SHOW_ARENA_ENEMY_FRAMES_TEXT, description = OPTION_TOOLTIP_SHOW_ARENA_ENEMY_FRAMES, type = "boolean" },

	["autoClearAFK"] = { prettyName = nil, description = OPTION_TOOLTIP_CLEAR_AFK, type = "boolean" },
	["colorblindWeaknessFactor"] = { prettyName = nil, description = OPTION_TOOLTIP_ADJUST_COLORBLIND_STRENGTH, type = "boolean" },
	["autoLootDefault"] = { prettyName = nil, description = OPTION_TOOLTIP_AUTO_LOOT_DEFAULT, type = "boolean" },
	["autoLootRate"] = { prettyName = "Auto Loot Rate", description = "Rate in milliseconds to tick auto loot", type = "number" },
	["ChatAmbienceVolume"] = { prettyName = nil, description = OPTION_TOOLTIP_, type = "boolean" },
	["threatShowNumeric"] = { prettyName = nil, description = OPTION_TOOLTIP_SHOW_NUMERIC_THREAT, type = "boolean" },
	["rightActionBar"] = { prettyName = nil, description = OPTION_TOOLTIP_SHOW_MULTIBAR3, type = "boolean" },
	["emphasizeMySpellEffects"] = { prettyName = nil, description = OPTION_TOOLTIP_EMPHASIZE_MY_SPELLS, type = "boolean" },
	["chatBubblesParty"] = { prettyName = nil, description = OPTION_TOOLTIP_PARTY_CHAT_BUBBLES, type = "boolean" },
	["enableTwitter"] = { prettyName = nil, description = OPTION_TOOLTIP_SOCIAL_ENABLE_TWITTER_FUNCTIONALITY, type = "boolean" },
	["threatPlaySounds"] = { prettyName = nil, description = OPTION_TOOLTIP_PLAY_AGGRO_SOUNDS, type = "boolean" },

	["showToastOnline"] = { prettyName = SHOW_TOAST_ONLINE_TEXT, description = OPTION_TOOLTIP_SHOW_TOAST_ONLINE, type = "boolean" },
	["showToastOffline"] = { prettyName = SHOW_TOAST_OFFLINE_TEXT, description = OPTION_TOOLTIP_SHOW_TOAST_OFFLINE, type = "boolean" },
	["showToastBroadcast"] = { prettyName = SHOW_TOAST_BROADCAST_TEXT, description = OPTION_TOOLTIP_SHOW_TOAST_BROADCAST, type = "boolean" },
	["showToastFriendRequest"] = { prettyName = SHOW_TOAST_FRIEND_REQUEST_TEXT, description = OPTION_TOOLTIP_SHOW_TOAST_FRIEND_REQUEST, type = "boolean" },
	["showToastConversation"] = { prettyName = SHOW_TOAST_CONVERSATION_TEXT, description = OPTION_TOOLTIP_SHOW_TOAST_CONVERSATION, type = "boolean" },
	["showToastWindow"] = { prettyName = SHOW_TOAST_WINDOW_TEXT, description = OPTION_TOOLTIP_SHOW_TOAST_WINDOW, type = "boolean" },
	["toastDuration"] = { prettyName = nil, description = OPTION_TOOLTIP_TOAST_DURATION, type = "number" },

	["enableMouseSpeed"] = { prettyName = ENABLE_MOUSE_SPEED, description = OPTION_TOOLTIP_ENABLE_MOUSE_SPEED, type = "boolean" },
	["mouseInvertPitch"] = { prettyName = INVERT_MOUSE, description = OPTION_TOOLTIP_INVERT_MOUSE, type = "boolean" },
	["enableWoWMouse"] = { prettyName = WOW_MOUSE, description = OPTION_TOOLTIP_WOW_MOUSE, type = "boolean" },
	["autointeract"] = { prettyName = CLICK_TO_MOVE, description = OPTION_TOOLTIP_CLICK_TO_MOVE, type = "boolean" },
	["mouseSpeed"] = { prettyName = MOUSE_SENSITIVITY, description = OPTION_TOOLTIP_MOUSE_SENSITIVITY, type = "number" },

	["wholeChatWindowClickable"] = { prettyName = nil, description = OPTION_TOOLTIP_CHAT_WHOLE_WINDOW_CLICKABLE, type = "boolean" },
	["useEnglishAudio"] = { prettyName = nil, description = OPTION_TOOLTIP_USE_ENGLISH_AUDIO, type = "boolean" },
	["ChatSoundVolume"] = { prettyName = nil, description = OPTION_TOOLTIP_, type = "number" },
	["reducedLagTolerance"] = { prettyName = nil, description = OPTION_TOOLTIP_REDUCED_LAG_TOLERANCE, type = "boolean" },
	["EnableMicrophone"] = { prettyName = nil, description = OPTION_TOOLTIP_ENABLE_MICROPHONE, type = "boolean" },
	["autoOpenLootHistory"] = { prettyName = nil, description = OPTION_TOOLTIP_AUTO_OPEN_LOOT_HISTORY, type = "boolean" },
	["showVKeyCastbarOnlyOnTarget"] = { prettyName = nil, description = OPTION_TOOLTIP_SHOW_TARGET_CASTBAR_IN_V_KEY_ONLY_ON_TARGET, type = "boolean" },
	["displaySpellActivationOverlays"] = { prettyName = nil, description = OPTION_TOOLTIP_DISPLAY_SPELL_ALERTS, type = "boolean" },
	["hdPlayerModels"] = { prettyName = nil, description = OPTION_TOOLTIP_SHOW_HD_MODELS, type = "boolean" },
	["autoLootKey"] = { prettyName = nil, description = OPTION_TOOLTIP_AUTO_LOOT_KEY, type = "boolean" }, -- TODO TYPE
	["MaxSpellStartRecoveryOffset"] = { prettyName = nil, description = OPTION_TOOLTIP_LAG_TOLERANCE, type = "number" },
	["advancedCombatLogging"] = { prettyName = nil, description = OPTION_TOOLTIP_ADVANCED_COMBAT_LOGGING, type = "boolean" },
	["disableServerNagle"] = { prettyName = nil, description = OPTION_TOOLTIP_OPTIMIZE_NETWORK_SPEED, type = "boolean" },
	["cameraYawSmoothSpeed"] = { prettyName = nil, description = OPTION_TOOLTIP_AUTO_FOLLOW_SPEED, type = "number" },
	["cameraWaterCollision"] = { prettyName = nil, description = OPTION_TOOLTIP_WATER_COLLISION, type = "boolean" },
	["cameraBobbing"] = { prettyName = nil, description = OPTION_TOOLTIP_HEAD_BOB, type = "boolean" },
	["cameraPivot"] = { prettyName = nil, description = OPTION_TOOLTIP_SMART_PIVOT, type = "boolean" },
	["cameraDistanceMaxFactor"] = { prettyName = nil, description = OPTION_TOOLTIP_MAX_FOLLOW_DIST, type = "number" },
	["cameraYawMoveSpeed"] = { prettyName = MOUSE_LOOK_SPEED, description = OPTION_TOOLTIP_MOUSE_LOOK_SPEED, type = "number" },
	["cameraTerrainTilt"] = { prettyName = nil, description = OPTION_TOOLTIP_FOLLOW_TERRAIN, type = "boolean" },
	["cameraHeadMovementStrength"] = { prettyName = nil, description = nil, type = "number" },
	["cameraHeadMovementWhileStanding"] = { prettyName = nil, description = nil, type = "number" },
	["cameraHeadMovementRange"] = { prettyName = nil, description = nil, type = "number" },
	["cameraHeadMovementSmoothRate"] = { prettyName = nil, description = nil, type = "number" },
	["cameraDynamicPitch"] = { prettyName = nil, description = nil, type = "number" },
	["cameraDynamicPitchBaseFovPad"] = { prettyName = nil, description = nil, type = "number" },
	["cameraDynamicPitchBaseFovPadFlying"] = { prettyName = nil, description = nil, type = "number" },
	["cameraDynamicPitchSmartPivotCutoffDist"] = { prettyName = nil, description = nil, type = "number" },
	["cameraOverShoulder"] = { prettyName = nil, description = nil, type = "number" },
	["cameraLockedTargetFocusing"] = { prettyName = nil, description = nil, type = "number" },
	["cameraDistanceMoveSpeed"] = { prettyName = nil, description = nil, type = "number" },
	["cameraPitchMoveSpeed"] = { prettyName = nil, description = nil, type = "number" },
	["cameraBobbingSmoothSpeed"] = { prettyName = nil, description = nil, type = "number" },
	["cameraFoVSmoothSpeed"] = { prettyName = nil, description = nil, type = "number" },
	["cameraDistanceSmoothSpeed"] = { prettyName = nil, description = nil, type = "number" },
	["cameraGroundSmoothSpeed"] = { prettyName = nil, description = nil, type = "number" },
	["cameraHeightSmoothSpeed"] = { prettyName = nil, description = nil, type = "number" },
	["cameraPitchSmoothSpeed"] = { prettyName = nil, description = nil, type = "number" },
	["cameraTargetSmoothSpeed"] = { prettyName = nil, description = nil, type = "number" },
	["cameraFlyingMountHeightSmoothSpeed"] = { prettyName = nil, description = nil, type = "number" },
	["cameraViewBlendStyle"] = { prettyName = nil, description = nil, type = "number" },
	["camerasmooth"] = { prettyName = nil, description = nil, type = "number" },
	["cameraSmoothPitch"] = { prettyName = nil, description = nil, type = "number" },
	["cameraSmoothYaw"] = { prettyName = nil, description = nil, type = "number" },
	["cameraSmoothStyle"] = { prettyName = nil, description = nil, type = "number" },
	["cameraSmoothTrackingStyle"] = { prettyName = nil, description = nil, type = "number" },

	["chatBubbles"] = { prettyName = nil, description = OPTION_TOOLTIP_CHAT_BUBBLES, type = "boolean" },
	["autoDismountFlying"] = { prettyName = nil, description = OPTION_TOOLTIP_AUTO_DISMOUNT_FLYING, type = "boolean" },
	["bottomRightActionBar"] = { prettyName = nil, description = OPTION_TOOLTIP_SHOW_MULTIBAR2, type = "boolean" },

	["showPartyBackground"] = { prettyName = SHOW_PARTY_BACKGROUND_TEXT, description = OPTION_TOOLTIP_SHOW_PARTY_BACKGROUND, type = "boolean" },
	["showPartyPets"] = { prettyName = SHOW_PARTY_PETS_TEXT, description = OPTION_TOOLTIP_SHOW_PARTY_PETS, type = "boolean" },
	["showArenaEnemyFrames"] = { prettyName = SHOW_ARENA_ENEMY_FRAMES_TEXT, description = OPTION_TOOLTIP_SHOW_ARENA_ENEMY_FRAMES, type = "boolean" },
	["showArenaEnemyCastbar"] = { prettyName = SHOW_ARENA_ENEMY_CASTBAR_TEXT, description = OPTION_TOOLTIP_SHOW_ARENA_ENEMY_CASTBAR, type = "boolean" },
	["showArenaEnemyPets"] = { prettyName = SHOW_ARENA_ENEMY_PETS_TEXT, description = OPTION_TOOLTIP_SHOW_ARENA_ENEMY_PETS, type = "boolean" },
	["fullSizeFocusFrame"] = { prettyName = FULL_SIZE_FOCUS_FRAME_TEXT, description = OPTION_TOOLTIP_FULL_SIZE_FOCUS_FRAME, type = "boolean" },

	["showChatIcons"] = { prettyName = nil, description = OPTION_TOOLTIP_SHOW_CHAT_ICONS, type = "boolean" },
	["spamFilter"] = { prettyName = nil, description = OPTION_TOOLTIP_SPAM_FILTER, type = "boolean" },
	["profanityFilter"] = { prettyName = nil, description = OPTION_TOOLTIP_PROFANITY_FILTER, type = "boolean" },
	["EnableVoiceChat"] = { prettyName = nil, description = OPTION_TOOLTIP_ENABLE_VOICECHAT, type = "boolean" },
	["rightTwoActionBar"] = { prettyName = nil, description = OPTION_TOOLTIP_SHOW_MULTIBAR4, type = "boolean" },
	["rotateMinimap"] = { prettyName = nil, description = OPTION_TOOLTIP_ROTATE_MINIMAP, type = "boolean" },
	["blockTrades"] = { prettyName = nil, description = OPTION_TOOLTIP_BLOCK_TRADES, type = "boolean" },
	["movieSubtitle"] = { prettyName = nil, description = OPTION_TOOLTIP_CINEMATIC_SUBTITLES, type = "boolean" },
	["displayFreeBagSlots"] = { prettyName = nil, description = OPTION_TOOLTIP_DISPLAY_FREE_BAG_SLOTS, type = "boolean" },
	["lockActionBars"] = { prettyName = nil, description = OPTION_TOOLTIP_LOCK_ACTIONBAR, type = "boolean" },
	["screenEdgeFlash"] = { prettyName = nil, description = OPTION_TOOLTIP_SHOW_FULLSCREEN_STATUS, type = "boolean" },
	["showVKeyCastbar"] = { prettyName = nil, description = OPTION_TOOLTIP_SHOW_TARGET_CASTBAR_IN_V_KEY, type = "boolean" },
	["chatMouseScroll"] = { prettyName = CHAT_MOUSE_WHEEL_SCROLL, description = OPTION_TOOLTIP_CHAT_MOUSE_WHEEL_SCROLL, type = "boolean" },
	["showGameTips"] = { prettyName = SHOW_TIPOFTHEDAY_TEXT, description = OPTION_TOOLTIP_SHOW_TIPOFTHEDAY, type = "boolean" },
	["InboundChatVolume"] = { prettyName = nil, description = OPTION_TOOLTIP_VOICE_OUTPUT_VOLUME, type = "number" },
	["spellActivationOverlayOpacity"] = { prettyName = nil, description = OPTION_TOOLTIP_SPELL_ALERT_OPACITY, type = "number" },
	["PushToTalkSound"] = { prettyName = nil, description = OPTION_TOOLTIP_PUSHTOTALK_SOUND, type = "boolean" },
	["countdownForCooldowns"] = { prettyName = nil, description = OPTION_TOOLTIP_COUNTDOWN_FOR_COOLDOWNS, type = "boolean" },
	["VoiceActivationSensitivity"] = { prettyName = nil, description = OPTION_TOOLTIP_VOICE_ACTIVATION_SENSITIVITY, type = "number" },
	["alwaysShowActionBars"] = { prettyName = nil, description = OPTION_TOOLTIP_ALWAYS_SHOW_MULTIBARS, type = "boolean" },
	["OutboundChatVolume"] = { prettyName = nil, description = OPTION_TOOLTIP_VOICE_INPUT_VOLUME, type = "number" },
	["autoQuestWatch"] = { prettyName = nil, description = OPTION_TOOLTIP_AUTO_QUEST_WATCH, type = "boolean" },
	["SpellTooltip_DisplayAvgValues"] = { prettyName = nil, description = OPTION_TOOLTIP_SHOW_POINTS_AS_AVG, type = "boolean" },

	["xpBarText"] = { prettyName = XP_BAR_TEXT, description = OPTION_TOOLTIP_XP_BAR, type = "boolean" },

	["bottomLeftActionBar"] = { prettyName = nil, description = OPTION_TOOLTIP_SHOW_MULTIBAR1, type = "boolean" },
	["showVKeyCastbarSpellName"] = { prettyName = nil, description = OPTION_TOOLTIP_SHOW_TARGET_CASTBAR_IN_V_KEY_SPELL_NAME, type = "boolean" },
	["buffDurations"] = { prettyName = SHOW_BUFF_DURATION_TEXT, description = OPTION_TOOLTIP_SHOW_BUFF_DURATION, type = "boolean" },
	["showDispelDebuffs"] = { prettyName = SHOW_DISPELLABLE_DEBUFFS_TEXT, description = OPTION_TOOLTIP_SHOW_DISPELLABLE_DEBUFFS, type = "boolean" },
	["showCastableBuffs"] = { prettyName = SHOW_CASTABLE_BUFFS_TEXT, description = OPTION_TOOLTIP_SHOW_CASTABLE_BUFFS, type = "boolean" },
	["deselectOnClick"] = { prettyName = nil, description = OPTION_TOOLTIP_GAMEFIELD_DESELECT, type = "boolean" },
	["autoQuestProgress"] = { prettyName = nil, description = OPTION_TOOLTIP_AUTO_QUEST_PROGRESS, type = "boolean" },
	["UberTooltips"] = { prettyName = USE_UBERTOOLTIPS, description = OPTION_TOOLTIP_USE_UBERTOOLTIPS, type = "boolean" },
	["Sound_EnableAllSound"] = { prettyName = ENABLE_SOUND, description = OPTION_TOOLTIP_ENABLE_SOUND, type = "boolean" },
	["Sound_EnableDSPEffects"] = { prettyName = ENABLE_DSP_EFFECTS, description = OPTION_TOOLTIP_ENABLE_DSP_EFFECTS, type = "boolean" },
	["Sound_SFXVolume"] = { prettyName = SOUND_VOLUME, description = OPTION_TOOLTIP_SOUND_VOLUME, type = "number" },
	["Sound_ZoneMusicNoDelay"] = { prettyName = ENABLE_MUSIC_LOOPING, description = OPTION_TOOLTIP_ENABLE_MUSIC_LOOPING, type = "boolean" },
	["Sound_EnableDialog"] = { prettyName = ENABLE_DIALOG, description = OPTION_TOOLTIP_ENABLE_DIALOG, type = "boolean" },
	["Sound_EnableSoundWhenGameIsInBG"] = { prettyName = ENABLE_BGSOUND, description = OPTION_TOOLTIP_ENABLE_BGSOUND, type = "boolean" },
	["Sound_EnableEmoteSounds"] = { prettyName = ENABLE_EMOTE_SOUNDS, description = OPTION_TOOLTIP_ENABLE_EMOTE_SOUNDS, type = "boolean" },
	["Sound_EnableAmbience"] = { prettyName = ENABLE_AMBIENCE, description = OPTION_TOOLTIP_ENABLE_AMBIENCE, type = "boolean" },
	["Sound_DialogVolume"] = { prettyName = DIALOG_VOLUME, description = OPTION_TOOLTIP_DIALOG_VOLUME, type = "number" },
	["Sound_EnablePetBattleMusic"] = { prettyName = ENABLE_PET_BATTLE_MUSIC, description = OPTION_TOOLTIP_ENABLE_PET_BATTLE_MUSIC, type = "boolean" },
	["Sound_MusicVolume"] = { prettyName = MUSIC_VOLUME, description = OPTION_TOOLTIP_MUSIC_VOLUME, type = "number" },
	["Sound_EnableReverb"] = { prettyName = ENABLE_REVERB, description = OPTION_TOOLTIP_ENABLE_REVERB, type = "boolean" },
	["Sound_MasterVolume"] = { prettyName = MASTER_VOLUME, description = OPTION_TOOLTIP_MASTER_VOLUME, type = "number" },
	["Sound_EnableMusic"] = { prettyName = ENABLE_MUSIC, description = OPTION_TOOLTIP_ENABLE_MUSIC, type = "boolean" },
	["Sound_AmbienceVolume"] = { prettyName = AMBIENCE_VOLUME, description = OPTION_TOOLTIP_AMBIENCE_VOLUME, type = "number" },
	["Sound_EnableErrorSpeech"] = { prettyName = ENABLE_ERROR_SPEECH, description = OPTION_TOOLTIP_ENABLE_ERROR_SPEECH, type = "boolean" },
	["Sound_EnableSFX"] = { prettyName = ENABLE_SOUNDFX, description = OPTION_TOOLTIP_ENABLE_SOUNDFX, type = "boolean" },
	["Sound_ListenerAtCharacter"] = { prettyName = ENABLE_SOUND_AT_CHARACTER, description = OPTION_TOOLTIP_ENABLE_SOUND_AT_CHARACTER, type = "boolean" },
	["Sound_EnablePetSounds"] = { prettyName = ENABLE_PET_SOUNDS, description = OPTION_TOOLTIP_ENABLE_PET_SOUNDS, type = "boolean" },

	["showTargetOfTarget"] = { prettyName = nil, description = OPTION_TOOLTIP_SHOW_TARGET_OF_TARGET, type = "boolean" },
	["guildMemberNotify"] = { prettyName = nil, description = OPTION_TOOLTIP_GUILDMEMBER_ALERT, type = "boolean" },
	["PetMeleeDamage"] = { prettyName = nil, description = OPTION_TOOLTIP_SHOW_PET_MELEE_DAMAGE, type = "boolean" },
	["Sound_EnableSoftwareHRTF"] = { prettyName = nil, description = OPTION_TOOLTIP_ENABLE_SOFTWARE_HRTF, type = "boolean" },
	["advancedWorldMap"] = { prettyName = nil, description = OPTION_TOOLTIP_ADVANCED_WORLD_MAP, type = "boolean" },
	["showTutorials"] = { prettyName = SHOW_TUTORIALS, description = OPTION_TOOLTIP_SHOW_TUTORIALS, type = "boolean" },
	["lossOfControl"] = { prettyName = nil, description = OPTION_TOOLTIP_LOSS_OF_CONTROL, type = "boolean" },
	["blockChannelInvites"] = { prettyName = nil, description = OPTION_TOOLTIP_BLOCK_CHAT_CHANNEL_INVITE, type = "boolean" },
	["showTargetCastbar"] = { prettyName = nil, description = OPTION_TOOLTIP_SHOW_TARGET_CASTBAR, type = "boolean" },
	["enablePetBattleCombatText"] = { prettyName = nil, description = OPTION_TOOLTIP_SHOW_PETBATTLE_COMBAT, type = "boolean" },
	--["CombatLogPeriodicSpells"] = { prettyName = nil, description = OPTION_TOOLTIP_LOG_PERIODIC_EFFECTS, type = "boolean" },
	["colorblindMode"] = { prettyName = nil, description = OPTION_TOOLTIP_USE_COLORBLIND_MODE, type = "boolean" },
	["useIPv6"] = { prettyName = USEIPV6, description = OPTION_TOOLTIP_USEIPV6, type = "boolean" },
	["interactOnLeftClick"] = { prettyName = INTERACT_ON_LEFT_CLICK_TEXT, description = OPTION_TOOLTIP_INTERACT_ON_LEFT_CLICK, type = "boolean" },
	["enableMovePad"] = { prettyName = MOVE_PAD, description = OPTION_TOOLTIP_MOVE_PAD, type = "boolean" },
	["colorblindSimulator"] = { prettyName = nil, description = OPTION_TOOLTIP_COLORBLIND_FILTER, type = "boolean" },

	["noBuffDebuffFilterOnTarget"] = { prettyName = "No Debuff Filter on Target", description = "Do not filter buffs or debuffs at all on targets", type = "boolean"},
	["showHonorAsExperience"] = { prettyName = nil, description = "Show the honor bar as a regular experience bar in place of rep", type = "boolean"},
	["ShowNamePlateLoseAggroFlash"] = { prettyName = nil, description = "When enabled, if you are a tank role and lose aggro, the nameplate with briefly flash.", type = "boolean"},
	["Sound_EnablePositionalLowPassFilter"] = { prettyName = ENABLE_SOFTWARE_HRTF, description = "", type = "boolean"},
	["TargetPriorityAllowAnyOnScreen"] = { prettyName = nil, description = "If set, and no 100% correct target is available, allow selecting any valid in-range target (2 = also out-of-range)", type = "boolean"},
	["TargetNearestUseOld"] = { prettyName = nil, description = "Use pre-7.0 'nearest target' functionality", type = "boolean"},
	["TargetPriorityCombatLock"] = { prettyName = nil, description = "1=Lock to in-combat targets when starting from an in-combat target. 2=Further restrict to in-combat with player.", type = "boolean"},
	["TargetPriorityCombatLockHighlight"] = { prettyName = nil, description = "1=Lock to in-combat targets when starting from an in-combat target. 2=Further restrict to in-combat with player. (while doing hold-to-target)", type = "boolean"},
	["TargetPriorityHoldHighlightDelay"] = { prettyName = nil, description = "Delay in Milliseconds before priority target highlight starts when holding the button", type = "number"},
	["TargetPriorityIncludeBehind"] = { prettyName = nil, description = "If set, include target's behind the player in priority target selection", type = "boolean"},
	["TargetPriorityPvp"] = { prettyName = nil, description = "When in pvp, give higher priority to players and important pvp targets (2 = all pvp targets, 3 = players only)", type = "boolean"},
	["TargetPriorityPvpLock"] = { prettyName = nil, description = "Lock to important pvp targets when starting from a pvp target.", type = "boolean"},
	["TargetPriorityPvpLockHighlight"] = { prettyName = nil, description = "Lock to players when starting from a player target in pvp. (while doing hold-to-target)", type = "boolean"},
	["TargetPriorityValueBank"] = { prettyName = nil, description = "Selects the scoring values bank for calculating target priority order", type = "boolean"},
	["unitClutter"] = { prettyName = nil, description = "Enables/Disables unit clutter", type = "boolean"},
	["unitClutterInstancesOnly"] = { prettyName = nil, description = "Whether or not to use unit clutter in instances only (0 or 1)", type = "boolean"},
	["unitClutterPlayerThreshold"] = { prettyName = nil, description = "The number of players that have to be nearby to trigger unit clutter", type = "boolean"},
	["UnitNameEnemyMinionName"] = { prettyName = UNIT_NAME_ENEMY_MINIONS, description = "", type = "boolean"},
	["UnitNameFriendlyMinionName"] = { prettyName = UNIT_NAME_FRIENDLY_MINIONS, description = "", type = "boolean"},
	["comboPointLocation"] = { prettyName = nil, description = "Location of combo points in UI. 1=target, 2=self", type = "number"},
	["doNotFlashLowHealthWarning"] = { prettyName = nil, description = "Do not flash your screen red when you are low on health.", type = "boolean"},
	["enableFloatingCombatText"] = { prettyName = nil, description = "Whether to show floating combat text", type = "boolean"},
	["findYourselfAnywhere"] = { prettyName = nil, description = "Always Highlight your character", type = "boolean"},
	["findYourselfAnywhereOnlyInCombat"] = { prettyName = nil, description = "Highlight your character only when in combat", type = "boolean"},
	["findYourselfInBG"] = { prettyName = nil, description = "Always Highlight your character in Battlegrounds", type = "boolean"},
	["findYourselfInBGOnlyInCombat"] = { prettyName = "Highlight your character in Battlegrounds only when in combat", description = "", type = "boolean"},
	["findYourselfInRaid"] = { prettyName = nil, description = "Always Highlight your character in Raids", type = "boolean"},
	["findYourselfInRaidOnlyInCombat"] = { prettyName = nil, description = "Highlight your character in Raids only when in combat", type = "boolean"},
	["findYourselfMode"] = { prettyName = nil, description = "Highlight you character. 0 = circle, 1 = circle & outline", type = "boolean"},
	["flashErrorMessageRepeats"] = { prettyName = nil, description = "Flashes the center screen red error text if the same message is fired.", type = "boolean"},
	["floatingCombatTextAllSpellMechanics"] = { prettyName = nil, description = "", type = "boolean"},
	["floatingCombatTextAuras"] = { prettyName = "FCT: Auras", description = "", type = "boolean"},
	["floatingCombatTextCombatDamage"] = { prettyName = nil, description = "Display damage numbers over hostile creatures when damaged", type = "boolean"},
	["floatingCombatTextCombatDamageAllAutos"] = { prettyName = nil, description = "Show all auto-attack numbers, rather than hiding non-event numbers", type = "boolean"},
	["floatingCombatTextCombatDamageDirectionalOffset"] = { prettyName = nil, description = "Amount to offset directional damage numbers when they start", type = "boolean"},
	["floatingCombatTextCombatDamageDirectionalScale"] = { prettyName = "FCT: Directional Scale", description = "Directional damage numbers movement scale (0 = no directional numbers)", type = "boolean"},
	["floatingCombatTextCombatHealing"] = { prettyName = "FCT: Healing", description = "Display amount of healing you did to the target", type = "boolean"},
	["floatingCombatTextCombatHealingAbsorbSelf"] = { prettyName = "FCT: Absorb (Self)", description = "Shows a message when you gain a shield.", type = "boolean"},
	["floatingCombatTextCombatHealingAbsorbTarget"] = { prettyName = "FCT: Absorb (Target)", description = "Display amount of shield added to the target.", type = "boolean"},
	["floatingCombatTextCombatLogPeriodicSpells"] = { prettyName = "FCT: Periodic Spells", description = "Display damage caused by periodic effects", type = "boolean"},
	["floatingCombatTextCombatState"] = { prettyName = "FCT: Combat State", description = "", type = "boolean"},
	["floatingCombatTextComboPoints"] = { prettyName = "FCT: Combo Points", description = "", type = "boolean"},
	["floatingCombatTextDamageReduction"] = { prettyName = "FCT: Damage Reduction", description = "", type = "boolean"},
	["floatingCombatTextDodgeParryMiss"] = { prettyName = "FCT: Dodge / Parry / Miss", description = "", type = "boolean"},
	["floatingCombatTextEnergyGains"] = { prettyName = "FCT: Energy Gains", description = "", type = "boolean"},
	["floatingCombatTextFloatMode"] = { prettyName = "FCT: Float Mode", description = "The combat text float mode", type = "number"},
	["floatingCombatTextFriendlyHealers"] = { prettyName = "FCT: Friendly Healers", description = "", type = "boolean"},
	["floatingCombatTextHonorGains"] = { prettyName = "FCT: Honor Gains", description = "", type = "boolean"},
	["floatingCombatTextLowManaHealth"] = { prettyName = "FCT: Low Mana/Health", description = "", type = "boolean"},
	["floatingCombatTextPeriodicEnergyGains"] = { prettyName = "FCT: Peridic Energy Gains", description = "", type = "boolean"},
	["floatingCombatTextPetMeleeDamage"] = { prettyName = "FCT: Pet Melee Damage", description = "Display pet melee damage in the world", type = "boolean"},
	["floatingCombatTextPetSpellDamage"] = { prettyName = "FCT: Pet Spell Damage", description = "Display pet spell damage in the world", type = "boolean"},
	["floatingCombatTextReactives"] = { prettyName = "FCT: Reactives", description = "", type = "boolean"},
	["floatingCombatTextRepChanges"] = { prettyName = "FCT: Reputation", description = "", type = "boolean"},
	["floatingCombatTextSpellMechanics"] = { prettyName = "FCT: Spell Mechanics", description = "", type = "boolean"},
	["floatingCombatTextSpellMechanicsOther"] = { prettyName = "FCT: Spell Mechanics (Other)", description = "", type = "boolean"},
	["statusText"] = { prettyName = "Status Text", description = "Whether the status bars show numeric health/mana values", type = "boolean"},
	["violenceLevel"] = { prettyName = "Violence Level", description = "Sets the violence level of the game", type = "number"},
	["ffxGlow"] = { prettyName = "FFX Glow", description = "full screen glow effect", type = "boolean"},
	["releaseUITextures"] = { prettyName = "Release UI Textures", description = "Release Hidden UI Textures by default", type = "boolean"},
	["alwaysCompareItems"] = { prettyName = "Always Compare Items", description = "Always show item comparison tooltips", type = "boolean"},
}
