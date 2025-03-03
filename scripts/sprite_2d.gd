extends Sprite2D  # Si c'est un Sprite2D

var est_allumee = false  # État de la lampe

const CAPTURE_D__CRAN_2025_02_24_142206_REMOVEBG_PREVIEW = preload("res://assets/Capture_d_écran_2025-02-24_142206-removebg-preview.png")
const CAPTURE_D__CRAN_2025_02_24_142244_REMOVEBG_PREVIEW = preload("res://assets/Capture_d_écran_2025-02-24_142244-removebg-preview.png")

func _ready():
	texture = CAPTURE_D__CRAN_2025_02_24_142244_REMOVEBG_PREVIEW  # Définir l'image éteinte au départ
	set_pickable(true)
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		toggle_lampe()

func toggle_lampe():
	est_allumee = !est_allumee  # Inverser l'état
	texture = CAPTURE_D__CRAN_2025_02_24_142206_REMOVEBG_PREVIEW if est_allumee else CAPTURE_D__CRAN_2025_02_24_142244_REMOVEBG_PREVIEW  # Changer l'image
