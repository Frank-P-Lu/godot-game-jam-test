extends Control

const Game = preload("res://Game.gd")

var textures = {
	Game.Card.CAT: preload("res://cat.tres"),
	Game.Card.ELEPHANT: preload("res://elephant.tres"),
	Game.Card.MOUSE: preload("res://mouse.tres"),
}

var card_type: Game.Card


func init(c_type: Game.Card, cost: int):
	card_type = c_type
	$Sprite.texture = textures[card_type]
	$Circle/Cost.text = str(cost)
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
