class_name PLAYER extends ACTOR


#func _ready() -> void:
	#animation_tree.active = true


#func _process(_delta: float) -> void:
	#update_animation_parameter()


func _physics_process(delta: float) -> void:
	## Sync sprite's position with the node
	sprite.position = self.position

	## Get the movement inputs
	input.handle_movement_input(delta)

	## Handle movement direction & calculation
	movement.handle_movement(delta)

	## Apply movement
	movement.apply_movement()


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
