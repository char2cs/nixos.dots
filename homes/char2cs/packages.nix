{ pkgs, inputs, ... }:
{
  home = {
    packages = with pkgs; with nodePackages_latest; with gnome; with libsForQt5; [
      sway

      # gui
      blueberry
      (mpv.override { scripts = [ mpvScripts.mpris ]; })
      d-spy
      dolphin
      figma-linux
      kolourpaint
      gnome.nautilus
      icon-library
      dconf-editor
      qt5.qtimageformats
      vlc
      yad

      # tools
      bat
      eza
      fd
      ripgrep
      fzf
      socat
      jq
      gojq
      acpi
      ffmpeg
      libnotify
      killall
      zip
      unzip
      glib
      foot
      starship
      showmethekey
      vscode
      ydotool
	  spotify
	  obs-studio
	  openssl
	  openvpn
	  fish
	  spotify-tui
	  discord
	  jetbrains.idea-ultimate

      # theming tools
      gradience

      # hyprland
      brightnessctl
      cliphist
      fuzzel
      grim
      hyprpicker
      tesseract
      imagemagick
      pavucontrol
      playerctl
      swappy
      swaylock-effects
      swayidle
      slurp
      swww
      wayshot
      wlsunset
      wl-clipboard
      wf-recorder

      # langs
      nodejs
      gjs
      bun
      cargo
      go
      gcc
      typescript
      eslint

      # Cybersecurity
      nmap
      arp-scan
    ];
  };
}
