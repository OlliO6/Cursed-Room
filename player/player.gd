extends CharacterBody2D


@export var movement_speed: float
@export_range(0, 1) var acceleration: float
@export_range(0, 1) var deceleration: float

@onready var state_machine = $StateMachine
@onready var idle_state = $StateMachine/Idle
@onready var run_state = $StateMachine/Run

func _ready() -> void:
	pass

func _physics_process(delta) -> void:
	
	$StateLabel.text = state_machine.state.name
	
	match state_machine.state:
		idle_state:
			_move(Vector2.ZERO, 0, deceleration)
			if InputManager.get_move_input() != Vector2.ZERO:
				state_machine.switch_state(run_state)
		
		run_state:
			var move_input:= InputManager.get_move_input()
			_move(move_input, movement_speed, acceleration)
			if move_input == Vector2.ZERO:
				state_machine.switch_state(idle_state)
	
	move_and_slide()

func _move(dir: Vector2, speed: float, accel: float) -> void:
	velocity = lerp(velocity, dir * speed, accel)
