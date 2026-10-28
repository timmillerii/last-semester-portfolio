
extends Node

# Player statistics
var stress: int = 20
var graduation_chance: int = 80
var career_chance: int = 80
var social_life: int = 50
var money: int = 500

# Relationships
var carl_relationship: int = 100
var brooke_relationship: int = 0
var brooke_phone_number: bool = false
var brooke_text_sent: bool = false

# Brooke storyline
var brooke_date_planned: bool = false
var brooke_temporarily_rejected: bool = false
var brooke_romance_closed: bool = false
var week3_party_completed: bool = false

# Important decisions/events
var heard_carl_job_offer: bool = false
var first_night_choice: String = ""
var first_night_completed: bool = false

# Computer Science graduation project
var cs_project_progress: int = 0
var cs_project_started: bool = false
var cs_project_passed: bool = false

# Semester progression
var current_week: int = 1
var current_day: int = 1
var semester_finished: bool = false

const TOTAL_WEEKS: int = 15

var day_names = [
	"Monday", "Tuesday", "Wednesday",
	"Thursday", "Friday", "Saturday", "Sunday"
]

# Campus navigation
var campus_spawn_location: String = "start"

# Week 4 astronomy lab
var week4_astronomy_completed: bool = false
var week4_worked_with_brooke: bool = false


# First night
func complete_first_night(choice: String):
	if first_night_completed:
		return

	if choice != "party" and choice != "study":
		return

	first_night_choice = choice
	first_night_completed = true

	if choice == "party":
		stress += 5
		social_life += 10
		money -= 20
		brooke_phone_number = true

	elif choice == "study":
		stress -= 5
		graduation_chance += 2
		career_chance += 2
		social_life -= 5


# Brooke's response to our first text
func complete_brooke_text(choice: int):
	if brooke_text_sent:
		return

	if not brooke_phone_number:
		return

	if choice == 1:
		brooke_relationship = 10
		brooke_date_planned = true
		brooke_temporarily_rejected = false

	elif choice == 2:
		brooke_relationship = 0
		brooke_date_planned = false
		brooke_temporarily_rejected = true

	else:
		return

	brooke_text_sent = true


# CS project
func work_on_cs_project(amount: int):
	if semester_finished:
		return

	cs_project_started = true
	cs_project_progress = clampi(cs_project_progress + amount, 0, 100)
	cs_project_passed = cs_project_progress >= 100

	print("CS Project Progress: ", cs_project_progress, "%")


func can_graduate() -> bool:
	return cs_project_passed


# Date display
func get_current_date() -> String:
	if semester_finished:
		return "Semester Complete"

	return "Week " + str(current_week) + " - " + day_names[current_day - 1]


# Advance one day for storylines
func advance_day():
	if semester_finished:
		return

	current_day += 1

	if current_day > 7:
		current_day = 1
		current_week += 1

	check_semester_end()
	print("Current date: ", get_current_date())


# Advance one week for normal activities
func advance_week():
	if semester_finished:
		return

	current_week += 1
	current_day = 1

	check_semester_end()
	print("Current date: ", get_current_date())


# Semester ending
func check_semester_end():
	if current_week > TOTAL_WEEKS:
		current_week = TOTAL_WEEKS
		current_day = 7
		semester_finished = true

		print("Semester finished!")

		if can_graduate():
			print("Ending: Graduated successfully!")
		else:
			print("Ending: Failed to graduate.")


# Current player objective
func get_objective() -> String:
	if semester_finished:
		return "Semester complete!"

	if not first_night_completed:
		return "Objective: Talk to Carl in your dorm."

	if not cs_project_started:
		return "Objective: Attend your CS class."

	if current_week == 2 and not brooke_text_sent:
		return "Objective: Reach out to Brooke."

	if current_week == 3 and not week3_party_completed:
		return "Objective: Attend the college party."

	if current_week == 4 and not week4_astronomy_completed:
		return "Objective: Head to astronomy class for your night lab."

	return "Objective: Explore campus or work on your CS project."

# Week 5 - Career Fair
var week5_career_completed: bool = false
var week5_attended_fair: bool = false
var week5_portfolio_improved: bool = false

var summit_recruiter_contact: bool = false
var summit_challenge_assigned: bool = false

# Week 6 - Technical Challenge
var week6_challenge_completed: bool = false
var week6_challenge_passed: bool = false

# Future career opportunities
var alternate_employer_unlocked: bool = false
var week9_interview_completed: bool = false
var week12_hiring_decision_completed: bool = false
