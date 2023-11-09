extends Node2D



func die():
	print("die triggerd")
	$PlayerAnimatedSprite.play("die")


func hit():
	print("hit")
	$PlayerAnimatedSprite.play("hit")
	$Timer.start()
	

	
# Called when the node enters the scene tree for the first time.
func _ready():
	$PlayerAnimatedSprite.play("idle")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_animated_sprite_animation_finished(anim_name : String):
	print("hit finished!")
	if anim_name == "hit":
		$PlayerAnimatedSprite.play("idle")



func _on_timer_timeout():
	$PlayerAnimatedSprite.play("idle")
