extends Control

# When play is pressed move to level 1
func _on_play_pressed():
	get_tree().change_scene_to_file("res://Levels/Level1.tscn")

# When options is pressed move to the options menu
func _on_options_pressed():
	get_tree().change_scene_to_file("res://Menus/OptionsMenu.tscn")

# When quit is pressed close the game
func _on_quit_pressed():
	get_tree().quit()
