extends Control

var chance := 100

func _input(_event):
	if Input.is_action_just_pressed("pause"):
		if $ColonThree.visible:
			$ColonThree.visible = false
		
		if randi_range(0 , chance+1) == chance:
			$ColonThree.visible = true  # :3
		
		visible = not visible
		get_tree().paused = not get_tree().paused


func _on_pause_button_pressed():
	if visible and get_tree().paused:
		visible = false
		get_tree().paused = false
