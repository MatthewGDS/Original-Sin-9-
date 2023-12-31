extends Area2D

export var speed = 2000

func _ready():
	set_as_toplevel(true)
	
func _process(delta):
	position == (Vector2.RIGHT*speed).rotated(rotation) * delta
	
func _physics_process(delta):
	global_position.x += -speed * delta
	yield(get_tree().create_timer(0.01), "timeout")
	set_physics_process(false)




func _on_VisibilityNotifier2D_screen_exited():
	queue_free()



func _on_bullet_body_entered(body):
	if !body.is_in_group("player"):
		queue_free()
