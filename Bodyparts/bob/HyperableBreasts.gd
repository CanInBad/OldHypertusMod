extends BodypartBreasts
var breastSizeModClass = load("res://Modules/Z_Hypertus/Misc/BreastsSizeModi.gd")

func _init():
	visibleName = "hyperable breasts"
	id = "breastshyperable"
	size = breastSizeModClass.G
	var lactationModClass = load("res://Modules/Z_Hypertus/Misc/LactationMod.gd")
	fluidProduction = lactationModClass.new()
	fluidProduction.bodypart = weakref(self)

# {FOREVER_FLAT = -1, FLAT = 0, A = 1, B = 2, C = 3, D = 4, DD = 5, E = 6, EE = 7, F = 8, FF = 9, G = 10, GG = 11}

func getCompatibleSpecies():
	return [Species.Any]

func getPickableAttributes():
	var result = .getPickableAttributes()
	var breastVariants = [
		[breastSizeModClass.FOREVER_FLAT, "Forever Flat", "Your breasts will never produce milk or increase in size (why are you picking this)"],
		[breastSizeModClass.FLAT, "Flat", "Flat breasts (hard mode)"],
	]
	for breastSize in breastSizeModClass.getAll():
		if(breastSize <= breastSizeModClass.FLAT || breastSize > breastSizeModClass.O):
			continue
		breastVariants.append([breastSize, breastSizeModClass.breastSizeToString(breastSize), breastSizeModClass.breastSizeToCupString(breastSize)])
	result["breastsize"]= {
		"text": "Change the breast size",
		"textButton": "Breast size",
		"buttonDesc": "Pick the breast size",
		"options": breastVariants,
	}
	return result

func getBreastsScale():
	var thesize = getSize()
	return breastSizeModClass.breastSizeToBoneScale(thesize)

func getDoll3DScene():
	var thesize = getSize()
	if(thesize <= breastSizeModClass.FLAT):
		return "res://Player/Player3D/Parts/Breasts/BreastsFlat/BreastsFlat.tscn"
	return "res://Player/Player3D/Parts/Breasts/BreastsScaleable/BreastsScaleable.tscn"

#func OLDgetDoll3DScene():
#	var thesize = getSize()
#	if(thesize <= breastSizeModClass.FLAT):
#		return "res://Player/Player3D/Parts/Breasts/BreastsFlat/BreastsFlat.tscn"
#	if(thesize <= breastSizeModClass.A):
#		return "res://Player/Player3D/Parts/Breasts/BreastsSmall/BreastsSmall.tscn"
#	if(thesize <= breastSizeModClass.B):
#		return "res://Player/Player3D/Parts/Breasts/BreastsMedium/BreastsMedium.tscn"
#	if(thesize <= breastSizeModClass.C):
#		return "res://Player/Player3D/Parts/Breasts/BreastsCurvy/BreastsCurvy.tscn"
#	return "res://Player/Player3D/Parts/Breasts/BreastsBig/BreastsBig.tscn"

func getAttributesText():
	return [
		["Breast size", breastSizeModClass.breastSizeToString(getSize())],
		["Bluespace anomalies", "Yes"],
	]

func getTooltipInfo():
	var result = []
	result.append("size: " + breastSizeModClass.breastSizeToCupString(getSize()))
	if(getFluidProduction() != null):
		result.append("Capacity: " + str(round(getFluidProduction().getFluidAmount() * 10.0)/10.0)+"/"+ str(round(getFluidProduction().getCapacity() * 10.0)/10.0)+" ml")
		result.append_array(getFluidProduction().getTooltipInfo())
	result.append("is making bluespace anomalies")
	return Util.join(result, "\n")

func getTraits():
	return {
		"PartTrait.Hyperable": true,
	}

func generateDataFor(_dynamicCharacter):
	size = RNG.pick([
		breastSizeModClass.A, breastSizeModClass.B, breastSizeModClass.C, breastSizeModClass.D, breastSizeModClass.DD, breastSizeModClass.DDD,
	])
