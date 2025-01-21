extends Control

@onready var dice_vboxcontainer : VBoxContainer = %Dice_VBoxContainer
@onready var result_label : Label = %Result_Label

func collect_dicebag() -> Dictionary[Enum.Dice, int]:
	var res : Dictionary[Enum.Dice, int] = {}
	for child: Dice in dice_vboxcontainer.get_children():
		if !child:
			continue
		
		res[child.dice_name] = child.get_dice_amount()
		
	return res

func _on_throw_button_pressed():
	var dice : Dictionary[Enum.Dice, int] = collect_dicebag()
	var dice_roll_res : int = 0
	for dice_type: Enum.Dice in dice.keys():
		var dice_amount = dice[dice_type]
		for i in range(dice_amount):
			dice_roll_res += Rand.rand_dice(dice_type)
	
	result_label.text = "Result: " + str(dice_roll_res)
