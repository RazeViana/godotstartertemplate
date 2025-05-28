class_name PLAYER_CONTROLLER extends Node2D

@export var speed: float
@export var acceleration: float
@export var deceleration: float

@export_group("Nodes")
@export var characterBody: CharacterBody2D


func handle_and_apply_movement(_delta: float) -> void:
	var movement_direction: Vector2 = Input.get_vector("player_move_left","player_move_right","player_move_up","player_move_down")

	if movement_direction != Vector2.ZERO:
		# Accelerate toward the desired speed in the given direction
		characterBody.velocity.x = move_toward(characterBody.velocity.x, movement_direction.x * speed, acceleration)
		characterBody.velocity.y = move_toward(characterBody.velocity.y, movement_direction.y * speed, acceleration)
	else:
		# Decelerate (move velocity toward zero) when there's no input
		characterBody.velocity.x = move_toward(characterBody.velocity.x, 0, deceleration)
		characterBody.velocity.y = move_toward(characterBody.velocity.y, 0, deceleration)

	characterBody.move_and_slide()


func get_current_speed() -> float:
	return characterBody.velocity.length()
