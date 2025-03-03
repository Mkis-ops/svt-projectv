extends Node2D

const BOL_MINERALISE = preload("res://assets/Capture_d_écran_2025-02-24_125335-removebg-preview.png")
const BOL_DEMINERALISE = preload("res://assets/Capture_d_écran_2025-02-24_125335-removebg-preview.png")
const BOL_VIDE = preload("res://assets/pngtree-wooden-rice-bowl-cartoon-illustration-image_1427043-removebg-preview.png")

enum EauType { MINERALISEE, DEMINERALISEE }
var eau_actuelle = null  # Aucun type sélectionné au départ
var plante_arrosee = false
var rempli_do = true
signal arroser
signal a_m
signal a_d
signal m_a
signal m_d
var oa = "aucun"
@onready var sprite_bol = $SpriteBol  # Assure-toi d'avoir un Sprite pour afficher le bol sélectionné
@onready var label_eau: Label = $LabelEau
@onready var button: Button = $Button
@onready var button_bol_deminiralise: Button = $ButtonBolDeminiralise
@onready var button_bol_mineralise: Button = $ButtonBolMineralise



	
func _ready() -> void:
	button.disabled = true

func _on_button_bol_deminiralise_pressed():
	eau_actuelle = EauType.DEMINERALISEE
	sprite_bol.texture = BOL_DEMINERALISE
	emit_signal("a_d")
	emit_signal("m_a")
	label_eau.text = "Eau déminéralisée sélectionnée"
	button.disabled = false

func _on_button_bol_mineralise_pressed() -> void:
	eau_actuelle = EauType.MINERALISEE
	emit_signal("a_m")
	emit_signal("m_d")
	sprite_bol.texture = BOL_MINERALISE
	label_eau.text = "Eau minéralisée sélectionnée"
	button.disabled = false

func _on_button_pressed() -> void:
	if eau_actuelle != null:
		rempli_do = false
		var type_eau = "minéralisée" if eau_actuelle == EauType.MINERALISEE else "déminéralisée"
	button.disabled = true
	button_bol_deminiralise.disabled = true
	button_bol_mineralise.disabled = true
	sprite_bol.texture = BOL_VIDE
	emit_signal("arroser")
	scale = Vector2(1, 1)
