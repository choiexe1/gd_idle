class_name CoinHeader extends HBoxContainer

@onready var label: Label = $Label

func _ready() -> void:
	label.text = str(GameState.coin)
	GameState.coin_changed.connect(_on_coin_changed)

func _on_coin_changed(coin: int) -> void:
	label.text = str(coin)
