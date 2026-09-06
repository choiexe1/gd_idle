@tool
## 업그레이드 버튼들을 세로로 쌓는 패널.
class_name UpgradePanel extends VBoxContainer

const UPGRADE_BUTTON = preload("res://scenes/ui/upgrade_button.tscn")

## 여기에 .tres를 넣는 만큼 버튼이 생긴다.
@export var upgrades: Array[Upgrade] = []:
	set(value):
		upgrades = value
		if is_node_ready():
			_build()

var buttons: Array[UpgradeButton] = []

func _ready() -> void:
	_build()

func _build() -> void:
	for child in get_children():
		remove_child(child)
		child.queue_free()
	buttons.clear()

	for upgrade in upgrades:
		if upgrade == null:
			continue
		var button: UpgradeButton = UPGRADE_BUTTON.instantiate()
		button.upgrade = upgrade
		add_child(button)
		buttons.append(button)

		if Engine.is_editor_hint():
			button.owner = self
