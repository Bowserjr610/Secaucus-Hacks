extends CanvasLayer

const Char_Read_Rate = 0.5
@onready var tween = get_tree().create_tween()
@onready var textbox_container = $TextboxContainer
@onready var start_symbol = $TextboxContainer/MarginContainer/HBoxContainer/Start
@onready var end_symbol = $TextboxContainer/MarginContainer/HBoxContainer/End
@onready var label = $TextboxContainer/MarginContainer/HBoxContainer/Label




func _ready():
	_hide_textbox()
	add_text("this text something something")
	

func _hide_textbox():
	start_symbol.text =  ""
	end_symbol.text = ""
	label.text = ""
	textbox_container.hide()
	
func show_textbox():
	start_symbol.text = "*"
	textbox_container.show()

func add_text(next_text):
	label.text = next_text
	show_textbox()
	tween.interpolate_value(label, "percent_visible", 0.0, 1.0, len(next_text) * Char_Read_Rate, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
