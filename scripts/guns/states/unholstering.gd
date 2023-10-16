extends "res://scripts/guns/states/gun_state.gd"

@onready var player = fsm_owner.get_node("AnimationPlayer")

func on_init():
	player.play("unholster") 
	player.connect("animation_finished", Callable(self, "on_anim_finish").bind(), CONNECT_ONE_SHOT)
	
func on_anim_finish(anim):
	if anim == "unholster":
		fsm.switch_state("unholstered")