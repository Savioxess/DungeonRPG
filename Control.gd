extends Control

#pause controller

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		var pause_state = not get_tree().paused
		get_tree().paused = pause_state
		visible = pause_state
		
