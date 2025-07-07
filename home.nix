{
    config,
    pkgs,
    lib,
    inputs,
    ...
}: {
    # Home Manager needs a bit of information about you and the paths it should
    # manage.
    nixpkgs.config.allowUnfree = true;
    home.username = "jonathankjorlaug";
    home.homeDirectory = "/home/jonathankjorlaug";

    home.stateVersion = "25.05"; # Please read the comment before changing.

    home.packages = with pkgs; [
        nixd
        alejandra
        hyprls
        dwt1-shell-color-scripts
        nix-search-cli
        slack
    ];
    # ++ lib.filter lib.isDerivation (builtins.attrValues pkgs.astal);

    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    home.sessionVariables = {
    };

    programs.bun.enable = true;

    programs.nh = {
        enable = true;
        clean.enable = true;
        flake = /home/jonathankjorlaug/hmconf/flake.nix;
    };
    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

    imports = [inputs.ags.homeManagerModules.default];

    programs.ags = {
        enable = true;

        extraPackages = with pkgs; [
            fzf

            gtk4
            libadwaita
            gjs
            gobject-introspection
            dart-sass
            adwaita-icon-theme

            inputs.astal.packages.${pkgs.system}.astal3
            inputs.astal.packages.${pkgs.system}.astal4
            inputs.astal.packages.${pkgs.system}.battery
            inputs.astal.packages.${pkgs.system}.bluetooth
            inputs.astal.packages.${pkgs.system}.io
            # inputs.astal.packages.${pkgs.system}.gjs
            inputs.astal.packages.${pkgs.system}.tray
            inputs.astal.packages.${pkgs.system}.mpris
            # inputs.astal.packages.${pkgs.system}.source
            inputs.astal.packages.${pkgs.system}.notifd
            inputs.astal.packages.${pkgs.system}.wireplumber
            inputs.astal.packages.${pkgs.system}.powerprofiles
            inputs.astal.packages.${pkgs.system}.network
            inputs.astal.packages.${pkgs.system}.hyprland
            inputs.astal.packages.${pkgs.system}.apps
        ];
    };
}
