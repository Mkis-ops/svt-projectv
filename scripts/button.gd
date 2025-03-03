extends Node2D

@onready var lampe: TextureRect = $TextureRect  # Récupère le TextureRect
@onready var label: Label = $Label  # Récupère le Label
@onready var button: Button = $Button  # Récupère le Button

signal sigma

const LAMPE_ON = preload("res://assets/Capture_d_écran_2025-02-24_142206-removebg-preview.png")
const LAMPE_OFF = preload("res://assets/Capture_d_écran_2025-02-24_142244-removebg-preview.png")

var est_allumee = false

func _ready():
	# Vérifie si tous les nœuds ont bien été trouvés
	if lampe == null:
		print("ERREUR : TextureRect non trouvé ! Vérifie son nom dans la scène.")
	if label == null:
		print("ERREUR : Label non trouvé ! Vérifie son nom dans la scène.")
	if button == null:
		print("ERREUR : Button non trouvé ! Vérifie son nom dans la scène.")

	# Assigne la texture de départ seulement si lampe est valide
	if lampe:
		lampe.texture = LAMPE_OFF  

	# Connecte le signal du bouton
	if button:
		button.pressed.connect(_on_button_pressed)

	mettre_a_jour_label()  # Met à jour le texte du label au démarrage

func _on_button_pressed():
	est_allumee = !est_allumee  # Inverse l'état de la lampe
	
	if lampe:
		lampe.texture = LAMPE_ON if est_allumee else LAMPE_OFF  # Change la texture

	mettre_a_jour_label()  # Met à jour le texte du label

func mettre_a_jour_label():
	if label:
		label.text = "LAMPE ALLUMÉE" if est_allumee else "LAMPE ÉTEINTE"
func _process(delta: float) -> void:
	if est_allumee == true:
		emit_signal("sigma")
	else:
		pass
