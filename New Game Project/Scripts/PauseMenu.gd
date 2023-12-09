extends Control

@onready var main = $".."

func _on_resume_pressed():
	main.pause_menu()


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Menus/MainMenu.tscn")


func _on_quit_pressed():
	get_tree().quit()
