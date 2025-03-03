extends Node2D

const BOL_MINERALISE = preload("res://assets/Capture_d_écran_2025-02-24_125335-removebg-preview.png")
const BOL_DEMINERALISE = preload("res://assets/Capture_d_écran_2025-02-24_125335-removebg-preview.png")

enum EauType { MINERALISEE, DEMINERALISEE }
var eau_actuelle = null  # Aucun type sélectionné au départ
var plante_arrosee = false

@onready var sprite_bol = $SpriteBol  # Assure-toi d'avoir un Sprite pour afficher le bol sélectionné
@onready var label_eau = $LabelEau  # Label pour afficher l'eau sélectionnée
@onready var plante: Node2D = %Plante




func _on_button_bol_deminiralise_pressed():
	eau_actuelle = EauType.DEMINERALISEE
	sprite_bol.texture = BOL_DEMINERALISE
	label_eau.text = "Eau déminéralisée sélectionnée"


func _on_button_bol_mineralise_pressed() -> void:
	eau_actuelle = EauType.MINERALISEE
	sprite_bol.texture = BOL_MINERALISE
	label_eau.text = "Eau minéralisée sélectionnée"


func _on_button_pressed() -> void:
	if eau_actuelle != null:
		plante_arrosee = true
		var type_eau = "minéralisée" if eau_actuelle == EauType.MINERALISEE else "déminéralisée"
		print("La plante a été arrosée avec de l'eau " + type_eau)
	else:
			print("Sélectionne un type d'eau avant d'arroser !")
	plante.arroser_plante()
