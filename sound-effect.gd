extends KinematicBody2D

const SPEED = 200
var sound_player := AudioStreamPlayer.new()

func _ready():

	add_child(sound_player)


func _physics_process(delta):
	var motion = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		motion.x += 1
		
	if Input.is_action_pressed("ui_left"):
		motion.x -= 1
	if Input.is_action_pressed("ui_down"):
		motion.y += 1
	if Input.is_action_pressed("ui_up"):
		motion.y -= 1

	motion = motion.normalized() * SPEED
	move_and_slide(motion)

	var c1 = position.x <= 0
	var c2 = position.x >= get_viewport().size.x
	var c3 = position.y <= 0
	var c4 = position.y >= get_viewport().size.y

	if c1 or c2 or c3 or c4:
		var sound_effect = load("res://bgmusic.wav")
		sound_player.stream = sound_effect
		sound_player.play()

