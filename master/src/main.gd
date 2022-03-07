extends Node2D

onready var currentHams = $main/currentHams;

func _ready():
	updateHams();

func updateHams():
	currentHams.text = "Hams: " + str(Global.points);

func _on_smoker_pressed():
	Global.points += 1;
	updateHams();


func _on_shopButton_toggled(button_pressed):
	$main/shopScreen.visible = button_pressed;


func _on_clickTimer_timeout():
	Global.points += Global.auto_clickers;
	updateHams();


func _on_autoSmoker_pressed():
	if Global.points >= Global.auto_clicker_price:
		Global.points -= Global.auto_clicker_price;
		Global.auto_clicker_price += 10;
		Global.auto_clickers += 1;
		updateHams();
		$"main/shopScreen/Page 1/itemList/autoSmoker".text = "Buy Auto Smoker for " + str(Global.auto_clicker_price) + " hams";
