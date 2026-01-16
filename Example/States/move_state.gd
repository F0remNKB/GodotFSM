## MoveState  состояние движения (velocity.x != 0)
class_name MoveState extends State

var text_state_label: String = "Move"

func update(_ctx: StateContext) -> State:
	if _ctx.unit.velocity.x == 0:
		return IdleState.new()
	if _ctx.can_jump:
		return JumpState.new()
	return null

func get_state_label() -> String:
	return text_state_label