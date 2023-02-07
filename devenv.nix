{ pkgs, lib, ... }:

{
  # https://devenv.sh/basics/

  # https://devenv.sh/packages/
    packages = lib.optionals pkgs.stdenv.isDarwin (with pkgs.darwin.apple_sdk; [
      frameworks.Security
    ]);

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
    shellcheck.enable = true;
    clippy.enable = true;
    rustfmt.enable = true;
  };

  # https://devenv.sh/processes/
  # processes.ping.exec = "ping example.com";
}
