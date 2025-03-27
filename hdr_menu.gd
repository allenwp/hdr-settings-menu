class_name  HDRMenu
extends Control


func _is_hdr_supported(screen: int) -> bool:
	return DisplayServer.has_feature(DisplayServer.FEATURE_HDR) \
		&& RenderingServer.get_rendering_device().has_feature(RenderingDevice.SUPPORTS_HDR_OUTPUT) \
		&& DisplayServer.screen_is_hdr_supported(screen)


func _ready() -> void:
	# Enable HDR render buffers for the current viewport, which allow for color values to exceed 1.0f.
	get_window().use_hdr_2d = true
	
	refresh_menu()


func refresh_menu() -> void:
	var screen := get_window().current_screen
	var hdr_supported := _is_hdr_supported(screen)
	%HDRCheckButton.disabled = !hdr_supported

	var window := get_window()

	if %HDRCheckButton.button_pressed != window.hdr_output_enabled:
		%HDRCheckButton.button_pressed = window.hdr_output_enabled
	%HDROptions.visible = window.hdr_output_enabled


func _on_hdr_check_button_toggled(toggled_on: bool) -> void:
	# Request HDR output to the display.
	get_window().hdr_output_enabled = toggled_on
