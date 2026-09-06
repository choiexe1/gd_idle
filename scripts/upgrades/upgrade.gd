## 구매할 수 있는 업그레이드 하나의 정의.
## 에디터에서 .tres 파일로 만들어 쓴다.
class_name Upgrade extends Resource

## 화면에 보이는 이름
@export var upgrade_name: String

## 무엇을 해주는지에 대한 한 줄 설명
@export var description: String

## 버튼 왼쪽에 표시할 아이콘
@export var icon: Texture2D

## 첫 구매 가격
@export var base_cost: int = 10

## 한 번 살 때마다 가격이 몇 배가 되는지
@export var cost_growth: float = 1.5

## 구매 1회당 클릭 획득량이 얼마나 늘어나는지
@export var coin_output_bonus: int = 1

## 최대 구매 횟수 (0이면 무제한)
@export var max_level: int = 0
