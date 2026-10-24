extends Node

func _ready() -> void:
	get_window().content_scale_factor = DisplayServer.screen_get_scale()
