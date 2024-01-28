extends Node2D
class_name Game

@export var level: int
@export var weaponPickupScene: PackedScene

func _ready():
	spawnEntitie(Enemies.eye, Vector2(140, 150))
	spawnEntitie(Enemies.eye, Vector2(140, 150))
	spawnEntitie(Enemies.eye, Vector2(140, 150))
	spawnEntitie(Enemies.shadowcat, Vector2(140, 150))
	spawnWeaponPickup(Weapons.dagger, Weapons.daggerImg, Vector2(50, 250))
	spawnWeaponPickup(Weapons.pistol, Weapons.pistolImg, Vector2(150, 250))
	spawnWeaponPickup(Weapons.bomb, Weapons.bombImg, Vector2(250, 250))

func _process(delta: float):
	#verifica se o player clicou ESQ
	if Input.is_action_just_pressed("esq"):
		#fecha o jogo
		get_tree().quit()

func spawnEntitie(entitieScene: PackedScene, entitiePosition: Vector2):
	var entitie = entitieScene.instantiate() as CharacterBody2D
	entitie.global_position = entitiePosition
	add_child(entitie)

func spawnWeaponPickup(choosenWeaponPickupScene, image: Texture, position: Vector2):
	var weaponPickup = weaponPickupScene.instantiate() as StaticBody2D
	weaponPickup.weaponScene = choosenWeaponPickupScene
	weaponPickup.image = image
	weaponPickup.global_position = position
	add_child(weaponPickup)
