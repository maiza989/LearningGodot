extends RigidBody2D

@export var speed = 500

#play explosion animation
func explode_animation():
	$Animation/ExplosionAnimation.play("explosion")
