extends Area3D

# Determine what the next scene is going to be
@export_file("*.tscn") var next_scene

# When an object enters the body of the flag
func _on_body_entered(body):
	# When the playerenters the body of the flag
	if body.is_in_group("Player"):
		# Load into the next scene
		get_tree().change_scene_to_file(next_scene)
