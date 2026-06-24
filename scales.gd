extends Node2D

var left_f: float
var right_f: float

@onready var left_label = $Left/Mass
@onready var right_label = $Right/Mass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func round_to_dec(num, digit) -> float:
	return round(num * pow(10.0, digit)) / pow(10.0, digit)

func update_label(mass: float, label: Label) -> void:
	var curr_mass: float = float(label.text)
	curr_mass += mass
	curr_mass = round_to_dec(curr_mass, 3)
	label.text = str(curr_mass)

func left_body_entered(body: RigidBody2D) -> void:
	var mass = body.get_mass()
	update_label(mass, left_label)


func left_body_exited(body: RigidBody2D) -> void:
	var mass = -body.get_mass()
	update_label(mass, left_label)


func right_body_entered(body: RigidBody2D) -> void:
	var mass = body.get_mass()
	update_label(mass, right_label)


func right_body_excited(body: RigidBody2D) -> void:
	var mass = -body.get_mass()
	update_label(mass, right_label)
