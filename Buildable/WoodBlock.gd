extends StaticBody2D

onready var stats = $Stats
onready var hurtBox = $HurtBox

var playerStats = PlayerStats



func _on_HurtBox_area_entered(area):
	stats.health -= area.damage
	hurtBox.create_hit_effect()

func _on_Stats_no_health():
	playerStats.add_wood(1)
	queue_free()
