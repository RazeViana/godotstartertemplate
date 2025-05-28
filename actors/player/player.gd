class_name PLAYER extends CharacterBody2D

@export var Name: String

@export_group("Nodes")
@export var player_controller: PLAYER_CONTROLLER
#@export var animation_tree: AnimationTree
@export var sprite: Sprite2D


#func _ready() -> void:
	#animation_tree.active = true


#func _process(_delta: float) -> void:
	#update_animation_parameter()


func _physics_process(delta: float) -> void:
	## Sync sprite's position with the node
	sprite.position = self.position

	## Handle movement direction & calculation
	player_controller.handle_and_apply_movement(delta)


#func update_animation_parameter() -> void:
	#if (velocity == Vector2.ZERO):
		#animation_tree["parameters/PlayerStateMachine/conditions/is_idle"] = true
		#animation_tree["parameters/PlayerStateMachine/conditions/is_moving"] = false

	#else:
		#animation_tree["parameters/PlayerStateMachine/conditions/is_idle"] = false
		#animation_tree["parameters/PlayerStateMachine/conditions/is_moving"] = true
#
	#if (input.get_movement_input() != Vector2.ZERO):
			#animation_tree["parameters/PlayerStateMachine/idle/blend_position"] = input.get_movement_input().normalized()
			#animation_tree["parameters/PlayerStateMachine/walk/blend_position"] = input.get_movement_input().normalized()
