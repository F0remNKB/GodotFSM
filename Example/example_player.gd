## ExamplePlayer  пример использования FSM с CharacterBody2D
class_name ExamplePlayer extends CharacterBody2D

var unit: Unit
var state_machine: StateMachine
var player_input: PlayerInput
var label: Label

func _ready() -> void:
	unit = Unit.new()
	state_machine = StateMachine.new()
	state_machine.setup(unit, (IdleState.new() if is_on_floor() else JumpState.new()))
	label = $Label
	player_input = PlayerInput.new()
	add_child(player_input)
	
	# Подключение Label для отображения текущего состояния (опционально)
	# label = Label3D.new()  или используй готовый Label из сцены

func _physics_process(_delta: float) -> void:
	# Обновление ввода
	player_input.update_input()
	
	# Обработка движения
	unit.move(player_input.move_direction)
	
	# Гравитация
	unit.velocity.y += unit.gravity * _delta
	
	# Обновление FSM
	var ctx = StateContext.new(unit)
	ctx.on_floor = is_on_floor()
	ctx.can_jump = player_input.jump_pressed and ctx.on_floor
	
	state_machine.physics_update(ctx)
	
	# Обновление Label с текущим состоянием (если подключен)

	label.text = state_machine.get_current_state_label()
	
	# Применение скорости
	velocity = unit.velocity
	move_and_slide()