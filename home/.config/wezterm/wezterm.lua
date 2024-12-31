local wezterm = require("wezterm")
local act = wezterm.action

local keybinds = {
		{
			key = "j",
			mods = "CTRL|SHIFT",
			action = act.ScrollByPage(1),
		},
		{
			key = "k",
			mods = "CTRL|SHIFT",
			action = act.ScrollByPage(-1),
		},
		{
			key = "g",
			mods = "CTRL|SHIFT",
			action = act.ScrollToTop,
		},
		{
			key = "e",
			mods = "CTRL|SHIFT",
			action = act.ScrollToBottom,
		},
		{
			key = "p",
			mods = "CTRL|SHIFT|SUPER",
			action = act.PaneSelect,
		},
		{
			key = "o",
			mods = "CTRL|SHIFT|SUPER",
			action = act.PaneSelect({ mode = "SwapWithActive" }),
		},
		{
			key = "%",
			mods = "CTRL|SHIFT|SUPER",
			action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = '"',
			mods = "CTRL|SHIFT|SUPER",
			action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "LeftArrow",
			mods = "CTRL|SHIFT|SUPER",
			action = act.AdjustPaneSize({ "Left", 1 }),
		},
		{
			key = "RightArrow",
			mods = "CTRL|SHIFT|SUPER",
			action = act.AdjustPaneSize({ "Right", 1 }),
		},
		{
			key = "UpArrow",
			mods = "CTRL|SHIFT|SUPER",
			action = act.AdjustPaneSize({ "Up", 1 }),
		},
		{
			key = "DownArrow",
			mods = "CTRL|SHIFT|SUPER",
			action = act.AdjustPaneSize({ "Down", 1 }),
		},
		{
			key = "h",
			mods = "CTRL|SHIFT|SUPER",
			action = act.ActivatePaneDirection("Left"),
		},
		{
			key = "l",
			mods = "CTRL|SHIFT|SUPER",
			action = act.ActivatePaneDirection("Right"),
		},
		{
			key = "k",
			mods = "CTRL|SHIFT|SUPER",
			action = act.ActivatePaneDirection("Up"),
		},
		{
			key = "j",
			mods = "CTRL|SHIFT|SUPER",
			action = act.ActivatePaneDirection("Down"),
		},
		{
			key = "z",
			mods = "CTRL|SHIFT|SUPER",
			action = act.TogglePaneZoomState,
		},
		{
			key = "q",
			mods = "CTRL|SHIFT|SUPER",
			action = act.CloseCurrentPane({ confirm = false }),
		},
		{
			key = "b",
			mods = "CTRL|SHIFT|SUPER",
			action = act.RotatePanes("CounterClockwise"),
		},
		{
			key = "n",
			mods = "CTRL|SHIFT|SUPER",
			action = act.RotatePanes("Clockwise"),
		},
		{
			key = "d",
			mods = "CTRL|SHIFT",
			action = act.ShowLauncher,
		},
		{
			key = ":",
			mods = "CTRL|SHIFT",
			action = act.ClearSelection,
		},
		{
			key = "t",
			mods = "CTRL|SHIFT",
			action = act.SpawnTab "DefaultDomain",
		},
		{
			key = "w",
			mods = "CTRL|SHIFT",
			action = act.CloseCurrentTab { confirm = false },
		},
		{
			key = "{",
			mods = "CTRL|SHIFT",
			action = act.ActivateTabRelative(-1)
		},
  	{
  		key = "}",
  		mods = "CTRL|SHIFT",
  		action = act.ActivateTabRelative(1)
  	},
  	{
			key = "{",
			mods = "SHIFT|ALT",
			action = act.MoveTabRelative(-1)
		},
  	{
  		key = "}",
  		mods = "SHIFT|ALT",
  		action = act.MoveTabRelative(1)
  	},
  	{
    	key = 'R',
    	mods = 'CTRL|SHIFT',
    	action = act.PromptInputLine {
	      description = wezterm.format {
        { Attribute = { Intensity = 'Bold' } },
        { Foreground = { AnsiColor = 'Fuchsia' } },
        { Text = 'Enter name for tab' },
	      },
      	initial_value = '',
      	action = wezterm.action_callback(function(window, _, line)
        	-- line will be `nil` if they hit escape without entering anything
        	-- An empty string if they just hit enter
        	-- Or the actual line of text they wrote
        	if line then
          	window:active_tab():set_title(line)
        	end
      	end),
    	},
  	},
	}

return {
	check_for_updates = false,
	enable_wayland = true,
	prefer_egl = true,
	font_size = 11.0,
	window_decorations = "NONE",
	window_close_confirmation = "NeverPrompt",
	exit_behavior_messaging = "None",
	front_end = "WebGpu",
	color_scheme = "Catppuccin Macchiato",
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	tab_bar_at_bottom = true,
	show_close_tab_button_in_tabs = false,
	show_new_tab_button_in_tab_bar = false,
	adjust_window_size_when_changing_font_size = false,
	window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
	use_fancy_tab_bar = false,
	enable_scroll_bar = false,
	inactive_pane_hsb = {
		saturation = 0.9,
		brightness = 0.7,
	},
	background = {
		{
			source = {
				Color = "#24273a",
			},
			height = "100%",
			width = "100%",
		},
		{
			source = {
				File = "/home/redsquirrel/.config/wezterm/phantom.png",
			},
			opacity = 0.02,
			vertical_align = "Middle",
			horizontal_align = "Center",
			height = "1920",
			width = "1440",
			repeat_y = "NoRepeat",
			repeat_x = "NoRepeat",
		},
	},
	launch_menu = {
		{
			args = { "btop" },
		},
		{
			args = { "cmatrix" },
		},
		{
			args = { "pipes-rs" },
		},
	},
	keys = keybinds,
}
