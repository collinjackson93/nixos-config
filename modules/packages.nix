{pkgs, ...}: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    obsidian
    openssh
    nixd
    synology-drive-client
    vim
    todoist-electron
    dnsutils # for nslookup
    vscode
    gp-saml-gui
    chromium
    eddie
  ];

  programs.firefox.enable = true;
}
