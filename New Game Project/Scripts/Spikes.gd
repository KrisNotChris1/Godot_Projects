extends Area3D

# When an object enters the body of the enemy
func _on_body_entered(body):
	# When the player enters the body of the enemy
	if body.is_in_group("Player"):
		# Reload the current scene
		body.game_over()
