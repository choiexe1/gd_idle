class_name CoinHeader extends HBoxContainer

@onready var label: Label = $Label

func _ready() -> void:
	label.text = str(0)
