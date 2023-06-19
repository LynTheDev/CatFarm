extends Camera2D


func _process(_delta):
	if Input.is_action_pressed("camera_right"):
		if not position.x >= limit_right:
			position.x += 10
		else:
			position.x = limit_right
		
	if Input.is_action_pressed("camera_left"):
		if not position.x < limit_left:
			position.x -= 10
		else :
			position.x = limit_left
