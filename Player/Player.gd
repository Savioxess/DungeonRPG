extends KinematicBody2D


const MAX_SPEED = 120
const ACCELRATION = 600
const FRICTION = 300

enum {
	MOVE,
	ATTACK
}

var state = MOVE

var velocity = Vector2.ZERO

func _physics_process(delta):
	match state:
		MOVE:
			move_state(delta)
	

func move_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if(input_vector != Vector2.ZERO):
		velocity = velocity.move_toward(input_vector * MAX_SPEED, delta * ACCELRATION)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, delta * ACCELRATION)
	
	move()

func move():
	velocity = move_and_slide(velocity)
