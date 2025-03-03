extends Node2D
@onready var boutton_commencer: Node2D = $"Boutton Commencer"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var bol: Node2D = $Bol
@onready var lampe: Node2D = $Lampe
@onready var label: Label = $AnimatedSprite2D/Label

var com = false
var lum = false
var a = false
var a_m = false
var a_d = false
var a_d_g = false

func _process(delta: float) -> void:
	pass
	print ("Lumieres" + str(lum))
	print ("Arrosage" + str(a))
	print ("Eau minerales" + str(a_m))
	print ("Commencer" + str(com))
	plant_growth()
	
func _ready() -> void:
	animated_sprite_2d.play("i")
	bol.connect('a_m', _on_bol_a_m)
func _on_boutton_commencer_simulation_commencer() -> void:
	com = true
func _on_lampe_sigma() -> void:
	lum = true
func _on_bol_arroser() -> void:
	a = true
func _on_bol_a_m() -> void:
	a_m = true
func _on_bol_a_d() -> void:
	a_d = true
func _on_bol_m_a() -> void:
	a_m = false
func _on_bol_m_d() -> void:
	a_d = false
func plant_growth():
	if a_d_g == false and com == true and lum == true and a == true and a_m == true:
		animated_sprite_2d.play("gg")     #1 1 1
		a_d_g = true 
		await get_tree().create_timer(5.0).timeout
		label.text = "La plante a pousse"
	if a_d_g == false and com == true and lum == false and a == false and a_m == false:
		animated_sprite_2d.play("i")      #0 0 0
		a_d_g = true 
		label.text = "La plante est morte"
	if a_d_g == false and com == true and lum == true and a == true and a_m == false and a_d == true:
		animated_sprite_2d.play("mg")      #1 1 0
		a_d_g = true 
		await get_tree().create_timer(10.0).timeout
		label.text = "La plante a pousse
					  Lentement"
	if a_d_g == false and com == true and lum == false and a == true and ( a_m == true != a_d == true):
		animated_sprite_2d.play("bg")    # 0 1 0
		a_d_g = true 
		await get_tree().create_timer(2.0).timeout
		label.text = "La plante est morte"
	if a_d_g == false and com == true and lum == true and a == false and  a_m == false and a_d == false:
		animated_sprite_2d.play("bg")    # 0 1 0
		a_d_g = true 
		await get_tree().create_timer(2.0).timeout
		label.text = "La plante est morte"
