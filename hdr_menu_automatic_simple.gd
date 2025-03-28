extends HDRMenu

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
	get_window().hdr_output_use_screen_luminance = true # FIXME: Needs separate settings


func _on_reset_max_lum_pressed() -> void:
	get_window().hdr_output_use_screen_luminance = true # FIXME: Needs separate settings


func _on_brightness_slider_drag_started() -> void:
	get_window().hdr_output_use_screen_luminance = false # FIXME: Needs separate settings


func _on_max_lum_slider_drag_started() -> void:
	get_window().hdr_output_use_screen_luminance = false # FIXME: Needs separate settings
