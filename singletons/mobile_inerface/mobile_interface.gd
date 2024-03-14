extends CanvasLayer

signal attack_touch_started
signal attack_touch_ended

@onready var control := get_node("Control") as Control
@onready var attack_stick := get_node("Control/AttackStick") as VirtualJoystick

var is_attacking: bool
var attack_dir: Vector2
var is_mobile: bool

func _ready() -> void:
	hide()
	control.process_mode = Node.PROCESS_MODE_DISABLED

func _process(_delta: float) -> void:
	if !is_mobile:
		return
	
	if attack_stick.is_pressed:
		attack_dir = attack_stick.output
		if !is_attacking:
			attack_touch_started.emit()
		is_attacking = true
	else:
		if is_attacking:
			attack_touch_ended.emit()
		is_attacking = false

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch or event is InputEventGesture:
		is_mobile = true
		show()
		control.process_mode = Node.PROCESS_MODE_INHERIT
	elif event is InputEventMouse or event is InputEventKey:
		is_mobile = false
		hide()
		control.process_mode = Node.PROCESS_MODE_DISABLED
