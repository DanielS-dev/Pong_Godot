extends Control

var pontos_jogador := 0
var pontos_adversario := 0

@onready var bola: RigidBody2D = $Bola

func _ready() -> void:
	bola.ponto_marcado.connect(_on_bola_ponto_marcado)
	atualizar_placar()

func _on_bola_ponto_marcado(jogador: int) -> void:
	if jogador == 1:
		GerenciadorDados.pontos_jogador += 1
	elif jogador == 2:
		GerenciadorDados.pontos_adversario += 1
	atualizar_placar()

func atualizar_placar() -> void:
	$Pontos1.text = "Pontos do Jogador: " + str(GerenciadorDados.pontos_jogador)
	$Pontos2.text = "Pontos do Adversario: " + str(GerenciadorDados.pontos_adversario)
