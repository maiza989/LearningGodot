extends Area2D

signal _on_house_entered
signal _on_house_exited

func _on_body_entered(_body):
	_on_house_entered.emit()


func _on_body_exited(_body):
	_on_house_exited.emit()
