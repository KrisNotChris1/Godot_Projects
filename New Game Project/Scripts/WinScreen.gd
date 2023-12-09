extends Control

# Go back to level 1 when restart is pressed
func _on_restart_pressed():
	get_tree().change_scene_to_file("res://Levels/Level1.tscn")

# Go back to the main menu when main menu is pressed
func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Menus/MainMenu.tscn")

# Quit the game when quit is pressed
func _on_quit_pressed():
	get_tree().quit()
