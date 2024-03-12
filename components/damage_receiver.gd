class_name DamageReceiver
extends Node

signal damage_taken(amount: int)

@export var invincible: bool
@export var invis_time: float = 0.5

var invis_timer: float

func _process(delta: float) -> void:
	if invis_timer > 0:
		invis_timer -= delta

func take_damage(dmg: int) -> void:
	damage_taken.emit(dmg)
	invis_timer = invis_time

func is_invincible() -> bool:
	return invincible or invis_timer > 0
