extends Node

export var max_health = 1 setget set_max_health
export var max_wood = 255
export var max_grass = 255
export var max_stone = 255


var health = max_health setget set_health

var wood = 0
var grass = 0
var stone = 0

signal no_health
signal health_changed(value)
signal max_health_changed(value)
signal wood_changed(value)
signal grass_changed(value)
signal stone_changed(value)

func set_max_health(value):
	max_health = value
	self.health = min(health, max_health)
	emit_signal("max_health_changed", max_health)
	
func set_health(value):
	health = value
	emit_signal("health_changed", value)
	if health <= 0:
		emit_signal("no_health")

func add_grass(value):
	grass = clamp(grass + value, 0, max_grass)
	emit_signal("grass_changed", grass)

func add_wood(value):
	wood = clamp(wood + value, 0, max_wood)
	emit_signal("wood_changed", wood)

func add_stone(value):
	stone = clamp(stone + value, 0, max_stone)
	emit_signal("stone_changed", stone)

func _ready():
	self.health = max_health
