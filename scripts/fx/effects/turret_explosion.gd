extends Node3D

func init():
	Sound.play_sound_at("turret_explode", global_transform.origin)
