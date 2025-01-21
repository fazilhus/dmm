extends Node

@export var desktop_pkd : PackedScene
@export var mobile_pkd : PackedScene

@onready var hud : CanvasLayer = %HUD

var platform : Enum.Platform = Enum.Platform.NONE

func _ready():
	match OS.get_name():
		"Windows", "Linux", "OSX":
			_ready_desktop()
		"Android", "iOS":
			_ready_mobile()
		_:
			Loggie.error("Unknown platform")
			get_tree().quit()


func _ready_desktop():
	Loggie.info("This is a desktop platform")
	platform = Enum.Platform.DESKTOP
	var ui = desktop_pkd.instantiate()
	hud.add_child(ui)
	

func _ready_mobile():
	Loggie.info("This is a mobile platform")
	platform = Enum.Platform.MOBILE
	var ui = mobile_pkd.instantiate()
	hud.add_child(ui)
