class_name Player extends CharacterBody2D

signal laser_shot(laser_scene, location)

@export var speed = 300

@onready var muzzle = $Muzzle

var laser_scene = preload("res://sceny/laser.tscn")

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()

func _physics_process(delta):

	var direction = Vector2(Input.get_axis("levo", "pravo"), 0)  
	
	
	velocity = direction * speed
	

	move_and_slide()

func shoot():
	laser_shot.emit(laser_scene, muzzle.global_position)
	
func die():
	queue_free()
