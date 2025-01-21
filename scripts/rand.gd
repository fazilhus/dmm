extends Node

var _rand : RandomNumberGenerator

func _ready() -> void:
    _rand = RandomNumberGenerator.new()
    _rand.randomize()

func rand_dice(dice: Enum.Dice) -> int:
    match dice:
        Enum.Dice.D4:
            return _rand.randi_range(1, 4)
        Enum.Dice.D6:
            return _rand.randi_range(1, 6)
        Enum.Dice.D8:
            return _rand.randi_range(1, 8)
        Enum.Dice.D10:
            return _rand.randi_range(1, 10)
        Enum.Dice.D12:
            return _rand.randi_range(1, 12)
        Enum.Dice.D20:
            return _rand.randi_range(1, 20)
        Enum.Dice.D100:
            return _rand.randi_range(1, 100)
        _:
            Loggie.error("Unknown Enum.Dice: {}", dice)
            return -1
