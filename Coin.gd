extends Area2D

onready var animation = $AnimationPlayer.play("spinning")


func _on_Coin_body_entered(body):
	$AnimationPlayer.play("fade")
