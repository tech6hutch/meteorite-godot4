extends Node

const save_filename = "user://savegame.save"

func _ready():
	pass

func do_save():
	
	var save_game = FileAccess.open(save_filename, FileAccess.WRITE)
	# use store_line to save other shit
	
	var save_data = PlayerData.get_player().do_save()
	
	save_game.store_string(JSON.new().stringify(save_data))
	save_game.close()
	
	
func do_load():
	
	if not FileAccess.file_exists(save_filename):
		print("no savefile detected")
		return # Error! We don't have a save to load.
		
	print("loading...")

	var save_game = FileAccess.open(save_filename, FileAccess.READ)
	var test_json_conv = JSON.new()
	test_json_conv.parse(save_game.get_as_text())
	var save_data = test_json_conv.get_data()
	save_game.close()
	
	PlayerData.get_player().do_load(save_data)
	
func delete_save_file():
	
	if save_file_exists():
		DirAccess.remove_absolute(save_filename)
		print("save removed")
		
func save_file_exists():
	return FileAccess.file_exists(save_filename)
