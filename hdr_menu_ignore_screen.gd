extends HDRMenu

var default_reference_lum
var default_max_lum

func _init() -> void:
	default_reference_lum = ProjectSettings.get_setting("display/window/hdr/reference_luminance")
	default_max_lum = ProjectSettings.get_setting("display/window/hdr/max_luminance")


func refresh_menu() -> void:
	super()
	var window = get_window()
	%BrightnessSlider.value = window.hdr_output_reference_luminance
	%BrightnessLabel.text = str(window.hdr_output_reference_luminance)
	%MaxLumSlider.value = window.hdr_output_max_luminance
	%MaxLumLabel.text = str(window.hdr_output_max_luminance)


func _on_brightness_slider_value_changed(value: float) -> void:
	get_window().hdr_output_reference_luminance = value


func _on_max_lum_slider_value_changed(value: float) -> void:
	get_window().hdr_output_max_luminance = value


func _on_reset_brightness_pressed() -> void:
	_on_interact()
	get_window().hdr_output_reference_luminance = default_reference_lum


func _on_reset_max_lum_pressed() -> void:
	_on_interact()
	get_window().hdr_output_max_luminance = default_max_lum


func _on_interact() -> void:
	get_window().hdr_output_use_screen_luminance = false
