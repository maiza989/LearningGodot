extends CharacterBody2D


func _process(delta):
	
	#input
	var direction = Input.get_vector("left", "right", "up", "down")
	position += direction * 1000 * delta 
	
	# primary attack
	if Input.is_action_pressed("primary action"):
		print("shootting lazer")
		
	# secondary attack
	if Input.is_action_pressed("secondary action"):
		print("shooting grnadge")	
	
