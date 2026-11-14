extends CharacterBody2D
class_name  Platform
var id
func _ready() -> void:
	rotation_degrees = id * 20
	
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	var direction
	direction = Input.get_axis("left" + str(id), "right" + str(id))
	
	if (Input.is_action_pressed("hit" + str(id))):
		var tween := create_tween()
		tween.tween_property(self, "rotation_degrees", 60 * id, 0.1)
		tween.tween_property(self, "rotation_degrees", 10 * id, 0.1)


	velocity.x += direction * Manager.speed * delta * 60
	velocity.x *= 0.9
	
	if (id == 1):
		position.x = clamp(position.x, 130, get_viewport_rect().size.x/2 - 130)
	else:
		position.x = clamp(position.x, get_viewport_rect().size.x/2 + 130, get_viewport_rect().size.x - 130)
	
	

	move_and_slide()
