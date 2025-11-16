extends Area3D

@onready var audio_player = $AudioStreamPlayer3D

@export var total_audios: int = 25

var caminho_base = "res://Assets/Audios/lynch"

func interact():
	var numero_sorteado = randi_range(1, total_audios)
	
	var arquivo_completo = caminho_base + str(numero_sorteado) + ".mp3"
	
	var som = load(arquivo_completo)
	
	if som:
		audio_player.stream = som
		audio_player.play()
