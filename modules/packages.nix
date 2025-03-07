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
    globalprotect-openconnect
    todoist-electron
    dnsutils # for nslookup
    vscode
  ];

  programs.firefox.enable = true;
}
