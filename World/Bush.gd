extends StaticBody2D

const GrassEffect = preload("res://Effects/GrassEffect.tscn")

onready var sprite = $Sprite
onready var hurtBox = $HurtBox
onready var stats = $Stats

export var RESPAWN_TIME_MIN = 20
export var RESPAWN_TIME_MAX = 30


var playerStats = PlayerStats

onready var timer = $Timer

func createGrassEffect():
	var grassEffect = GrassEffect.instance()
	var world = get_tree().current_scene
	world.add_child(grassEffect)
	grassEffect.global_position = global_position
	playerStats.add_wood(1)
	sprite.visible = false
	var respawnSeconds = rand_range(RESPAWN_TIME_MIN,RESPAWN_TIME_MAX)
	timer.start(respawnSeconds)
	

func _on_HurtBox_area_entered(area):
	if sprite.visible == true:
		stats.health -= area.damage

func _on_Timer_timeout():
	sprite.visible = true
	
func _on_Stats_no_health():
	sprite.visible = false
	stats.set_health(stats.max_health)
	createGrassEffect()
