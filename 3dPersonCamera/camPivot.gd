extends Node3D

@export var target : Node3D
var mouse_sensitivity = 0.002

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = target.get_node("CharacterBody3D").global_position
	var input = Input.get_action_raw_strength("Rstick_right")-Input.get_action_raw_strength("Rstick_left")
	if(abs(input) > 0.2):
		rotate_y(input * mouse_sensitivity*8*-1)
		
	var input2 = Input.get_action_raw_strength("Rstick_up")-Input.get_action_raw_strength("Rstick_down")
	if(abs(input2) > 0.2):
		$camPivot2.rotate_x(input2 * mouse_sensitivity*8*1)
	pass



func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * mouse_sensitivity)
		$camPivot2.rotate_x(-event.relative.y * mouse_sensitivity)
