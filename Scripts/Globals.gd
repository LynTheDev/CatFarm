extends Node

@export 
var coins := 0

@export 
var farm_level := 1

@export 
var player_level := 1

@export
var player_exp := 0

var game_state: STATES = STATES.Idle
enum STATES {
	Planting,
	Idle,
	Paused
}

var PLANTS = {
	Carrot = "Carrot",
	Wheat = "Wheat",
	Cabbage = "Cabbage",
	Empty = "Empty"
}

var PLANT_DATA = {
	"Carrot": {
		"Cost": 0,
		"Yield": 5,
		"OffsetX": -7.5,
		"OffsetY": -15.5,

		"GrowthTime": 5,
		"ExpYield": 1
	},

	"Wheat": {
		"Cost": 15,
		"Yield": 25,
		"OffsetX": -15.8,
		"OffsetY": -31.3,

		"GrowthTime": 15,
		"ExpYield": 5
	}
}