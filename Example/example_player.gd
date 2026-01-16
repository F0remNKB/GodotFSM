## ExamplePlayer  пример использования FSM с CharacterBody2D
class_name ExamplePlayer extends CharacterBody2D

var unit: Unit
var state_machine: StateMachine
var player_input: PlayerInput
var label: Label
var ctx: StateContext

func _ready() -> void:
	unit = Unit.new()
	state_machine = StateMachine.new()
	state_machine.setup(unit, IdleState.new())
	player_input = PlayerInput.new()
	add_child(player_input)
	ctx = StateContext.new(unit)
	label = $Label

func _physics_process(delta: float) -> void:
	player_input.update_input()
	unit.move(player_input.move_direction)
	unit.velocity.y += unit.gravity * delta
	ctx.on_floor = is_on_floor()
	ctx.can_jump = player_input.jump_pressed and ctx.on_floor
	state_machine.physics_update(ctx)
	if label:
		label.text = state_machine.get_current_state_label()
	velocity = unit.velocity
	move_and_slide()
	unit.velocity = velocity
