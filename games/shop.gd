extends Window

func _on_per_click_pressed() -> void:
	update()
	var price = int($ColorRect/VBoxContainer/GridContainer/PerClick/Price.text.lstrip("(").rstrip(" SCORE)"))
	if get_parent().score < price: return
	get_parent().score -= price
	price = price * (1.01) ** Upgrades.upgrades["Click"]
	$ColorRect/VBoxContainer/GridContainer/PerClick/Price.text = "(%.2f SCORE)" % price
	Upgrades.upgrades["Click"] += 1.0
	update()

func _on_firewall_click_pressed() -> void:
	update()
	var price = int($ColorRect/VBoxContainer/GridContainer/FirewallClick/Price.text.lstrip("(").rstrip(" SCORE)"))
	if get_parent().score < price: return
	get_parent().score -= price
	price = price * (1.05) ** Upgrades.upgrades["Firewall"]
	$ColorRect/VBoxContainer/GridContainer/FirewallClick/Price.text = "(%.2f SCORE)" % price
	Upgrades.upgrades["Firewall"] += 0.1
	update()

func _on_firewall_speed_pressed() -> void:
	update()
	var price = int($ColorRect/VBoxContainer/GridContainer/FirewallSpeed/Price.text.lstrip("(").rstrip(" SCORE)"))
	if get_parent().score < price: return
	get_parent().score -= price
	price = price * (1.05) ** Upgrades.upgrades["FirewallSpeed"]
	$ColorRect/VBoxContainer/GridContainer/FirewallSpeed/Price.text = "(%.2f SCORE)" % price
	Upgrades.upgrades["FirewallSpeed"] += 0.1
	update()

func update() -> void:
	get_parent().update()
	$ColorRect/VBoxContainer/GridContainer/PerClick/PerClick.text = "%.1f" % Upgrades.upgrades["Click"]
	$ColorRect/VBoxContainer/GridContainer/FirewallClick/FirewallClick.text = "%.1fx" % Upgrades.upgrades["Firewall"]
	$ColorRect/VBoxContainer/GridContainer/FirewallSpeed/FirewallSpeed.text = "%.1fx" % Upgrades.upgrades["FirewallSpeed"]
	$ColorRect/VBoxContainer/GridContainer/AutoBrickDelay/AutoBrickDelay.text = "%.1fs" % Upgrades.upgrades["AutoBrickDelay"]

func _on_visibility_changed() -> void: update()

func _on_close_requested() -> void: hide()

func _on_firewall_pressed() -> void:
	var price = int($ColorRect/VBoxContainer/GridContainer/Firewall/Price.text.lstrip("(").rstrip(" SCORE)"))
	if get_parent().score < price: return
	get_parent().score -= price
	$ColorRect/VBoxContainer/GridContainer/FirewallClick.show()
	$ColorRect/VBoxContainer/GridContainer/FirewallSpeed.show()
	$ColorRect/VBoxContainer/GridContainer/AutoBrick.show()
	$ColorRect/VBoxContainer/GridContainer/Firewall.hide()
	$"../Firewall".show()
	update()

func _on_auto_brick_pressed() -> void:
	var price = int($ColorRect/VBoxContainer/GridContainer/AutoBrick/Price.text.lstrip("(").rstrip(" SCORE)"))
	if get_parent().score < price: return
	get_parent().score -= price
	Upgrades.upgrades["AutoBrick"] = true
	$ColorRect/VBoxContainer/GridContainer/AutoBrick.hide()
	$ColorRect/VBoxContainer/GridContainer/AutoBrickDelay.show()
	update()

func _on_auto_brick_delay_pressed() -> void:
	var price = int($ColorRect/VBoxContainer/GridContainer/AutoBrickDelay/Price.text.lstrip("(").rstrip(" SCORE)"))
	if get_parent().score < price: return
	get_parent().score -= price
	Upgrades.upgrades["AutoBrickDelay"] -= 0.1
	update()
	if Upgrades.upgrades["AutoBrickDelay"] <= 0.2: $ColorRect/VBoxContainer/GridContainer/AutoBrickDelay.hide()
