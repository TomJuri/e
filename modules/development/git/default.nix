{ pkgs, config, lib, ... }: 
{
  options = {
    git.enable = lib.mkEnableOption "Enables git";
  };

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      userName = "TomJuri";
      userEmail = "mail@tomjuri.de";
      signing = {
        key = "323DE11EA057A78F";
        signByDefault = true;
      };
    };
  };
}
