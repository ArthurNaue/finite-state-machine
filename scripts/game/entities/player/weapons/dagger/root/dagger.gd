extends Node2D
class_name Dagger

@export var weaponCooldown: float
@export var attackEffect: PackedScene
@onready var weaponsNode = get_parent()
@onready var player = get_parent().get_parent()
@onready var anim = $anim

func _ready():
	player.weaponCooldown = weaponCooldown
	anim.play("idle")

func _process(delta:float):
	if Input.is_action_pressed("mouse_left"):
		if player.weaponCooldown <= 0:
			player.weaponCooldown = weaponCooldown
			anim.play("attack")
			weaponsNode.attacking = true
			SpawnEffect(attackEffect)

func _on_anim_animation_finished(attack):
	anim.play("idle")
	weaponsNode.attacking = false

func SpawnEffect(effectScene: PackedScene):
	var effect = effectScene.instantiate() as AnimatedSprite2D
	get_parent().add_child(effect)
	effect.global_position = player.global_position
