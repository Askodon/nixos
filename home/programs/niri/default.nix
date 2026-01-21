{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.noctalia.homeModules.default
    inputs.niri.homeModules.niri
  ];

  home.packages = with pkgs; [
    tela-circle-icon-theme
    bibata-cursors
  ];

  programs = {
    noctalia-shell = {
      enable = true;
    };
    niri = {
      enable = true;
      settings = {
        prefer-no-csd = true;
        spawn-at-startup = [
          { command = [ "noctalia-shell" ]; }
        ];
        input = {
          keyboard = {
            repeat-rate = 35;
            repeat-delay = 200;
            xkb = {
              layout = "us,ru";
              variant = ",phonetic_YAZHERTY";
              options = "grp:win_space_toggle";
            };
            track-layout = "window";
          };
          touchpad = {
            enable = true;
            tap = true;
            natural-scroll = true;
          };
          focus-follows-mouse = {
            enable = true;
            max-scroll-amount = "0%";
          };
        };
        gestures = {
          hot-corners.enable = false;
        };
        overview = {
          backdrop-color = "#181825";
        };
        layout = {
          gaps = 5;
          center-focused-column = "never";
          preset-column-widths = [
            { proportion = 0.33333; }
            { proportion = 0.5; }
            { proportion = 0.66667; }
          ];
          focus-ring = {
            enable = true;
            width = 2;
            active.color = "#CBA6F7";
            inactive.color = "#313244";
          };
          tab-indicator = {
            enable = true;
            place-within-column = true;
          };
        };
        #cursor = {
        #  theme = "Bibata-Original-Classic";
        #  size = 20;
        #  hide-after-inactive-ms = 30000;
        #};
        hotkey-overlay = {
          skip-at-startup = true;
          hide-not-bound = true;
        };
        screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
        animations = {
          window-open = {
            kind.easing = {
              curve = "ease-out-expo";
              duration-ms = 450;
            };
          };
          window-close = {
            kind.easing = {
              curve = "ease-out-quad";
              duration-ms = 200;
            };
          };
          screenshot-ui-open = {
            kind.easing = {
              curve = "ease-out-expo";
              duration-ms = 1000;
            };
          };
          workspace-switch = {
            kind.spring = {
              damping-ratio = 0.85;
              stiffness = 250;
              epsilon = 0.0001;
            };
          };
          horizontal-view-movement = {
            kind.spring = {
              damping-ratio = 0.9;
              stiffness = 250;
              epsilon = 0.0001;
            };
          };
          window-movement = {
            kind.spring = {
              damping-ratio = 0.85;
              stiffness = 250;
              epsilon = 0.0001;
            };
          };
          window-resize = {
            kind.spring = {
              damping-ratio = 0.9;
              stiffness = 250;
              epsilon = 0.0001;
            };
          };
          overview-open-close = {
            kind.spring = {
              damping-ratio = 0.85;
              stiffness = 250;
              epsilon = 0.0001;
            };
          };
        };
        window-rules = [
          {
            open-maximized = true;
            geometry-corner-radius = {
              bottom-left = 15.0;
              bottom-right = 15.0;
              top-left = 15.0;
              top-right = 15.0;
            };
            clip-to-geometry = true;
          }
          {
            matches = [
              { app-id = "^org\\.keepassxc\\.KeePassXC$"; }
            ];
            block-out-from = "screen-capture";
          }
        ];
        binds =
          let
            act = config.lib.niri.actions;
          in
          {
            "Mod+Shift+Slash".action = act.show-hotkey-overlay;
            "Mod+T".action.spawn = "ghostty";
            "Mod+P".action.spawn = [
              "noctalia-shell"
              "ipc"
              "call"
              "launcher"
              "toggle"
            ];
            #"Mod+Alt+F".action.spawn = "nautilus";
            "Super+Alt+L".action.spawn = [
              "noctalia-shell"
              "ipc"
              "call"
              "lockScreen"
              "lock"
            ];
            "Super+C".action.spawn = [
              "noctalia-shell"
              "ipc"
              "call"
              "launcher"
              "clipboard"
            ];
            "Super+Alt+S" = {
              action.spawn = [
                "sh"
                "-c"
                "pkill orca || exec orca"
              ];
              allow-when-locked = true;
            };
            "XF86AudioRaiseVolume" = {
              action.spawn = [
                "noctalia-shell"
                "ipc"
                "call"
                "volume"
                "increase"
              ];
              allow-when-locked = true;
            };
            "XF86AudioLowerVolume" = {
              action.spawn = [
                "noctalia-shell"
                "ipc"
                "call"
                "volume"
                "decrease"
              ];
              allow-when-locked = true;
            };
            "XF86AudioMute" = {
              action.spawn = [
                "noctalia-shell"
                "ipc"
                "call"
                "volume"
                "muteOutput"
              ];
              allow-when-locked = true;
            };
            "XF86AudioMicMute" = {
              action.spawn = [
                "noctalia-shell"
                "ipc"
                "call"
                "volume"
                "muteInput"
              ];
              allow-when-locked = true;
            };
            "XF86MonBrightnessUp" = {
              action.spawn = [
                "noctalia-shell"
                "ipc"
                "call"
                "brightness"
                "increase"
              ];
              allow-when-locked = true;
            };
            "XF86MonBrightnessDown" = {
              action.spawn = [
                "noctalia-shell"
                "ipc"
                "call"
                "brightness"
                "decrease"
              ];
              allow-when-locked = true;
            };
            "Mod+O" = {
              action = act.toggle-overview;
              repeat = false;
            };
            "Mod+Q" = {
              action = act.close-window;
              repeat = false;
            };
            "Mod+Left".action = act.focus-column-left;
            "Mod+Down".action = act.focus-window-down;
            "Mod+Up".action = act.focus-window-up;
            "Mod+Right".action = act.focus-column-right;
            "Mod+H".action = act.focus-column-left;
            "Mod+J".action = act.focus-workspace-down;
            "Mod+K".action = config.lib.niri.actions.focus-workspace-up;
            "Mod+L".action = act.focus-column-right;
            "Mod+Ctrl+Left".action = act.move-column-left;
            "Mod+Ctrl+Down".action = act.move-window-down;
            "Mod+Ctrl+Up".action = act.move-window-up;
            "Mod+Ctrl+Right".action = act.move-column-right;
            "Mod+Ctrl+H".action = act.move-column-left;
            "Mod+Ctrl+U".action = act.move-window-down;
            "Mod+Ctrl+I".action = act.move-window-up;
            "Mod+Ctrl+L".action = config.lib.niri.actions.move-column-right;
            "Mod+Home".action = act.focus-column-first;
            "Mod+End".action = act.focus-column-last;
            "Mod+Ctrl+Home".action = act.move-column-to-first;
            "Mod+Ctrl+End".action = act.move-column-to-last;
            "Mod+Shift+Left".action = act.focus-monitor-left;
            "Mod+Shift+Down".action = act.focus-monitor-down;
            "Mod+Shift+Up".action = act.focus-monitor-up;
            "Mod+Shift+Right".action = act.focus-monitor-right;
            "Mod+Shift+H".action = act.focus-monitor-left;
            "Mod+Shift+U".action = act.focus-monitor-down;
            "Mod+Shift+I".action = act.focus-monitor-up;
            "Mod+Shift+L".action = act.focus-monitor-right;
            "Mod+Shift+Ctrl+Left".action = act.move-column-to-monitor-left;
            "Mod+Shift+Ctrl+Down".action = act.move-column-to-monitor-down;
            "Mod+Shift+Ctrl+Up".action = act.move-column-to-monitor-up;
            "Mod+Shift+Ctrl+Right".action = act.move-column-to-monitor-right;
            "Mod+Shift+Ctrl+H".action = act.move-column-to-monitor-left;
            "Mod+Shift+Ctrl+J".action = act.move-column-to-monitor-down;
            "Mod+Shift+Ctrl+K".action = act.move-column-to-monitor-up;
            "Mod+Shift+Ctrl+L".action = act.move-column-to-monitor-right;
            "Mod+Page_Down".action = act.focus-workspace-down;
            "Mod+Page_Up".action = act.focus-workspace-up;
            "Mod+U".action = act.focus-window-down;
            "Mod+I".action = act.focus-window-up;
            "Mod+Ctrl+Page_Down".action = act.move-column-to-workspace-down;
            "Mod+Ctrl+Page_Up".action = act.move-column-to-workspace-up;
            "Mod+Ctrl+J".action = act.move-column-to-workspace-down;
            "Mod+Ctrl+K".action = act.move-column-to-workspace-up;
            "Mod+Shift+Page_Down".action = act.move-workspace-down;
            "Mod+Shift+Page_Up".action = act.move-workspace-up;
            "Mod+Shift+J".action = act.move-workspace-down;
            "Mod+Shift+K".action = act.move-workspace-up;
            "Mod+WheelScrollDown" = {
              action = act.focus-workspace-down;
              cooldown-ms = 150;
            };
            "Mod+WheelScrollUp" = {
              action = act.focus-workspace-up;
              cooldown-ms = 150;
            };
            "Mod+Ctrl+WheelScrollDown" = {
              action = act.move-column-to-workspace-down;
              cooldown-ms = 150;
            };
            "Mod+Ctrl+WheelScrollUp" = {
              action = act.move-column-to-workspace-up;
              cooldown-ms = 150;
            };
            "Mod+WheelScrollRight".action = act.focus-column-right;
            "Mod+WheelScrollLeft".action = act.focus-column-left;
            "Mod+Ctrl+WheelScrollRight".action = act.move-column-right;
            "Mod+Ctrl+WheelScrollLeft".action = act.move-column-left;
            "Mod+Shift+WheelScrollDown".action = act.focus-column-right;
            "Mod+Shift+WheelScrollUp".action = act.focus-column-left;
            "Mod+Ctrl+Shift+WheelScrollDown".action = act.move-column-right;
            "Mod+Ctrl+Shift+WheelScrollUp".action = act.move-column-left;
            "Mod+1".action.focus-workspace = 1;
            "Mod+2".action.focus-workspace = 2;
            "Mod+3".action.focus-workspace = 3;
            "Mod+4".action.focus-workspace = 4;
            "Mod+5".action.focus-workspace = 5;
            "Mod+6".action.focus-workspace = 6;
            "Mod+7".action.focus-workspace = 7;
            "Mod+8".action.focus-workspace = 8;
            "Mod+9".action.focus-workspace = 9;
            "Mod+Ctrl+1".action.move-column-to-workspace = 1;
            "Mod+Ctrl+2".action.move-column-to-workspace = 2;
            "Mod+Ctrl+3".action.move-column-to-workspace = 3;
            "Mod+Ctrl+4".action.move-column-to-workspace = 4;
            "Mod+Ctrl+5".action.move-column-to-workspace = 5;
            "Mod+Ctrl+6".action.move-column-to-workspace = 6;
            "Mod+Ctrl+7".action.move-column-to-workspace = 7;
            "Mod+Ctrl+8".action.move-column-to-workspace = 8;
            "Mod+Ctrl+9".action.move-column-to-workspace = 9;
            "Mod+BracketLeft".action = act.consume-window-into-column;
            "Mod+BracketRight".action = act.expel-window-from-column;
            "Mod+Comma".action = act.consume-or-expel-window-left;
            "Mod+Period".action = act.consume-or-expel-window-right;
            "Mod+R".action = act.switch-preset-column-width;
            "Mod+Shift+R".action = act.switch-preset-window-height;
            "Mod+Ctrl+R".action = act.reset-window-height;
            "Mod+F".action = act.maximize-column;
            "Mod+Shift+F".action = act.fullscreen-window;
            "Mod+Ctrl+F".action = act.expand-column-to-available-width;
            "Mod+C".action = act.center-column;
            "Mod+Ctrl+C".action = act.center-visible-columns;
            "Mod+Minus".action.set-column-width = "-10%";
            "Mod+Equal".action.set-column-width = "+10%";
            "Mod+Shift+Minus".action.set-window-height = "-10%";
            "Mod+Shift+Equal".action.set-window-height = "+10%";
            "Mod+V".action = act.toggle-window-floating;
            "Mod+Shift+V".action = act.switch-focus-between-floating-and-tiling;
            "Mod+W".action = act.toggle-column-tabbed-display;
            "Print".action.spawn = [
              "sh"
              "-c"
              ''grim -g \"$(slurp)\" - | swappy -f -''
            ];
            "Ctrl+Print".action.spawn = [
              "sh"
              "-c"
              "grim - | swappy -f -"
            ];
            "Alt+Print".action.screenshot-window.write-to-disk = true;
            "Mod+Escape" = {
              action = act.toggle-keyboard-shortcuts-inhibit;
              allow-inhibiting = false;
            };
            "Mod+Shift+E".action = act.quit;
            "Ctrl+Alt+Delete".action = act.quit;
            "Mod+Shift+P".action = act.power-off-monitors;
          };
      };
    };
  };
}
