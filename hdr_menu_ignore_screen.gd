extends HDRMenu

const default_reference_lum = 200
const default_max_lum = 1000


func refresh_menu() -> void:
	super()
	var window = get_window()
	%BrightnessSlider.value = get_window().hdr_output_reference_luminance
	%BrightnessLabel.text = str(get_window().hdr_output_reference_luminance)
	%MaxLumSlider.value = window.hdr_output_max_luminance
	%MaxLumLabel.text = str(window.hdr_output_max_luminance)


func _on_brightness_slider_value_changed(value: float) -> void:
	get_window().hdr_output_reference_luminance = %BrightnessSlider.value


func _on_max_lum_slider_value_changed(value: float) -> void:
	get_window().hdr_output_max_luminance = value


func _on_reset_brightness_pressed() -> void:
	get_window().hdr_output_use_screen_luminance = false
	get_window().hdr_output_reference_luminance = default_reference_lum


func _on_reset_max_lum_pressed() -> void:
	get_window().hdr_output_use_screen_luminance = false
	get_window().hdr_output_max_luminance = default_max_lum
