extends Node2D

var lenght = 10
var speed_rotating = 300
var speed_moving = 100
var direction_angle = 0
var direction_to_calculate_angle = 0
var direction_to_move_angle = 0
var segment_gracza = load("res://segment_gracza.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func calculate_direction(direction_input_angle, direction_angle):
	if direction_input_angle > direction_angle:
		direction_to_move_angle=+1
	if direction_input_angle < direction_angle:
		direction_to_move_angle=-1
	return direction_to_move_angle


func ruch(direction_angle):
#	if Input.is_action_pressed('w_lewo'):
#		direction_to_move_angle -=1
#	elif Input.is_action_pressed('w_prawo'):
#		direction_to_move_angle +=1
	direction_to_move_angle = get_global_mouse_position() - global_position.normalized()
	if Input.is_action_pressed('przyspieszenie'):
		speed_moving = 300
	if not Input.is_action_pressed("przyspieszenie"):
		speed_moving = 100
	$gracz_rigid_body.set_axis_velocity(Vector2.from_angle(direction_angle)*speed_moving)


func create_segment(number_of_segments):
	for i in range (0, number_of_segments):
		var new_klone = segment_gracza
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ruch(calculate_direction(direction_to_calculate_angle, direction_angle))



func _on_area_2d_area_entered(area):
	if area == 'apple':
		lenght +=1
		create_segment(1)
