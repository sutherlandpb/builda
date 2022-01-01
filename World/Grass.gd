extends Node2D
const GrassEffect = preload("res://Effects/GrassEffect.tscn")
var stats = PlayerStats

func createGrassEffect():
	var grassEffect = GrassEffect.instance()
	var world = get_tree().current_scene
	world.add_child(grassEffect)
	grassEffect.global_position = global_position
	stats.add_grass(1)
	queue_free()


func _on_HurtBox_area_entered(area):
	createGrassEffect()
