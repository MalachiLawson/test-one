extends Node2D

var chat_count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/RichTextLabel.hide()
	$CanvasLayer/Sprite2D.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GlobalVariables.talking_jail:
		chat_picker()
		GlobalVariables.talking_jail = false
	if GlobalVariables.chat_done:
		$CanvasLayer/AnimationPlayer.pause()
	if Input.is_action_just_pressed("interact") and GlobalVariables.chat_done:
		$CanvasLayer/RichTextLabel.hide()
		$CanvasLayer/Sprite2D.hide()
		GlobalVariables.chat_done = false
		GlobalVariables.can_move = true

func chat_picker():
	if chat_count == 0:
		$CanvasLayer/RichTextLabel.show()
		$CanvasLayer/Sprite2D.show()
		chat_count = 1
		$CanvasLayer/AnimationPlayer.play("greeting")
		await $CanvasLayer/AnimationPlayer.animation_finished
		GlobalVariables.chat_done = true
	else:
		$CanvasLayer/RichTextLabel.show()
		$CanvasLayer/Sprite2D.show()
		chat_count += 1
		$CanvasLayer/AnimationPlayer.play("anger")
		await $CanvasLayer/AnimationPlayer.animation_finished
		GlobalVariables.chat_done = true
