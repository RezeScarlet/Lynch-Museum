extends Control

@onready var video_player = $VideoStreamPlayer
@onready var scroll_container = $ScrollContainer
@onready var texto_label = $ScrollContainer/MarginContainer/VBoxContainer/RichTextLabel
@onready var audio_player = $AudioStreamPlayer2D

@export var velocidade_scroll = 25.0

var creditos_rolando = false
var posicao_atual_scroll = 0.0

func _ready():
	audio_player.stop()
	scroll_container.hide()
	scroll_container.scroll_vertical = 0
	
	video_player.finished.connect(_on_video_finished)
	audio_player.finished.connect(_on_audio_finished)
	
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

func _process(delta):
	if creditos_rolando:
		posicao_atual_scroll += velocidade_scroll * delta
		scroll_container.scroll_vertical = posicao_atual_scroll
		
		var altura_maxima = scroll_container.get_v_scroll_bar().max_value
		if posicao_atual_scroll >= altura_maxima:
			creditos_rolando = false

func _on_video_finished():
	video_player.hide()
	audio_player.play()
	scroll_container.show()
	creditos_rolando = true

func _on_audio_finished():
	get_tree().quit()

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
