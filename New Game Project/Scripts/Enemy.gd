extends Area3D

# Variables that can be changed within the inspector
@export var move_speed : float = 2.0
@export var move_dir : Vector3
# Positions
var start_pos : Vector3
var target_pos : Vector3

# Called when the node enters the scene tree for the first time.
func _ready():
	# Current positiion of the enemy will become its starting position
	start_pos = global_position
	# The position that the enemy will move to
	target_pos = start_pos + move_dir


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Enemy moves toward target position evenly over time
	global_position = global_position.move_toward(target_pos, move_speed * delta)
	if global_position == target_pos:
		if global_position == start_pos:
			target_pos = start_pos + move_dir
		else:
			target_pos = start_pos

# When an object enters the body of the enemy
func _on_body_entered(body):
	# When the player enters the body of the enemy
	if body.is_in_group("Player"):
		# Reload the current scene
		body.game_over()
