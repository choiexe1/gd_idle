@tool
## 업그레이드 하나를 사는 버튼. 가격을 못 내면 스스로 비활성화된다.
class_name UpgradeButton extends Button

signal purchased(upgrade: Upgrade, level: int)

## 인스펙터에서 .tres를 꽂으면 에디터에서도 바로 보인다.
@export var upgrade: Upgrade:
	set(value):
		upgrade = value
		if is_node_ready():
			_refresh()

@onready var icon_rect: TextureRect = $Margin/Row/Icon
@onready var name_label: Label = $Margin/Row/Text/Name
@onready var desc_label: Label = $Margin/Row/Text/Description
@onready var cost_label: Label = $Margin/Row/Cost/Amount
@onready var level_label: Label = $Margin/Row/Cost/Level

var level := 0

func _ready() -> void:
	_refresh()

	if Engine.is_editor_hint():
		return

	pressed.connect(_on_pressed)
	GameState.coin_changed.connect(_on_coin_changed)

## 지금 레벨에서 다음 구매에 드는 비용
func get_cost() -> int:
	if upgrade == null:
		return 0
	return int(upgrade.base_cost * pow(upgrade.cost_growth, level))

func is_maxed() -> bool:
	return upgrade != null and upgrade.max_level > 0 and level >= upgrade.max_level

func _on_pressed() -> void:
	var cost := get_cost()
	if upgrade == null or is_maxed() or GameState.coin < cost:
		return

	GameState.coin -= cost
	level += 1
	GameState.coin_output += upgrade.coin_output_bonus
	purchased.emit(upgrade, level)
	_refresh()

func _on_coin_changed(_coin: int) -> void:
	_refresh()

func _refresh() -> void:
	if upgrade == null:
		name_label.text = "비어 있음"
		desc_label.text = ""
		cost_label.text = ""
		level_label.text = ""
		icon_rect.texture = null
		disabled = true
		return

	icon_rect.texture = upgrade.icon
	name_label.text = upgrade.upgrade_name
	desc_label.text = upgrade.description
	level_label.text = "Lv.%d" % level

	if is_maxed():
		cost_label.text = "MAX"
		disabled = true
	else:
		cost_label.text = str(get_cost())
		disabled = not Engine.is_editor_hint() and GameState.coin < get_cost()
