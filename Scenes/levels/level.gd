extends Node2D
class_name ParentLevel


var lazer_scene: PackedScene = preload("res://Scenes/projectiles/lazer.tscn")
var grenade_scene: PackedScene = preload("res://Scenes/projectiles/gernade.tscn")


# spawn an instance for player lazer
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

# spawn an instance for playr grenade
func _on_player_grenade(pos, direction):
	# creating grenade instance
	var grenade = grenade_scene.instantiate() as RigidBody2D
	# making grenade postion to be at the player gun 
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed 
	#add grenade instance to a private/separate node 
	$Projectiles.add_child(grenade)

# A tween animation to zoom in when player enter a house
func _on_house__on_house_entered():
	var node = get_node("Player/Camera2D")
	var tween = get_tree().create_tween()
	tween.tween_property(node, "zoom", Vector2(1,1), 0.5).set_trans(Tween.TRANS_SINE)

# a tween animation to zoom out	when layer exit a house
func _on_house__on_house_exited():
	var node = get_node("Player/Camera2D")
	var tween = get_tree().create_tween()
	tween.tween_property(node, "zoom", Vector2(0.6,0.6), 0.5).set_trans(Tween.TRANS_CUBIC)
