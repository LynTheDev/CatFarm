extends Node

@export 
var coins := 0

@export 
var ExpPerLevel: float = 0.3

@export
var LevelIncreaseSpeed: float = 2

var rpc_states: RPCSTATES = RPCSTATES.InGame
enum RPCSTATES {
	InGame,
	MainMenu,
	Paused
}

var game_state: STATES = STATES.Idle
enum STATES {
	Planting,
	Idle,
	Paused
}

var USER_DATA = {
	Level = 1,
	ToNext = 10,
	Exp = 0,

	FarmLevel = 1
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
