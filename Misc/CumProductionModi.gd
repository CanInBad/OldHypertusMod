extends FluidProduction
# class_name CumProductionNew # 😤

func getCapacity() -> float:
	var penis = getBodypart()
	var lenCM = penis.getLength()

	var mult = 1.0
	var pc = getCharacter()
	if(pc != null):
		mult += pc.getCustomAttribute("BuffAttribute.CumPenisCapacityBuff")
	
	return round((50.0 + pow(lenCM, 2.0)) * (mult))

func getProductionSpeedPerHour() -> float:
	if(!shouldProduce()):
		return 0.0
	
	var mult = 1.0
	var pc = getCharacter()
	if(pc != null):
		mult += pc.getCustomAttribute("BuffAttribute.CumPenisProductionBuff")

	return getCapacity() / 2.0 * mult

func getFluidSource():
	return FluidSource.Penis
