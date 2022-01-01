extends PopupPanel


var isVisible = false


func _physics_process(delta):
	if Input.is_action_just_pressed("Inventory"):
		if isVisible:
			isVisible = false
			hide()
		else:
			isVisible = true
			popup(Rect2(450, 70, 160, 100))
			



func _on_Backpack_popup_hide():
	isVisible = false
