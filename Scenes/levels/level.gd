extends Node2D

var lazer_scene: PackedScene = preload("res://Scenes/projectiles/lazer.tscn")
var grenade_scene: PackedScene = preload("res://Scenes/projectiles/gernade.tscn")


func _on_gate_gate_body_entered(_body):
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 0.6)

	
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
	# test 
	
func _on_player_grenade(pos, direction):
	# creating grenade instance
	var grenade = grenade_scene.instantiate() as RigidBody2D
	# making grenade postion to be at the player gun 
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed 
	#add grenade instance to a private/separate node 
	$Projectiles.add_child(grenade)

func _on_house__on_house_entered():
	var node = get_node("Player/Camera2D")
	var tween = get_tree().create_tween()
	tween.tween_property(node, "zoom", Vector2(1,1), 0.5).set_trans(Tween.TRANS_SINE)
	
func _on_house__on_house_exited():
	var node = get_node("Player/Camera2D")
	var tween = get_tree().create_tween()
	tween.tween_property(node, "zoom", Vector2(0.6,0.6), 0.5).set_trans(Tween.TRANS_CUBIC)
