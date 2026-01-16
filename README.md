# Godot FSM

A minimal FSM example for Godot 4 with separate modules: FSM core, base Unit, input handling, and a ready-to-use example scene.

## Structure
```
FSM/                  # FSM Core
  state.gd            # Base state class with get_state_label()
  state_machine.gd    # Transition manager with get_current_state_label()
  state_context.gd    # Context for passing data to update()

Unit/                 # Base unit data class
  unit.gd             # velocity, speed, jump_force, gravity

Input/                # Input handling
  player_input.gd     # move_direction, jump_pressed, jump_held

Example/              # Integration example
  example_player.gd   # CharacterBody2D + FSM + Label (optional)
  States/
    idle_state.gd     # Idle
    move_state.gd     # Movement
    jump_state.gd     # Jump
```

## Quick Start
1) Copy the required folders (usually FSM + Unit + Input) to your project.
2) Set up your input actions: `ui_left`, `ui_right`, `ui_accept` (or rename them in player_input.gd).
3) Create a CharacterBody2D node and add example code from `Example/example_player.gd`.
4) (Optional) Add a Label to your scene and assign it to the `label` field to display the current state.

## Example Code
```gdscript
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
label = null

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
```

## Label Setup (Optional)
- Use any Label node in your scene
- Assign it in code: `label = $Label`

## About
This example was extracted from a working game project with GitHub Copilot to demonstrate a clean FSM implementation without unnecessary dependencies.

## License
MIT
