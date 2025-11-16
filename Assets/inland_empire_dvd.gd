extends Area3D

@export var movie_data: MovieData 

signal interact_requested(data: MovieData)

func interact():
	if movie_data:
		interact_requested.emit(movie_data)
	hide()
