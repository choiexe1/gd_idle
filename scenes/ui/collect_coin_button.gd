class_name CollectCoinButton extends Button

func _ready() -> void:
	pressed.connect(_on_pressed)

func _on_pressed() -> void:
	GameState.coin += GameState.coin_output
