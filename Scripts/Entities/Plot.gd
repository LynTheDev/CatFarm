extends Area2D


var wheat = preload("res://Assets/Plots/Wheat.png")
var carrot = preload("res://Assets/Plots/Carrot.png")

var is_occupied := false
var can_choose := false
var occupied_by = Glob.PLANTS.Empty
var can_harvest := false


func exp_checker():
	if Glob.USER_DATA.Exp >= Glob.USER_DATA.ToNext:
		Glob.USER_DATA.Level += 1

		var next_exp := pow(Glob.USER_DATA.Level / Glob.ExpPerLevel, Glob.LevelIncreaseSpeed)
		Glob.USER_DATA.ToNext = floor(next_exp)


func plant_handler(plant: String):
	$PlantSprite.offset.x = Glob.PLANT_DATA[plant]["OffsetX"]
	$PlantSprite.offset.y = Glob.PLANT_DATA[plant]["OffsetY"]

	Glob.coins -= Glob.PLANT_DATA[plant]["Cost"]

	$GrowTimer.wait_time = Glob.PLANT_DATA[plant]["GrowthTime"]


func plant_yield_handler(plant: String):
	Glob.coins += Glob.PLANT_DATA[plant]["Yield"]
	Glob.USER_DATA.Exp += Glob.PLANT_DATA[plant]["ExpYield"]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if $GrowTimer.time_left > 0:
		if $GrowTimer.time_left < 60:
			$TimeLeft.text = "{0}s".format({"0": floor($GrowTimer.time_left)})
		else:
			var padding = "%dm %02ds" % [floor($GrowTimer.time_left / 60), int($GrowTimer.time_left) % 60]
			$TimeLeft.text = padding

		$ProgressBG.visible = true
		$ProgressBorders.visible = true
		$PlantSprite.visible = true

		var scale_fct = 60 / $GrowTimer.wait_time
		$Progress.size.x = 60 - (scale_fct * $GrowTimer.time_left)

		var plant_fct = 1 / $GrowTimer.wait_time
		$PlantSprite.scale.x = 1 - (plant_fct * $GrowTimer.time_left)
		$PlantSprite.scale.y = 1 - (plant_fct * $GrowTimer.time_left)

	if visible:
		$Animations.play("ArrowFloat") 


func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if can_harvest:
			$Progress.size.x = 0

			$ProgressBG.visible = false
			$ProgressBorders.visible = false
			$PlantSprite.visible = false

			plant_yield_handler(occupied_by)
			
			exp_checker()
			$TimeLeft.text = ""

			is_occupied = false
			occupied_by = Glob.PLANTS.Empty

			can_harvest = false
		
		if Glob.game_state == Glob.STATES.Planting:
			if get_parent().to_plant == Glob.PLANTS.Carrot and not is_occupied:
				Glob.game_state = Glob.STATES.Idle

				is_occupied = true
				occupied_by = Glob.PLANTS.Carrot

				$PlantSprite.texture = carrot
				plant_handler("Carrot")

				$GrowTimer.start();

			if get_parent().to_plant == Glob.PLANTS.Wheat and not is_occupied:
				Glob.game_state = Glob.STATES.Idle

				is_occupied = true
				occupied_by = Glob.PLANTS.Wheat

				$PlantSprite.texture = wheat
				plant_handler("Wheat")
				
				$GrowTimer.start()



func _on_grow_timer_timeout():
	can_harvest = true
	$TimeLeft.text = "Done"

	$GrowTimer.stop()
