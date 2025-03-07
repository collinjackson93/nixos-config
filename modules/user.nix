{...}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.collin = {
    isNormalUser = true;
    description = "Collin Jackson";
    extraGroups = ["networkmanager" "wheel"];
  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "collin";
}
