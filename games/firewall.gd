extends Window

func _on_visibility_changed() -> void:
	while visible and $TextureProgressBar.value < 99.9:
		await $Block.pressed
		$Block.position = Vector2(randf_range(0.0, 240.0), randf_range(0.0, 240.0))
		$TextureProgressBar.value += randf_range(5.0, 10.0) * Upgrades.upgrades["FirewallSpeed"]
	$TextureProgressBar.value = 0
	get_parent().score += randi_range(10, 35) * Upgrades.upgrades["Firewall"]
	get_parent().update()
	_on_visibility_changed()

func _physics_process(_delta: float) -> void:
	if visible: $TextureProgressBar.value -= 0.05
