extends Node2D

var tmp_coins := 0

func _ready():
	tmp_coins = Glob.coins

func _process(_delta):
	if tmp_coins < Glob.coins:
		tmp_coins += 1
	elif tmp_coins > Glob.coins:
		tmp_coins -= 1
	else:
		tmp_coins = Glob.coins

	var text_format = "%010d" % [tmp_coins];
	$"Player/View/UIView/UI/Currency".text = text_format
