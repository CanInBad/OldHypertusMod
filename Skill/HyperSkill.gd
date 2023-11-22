extends SkillBase

func _init():
	id = "HyperSkill"

func getShortName():
	return "Hyper"

func getVisibleName():
	return "Hyper Lover"

func getVisibleDescription():
	return "Shows how much you are honed to using bluespace anomalies"

func getLevelCap():
	return 200

func getPerkTiers():
	return [
		[0],
		[5],
		[10],
	]
