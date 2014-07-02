{ cabal, binary, HTTP, network }:

cabal.mkDerivation (self: {
  pname = "Thrift";
  version = "0.6.0.1";
  sha256 = "0yk496zql0jpyj83ybdzffc03sylf5pwn093k831m99j54l2r5yv";
  buildDepends = [ binary HTTP network ];
  meta = {
    homepage = "http://thrift.apache.org";
    description = "Haskell bindings for the Apache Thrift RPC system";
    license = "unknown";
    platforms = self.ghc.meta.platforms;
  };
})
