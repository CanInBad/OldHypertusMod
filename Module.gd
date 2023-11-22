extends Module

func getFlags():
	return {
		"HyperPenisCustomSize": flag(FlagType.Number),
	}

func _init():
	id = "Hypertus"
	author = "CanInBad"
	
	perks = [
		"res://Modules/Z_Hypertus/Perks/CumProduBuff1.gd",
		"res://Modules/Z_Hypertus/Perks/CumProduBuff2.gd",
		"res://Modules/Z_Hypertus/Perks/CumProduBuff3.gd",
		"res://Modules/Z_Hypertus/Perks/CumProduBuff4.gd",
		"res://Modules/Z_Hypertus/Perks/CriticalCombat.gd",
		"res://Modules/Z_Hypertus/Perks/CriticalLust.gd",
	]

	buffs = [
		"res://Modules/Z_Hypertus/Buffs/CumProductionBuff.gd",
		"res://Modules/Z_Hypertus/Buffs/CumPenisCapacityBuff.gd",
		"res://Modules/Z_Hypertus/Buffs/PhysicalDamageBuffRNG.gd",
		"res://Modules/Z_Hypertus/Buffs/LustDamageBuffRNG.gd",
	]
	bodyparts = [
		"res://Modules/Z_Hypertus/Bodyparts/Penises/CaninePenis.gd",
		"res://Modules/Z_Hypertus/Bodyparts/Penises/DragonPenis.gd",
		"res://Modules/Z_Hypertus/Bodyparts/Penises/EquinePenis.gd",
		"res://Modules/Z_Hypertus/Bodyparts/Penises/FelinePenis.gd",
		"res://Modules/Z_Hypertus/Bodyparts/Penises/HumanPenis.gd",
		"res://Modules/Z_Hypertus/Bodyparts/bob/HyperableBreasts.gd",
		"res://Modules/Z_Hypertus/Bodyparts/vagenie/HyperVagina.gd",
		"res://Modules/Z_Hypertus/Bodyparts/donkey/Anus.gd",
		"res://Modules/Z_Hypertus/Bodyparts/donkey/AnusWomb.gd",
	]
	scenes = [
		"res://Modules/Z_Hypertus/Scenes/CustomInputCustomizationPenis.gd",
	]
	events = [
		"res://Modules/Z_Hypertus/Events/CustomizationButton.gd",
		"res://Modules/Z_Hypertus/Events/NewDayGainHyperXP.gd",
	]
	skills = [
		"res://Modules/Z_Hypertus/Skill/HyperSkill.gd",
	]
	var _a = knottedHorseCockCompactLayer(bodyparts)
	var _b = synthCompactLayer(bodyparts)

	var _listCompactLayers = {
		"Knotted Horse Cock": _a,
		"Synth Species": _b,
	}
	
func knottedHorseCockCompactLayer(bodyparts):
	if "Knotted Horse Cock" in GlobalRegistry.getModules():
		var tempArrys = [
			"res://Modules/Z_Hypertus/Bodyparts/Penises/CompactLayer/KnottedEquinePenis.gd"
		]
		var sum = 0
		for i in tempArrys:
			bodyparts.append(i)
			if i in bodyparts:
				var tempStr = i.get_file()
				Log.print("[b]"+id+":[/b] "+"## Knotted Equine Penis: "+tempStr+" compatibility layer activated! ##")
				sum += 1
		match sum:
			1:
				Log.print("[b]"+id+":[/b] "+"## Knotted Equine Penis compatibility layer activated! ##\n")
				return true
			0:
				Log.print("[b]"+id+":[/b] "+"## Knotted Equine Penis compatibility layer **Failed** to load ##\n")
				return false
			_:
				Log.print("[b]"+id+":[/b] "+"## Knotted Equine Penis compatibility layer fucked up!???? ## (PLEASE TELL THE DEV)\n")
				return false
	else:
		return false

func synthCompactLayer(bodyparts):
	if "SynthSpecies" in GlobalRegistry.getModules():
		var tempArrays = [
			"res://Modules/Z_Hypertus/Bodyparts/Penises/CompactLayer/SynthEquinePenis.gd",
			"res://Modules/Z_Hypertus/Bodyparts/Penises/CompactLayer/SynthPenis.gd",
			"res://Modules/Z_Hypertus/Bodyparts/Penises/CompactLayer/SynthPenisHuman.gd",
		] 
		var sum = 0 # I really want to make this an int but editor complains that match can only use array????
		for i in tempArrays:
			bodyparts.append(i)
			if i in bodyparts:
				# var tempStr = i.get_slice("/",-1) #hopfully picks the last index of splitting
				var tempStr = i.get_file()
				Log.print("[b]"+id+":[/b] "+"## Synth Species: "+tempStr+", compatibility layer activated! ##")
				sum += 1

		match sum:
			[4, ..]:
				Log.print("[b]"+id+":[/b] "+"## Synth Species compatibility layer fucked up!????? ## (PLEASE TELL THE DEV)\n")
				return false
			3:
				Log.print("[b]"+id+":[/b] "+"## Synth Species compatibility layer activated! ##\n")
				return true
			0:
				Log.print("[b]"+id+":[/b] "+"## Synth Species compatibility layer **Failed** to load ##\n")
				return false
			_:
				Log.print("[b]"+id+":[/b] "+"## Synth Species compatibility layer **partially** activated ##\n")
				return false
	else:
		return false
	
