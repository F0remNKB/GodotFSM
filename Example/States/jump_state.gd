## JumpState  состояние прыжка
class_name JumpState extends State

var text_state_label: String = "Jump"

func enter(_unit: Unit) -> void:
	_unit.velocity.y = _unit.jump_force

func update(_ctx: StateContext) -> State:
	_ctx.unit.velocity.y += _ctx.unit.gravity * 0.016
	if _ctx.on_floor:
		if _ctx.unit.velocity.x == 0:
			return IdleState.new()
		else:
			return MoveState.new()
	return null

func get_state_label() -> String:
	return text_state_label