extends HDRMenu


func refresh_menu() -> void:
	super()
	var window = get_window()
	if %CustomBrightness.button_pressed != !window.hdr_output_auto_adjust_reference_luminance:
		%CustomBrightness.button_pressed = !window.hdr_output_auto_adjust_reference_luminance
	%CustomBrightnessControls.visible = !window.hdr_output_auto_adjust_reference_luminance
	%CustomBrightnessSlider.value = window.hdr_output_reference_luminance
	%CustomBrightnessLabel.text = str(window.hdr_output_reference_luminance)
	
	if %CustomMaxLum.button_pressed != !window.hdr_output_auto_adjust_max_luminance:
		%CustomMaxLum.button_pressed = !window.hdr_output_auto_adjust_max_luminance
	%CustomMaxLumControls.visible = !window.hdr_output_auto_adjust_max_luminance
	%CustomMaxLumSlider.value = window.hdr_output_max_luminance
	%CustomMaxLumLabel.text = str(window.hdr_output_max_luminance)


func _on_custom_brightness_toggled(toggled_on: bool) -> void:
	get_window().hdr_output_auto_adjust_reference_luminance = !toggled_on


func _on_custom_max_lum_toggled(toggled_on: bool) -> void:
	get_window().hdr_output_auto_adjust_max_luminance = !toggled_on


func _on_custom_brightness_slider_value_changed(value: float) -> void:
	get_window().hdr_output_reference_luminance = value


func _on_custom_max_lum_slider_value_changed(value: float) -> void:
	get_window().hdr_output_max_luminance = value
