@tool
extends Node3D

@export (Vector3) var bounds = Vector3(1,1,1)#: set = set_bounds
var area 
var shape
var mesh 

func _ready():
	area = $area
	shape = $area/shape
	mesh = $mesh

	
func _process(delta):
	set_bounds(bounds)
	
	if Engine.is_editor_hint():
		return
		
	mesh.get_surface_override_material(0).uv1_offset += Vector3(1,1,0)*0.1*delta
	
func set_bounds(value):
	bounds = value
	mesh.mesh.size = bounds * (1 - 1e-3) # against z-fighting
	shape.shape.size = bounds / 2

func _physics_process(delta):
	
	if Engine.is_editor_hint():
		return
		
	for b in area.get_overlapping_bodies():
		if b.is_in_group("player"): # TODO this is always true right?
			b.hurt(50*delta) #, Enums.BulletColor.RED) → this breaks the editor
			b.velocity *= 0.7