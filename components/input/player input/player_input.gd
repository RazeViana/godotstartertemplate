class_name PLAYER_INPUT extends INPUT


func handle_movement_input(_delta) -> void:
	movement_input = Input.get_vector("player_move_left","player_move_right","player_move_up","player_move_down")
