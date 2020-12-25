{ config, buildPythonPackage, fetchgitPrivate, pytestCheckHook
, pytestcov, toml, requests, numpy, pyaml, networkx, pyjson5
, sh, werkzeug, GitPython, jsonnet, setuptools, requests-mock }:

buildPythonPackage rec {
  pname = "golden python";
  version = "0.0-";

  src = fetchgitPrivate {
    url = "/home/nokx/workOn/projects/golden_python/.git";
    rev = "dc9a2e6bcf601e7aefedff545d2f52cd10aa9a8b";
    sha256 = "03ic91fq5psd6807rxf0r40l84lwgcxf3alll381i5vg7kv1pzb5";
  };

  checkInputs = [ pytestCheckHook pytestcov requests-mock ];

  pytestFlagsArray = [ "tests" ];

  propagatedBuildInputs = [
    GitPython
    pyjson5
    jsonnet
    networkx
    numpy
    pyaml
    requests
    setuptools
    sh
    toml
    werkzeug
  ];

  # passthru = {
  #   updateScript = inait-updater {
  #     packageName = pname;
  #     attrPath = "pythonPackages.${pname}";
  #   };
  # };

  meta = {
    description = "Golden python skeleton project build by nokx";
    maintainers = [ nokx ];
    homepage = "https://five.nokx/";
    license = {
      fullName = "Copyright MIT nokx";
      free = true;
    };
  };
}
