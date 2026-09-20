hl.config({
    general = {
        gaps_in  = 4,
        gaps_out = 8,

        border_size = 2,

	resize_on_border = false,
	allow_tearing = true,
	layout = "dwindle"
    },
    decoration = {
        rounding       = 0,
        rounding_power = 2,

        active_opacity   = 0.95,
        inactive_opacity = 0.9,

        shadow = {
            enabled      = true,
            range        = 2,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },

})
