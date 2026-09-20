hl.monitor({
	output = "HDMI-A-1",
	mode = "1920x1080@180.00",
	scale = "1.0",
	position = "0x0"
})


hl.monitor({
	output = "eDP-1",
	mode = "1920x1080@60.00",
	scale = "1.0",
	position = "1920x0"
})
-- fallback
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})
