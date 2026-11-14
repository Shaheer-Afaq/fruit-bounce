extends Node2D

@onready var texture_button: TextureButton = $TextureButton
@onready var game: Node2D = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Win2.visible = false
	$Win1.visible = false
	
	if Manager.won == 1:
		$Win1.visible = true
	elif Manager.won == -1:
		$Win2.visible = true
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_texture_button_pressed() -> void:
	
	get_tree().change_scene_to_file("res://Scenes/game.tscn")
