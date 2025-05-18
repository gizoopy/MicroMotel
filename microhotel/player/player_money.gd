class_name PlayerMoney
extends Resource

var current_money = 6969	

func money_string() -> String:
	return insert_commas(current_money)

var money_info: int:
	get:
		return current_money
	set(value):
		current_money = value

func money_add(amount: int):
	current_money += amount

func money_remove(amount: int):
	current_money -= amount


func insert_commas(amount: int) -> String:
	var num_str := str(amount)
	var result := ""
	var count := 0

	for i in range(num_str.length() - 1, -1, -1):
		result = num_str[i] + result
		count += 1
		if count % 3 == 0 and i != 0:
			result = "," + result

	return result
