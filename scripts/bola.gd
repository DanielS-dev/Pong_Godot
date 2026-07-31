extends RigidBody2D

signal ponto_marcado(jogador: int)

@export var speed := 400.0
@export var center_position := Vector2(576, 323)

const LIMITE_ESQUERDO := -50
const LIMITE_DIREITO := 1200

func _ready() -> void:
	gravity_scale = 0.0
	lock_rotation = true
	can_sleep = false
	linear_velocity = criar_velocidade()

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	var posicao_x := state.transform.origin.x
	if posicao_x < LIMITE_ESQUERDO:
		# A bola saiu pelo lado esquerdo.
		# Portanto, o adversário da direita marcou.
		ponto_marcado.emit(2)
		reiniciar_bola(state)
		return
	if posicao_x > LIMITE_DIREITO:
		# A bola saiu pelo lado direito.
		# Portanto, o jogador da esquerda marcou.
		ponto_marcado.emit(1)
		reiniciar_bola(state)
		return
	if state.linear_velocity.length() > 0:
		state.linear_velocity = state.linear_velocity.normalized() * speed

func reiniciar_bola(state: PhysicsDirectBodyState2D) -> void:
	var novo_transform := state.transform
	novo_transform.origin = center_position
	state.transform = novo_transform
	state.linear_velocity = criar_velocidade()
	state.angular_velocity = 0.0

func criar_velocidade() -> Vector2:
	var direction_x: float = [-1.0, 1.0].pick_random()
	var direction_y := randf_range(-0.7, 0.7)
	return Vector2(direction_x, direction_y).normalized() * speed
