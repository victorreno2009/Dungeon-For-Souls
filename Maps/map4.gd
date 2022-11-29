extends Node2D


var id = 7;

func _ready():
	Global.set_map(id)
	print ("Mapa: ", Global.get_map())
