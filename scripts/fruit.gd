extends RigidBody2D
class_name fruit

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

	sprite.frame = randi_range(0, 13)
	sprite.scale = Vector2(randf_range(5, 7), randf_range(5,7))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node) -> void:
	$hit.pitch_scale = randf() + 0.4
	$hit.play()
	
