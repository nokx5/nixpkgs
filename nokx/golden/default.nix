{ pkgs ? import <nixpkgs> { }, fetchRepo, shellHook, cudaSupport ? false
, cudatoolkit ? null, nvidia_x11 ? null, fixDarwinDylibNames ? null }:

with pkgs;

# { stdenv, fetchRepo, shellHook, cmake, ninja, boost172,lib, buildPythonPackage, setuptools_scm, coreapi,  djangorestframework, pytest, numpy, pyjson5, toml, decorator, APScheduler}:

{
  golden_cpp = callPackage ./golden_cpp { inherit fetchRepo shellHook; };
  golden_python = with python38Packages;
    callPackage ./golden_python { inherit fetchRepo shellHook; };
  golden_python39 = with python39Packages;
    callPackage ./golden_python { inherit fetchRepo shellHook; };

}
