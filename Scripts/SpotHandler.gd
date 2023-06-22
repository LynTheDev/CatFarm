extends Node


var to_plant = Glob.PLANTS.Empty
var menu_open := false


func close_menu():
	$"../Player/View/UIView/UI/MenuPlayer".play_backwards("OpenMenu")
	menu_open = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("menu_close") and menu_open:
		if Glob.game_state == Glob.STATES.Planting:
			Glob.game_state = Glob.STATES.Idle
			to_plant = Glob.PLANTS.Empty
		
		close_menu()
	
	if Glob.game_state == Glob.STATES.Planting:
		for plot in get_children():
			if not plot.is_occupied:
				plot.can_choose = true
				plot.get_node("Arrow").visible = true
			
			if plot.is_occupied:
				plot.can_choose = false
				plot.get_node("Arrow").visible = false
		
		if Input.is_action_just_pressed("cancel_action"):
			Glob.game_state = Glob.STATES.Idle
			to_plant = Glob.PLANTS.Empty
	
	if Glob.game_state == Glob.STATES.Idle:
		for plot in get_children():
			plot.can_choose = false
			plot.get_node("Arrow").visible = false


func _on_carrot_button_pressed():
	Glob.game_state = Glob.STATES.Planting
	to_plant = Glob.PLANTS.Carrot

	close_menu()


func _on_exit_button_pressed():
	if Glob.game_state == Glob.STATES.Planting:
		Glob.game_state = Glob.STATES.Idle
		to_plant = Glob.PLANTS.Empty
	
	close_menu()



func _on_plant_handle_pressed():
	$"../Player/View/UIView/UI/MenuPlayer".play("OpenMenu")
	menu_open = true


func _on_wheat_button_pressed():
	Glob.game_state = Glob.STATES.Planting
	to_plant = Glob.PLANTS.Wheat

	close_menu()
