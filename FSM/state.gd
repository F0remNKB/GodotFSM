## State  базовый класс состояния для FSM. Определяет интерфейс для всех состояний.
class_name State
extends Object

## Вход в состояние
func enter(_unit: Unit) -> void:
	pass

## Выход из состояния
func exit(_unit: Unit) -> void:
	pass

## Обновление логики состояния каждый физический кадр
func update(_ctx: StateContext) -> State:
	return null

## Название состояния для отображения и отладки
func get_state_label() -> String:
	return "State"