## PlayerInput  обработка ввода игрока
class_name PlayerInput extends Node

var move_direction: int = 0
var jump_pressed: bool = false
var jump_held: bool = false

## Обновляет состояние ввода каждый кадр
func update_input() -> void:
	move_direction = horizontal_input()
	jump_pressed = is_jump_pressed()
	jump_held = is_jump_held()

## Определяет горизонтальное направление
func horizontal_input() -> int:
	if Input.is_action_pressed("ui_right"):
		return 1
	if Input.is_action_pressed("ui_left"):
		return -1
	return 0

## Проверяет нажатие кнопки прыжка
func is_jump_pressed() -> bool:
	return Input.is_action_just_pressed("ui_accept")

## Проверяет удержание кнопки прыжка
func is_jump_held() -> bool:
	return Input.is_action_pressed("ui_accept")
