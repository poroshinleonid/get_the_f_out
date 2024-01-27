extends CharacterBody2D

const max_speed = 200
const acceleration = 1500
const friction = 1500
@onready var sprite_2d = %AnimatedSprite2D

var input = Vector2.ZERO

func _physics_process(delta):
	player_movement(delta)

func get_input():
	if input.y == 0:
		input.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	if input.x == 0:
		input.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))
	return input.normalized()

func idle():
	if sprite_2d.animation == "idle_right" || sprite_2d.animation == "idle_left"\
	|| sprite_2d.animation == "idle_up" || sprite_2d.animation == "idle_down":
		return 0
	return 1

func player_movement(delta):
	input = get_input()
	if (Vector2.ZERO == input):
		#if velocity.length() > (friction * delta):
			#velocity -= velocity.normalized() * (friction * delta)
		#else:
		velocity = Vector2.ZERO
	else:
		velocity += (input * acceleration * delta)
		velocity = velocity.limit_length(max_speed)
	if input.x > 0:
		sprite_2d.animation = "right"
	elif Input.is_action_just_released("right"):
		sprite_2d.animation = "idle_right"
	if input.x < 0:
		sprite_2d.animation = "left"
	elif Input.is_action_just_released("left"):
		sprite_2d.animation = "idle_left"
	if input.y < 0:
		sprite_2d.animation = "up"
	elif Input.is_action_just_released("up"):
		sprite_2d.animation = "idle_up"
	if input.y > 0:
		sprite_2d.animation = "down"
	elif Input.is_action_just_released("down"):
		sprite_2d.animation = "idle_down"
	move_and_slide()


func _on_player_collision_area_area_entered(area):
	#%PressToTalkLabel.visible = true
	var overl_bodies = area.get_overlapping_bodies()
	var	overl_body
	if overl_bodies.size() > 0:
		overl_body = overl_bodies.front()
	if (overl_body.has_method("init_dial")):
		overl_body.init_dial()

func _on_player_collision_area_area_exited(area):
	pass
