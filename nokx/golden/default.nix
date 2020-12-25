{ stdenv, fetchRepo, cmake, ninja
# , lz4
# , snappy
# , zlib
# , zstd
# , enableJemalloc ? false, jemalloc
# , enableLite ? false
# , enableShared ? true
}:

{
  golden_cpp = stdenv.mkDerivation rec {
    pname = "golden_cpp";
    version = "0.0.0";

    src = fetchRepo "golden_cpp" null;
    nativeBuildInputs = [ cmake ninja ];

    propagatedBuildInputs = [  ]; # bzip2 lz4 snappy zlib zstd

    # buildInputs = stdenv.lib.optional enableJemalloc jemalloc;

    NIX_CFLAGS_COMPILE = stdenv.lib.optionalString stdenv.cc.isGNU
      "-Wno-error=deprecated-copy -Wno-error=pessimizing-move";

    cmakeFlags = [
      "-DPORTABLE=1"
      "-DWITH_TESTS=1"
      # (stdenv.lib.optional
      #     (stdenv.hostPlatform.isx86 && stdenv.hostPlatform.isLinux)
      #     "-DFORCE_SSE42=1")
      # (stdenv.lib.optional enableLite "-DROCKSDB_LITE=1")
      # "-DFAIL_ON_WARNINGS=${if stdenv.hostPlatform.isMinGW then "NO" else "YES"}"
    ]; # ++ stdenv.lib.optional (!enableShared) "-DROCKSDB_BUILD_SHARED=0";

    # # otherwise "cc1: error: -Wformat-security ignored without -Wformat [-Werror=format-security]"
    # hardeningDisable = stdenv.lib.optional stdenv.hostPlatform.isWindows "format";

    #   meta = with stdenv.lib; {
    #     homepage = "https://rocksdb.org";
    #     description = "A library that provides an embeddable, persistent key-value store for fast storage";
    #     license = licenses.asl20;
    #     maintainers = with maintainers; [ adev magenbluten ];
    #   };
  };

}
