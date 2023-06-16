extends Camera2D


func _process(_delta):
	var window_size = DisplayServer.window_get_size()
	var rl = limit_left + (window_size.x / 2)
	var rr = limit_right - (window_size.x / 2)

	if Input.is_action_pressed("camera_right"):
		if not position.x >= limit_right:
			position.x += 10
		else:
			position.x = rr

		
	if Input.is_action_pressed("camera_left"):
		if not position.x < limit_left:
			position.x -= 10
		else :
			position.x = rl
