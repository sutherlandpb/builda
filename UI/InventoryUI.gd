extends Control

onready var label = $Label

var grass = 0
var stone = 0
var wood = 0

func _ready():
	PlayerStats.connect("grass_changed", self, "set_grass")
	
func set_grass(value):
	grass = value
	label.text = "grass:" + str(grass)
	
