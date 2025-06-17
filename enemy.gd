extends CharacterBody3D
@onready var navigation_agent_3d: NavigationAgent3D= $NavigationAgent3D
# Minimum speed of the mob in meters per second.
@export var min_speed = 10
# Maximum speed of the mob in meters per second.
@export var max_speed = 18
@export var target: Node3D

func _ready() -> void:
	if not target: _set_target()
	
func _set_target():
	target = get_tree().get_first_node_in_group("player")

func _physics_process(_delta):
	var nextPathPosition = navigation_agent_3d.get_next_path_position()
	
	var direction = global_position.direction_to(nextPathPosition)
	var calculateVelocity = direction * min_speed
	velocity = Vector3(calculateVelocity.x, velocity.y, calculateVelocity.z)
	
	look_at(target.global_position)
	
	move_and_slide()
	
	_update_target_position()
	
func _update_target_position():
	navigation_agent_3d.set_target_position(target.global_position)



func _on_navigation_agent_3d_target_reached() -> void:
	pass # Replace with function body.
