class_name MOVEMENT extends Node2D

@export var speed: float
@export var acceleration: float
@export var deceleration: float

@export_group("Nodes")
@export var characterBody: CharacterBody2D
@export var input: INPUT


func handle_movement(_delta: float) -> void:
	var direction = input.get_movement_input()

	if direction != Vector2.ZERO:
		# Accelerate toward the desired speed in the given direction
		characterBody.velocity.x = move_toward(characterBody.velocity.x, direction.x * speed, acceleration)
		characterBody.velocity.y = move_toward(characterBody.velocity.y, direction.y * speed, acceleration)
	else:
		# Decelerate (move velocity toward zero) when there's no input
		characterBody.velocity.x = move_toward(characterBody.velocity.x, 0, deceleration)
		characterBody.velocity.y = move_toward(characterBody.velocity.y, 0, deceleration)


func get_current_speed() -> float:
	return characterBody.velocity.length()


func apply_movement() -> void:
	characterBody.move_and_slide()
