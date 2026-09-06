@tool
class_name Inventory extends GridContainer

const ITEM_SLOT = preload("res://scenes/ui/item_slot.tscn")
const SLOT_COUNT = 50

var slots: Array[ItemSlot] = []
var items: Array = []

func _ready() -> void:
	_build_slots()

	if Engine.is_editor_hint():
		return

	items.resize(SLOT_COUNT)
	add_item(load("res://resources/items/healing_potion.tres"), 5)

func _build_slots() -> void:
	for child in get_children():
		child.queue_free()
	slots.clear()

	for i in SLOT_COUNT:
		var slot: ItemSlot = ITEM_SLOT.instantiate()
		add_child(slot)
		slots.append(slot)

func add_item(item: BaseItem, count: int = 1) -> void:
	for i in SLOT_COUNT:
		if items[i] == null:
			items[i] = {"item": item, "count": count}
			slots[i].set_item(item, count)
			return
