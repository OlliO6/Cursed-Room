class_name Item
extends Area2D

@export var spawn_in_deadly_zone: bool
@export var scene_to_spawn: PackedScene
@export var free_on_collect: bool

signal collected

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func collect() -> void:
	if spawn_in_deadly_zone:
		#TODO: 
		print("Spawn Enemy")
	collected.emit()
	if free_on_collect:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		collect()
