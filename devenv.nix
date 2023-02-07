{ pkgs, lib, ... }:

{
  # https://devenv.sh/basics/

  # https://devenv.sh/packages/
    packages = lib.optionals pkgs.stdenv.isDarwin (with pkgs.darwin.apple_sdk; [
      frameworks.Security
    ]) ++ [ pkgs.shellcheck ];

  # https://devenv.sh/scripts/

  enterShell = '''';

  # https://devenv.sh/languages/
  # languages.nix.enable = true;
  languages.rust = {
    enable = true;
    version = "stable";
  };

  # https://devenv.sh/pre-commit-hooks/
  pre-commit.hooks = {
    shellcheck = {
      enable = true;
      # List of tags describing types of files. See https://pre-commit.com/#filtering-files-with-types
      types = [ "file" "executable" "text" ]; 
      # '-x' permits shellcheck to source library scripts
      # '--severity info' prevents pre-commit from failing on style issues
      raw.args = ["-x" "--severity" "info"]; 
    };
    clippy.enable = true;
    rustfmt.enable = true;
  };

  # https://devenv.sh/processes/
  # processes.ping.exec = "ping example.com";
}
