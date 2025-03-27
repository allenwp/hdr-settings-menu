extends Control

@export var menus: Array[HDRMenu]


func _process(_delta: float) -> void:
	for menu: HDRMenu in menus:
		menu.refresh_menu() # refresh all every frame because each menu can affect the other
