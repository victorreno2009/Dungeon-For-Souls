extends KinematicBody2D


export var velocidade_andar = 250
var pos = "Idle Down"
var x = 0

var movement = Vector2(0,0)

func _physics_process(delta):

	
	var horizontal_Axis = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	movement.x = velocidade_andar * horizontal_Axis
	var vertical_Axis = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	movement.y = velocidade_andar * vertical_Axis
	
	
	move_and_slide(movement,Vector2.UP)
	
	update_animation()

func update_animation():
	if movement.x > 0:
		$AnimatedSprite.scale.x = -1
	elif movement.x < 0:
		$AnimatedSprite.scale.x = 1
	if movement.y == 0 and abs(movement.x) > 0:
		$AnimatedSprite.play("Walk Left")
		pos = "Idle Left"
	if movement.y > 0 and movement.x == 0:
		$AnimatedSprite.play("Walk Down")
		pos = "Idle Down"
	elif movement.y < 0 and movement.x == 0:
		$AnimatedSprite.play("Walk Up")
		pos = "Idle Up"
	elif movement.y == 0 and movement.x == 0: 
		$AnimatedSprite.play(pos)




# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var adjacency_list = [
#sala 0
	[2, 3],
#sala 1
	[4, 5],
#sala 2
	[6, 7],
#sala 3
	[8, 9],
#sala 4
	[10, 11],
#sala 5
	[4, 2],
#sala 6
	[2, 9],
#sala 7
	[5, 1],
#sala 8
	[9, 7],
#sala 9
	[7, 2],
#sala 10
	[11, 1],
#sala 11
	[11, 5]
]

var searched_rooms = []

func dfs(current_room):
	for room in adjacency_list[current_room]:
		if(!searched_rooms.has(room)):
			searched_rooms.append(room)
			dfs(room)



func compare():
	var c
	c = searched_rooms[Global.get_count()] == Global.get_map()
	print(Global.get_count())
	print(Global.get_map())
	return c

# Called when the node enters the scene tree for the first time.
func _ready():
	dfs(0)
	print("Comparação: ", compare())
	print(searched_rooms)
	Global.add_count()
	#print(Global.get_count())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


