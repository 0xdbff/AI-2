{ pkgs ? import <nixpkgs> {} }:
(pkgs.buildFHSUserEnv {
  name = "cuda";
  targetPkgs = pkgs: with pkgs; [
    python311Full
    python311Packages.pip
    openssl
    poetry
    glib
    glibc
    libcxx
    gcc11
    git
    zip
    gitRepo
    gnupg
    autoconf
    curl
    procps
    gnumake
    cmake
    clang
    util-linux
    m4
    gperf
    unzip
    cudatoolkit
    linuxPackages.nvidia_x11
    libGLU libGL
    xorg.libXi xorg.libXmu freeglut
    xorg.libXext xorg.libX11 xorg.libXv xorg.libXrandr zlib
    ncurses5
    stdenv.cc
    binutils
    # dev
    #llvmPackages_rocm.clang-tools-extra
    nodePackages_latest.pyright
  ];
  multiPkgs = pkgs: with pkgs; [ zlib ];
  runScript = "
  fish
  ";
  profile = ''
    export CUDA_PATH=${pkgs.cudatoolkit}
    export LD_LIBRARY_PATH=${pkgs.linuxPackages.nvidia_x11}/lib
    export EXTRA_LDFLAGS="-L/lib -L${pkgs.linuxPackages.nvidia_x11}/lib"
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${pkgs.glibc}/lib";
    export EXTRA_CCFLAGS="-I/usr/include"
  '';
}).env
