extends Node

var gameScene = preload("res://Scenes/game.tscn")
var fruitScene = preload("res://scenes/fruit.tscn")
var platformScene = preload("res://scenes/trampoline.tscn")

var speed :int = 60
var score1
var score2
const max_points := 10
var won := 0
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
