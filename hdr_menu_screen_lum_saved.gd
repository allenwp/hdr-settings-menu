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
	if toggled_on:
		_save_project_settings()
	
	get_window().hdr_output_use_screen_luminance = toggled_on
	
	if !toggled_on:
		_load_project_settings()


func _save_project_settings() -> void:
	var window = get_window()
	ProjectSettings.set_setting("display/window/hdr/reference_luminance", window.hdr_output_reference_luminance)
	ProjectSettings.set_setting("display/window/hdr/max_luminance", window.hdr_output_max_luminance)


func _load_project_settings() -> void:
	var window = get_window()
	window.hdr_output_reference_luminance = ProjectSettings.get_setting("display/window/hdr/reference_luminance")
	window.hdr_output_max_luminance = ProjectSettings.get_setting("display/window/hdr/max_luminance")


func _on_reset_brightness_pressed() -> void:
	var window = get_window()
	window.hdr_output_reference_luminance = DisplayServer.screen_get_sdr_white_level(window.current_screen)


func _on_reset_max_lum_pressed() -> void:
	var window = get_window()
	window.hdr_output_max_luminance = DisplayServer.screen_get_max_luminance(window.current_screen)
