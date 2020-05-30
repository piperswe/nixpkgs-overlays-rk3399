{ stdenv, buildPackages, fetchFromGitLab, perl, buildLinux, modDirVersionArg ? null, ... } @ args:

with stdenv.lib;

buildLinux (args // rec {
  version = "5.6.0";
  modDirVersion = version;

  src = fetchFromGitLab {
    domain = "gitlab.manjaro.org";
    owner = "tsys";
    repo = "linux-pinebook-pro";
    rev = "93293259039d6fc3a725961d42b4f11bfc3f5127";
    sha256 = "0yrn22j10f3f6hxmbd23ccis35f9s8cbjvzxiyxnsch2zab9349s";
  };

  extraConfig = ''
    CRYPTO_AEGIS128_SIMD n
    RTC_DRV_RK808 y
    STAGING y
    STAGING_MEDIA y
    ARCH_ROCKCHIP y
    VIDEO_DEV m
    VIDEO_V4L2 m
    MEDIA_CONTROLLER y
    MEDIA_CONTROLLER_REQUEST_API y
    VIDEO_HANTRO m
    VIDEO_HANTRO_ROCKCHIP y
  '';
} // (args.argsOverride or {}))
