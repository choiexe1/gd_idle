class_name Potion
extends Consumable

## 포션의 종류들
enum PotionType { HP, MP }

@export var type: PotionType

## 회복량
@export var amount: float
