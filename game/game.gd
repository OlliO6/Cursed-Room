extends Node2D

signal friendly_zone_entered
signal deadly_zone_entered

@export var _current_zone: Zone = Zone.Friendly

@onready var player := get_node("Player") as Player
@onready var friendly_zone := get_node("FriendlyZone") as Node2D
@onready var deadly_zone := get_node("DeadlyZone") as Node2D

func _ready() -> void:
	InputManager.switch_zone_pressed.connect(switch_zone)
	enter_zone(_current_zone)

func switch_zone() -> void:
	enter_zone(Zone.Deadly if _current_zone == Zone.Friendly else Zone.Friendly)

func enter_zone(zone: Zone) -> void:
	_current_zone = zone

	var to_remove := deadly_zone if zone == Zone.Friendly else friendly_zone
	var to_add := friendly_zone if zone == Zone.Friendly else deadly_zone

	if to_remove.is_inside_tree():
		remove_child(to_remove)
	if !to_add.is_inside_tree():
		add_child(to_add)

enum Zone {Friendly, Deadly}
