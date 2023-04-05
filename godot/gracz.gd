extends Node2D
var lenght = 10
var segment_gracza = load("res://segment_gracza.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func create_segment(number_of_segments):
	for i in range (0, number_of_segments):
		var new_klone = segment_gracza
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_area_entered(area):
	if area == 'apple':
		lenght +=1
		create_segment(1)
