extends Node

signal coin_changed(coin: int)

var coin := 0:
	set(value):
		coin = value
		coin_changed.emit(coin)

var coin_output := 1
