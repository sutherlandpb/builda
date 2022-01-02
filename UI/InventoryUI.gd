extends Control

onready var grassLabel = $GrassLabel
onready var woodLabel = $WoodLabel

var grass = 0
var stone = 0
var wood = 0

func _ready():
	PlayerStats.connect("grass_changed", self, "set_grass")
	PlayerStats.connect("wood_changed", self, "set_wood")
	
func set_grass(value):
	grass = value
	grassLabel.text = "grass:" + str(grass)

func set_wood(value):
	wood = value
	woodLabel.text = "wood:" + str(wood)
	
