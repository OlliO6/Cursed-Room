extends Node

const DEADZONE:= 0.3

signal attack_started
signal attack_ended
signal spezial_started
signal spezial_ended

func get_move_input() -> Vector2:
	
	var result: Vector2
	result.x = Input.get_axis("move_left", "move_right")
	result.y = Input.get_axis("move_up", "move_down")
	var lenght:= result.length()
	if lenght > 1:
		result = result.normalized()
		
	return result if lenght > DEADZONE else Vector2.ZERO

func _unhandled_input(event: InputEvent) -> void:
	
	if event.is_echo():
		return
	
	if event.is_action("attack"):
		(attack_started if event.is_pressed() else attack_ended).emit()
		return
	
	if event.is_action("spezial"):
		(spezial_started if event.is_pressed() else spezial_ended).emit()
		return
