class_name Weapon
extends Node2D

signal attacked

var is_attacking: bool
var can_attack_again: bool = true

func _ready() -> void:
	InputManager.attack_started.connect(_on_attack_input)

func do_rotate() -> bool:
	return !is_attacking

func attack() -> void:
	is_attacking = true
	can_attack_again = false
	attacked.emit()

func end_attack() -> void:
	is_attacking = false

func allow_attacking_again() -> void:
	can_attack_again = true

func _on_attack_input() -> void:
	if !is_attacking&&can_attack_again:
		attack()
