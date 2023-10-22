extends ParentLevel

# stop player movment on gate
func _on_gate_gate_body_entered(_body):
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 0.6)

