extends Area2D

@export var speed: int = 1000
var direction: Vector2 = Vector2.UP

func _process(delta):
	position += direction * speed * delta

func _on_body_entered(body):
	#if body.has_method("hit"):
	#	body.hit()
	if "hit" and "is_enemy" in body:
		body.hit()
		print("is_enemya")
	queue_free()



func _on_despawn_lazer_timer_timeout():
	queue_free()
