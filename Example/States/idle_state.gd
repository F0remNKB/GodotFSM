## IdleState  состояние покоя (velocity.x == 0)
class_name IdleState extends State

var text_state_label: String = "Idle"

func update(_ctx: StateContext) -> State:
	if _ctx.unit.velocity.x != 0:
		return MoveState.new()
	if _ctx.can_jump:
		return JumpState.new()
	return null

func get_state_label() -> String:
	return text_state_label