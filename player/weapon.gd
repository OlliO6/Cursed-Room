class_name Weapon
extends Node2D

var is_attacking: bool

func _ready() -> void:
	InputManager.attack_started.connect(_on_attack_input)

func do_rotate() -> bool:
	return !is_attacking

func _on_attack_input() -> void:
	print("ATTACK")
