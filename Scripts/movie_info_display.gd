extends CanvasLayer

@onready var cover_rect = $PanelContainer/MarginContainer/HBoxContainer/TextureRect
@onready var title_label = $PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/LabelTitle
@onready var synopsis_label = $PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/RichTextLabelSynopsis
@onready var cast_label = $PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/LabelCast

func _ready():
	hide()
	set_process_input(false)

func show_movie_info(data: MovieData):
	title_label.text = "%s (%d)" % [data.title, data.year]
	synopsis_label.text = data.synopsis
	cover_rect.texture = data.cover_image
	
	cast_label.text = "Elenco: " + ", ".join(data.cast)
	
	show()
	
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

	await get_tree().create_timer(0.1).timeout
	
	set_process_input(true)

func _input(event):
	if event.is_action_pressed("Interact") or event.is_action_pressed("ui_cancel"):
		close_display()
		get_viewport().set_input_as_handled()
			
func close_display():
	hide()
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	set_process_input(false)
