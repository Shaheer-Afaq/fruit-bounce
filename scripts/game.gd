extends Node2D

@onready var timer: Timer = $Timer
@onready var label: Label = $Label
@onready var label_2: Label = $Label2
@onready var audio: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _ready() -> void:
	Manager.score1 = 0
	Manager.score2 = 0

	audio.play(0.0)
	
	var player1 = Manager.platformScene.instantiate()
	var player2 = Manager.platformScene.instantiate()
	
	player1.position = Vector2(200, 550)
	player1.id = 1
	player2.position = Vector2(get_viewport_rect().size.x - 200, 550)
	player2.id = -1
	add_child(player1)
	add_child(player2)
	
	update_labels()
	
	summon_fruit()

func _process(delta: float) -> void:
	if (Manager.score1 >= Manager.max_points):
		Manager.won = 1
		get_tree().change_scene_to_file("res://scenes/title_screen.tscn")
		
	if (Manager.score2 >= Manager.max_points):
		Manager.won = -1
		get_tree().change_scene_to_file("res://scenes/title_screen.tscn")
		

func _on_area_2d_body_entered(body: Node2D) -> void:
	if not body is fruit:
		return
	
	var midpoint := get_viewport_rect().size.x/2

	if body.position.x >= midpoint:
		Manager.score1 += 1
	else:
		Manager.score2 += 1

	update_labels()
	body.queue_free()
	summon_fruit.call_deferred()
		
func summon_fruit():
	var midpoint := get_viewport_rect().size.x/2
	var fruitInstance = Manager.fruitScene.instantiate()
	if (randf() < 0.99):
		var dir := 1 if randf() < 0.5 else -1
		fruitInstance.position = Vector2(midpoint + (dir * midpoint*0.5), -40)
		add_child(fruitInstance)
	else:
		fruitInstance.position = Vector2(midpoint*1.5, -40)
		var fruitInstance2 = Manager.fruitScene.instantiate()
		fruitInstance2.position = Vector2(midpoint/2, -40)

		add_child(fruitInstance)
		add_child(fruitInstance2)
		
	
	
func update_labels() -> void:
	label.text = str(Manager.score1)
	label_2.text = str(Manager.score2)
