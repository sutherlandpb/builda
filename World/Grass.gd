extends Node2D
const GrassEffect = preload("res://Effects/GrassEffect.tscn")

onready var sprite = $Sprite
onready var hurtBox = $HurtBox

export var RESPAWN_TIME_MIN = 20
export var RESPAWN_TIME_MAX = 30


var stats = PlayerStats

onready var timer = $Timer

func createGrassEffect():
	var grassEffect = GrassEffect.instance()
	var world = get_tree().current_scene
	world.add_child(grassEffect)
	grassEffect.global_position = global_position
	stats.add_grass(1)
	sprite.visible = false
	var respawnSeconds = rand_range(RESPAWN_TIME_MIN,RESPAWN_TIME_MAX)
	timer.start(respawnSeconds)
	

func _on_HurtBox_area_entered(area):
	if sprite.visible == true:
		createGrassEffect()


func _on_Timer_timeout():
	sprite.visible = true
