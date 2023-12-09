extends Control

# Go to the main menu when back is pressed
func _on_back_pressed():
	get_tree().change_scene_to_file("res://Menus/MainMenu.tscn")
