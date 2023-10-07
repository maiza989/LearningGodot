extends StaticBody2D

signal gate_body_entered
signal gate_body_exited



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_area_2d_body_entered(body):
	gate_body_entered.emit(body) # Replace with function body.


func _on_area_2d_body_exited(body):
	gate_body_exited.emit(body)
