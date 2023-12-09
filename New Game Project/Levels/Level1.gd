extends Node3D

@onready var p_menu = $PauseMenu
@onready var o_menu = $"."

var paused = false

func _ready():
	paused = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pause_menu()
		
func pause_menu():
	if paused:
		p_menu.hide()
		Engine.time_scale = 1
	else:
		p_menu.show()
		Engine.time_scale = 0
		
	paused = !paused
