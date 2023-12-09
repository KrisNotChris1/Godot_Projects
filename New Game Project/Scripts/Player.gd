extends CharacterBody3D

var move_speed : float = 4.0
var jump_force : float = 8.0
var gravity : float = 20.0
var facing_angle : float
var score : int

# Store the character model as a variable to rotate the character when the game starts
@onready var model : MeshInstance3D = get_node("Model")
# Store the score UI as a variable to update it
@onready var score_text : Label = get_node("ScoreText")

# Player movement (constant rate every second)
func _physics_process(delta):
	# When the player is not on the ground/floor
	if not is_on_floor():
		# Apply gravity to push the player down
		velocity.y -= gravity * delta
	# When the player presses the Spacebar and is on the ground/floor
	if Input.is_action_pressed("jump") and is_on_floor():
		# Jump into the air
		velocity.y = jump_force
	# Player direction based on keyboard presses
	var input = Input.get_vector("move_left", "move_right","move_forward","move_backward")
	# Converting a 2D Vector into a 3D Vector for 3D movement
	var dir = Vector3(input.x, 0, input.y)
	# Direction the player will move and at which speed without overwriting the gravity force
	velocity.x = dir.x * move_speed
	velocity.z = dir.z * move_speed
	move_and_slide()
	# Direction the player will face based on current input
	if input.length() > 0 :
		facing_angle = Vector2(input.y, input.x).angle()
	# Smoothing out rotation from one angle to the next
	model.rotation.y = lerp_angle(model.rotation.y, facing_angle, 0.3)
	# When the player is at a y position of -5 or less
	if global_position.y < -5 :
		# Reload the scene
		game_over()

func game_over():
	# Reload which ever scene the player is currently in
	get_tree().reload_current_scene()
	
func add_score(amount):
	score += amount
	score_text.text = str("Score: ", score)
