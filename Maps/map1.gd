extends TileMap


var id = 2;

func _ready():

	Global.set_map(id)
	print ("Mapa: ", Global.get_map())
