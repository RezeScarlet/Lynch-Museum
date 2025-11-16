extends Node

var total_dvds = 0
var dvds_coletados = 0

func _ready():
	total_dvds = get_tree().get_nodes_in_group("Interactables").size()

func registrar_coleta():
	dvds_coletados += 1
	
	if dvds_coletados >= total_dvds:
		vitoria()

func vitoria():
	await get_tree().create_timer(2.0).timeout
	
	get_tree().change_scene_to_file("res://Scenes/UI/creditos.tscn")
