extends Node

#Minimum Window Sizes
var minWidth = 800
var minHeight = 600

func _ready() -> void:
	#1 - Set minimum allowed window size
	get_window().set_min_size(Vector2(minWidth,minHeight))
	
	
