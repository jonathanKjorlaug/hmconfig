{
    config,
    pkgs,
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
    ];

    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    home.sessionVariables = {
    };

    programs.nh = {
        enable = true;
        clean.enable = true;
        flake = "~/hmconf";
    };

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
}
