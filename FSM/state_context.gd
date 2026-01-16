## StateContext — контекст состояния, передается в update() для доступа к данным юнита
class_name StateContext
extends Object

var unit: Unit
var move_dir: Vector2 = Vector2.ZERO
var on_floor: bool = false
var can_jump: bool = false

func _init(_unit: Unit) -> void:
	unit = _unit
