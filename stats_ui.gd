
extends CanvasLayer

@onready var stress_label = $StatsPanel/StressLabel
@onready var graduation_label = $StatsPanel/GraduationLabel
@onready var career_label = $StatsPanel/CareerLabel
@onready var social_label = $StatsPanel/SocialLabel
@onready var money_label = $StatsPanel/MoneyLabel
@onready var date_label = $StatsPanel/DateLabel
@onready var cs_project_label = $StatsPanel/CSProjectLabel
@onready var brooke_label = $StatsPanel/BrookeLabel

func _process(_delta):
	stress_label.text = "Stress: " + str(GameState.stress)
	graduation_label.text = "Graduation: " + str(GameState.graduation_chance) + "%"
	career_label.text = "Career: " + str(GameState.career_chance) + "%"
	social_label.text = "Social Life: " + str(GameState.social_life)
	money_label.text = "Money: $" + str(GameState.money)
	date_label.text = GameState.get_current_date()
	cs_project_label.text = "CS Project: " + str(GameState.cs_project_progress) + "%"

	if GameState.brooke_text_sent:
		brooke_label.show()
		brooke_label.text = "Brooke Relationship: " + str(GameState.brooke_relationship) + "%"
	else:
		brooke_label.hide()
