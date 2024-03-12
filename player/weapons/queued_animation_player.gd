extends AnimationPlayer

@export var animation_queue: PackedStringArray
@export var index: int = -1
@export var end_queue_if_not_playing: bool

func play_next() -> void:

	if end_queue_if_not_playing and !is_playing():
		index = 0
	else:
		index += 1
		if index >= animation_queue.size():
			index = 0
	stop()
	play(animation_queue[index])
