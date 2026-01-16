## Unit  базовый класс с данными юнита
class_name Unit extends Object

# Базовые параметры
var direction: int = 1
var velocity: Vector2 = Vector2.ZERO
var speed: float = 250.0
var jump_force: float = -300.0
var gravity: float = 980.0

## Инициализация юнита
func setup(config: Dictionary) -> void:
	if config.has("direction"):
		direction = config["direction"]
	if config.has("speed"):
		speed = config["speed"]
	if config.has("jump_force"):
		jump_force = config["jump_force"]

## Устанавливает горизонтальную скорость
func move(move_direction: int) -> void:
	if move_direction == 0:
		velocity.x = 0
	else:
		velocity.x = speed * move_direction