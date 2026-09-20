hl.config({
    input = {
        kb_layout  = "us,cz",
        kb_variant = ",qwerty",
        kb_model   = "",
        kb_options = "grp:alt_shift_toggle,caps:escape,lv3:ralt_switch",
        kb_rules   = "",
        follow_mouse = 1,
	accel_profile = "flat",

	repeat_rate = 35,
	repeat_delay = 200,
        sensitivity = 0,

        touchpad = {
            natural_scroll = true,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

