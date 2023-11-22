extends EventBase

func _init():
	id = "NewDayGainHyperXP"

func registerTriggers(es):
	es.addTrigger(self, Trigger.WakeUpInCell)

func react(_triggerID, _args):
	var player = GM.pc
	var sum:int = 0
	if GM.pc.getBodypart(BodypartSlot.Penis).getTraits() != null:
		if "PartTrait.Hyperable" in GM.pc.getBodypart(BodypartSlot.Penis).getTraits():
			var toCheckPlus = [
				Perk.CumBreath, # both of this doesn't make sense but alright
				Perk.CumBreathV2, # both of this doesn't make sense but alright
				Perk.CumStud,
				Perk.CumStudV2,
				"Perk.CumStudV3", # RNGperks 😁
				"Perk.CumProduBuff1",
				"Perk.CumProduBuff2",
				"Perk.CumProduBuff3",
				"Perk.CumProduBuff4",
			]
			var toCheckMinus = [
				Perk.StartMaleInfertility,
				Perk.StartMaleChastity,
			]
			for i in toCheckPlus:
				if player.hasPerk(i):
					sum += 1
			for i in toCheckMinus:
				if player.hasPerk(i):
					sum -= 1
	
	if GM.pc.getBodypart(BodypartSlot.Vagina).getTraits() != null \
	or GM.pc.getBodypart(BodypartSlot.Anus).getTraits() != null:
		if "PartTrait.Hyperable" in GM.pc.getBodypart(BodypartSlot.Vagina).getTraits() or \
		("PartTrait.Hyperable" in GM.pc.getBodypart(BodypartSlot.Anus).getTraits() and player.hasWombIn(OrificeType.Anus)):
			var toCheckPlus = [
				Perk.FertilityBetterOvulation,
				Perk.FertilityBetterOvulationV2,
				Perk.FertilityBetterOvulationV3,
				Perk.FertilityBroodmother,
				Perk.CumSloppySeconds,
			]
			var toCheckMinus = [
				Perk.StartInfertile,
			]
			for i in toCheckPlus:
				if player.hasPerk(i):
					sum += 1
			for i in toCheckMinus:
				if player.hasPerk(i):
					sum -= 1
	if GM.pc.getBodypart(BodypartSlot.Breasts).getTraits() != null:
		if "PartTrait.Hyperable" in GM.pc.getBodypart(BodypartSlot.Breasts).getTraits():
			var toCheckPlus = [
				Perk.MilkBiggerBreasts,
				Perk.MilkBiggerBreastsV2,
				Perk.MilkBiggerBreastsV3,
				Perk.MilkFasterProduction,
				Perk.MilkFasterProductionV2,
				Perk.MilkFasterProductionV3,
				Perk.MilkNoSoreNipples,
			]
			# var toCheckMinus = [
				
			# ]
			for i in toCheckPlus:
				if player.hasPerk(i):
					sum += 1
			# for i in toCheckMinus:
			# 	if player.hasPerk(i):
			# 		sum -= 1

	if sum>0:
		addMessage("Granted Hyper XP: "+ str((sum*sum*5))+"\n")
		player.addSkillExperience("HyperSkill", sum * sum * 5)
