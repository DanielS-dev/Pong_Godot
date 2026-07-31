extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_sair_pressed() -> void:
	get_tree().quit()

func _on_voltar_pressed() -> void:
	$Criar_Usuario.visible = false
	$Criar_Usuario/Nome_Input.text = ""
	$Menu.visible = true

func _on_iniciar_pressed() -> void:
	$Menu.visible = false
	$Criar_Usuario.visible = true

func _on_creditos_pressed() -> void:
	$Menu.visible = false
	$Creditos.visible = true

func _on_voltar_creditos_pressed() -> void:
	$Creditos.visible = false
	$Menu.visible = true

func _on_criar_pressed() -> void:
	if ($Criar_Usuario/Nome_Input.text == ""):
		var erro = Label.new()
		erro.text = "Nome Vazio!!!"
		erro.add_theme_color_override("font_color", Color(255,0,0))
		erro.add_theme_font_size_override("font_size", 30)
		erro.top_level = true
		erro.visible = true
		$Criar_Usuario.add_child(erro)
		erro.set_anchors_and_offsets_preset(Control.PRESET_CENTER)
		await get_tree().create_timer(1.0).timeout
		erro.visible = false
	else:
		GerenciadorDados.nome_jogador = $Criar_Usuario/Nome_Input.text
		get_tree().change_scene_to_file("res://scenes/jogo.tscn")
