extends StaticBody2D

signal gate_body_entered
signal gate_body_exited

# functions for signal use.
func _on_area_2d_body_entered(body):
	gate_body_entered.emit(body)
func _on_area_2d_body_exited(body):
	gate_body_exited.emit(body)
