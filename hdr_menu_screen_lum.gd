extends HDRMenu

func refresh_menu() -> void:
	super()
	var window = get_window()
	if %UseScreenLuminance.button_pressed != window.hdr_output_use_screen_luminance:
		%UseScreenLuminance.button_pressed = window.hdr_output_use_screen_luminance
	%CustomLuminance.visible = !window.hdr_output_use_screen_luminance
	%BrightnessSlider.value = window.hdr_output_reference_luminance
	%BrightnessLabel.text = str(window.hdr_output_reference_luminance)
	%MaxLumSlider.value = window.hdr_output_max_luminance
	%MaxLumLabel.text = str(window.hdr_output_max_luminance)


func _on_brightness_slider_value_changed(value: float) -> void:
	get_window().hdr_output_reference_luminance = value


func _on_max_lum_slider_value_changed(value: float) -> void:
	get_window().hdr_output_max_luminance = value


func _on_use_screen_luminance_toggled(toggled_on: bool) -> void:
	get_window().hdr_output_use_screen_luminance = toggled_on
