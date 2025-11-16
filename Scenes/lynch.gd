extends Area3D

# Arraste o nó de áudio para cá segurando Ctrl
@onready var audio_player = $AudioStreamPlayer3D

# Defina aqui quantos áudios você tem no total
@export var total_audios: int = 26

# O caminho da pasta. IMPORTANTE: Termine com o começo do nome do arquivo (ex: "lynch")
# Exemplo: se os arquivos estão na pasta "sons" e se chamam "lynch1.mp3", o caminho é:
var caminho_base = "res://Assets/audios/lynch"

func interact():
	var numero_sorteado = randi_range(1, total_audios)
	
	var arquivo_completo = caminho_base + str(numero_sorteado) + ".mp3"
	
	var som = load(arquivo_completo)
	
	if som:
		audio_player.stream = som
		audio_player.play()
		print("Tocando áudio do Lynch nº: ", numero_sorteado)
	else:
		print("Erro: Não achei o áudio ", arquivo_completo)
