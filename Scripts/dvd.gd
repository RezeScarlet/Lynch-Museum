extends Area3D

@export var movie_data: MovieData 

var ja_foi_coletado = false

signal interact_requested(data: MovieData)

func interact():
	if movie_data:
		interact_requested.emit(movie_data)
		
	if not ja_foi_coletado:
		ja_foi_coletado = true
		GameManager.registrar_coleta()
	hide()
