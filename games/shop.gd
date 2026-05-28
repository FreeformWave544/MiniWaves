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

func _on_visibility_changed() -> void:
	update()

func _on_close_requested() -> void:
	hide()

func _on_firewall_pressed() -> void:
	$ColorRect/VBoxContainer/GridContainer/FirewallClick.show()
	$ColorRect/VBoxContainer/GridContainer/FirewallSpeed.show()
	$ColorRect/VBoxContainer/GridContainer/Firewall.hide()
	$"../Firewall".show()
