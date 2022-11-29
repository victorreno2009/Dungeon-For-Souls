extends Node2D


var id = 6;

func _ready():
	process_priority = -100
	Global.set_map(id)
	print ("Mapa: ", Global.get_map())
