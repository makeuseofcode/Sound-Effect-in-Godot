extends KinematicBody2D

const SPEED = 150

func _physics_process(delta):
    var velocity = Vector2.ZERO
    if Input.is_action_pressed("move_right"):
        velocity.x += SPEED
    if Input.is_action_pressed("move_left"):
        velocity.x -= SPEED
    if Input.is_action_pressed("move_down"):
        velocity.y += SPEED
    if Input.is_action_pressed("move_up"):
        velocity.y -= SPEED

    velocity = move_and_slide(velocity)
