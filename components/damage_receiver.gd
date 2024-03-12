class_name DamageReceiver
extends Node

signal damage_taken(amount: int)

func take_damage(dmg: int):
	damage_taken.emit(dmg)
