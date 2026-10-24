extends Node

#Credits: Godot's Documentation (https://docs.godotengine.org/en/stable/tutorials/ui/creating_applications.html)

# Use a dedicated configuration file for the window state.
# This way, the application's other configuration files are left
# untouched and can be put in version control without unnecessary diffs
# being produced.
const CONFIG_WINDOW_PATH = "user://window.ini"

var config_file:ConfigFile = ConfigFile.new()

var editor_window_restore: bool = false

func _enter_tree():
	config_file.load(CONFIG_WINDOW_PATH)

	# Do not restore previous window state if running from the editor
	# with game embedding enabled.
	if OS.has_feature("editor") and not Engine.is_embedded_in_editor() and editor_window_restore:
		var window_screen = config_file.get_value("main", "screen", -1)
		if window_screen is int:
			get_window().current_screen = window_screen

		var window_mode = config_file.get_value("main", "mode", -1)
		if window_mode is Window.Mode:
			get_window().mode = window_mode

		var window_position = config_file.get_value("main", "position", -1)
		if window_position is Vector2i:
			get_window().position = window_position

		var window_size = config_file.get_value("main", "size", -1)
		if window_size is Vector2i:
			get_window().size = window_size


func _exit_tree():
	# Save the current window state when the application is quit normally.
	# In a real world scenario, it's recommended to also save this information
	# regularly (e.g. with a Timer node), so that the window state can be
	# restored after a crash or when terminated externally.
	config_file.set_value("main", "screen", get_window().current_screen)
	config_file.set_value("main", "mode", get_window().mode)
	config_file.set_value("main", "position", get_window().position)
	config_file.set_value("main", "size", get_window().size)
	config_file.save(CONFIG_WINDOW_PATH)
