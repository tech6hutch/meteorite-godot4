extends Node

func _ready():
	
	get_window().size = Vector2(1280,720)
	await get_tree().process_frame
	DisplayServer.window_set_position(DisplayServer.screen_get_position() + (DisplayServer.screen_get_size() - DisplayServer.window_get_size()) / 2)

	

	#OS.window_fullscreen = true
	#Config does this now
