extends Node2D

func _ready():
	GlobalSignals.pizza.emit()  # ✅ Émettre le signal
