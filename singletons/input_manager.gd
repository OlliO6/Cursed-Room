extends Node

const DEADZONE:= 0.3

func get_move_input() -> Vector2:
	
	var result: Vector2
	result.x = Input.get_axis("move_left", "move_right")
	result.y = Input.get_axis("move_up", "move_down")
	var lenght:= result.length()
	if lenght > 1:
		result = result.normalized()
		
	return result if lenght > DEADZONE else Vector2.ZERO
