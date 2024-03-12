extends Area2D

@export var damage: int = 10

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	var dmg:= body.get_node("DamageReceiver") as DamageReceiver
	if dmg:
		dmg.take_damage(damage)
