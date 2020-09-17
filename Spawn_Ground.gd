extends Node2D

onready var Player = get_tree().get_root().get_child(0).get_node("Player")
const scn_ground = preload("res://Plattform(Straße).tscn")
var LastBlock
const GROUND_WIDTH = 8

func _ready():
	spawn_ground()
	go_next_pos()
	
func _process(delta):
	
	if Player.position.distance_to(LastBlock.position) < 200:
		spawn_ground()
		go_next_pos()


func spawn_ground():
	var new_ground = scn_ground.instance()
	new_ground.position = position
	get_node("Container").add_child(new_ground)
	LastBlock=new_ground
	
	pass
	
func go_next_pos():
	position = position + Vector2(GROUND_WIDTH, 0) 
