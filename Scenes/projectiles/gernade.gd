extends RigidBody2D

@export var speed = 500

func explode_animation():
	$Animation/ExplosionAnimation.play("explosion")
