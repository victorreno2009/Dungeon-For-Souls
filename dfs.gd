extends Node2D


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

# Called when the node enters the scene tree for the first time.
func _ready():
	dfs(0)
	print(searched_rooms)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
