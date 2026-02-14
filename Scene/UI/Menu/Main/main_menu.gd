extends Control

@onready var menu_button: VBoxContainer = $menu_button
@onready var settings_view: Panel = $settings_view


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	menu_button.visible = true
	settings_view.visible = false
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


# Start World
func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/UI/World/Main/main_world.tscn")

# Settings
func _on_settings_pressed() -> void:
	print("Settings")
	menu_button.visible = false
	settings_view.visible = true

# Quit Game
func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_back_button_pressed() -> void:
	_ready()
