extends HSlider

# Access the audio bus within the inspector
@export var bus_name: String

var bus_index: int

# When the game starts
func _ready():
	# Find the index number for the bus name
	bus_index = AudioServer.get_bus_index(bus_name)
	# Whatever the volume is, change it to that volume
	value_changed.connect(_on_value_changed)
	# Get the current volume of the music from the audio bus
	value = db_to_linear(AudioServer.get_bus_volume_db(bus_index))
	
# After changing the volume
func _on_value_changed(value: float):
	# Change the volume
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
