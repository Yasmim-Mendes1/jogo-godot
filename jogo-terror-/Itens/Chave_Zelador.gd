extends Area2D

@export var item_name: String = "Item"

var player_in_area: bool = false
var player_ref: Node = null

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)


func _process(_delta: float) -> void:
	if player_in_area and Input.is_action_just_pressed("interact"):
		collect_item()


func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		player_in_area = true
		player_ref = body
		print("Aperte E para pegar: ", item_name)


func _on_body_exited(body: Node) -> void:
	if body.is_in_group("Player"):
		player_in_area = false
		player_ref = null
		print("Saiu da área do item")


func collect_item() -> void:
	print("Item coletado: ", item_name)

	# Aqui você pode mandar o item para o inventário do player
	if player_ref != null and player_ref.has_method("add_item"):
		player_ref.add_item(item_name)

	queue_free()
