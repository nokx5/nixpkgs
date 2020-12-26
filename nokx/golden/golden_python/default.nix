{ lib, buildPythonPackage, fetchRepo, shellHook, setuptools_scm, coreapi
, djangorestframework, pytest, numpy, pyjson5, toml, decorator, APScheduler }:

buildPythonPackage rec {
  inherit shellHook;

  pname = "golden_python";
  version = "0.0.0";

  src = fetchRepo "golden_python" null;

  nativeBuildInputs = [ setuptools_scm ];

  propagatedBuildInputs =
    [ coreapi djangorestframework numpy pyjson5 toml decorator APScheduler ];

  doCheck = true;
  checkInputs = [ pytest ];
  checkPhase = "pytest tests";

  # meta = with lib; {
  #   description = "Generation of Swagger/OpenAPI schemas for Django REST Framework";
  #   homepage = "https://github.com/axnsan12/drf-yasg";
  #   maintainers = with maintainers; [ ivegotasthma ];
  #   license = licenses.mit;
  # };
}
