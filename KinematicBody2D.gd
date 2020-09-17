extends KinematicBody2D

const gravity = 550
const speed = 200
const jumping = 250
const up = Vector2(0, -1)
var movement = Vector2(0, 0)

var is_dead = false

func die():
	$AnimationPlayer.play("dead")
	is_dead = true

func _physics_process(delta):
	if is_dead:
		return
	
	movement.x = 0
	
	if is_on_ceiling() || is_on_floor():
		movement.y = 0
	
	movement.y += gravity * delta
	
	check_key_input()
	 
	move_and_slide(movement, up)
	
	set_animation()
	
func check_key_input():
	if Input.is_key_pressed(KEY_D):
		movement.x = speed * 1
	elif Input.is_key_pressed(KEY_A):
		movement.x = speed * -1
	if Input.is_key_pressed(KEY_W) && is_on_floor():
		movement.y = -jumping
		
func set_animation():
	if movement.x < 0:
		$Sprite.flip_h = true
		$AnimationPlayer.play("Walk")
	
	if movement.x > 0:
		$Sprite.flip_h = false
		$AnimationPlayer.play("Walk")
	
	if movement.x == 0:
		$AnimationPlayer.play("idle")
	
	if movement.y < 0:
		$AnimationPlayer.play("sky")
	
