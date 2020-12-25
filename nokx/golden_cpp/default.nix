{ stdenv, lib, fetchgitPrivate, cmake, ninja, pkgconfig, boost
, cudatoolkit ? null, nvidia_x11 ? null, libpng, openssl, tbb, fixDarwinDylibNames
, cudaSupport ? false }:

assert cudaSupport -> cudatoolkit != null;

# let cmakeFeature = x: if x then "ON" else "OFF";
# in

stdenv.mkDerivation rec {
  variant = if cudaSupport then "-gpu" else "";
  pname = "golden_cpp{variant}";
  version = "0.0.0";

  src = fetchgitPrivate {
    url = "/home/nokx/workOn/projects/golden_cpp";
    rev = "e0d18651d903f9fa77e623fd993c96a35120c1fd";
    sha256 = "1hvrd9brr4912x74kqn7z5g1yz9lsf1m23lxsq9avnhwkl8hz4hl";
  };

  nativeBuildInputs = [ cmake ninja pkgconfig ]
    ++ lib.optionals cudaSupport [ addOpenGLRunpath ]
    ++ lib.optional stdenv.isDarwin fixDarwinDylibNames;

  buildInputs = [ boost libpng openssl tbb ]
    ++ lib.optionals cudaSupport [ cudatoolkit nvidia_x11 ];

  cmakeFlags = [
    "-DGOLDEN_CPP=ON"
    "-DGOLDEN_PYBIND=OFF"
    "-DGOLDEN_STATIC=ON"
    # "-DGOLDEN_CUDA=${cmakeFeature cudaSupport}"
  ];

  ninjaFlags = [ "-v" ];

  enableParalleBuilding = true;
  enableParallelChecking = false;

  # FIXME disable the tests for now:
  doCheck = false;

  # postFixup = lib.optionalString cudaSupport ''
  #   find $out -type f \( -name '*.so' -or -name '*.so.*' \) | while read lib; do
  #     new_refs="$(patchelf --print-rpath "$lib" | sed -E -e 's,:?${nvidia_x11}[^:]*,,')"
  #     patchelf --set-rpath "$new_refs" "$lib"
  #     addOpenGLRunpath "$lib"
  #   done
  # '';

  # passthru = { updateScript = inait-updater { packageName = pname; }; };
}