{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-20.09";

  outputs = { self, nixpkgs }: rec {
    overlay = self: super: {
      foundry-vtt = super.callPackage ./foundry-vtt-headless.nix { };
    };
  };
}
