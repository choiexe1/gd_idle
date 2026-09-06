@tool
class_name ItemSlot extends Button

@onready var image: TextureRect = $Image
@onready var amount: Label = $Amount

func set_item(item: BaseItem, count: int = 1) -> void:
	if item == null:
		image.texture = null
		amount.text = ""
		tooltip_text = ""
		return
	
	image.texture = item.icon
	amount.text = str(count) if count > 1 else ""
	tooltip_text = "%s\n%s" % [item.item_name, item.description]
