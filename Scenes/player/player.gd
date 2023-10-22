extends CharacterBody2D

var can_lazer: bool = true
var can_grenade: bool = true

# Custom signal
signal lazer(pos, direction)
signal grenade(pos, direction)

@export var max_speed: int = 500
var speed: int = max_speed

func _process(_delta):
	#input
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed 
	move_and_slide()
	# player face mouse 
	look_at(get_global_mouse_position())
	var player_direction = (get_global_mouse_position() - position).normalized()
	
	# primary attack
	if Input.is_action_pressed("primary action") and can_lazer:
		#emit particles
		$LazerParticles.emitting = true
		# select a random marker 2d to spawn a lazer from 
		var lazer_markers = $lazerSpawnPosition.get_children()
		var selected_lazer = lazer_markers[randi() % lazer_markers.size()]
		can_lazer = false
		$Timers/lazerReloadTimer.start()
		#emit postion of lazer
		lazer.emit(selected_lazer.global_position, player_direction)
		
	# secondary attack
	if Input.is_action_pressed("secondary action") and can_grenade:
		can_grenade = false
		$Timers/grenadeReloadTimer.start()
		# setting grenade position to marker2d gloabl position/on the gun
		var grenade_marker_pos = $lazerSpawnPosition.get_children()[0].global_position
		grenade.emit(grenade_marker_pos, player_direction)
		

func _on_lazer_reload_timer_timeout():
	can_lazer = true
func _on_grenade_reload_timer_timeout():
	can_grenade = true
