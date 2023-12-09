extends Area3D

var spin_speed : float = 2.0
var bob_height : float = 0.2
var bob_speed : float = 5.0
# Starting y-axis position of the coin
@onready var start_y : float = global_position.y
# Time
var t : float = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Rotate the coin around the y-axis
	rotate(Vector3.UP, spin_speed * delta)
	# Time = Time
	t += delta
	# Converted sine wave instead of being between - 1 and 1 it's between 0 and 1
	var d = (sin(t * bob_speed) + 1) / 2
	# Update y-axis position
	global_position.y = start_y + (d * bob_height)

# When an object enters the body of the coin
func _on_body_entered(body):
	# When the player enters the body of the coin
	# This can become the place for checking if the coin is bronze, silver, or gold
	# to give the player points based on what kind of coin they interacted with
	if body.is_in_group("Player"):
		# Increase the score by 1
		body.add_score(1)
		# Remove the coin from the scene
		queue_free()
