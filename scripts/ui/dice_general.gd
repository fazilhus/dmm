extends Control
class_name DiceGeneral

@onready var dice_vboxcontainer : VBoxContainer = %Dice_VBoxContainer
@onready var result_label : Label = %Result_Label
@onready var total_modifier_spinbox : SpinBox = %TotalModifier_SpinBox

func collect_dicebag() -> Dictionary[Enum.Dice, DiceRoll]:
	var res : Dictionary[Enum.Dice, DiceRoll] = {}
	for child: Dice in dice_vboxcontainer.get_children():
		if !child:
			continue
		
		var dice_roll : DiceRoll = DiceRoll.new()
		dice_roll.type = child.dice_name
		dice_roll.amount = child.get_dice_amount()
		dice_roll.modifier = child.get_dice_modifier()
		
		res[child.dice_name] = dice_roll
		
	return res

func _on_throw_button_pressed():
	var dice : Dictionary[Enum.Dice, DiceRoll] = collect_dicebag()
	var dice_roll_res : int = 0
	for dice_type: Enum.Dice in dice.keys():
		var dice_roll = dice[dice_type]
		for i in range(dice_roll.amount):
			dice_roll_res += Rand.rand_dice(dice_type)
		dice_roll_res += dice_roll.modifier
	dice_roll_res += int(total_modifier_spinbox.value)
	
	result_label.text = "Result: " + str(dice_roll_res)
