extends Node

signal attacked(weapon: Weapon)

func emit_attacked(weapon: Weapon) -> void:
	attacked.emit(weapon)
