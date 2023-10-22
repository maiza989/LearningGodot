extends Area2D

@export var speed: int = 1000
var direction: Vector2 = Vector2.UP

func _process(delta):
	position += direction * speed * delta

# a method that destroy lazer when it collides with an enemy or objects
func _on_body_entered(body):
	#if body.has_method("hit"):
	#	body.hit()
	if "hit" in body:
		body.hit()
	if "is_enemy" in body:
		print("is_enemy")		
	queue_free()

# a time method that despawns lazer after certain time.
func _on_despawn_lazer_timer_timeout():
	queue_free()
