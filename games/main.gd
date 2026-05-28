extends Control

var score := 0.0
@onready var oldTime = Time.get_ticks_msec()
func _on_clicker_pressed() -> void:
	if (Time.get_ticks_msec() - oldTime) < 80: print("X") ; return
	print("Y")
	oldTime = Time.get_ticks_msec()
	update()
	score += Upgrades.upgrades["Click"]
	update()

func update() -> void:
	$Score.text = "SCORE:\n%.2f" % score

func _on_shop_pressed() -> void:
	$ShopWindow.show()
