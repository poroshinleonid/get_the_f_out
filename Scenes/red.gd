extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta):
	# Handle jump.
	if Input.is_action_just_pressed("up"):
		velocity.y += JUMP_VELOCITY
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	if Input.is_action_just_pressed("down"):
		velocity.y -= JUMP_VELOCITY
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _on_body_entered(body):
		if body && body.has_method("initiate_dialogue"):
			%PressToTalkLabel.visible = true
			%PressToTalkLabel.text = "OVERLAP"
		else:
			%PressToTalkLabel.visible = false
			%PressToTalkLabel.text = "no over"
	#var	overlapping_npc = %PlayerCollisionArea.get_overlapping_bodies().front()
	#if overlapping_npc and overlapping_npc.has_method("initiate_dialogue"):
		#%PressToTalkLabel.visible = true
		#%PressToTalkLabel.text = "OVERLAP"
	#elif (overlapping_npc):
		#%PressToTalkLabel.visible = false
	#else:
		#%PressToTalkLabel.visible = false
			
			
