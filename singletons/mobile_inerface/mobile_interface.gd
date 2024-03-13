extends CanvasLayer

func _ready() -> void:
	hide()
	process_mode = Node.PROCESS_MODE_DISABLED

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch or event is InputEventGesture:
		hide()
		process_mode = Node.PROCESS_MODE_DISABLED
	elif event is InputEventMouse or event is InputEventKey:
		show()
		process_mode = Node.PROCESS_MODE_INHERIT