extends Node2D
@onready var button: Button = $Sprite2D/Button


	


func _on_button_pressed() -> void:
	get_tree().reload_current_scene()  # Recharge complètement la scène actuelle
