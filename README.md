# Godot FSM

Пример минимальной FSM для Godot 4 с раздельными модулями: ядро FSM, базовый Unit, обработка ввода и готовая сцена-пример.

## Структура
```
FSM/                  # Ядро FSM
  state.gd            # Базовый класс состояния с get_state_label()
  state_machine.gd    # Менеджер переходов с get_current_state_label()
  state_context.gd    # Контекст для передачи данных в update()

Unit/                 # Базовый класс данных юнита
  unit.gd             # velocity, speed, jump_force, gravity

Input/                # Обработка ввода
  player_input.gd     # move_direction, jump_pressed, jump_held

Example/              # Пример интеграции
  example_player.gd   # CharacterBody2D + FSM + Label (опционально)
  States/
    idle_state.gd     # Покой
    move_state.gd     # Движение
    jump_state.gd     # Прыжок
```

## Быстрый старт
1) Скопируй нужные папки (обычно FSM + Unit + Input) в проект.
2) Подключи свои действия ввода: `ui_left`, `ui_right`, `ui_accept` (или переименуй в player_input.gd).
3) Создай узел CharacterBody2D и добавь примерный код из `Example/example_player.gd`.
4) (Опционально) Добавь Label в сцену и присвой его полю `label` для отображения текущего состояния.

## Пример кода
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

## Подключение Label (опционально)
- Используй любой Label в сцене
- Присвой ссылку в коде: `label = $Label`

## О проекте
Этот пример был выделен из рабочего игрового проекта с помощью GitHub Copilot, чтобы показать чистую реализацию FSM без лишних зависимостей.

## Лицензия
MIT
