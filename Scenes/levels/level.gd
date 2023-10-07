extends Node2D

var lazer_scene: PackedScene = preload("res://Scenes/projectiles/lazer.tscn")
var grenade_scene: PackedScene = preload("res://Scenes/projectiles/gernade.tscn")


func _on_gate_gate_body_entered(_body):
	print("body entered") 

	
func _on_gate_gate_body_exited(_body):
	print("body exited")

func _on_player_lazer(pos, direction):
	var lazer = lazer_scene.instantiate() as Area2D
	#update lazer position
	lazer.position = pos
	lazer.rotation_degrees = rad_to_deg(direction.angle()) + 90
	lazer.direction = direction
	# move lazer done in lazer script
	# add lazer instance to private/separate node
	$Projectiles.add_child(lazer)
	
	
func _on_player_grenade(pos, direction):
	# creating grenade instance
	var grenade = grenade_scene.instantiate() as RigidBody2D
	# making grenade postion to be at the player gun 
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed 
	#add grenade instance to a private/separate node 
	$Projectiles.add_child(grenade)

