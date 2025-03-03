extends Node2D
@onready var button: Button = $Sprite2D/Button
@onready var plante: Node2D = $"."

signal simulation_commencer


func _on_button_pressed() -> void:
	emit_signal("simulation_commencer")
	button.disabled = true
	print ("oui")
