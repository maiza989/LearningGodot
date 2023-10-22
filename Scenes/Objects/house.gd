extends Area2D

signal _on_house_entered
signal _on_house_exited


# method that hold signal for player when entering the house
func _on_body_entered(_body):
	_on_house_entered.emit()

# smae as above
func _on_body_exited(_body):
	_on_house_exited.emit()
