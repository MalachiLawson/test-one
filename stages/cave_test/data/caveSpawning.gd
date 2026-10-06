extends Node2D

@export var poo: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	var poo1 = poo.instantiate()
	poo1.position = Vector2(40,85)
	add_child(poo1)
	var poo2 = poo.instantiate()
	poo2.position = Vector2(215,100)
	add_child(poo2)
