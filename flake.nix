{
  description = "nvim configuration";
  inputs = {
    # https://notashelf.github.io/nvf/
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs =
    {
      nixpkgs,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      cfg = (import ./nvimconf.nix) nixpkgs.lib;
    in
    {
      packages.${system} = {
        # Set the default package to the wrapped instance of Neovim.
        # This will allow running your Neovim configuration with
        # `nix run` and in addition, sharing your configuration with
        # other users in case your repository is public.
        default =
          (inputs.nvf.lib.neovimConfiguration {
            inherit pkgs;
            modules = [
              {
                config = cfg;
              }
            ];
          }).neovim;
      };
    };
}
