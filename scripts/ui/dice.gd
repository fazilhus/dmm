extends Control
class_name Dice

@export var dice_name : Enum.Dice

@onready var dice_name_label : Label = %DiceName_Label
@onready var amount_spinbox : SpinBox = %Amount_SpinBox

func _ready():
	_refresh()

func _refresh():
	dice_name_label.text = Util.dice_to_str(dice_name)

func get_dice_amount() -> int:
	return int(amount_spinbox.value)
