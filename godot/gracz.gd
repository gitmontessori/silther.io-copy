extends Node2D

var lenght = 10
var speed_rotating = 300
var speed_moving = 500
var direction = 0
var segment_gracza = load("res://segment_gracza.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func ruch():
	if Input.is_action_pressed('w_lewo'):
		$gracz_rigid_body.set_axis_velocity(Vector2.LEFT*speed_rotating)
	elif Input.is_action_pressed('w_prawo'):
		$gracz_rigid_body.set_axis_velocity(Vector2.RIGHT*speed_rotating)
	elif Input.is_action_pressed('przyspieszenie'):
		speed_moving = 800
	if not Input.is_action_pressed("przyspieszenie"):
		speed_moving = 500
	$gracz_rigid_body.set_axis_velocity(Vector2.from_angle(direction)*speed_moving)


func create_segment(number_of_segments):
	for i in range (0, number_of_segments):
		var new_klone = segment_gracza
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ruch()



func _on_area_2d_area_entered(area):
	if area == 'apple':
		lenght +=1
		create_segment(1)
