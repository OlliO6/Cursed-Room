class_name Weapon
extends Node2D

signal attacked
signal attack_ended

var is_attacking: bool
var can_attack_again: bool = true

func _ready() -> void:
	InputManager.attack_started.connect(_on_attack_input)
	MobileInterface.attack_touch_started.connect(_on_attack_input)

func do_rotate() -> bool:
	return !is_attacking

func attack() -> void:
	is_attacking = true
	can_attack_again = false
	attacked.emit()

func end_attack() -> void:
	is_attacking = false
	attack_ended.emit()

func allow_attacking_again() -> void:
	can_attack_again = true
	if MobileInterface.is_attacking:
		await get_tree().physics_frame
		attack()

func _on_attack_input() -> void:
	if !is_attacking&&can_attack_again:
		attack()
