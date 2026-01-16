## StateMachine  конечный автомат для управления переходами между состояниями.
class_name StateMachine
extends Object

var current_state: State
var previous_state: State
var unit: Unit

## Инициализация автомата и установка начального состояния
func setup(_unit: Unit, _initial_state: State) -> void:
	unit = _unit
	current_state = _initial_state
	current_state.enter(unit)

## Обновление состояния каждый физический кадр
func physics_update(_ctx: StateContext) -> void:
	if not current_state:
		return
	var next_state = current_state.update(_ctx)
	if next_state:
		change_state(next_state)

## Получить название текущего состояния
func get_current_state_label() -> String:
	return current_state.get_state_label()

## Перейти в новое состояние
func change_state(new_state: State) -> void:
	current_state.exit(unit)
	previous_state = current_state
	current_state = new_state
	current_state.enter(unit)