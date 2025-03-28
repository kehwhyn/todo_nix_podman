let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.05";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShellNoCC {
  packages = with pkgs; [
    nodejs_22
    nodePackages.serve
    python311
    python311Packages.fastapi
    python311Packages.uvicorn
    python311Packages.pydantic
    python311Packages.sqlalchemy
    python311Packages.python-multipart
    postgresql
  ];

  shellHook = ''
    echo "Welcome to the SolidJS + FastAPI dev environment!"
    echo "Node: $(node -v)"
    echo "Python: $(python --version)"
  '';
}
