extends Control


var score = 0
var random = RandomNumberGenerator.new()

"""
Hit - Draw a card
Stand - End round
Surrender - Take a penalty, but you don't lose.

Done:
- Add sprite player
- Add animation for player

TODO:
- End round on Stand (end round function)
- Dealer logic
- Clear hand text

- Add animation for game over
- Add logic for player animation


"""
enum Card {MOUSE, CAT, ELEPHANT}
const cards : Array[Card] = [Card.MOUSE, Card.CAT, Card.ELEPHANT]
const card_vals = {Card.MOUSE : 1, Card.CAT : 3, Card.ELEPHANT: 5}

var player_cards : Array[Card] = []


var track2 = preload("res://audio/academy.mp3")

# returns a card
func draw_card() -> Card:
	var card = cards[random.randi() % cards.size()]
	return card



# HandCards
func add_hand(card: Card):
	$Hand.text = "Hand: " + str(player_cards)
	var card_instance = preload("res://card.tscn").instantiate()
	card_instance.init(card, card_vals[card])
	$HandCards.add_child(card_instance)

func clear_hand() -> void:
	$Hand.text = "Hand: []"
	for child in $HandCards.get_children():
		child.queue_free()


func game_over() -> void:
	print('game over!')
	$GameOver.visible = true
	$Player.die()

func end_round() -> void:
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	set_score(score)


func set_score(k: int):

	$Score.text = "Score: " + str(k)


func _on_hit_pressed():
	var card = draw_card()
	player_cards.append(card)
	score += card_vals[card]
	
	if score >= 21:
		game_over()
	else:

		set_score(score)
		add_hand(card)
	
		$Player.hit()
	


func _on_stand_pressed():
	# Simulate dealer's game
	var dealers_hand : Array[Card] = []
	var d_score = 0
	for i in range(player_cards.size()):
		var c = draw_card()
		dealers_hand.append(c)
		d_score += card_vals[c]
	
	$Dealer.text = "Dealer's score: " + str(d_score) + "\n with hand: " + str(dealers_hand)
	
	end_round()

func _on_surrender_pressed():
	print("Surrendered!")
	
	player_cards = []
	score = 0
	set_score(0)
	$Dealer.text = "Dealer's score: "
	clear_hand()


func _on_change_music_pressed():
	$MusicPlayer.stop()
	
	$MusicPlayer.stream = track2
	
	$MusicPlayer.play(10.0)
	


func _on_sfx_pressed():
	$SFX.play()	

