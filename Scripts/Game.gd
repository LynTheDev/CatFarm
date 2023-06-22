extends Node2D

var tmp_coins := 0
var tmp_exp := 0

func _ready():
	tmp_coins = Glob.coins
	tmp_exp = Glob.USER_DATA.Exp

func _process(_delta):
	if tmp_coins < Glob.coins:
		tmp_coins += 1
	elif tmp_coins > Glob.coins:
		tmp_coins -= 1
	else:
		tmp_coins = Glob.coins
	
	if tmp_exp < Glob.USER_DATA.Exp:
		tmp_exp += 1
	else:
		tmp_exp = Glob.USER_DATA.Exp

	$"Player/View/UIView/UI/Currency".text = "%010d" % [tmp_coins]
	$"Player/View/UIView/UI/Exp".text = "%d: %d/%d" % [Glob.USER_DATA.Level, tmp_exp, Glob.USER_DATA.ToNext]
