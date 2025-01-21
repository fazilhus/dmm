extends Node

func dice_to_str(dice: Enum.Dice) -> String:
    match dice:
        Enum.Dice.D4:
            return "D4"
        Enum.Dice.D6:
            return "D6" 
        Enum.Dice.D8:
            return "D8" 
        Enum.Dice.D10:
            return "D10" 
        Enum.Dice.D12:
            return "D12" 
        Enum.Dice.D20:
            return "D20" 
        Enum.Dice.D100:
            return "D100" 
        _:
            Loggie.error("Unknown Enum.Dice: ", dice)
            return "None"