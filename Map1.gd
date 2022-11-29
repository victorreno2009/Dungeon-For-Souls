extends Node2D


var id = 0;

func _ready():

	Global.set_map(id)
	print ("Mapa: ", Global.get_map())






