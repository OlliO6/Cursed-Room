extends Node2D

@export var _weapon: Weapon

func _process(_delta: float) -> void:
	if is_instance_valid(_weapon)&&_weapon.do_rotate():
		rotate_weapon()

func rotate_weapon() -> void:
	var dir := (get_global_mouse_position() - global_position).normalized()
	if dir != Vector2.ZERO:
		global_transform.x = dir
	
	skew = 0
	position = Vector2.ZERO
	scale = Vector2.ONE
	
	if abs(rotation_degrees) > 90:
		_weapon.transform = Transform2D.FLIP_Y
	else:
		_weapon.transform = Transform2D.IDENTITY
