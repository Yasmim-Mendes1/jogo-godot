extends CharacterBody2D

@export var max_health: int = 100
var current_health: int 

signal died

func _ready() -> void:
	current_health = max_health
	connect("died", _on_enemy_died)
	
func take_damage(amount: int):
	current_health -= amount
	current_health = clamp(current_health, 0 , max_health)
	
	if current_health <= 0:
		die()
		
func die():
	print("Inimigo morreu")
	emit_signal("died")
	queue_free()
	
func _on_enemy_died():
	pass
