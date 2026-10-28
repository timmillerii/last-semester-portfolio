extends CanvasLayer

signal choice_selected(choice: int)

@onready var panel = $Panel
@onready var label = $Panel/Label
@onready var choice1 = $Panel/Choice1
@onready var choice2 = $Panel/Choice2

func _ready():
	panel.hide()

func show_dialogue(text):
	label.text = text
	choice1.hide()
	choice2.hide()
	panel.show()

func show_choices(text, option1, option2):
	label.text = text
	choice1.text = option1
	choice2.text = option2
	choice1.show()
	choice2.show()
	panel.show()

func hide_dialogue():
	panel.hide()

func _on_choice_1_pressed():
	choice_selected.emit(1)

func _on_choice_2_pressed():
	choice_selected.emit(2)
