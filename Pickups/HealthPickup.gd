extends Area2D

var stats = PlayerStats


func _on_HealthPickup_area_entered(area):
	print("hit item")
	stats.health += 1
	queue_free()
