extends Node3D

@onready var ui_display = $MovieInfoDisplay

func _ready():
	for dvd in get_tree().get_nodes_in_group("Interactables"):
		dvd.interact_requested.connect(_on_dvd_interacted)

func _on_dvd_interacted(data: MovieData):
	ui_display.show_movie_info(data)
