extends Node2D


var id = 9;

func _ready():
	Global.set_map(id)
	print ("Mapa: ", Global.get_map())
