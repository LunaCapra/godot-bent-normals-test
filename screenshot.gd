@tool
extends Node

@export_tool_button("Take screenshot")
var screenshot = take_screenshot

func take_screenshot():
	await RenderingServer.frame_post_draw
	var dir = DirAccess.open("res://screenshots/")
	if dir:
		var viewport = EditorInterface.get_editor_viewport_3d(0).get_viewport()
		var texture = viewport.get_texture()
		texture.get_image().save_png("res://screenshots/screenshot_" + str(dir.get_files().size()) + ".png")
		EditorInterface.get_resource_filesystem().scan()
