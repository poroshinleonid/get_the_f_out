extends CharacterBody2D

func init_dial():
	print("DIAL")
	Dialogic.start("res://dialogues/timeline1.dtl")
	#var events : Array = []
	#var text_event = DialogicTextEvent.new()
	#text_event.text = "Make me laugh bro"
	##text_event.character = load("res://characters/Emilio.dch")
	#events.append(text_event)
#
	#var timeline : DialogicTimeline = DialogicTimeline.new()
	#timeline.events = events
	## if your events are already resources, you need to add this:
	#timeline.events_processed = true
	#Dialogic.start(timeline)

func _on_sample_npc_area_2d_area_entered(area):
	velocity = Vector2.LEFT * 1000
	move_and_slide # Replace with function body.
