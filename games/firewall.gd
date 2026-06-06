extends Window

func _on_visibility_changed() -> void:
	while visible and $TextureProgressBar.value < 99.9:
		await $Block.pressed
		for i in range(Upgrades.upgrades["Blocks"]):
			if i == 1: $Block2.show()
			elif i > 1 and not get_node_or_null("Block" + str(i + 1)):
				var new_block = $Block2.duplicate()
				new_block.name = "Block" + str(i + 1)
				add_child(new_block)
		for child in get_children():
			if child is Button: child.position = Vector2(randf_range(0.0, 240.0), randf_range(0.0, 240.0))
		$TextureProgressBar.value += randf_range(5.0, 10.0) * Upgrades.upgrades["FirewallSpeed"]
	$TextureProgressBar.value = 0
	get_parent().score += randi_range(90, 135) * Upgrades.upgrades["Firewall"]
	get_parent().update()
	_on_visibility_changed()

var brickTimer := 0.0
func _physics_process(delta: float) -> void:
	if visible:
		if "AutoBrick" in Upgrades.upgrades: brickTimer += delta
		$TextureProgressBar.value -= 0.05
		if brickTimer >= max(0.0, Upgrades.upgrades["AutoBrickDelay"]) and Upgrades.upgrades["AutoBrick"] == true:
			brickTimer = 0.0
			$Block.pressed.emit()
