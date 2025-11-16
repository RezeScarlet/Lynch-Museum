extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const CAMERA_X_LIMIT_UP = -1.39626
const CAMERA_X_LIMIT_DOWN = 1.39626
@onready var camera = $Camera3D 
@export var mouse_sensitivity: float = 0.005
@onready var raycast = $Camera3D/RayCast3D

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	pass

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * mouse_sensitivity)
		camera.rotate_x(-event.relative.y * mouse_sensitivity)
		camera.rotation.x = clamp(camera.rotation.x, CAMERA_X_LIMIT_UP, CAMERA_X_LIMIT_DOWN)

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		
	if Input.is_action_just_pressed("Interact"):
		if raycast.is_colliding():
			var objeto = raycast.get_collider()
			if objeto.has_method("interact"):
				objeto.interact()

	move_and_slide()
