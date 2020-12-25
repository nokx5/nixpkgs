{ stdenv
, buildPythonPackage
, fetchFromGitHub
, matplotlib
, numpy
, python-dateutil
, pytz
, requests
, retrying
, scipy
, six
, tornado
, tweepy
, ws4py
}:

buildPythonPackage rec {
  pname = "pyalgotrade";
  version = "0.20";

  src = fetchFromGitHub {
    owner = "gbeced";
    repo = "pyalgotrade";
    rev = version;
    sha256 = "7927c87af202869155280a93ff6ee934bb5b46cdb1f20b70f7407337f8541cbd"; #ad2bcc6b25c06c66eee4a8d522ce844504d8ec62";
  };

  propagatedBuildInputs = [
    matplotlib numpy python-dateutil pytz requests
    retrying scipy six tornado tweepy ws4py
  ];

  # no tests in PyPI tarball
  doCheck = false;

  meta = with stdenv.lib; {
    description = "Python Algorithmic Trading";
    homepage = "http://gbeced.github.io/pyalgotrade/";
    license = licenses.asl20;
  };

}
