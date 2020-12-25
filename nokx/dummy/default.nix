{ pkgs ? import <nixpkgs> { } }:

if builtins.isNull pkgs then
({})
else
(
{
  # # cpp
  # algo_gcc10 = ../../applications/audio/ensemble-chorus/default.nix

  # pkgs.stdenv.mkDerivation {
  #   stdenv = pkgs.overrideCC pkgs.stdenv pkgs.gcc10
  # };
  
  # algo = with pkgs; stdenv.mkDerivation {  
  # };









  
  # python
  pyalgotrade_python37 = pkgs.callPackage ../../pkgs/development/python-modules/pyalgotrade {
      stdenv = pkgs.stdenv;
      buildPythonPackage = pkgs.python37Packages.buildPythonPackage;
      fetchPypi = pkgs.python37Packages.fetchPypi;
      matplotlib = pkgs.python37Packages.matplotlib;
      numpy = pkgs.python37Packages.numpy;
      python-dateutil = pkgs.python37Packages.python-dateutil;
      pytz = pkgs.python37Packages.pytz;
      requests = pkgs.python37Packages.requests;
      retrying = pkgs.python37Packages.retrying;
      scipy = pkgs.python37Packages.scipy;
      six = pkgs.python37Packages.six;
      tornado = pkgs.python37Packages.tornado;
      tweepy = pkgs.python37Packages.tweepy;
      ws4py = pkgs.python37Packages.ws4py;
    };
  pyalgotrade_python38 = with pkgs; with python38Packages; callPackage ../../pkgs/development/python-modules/pyalgotrade {};

  # pyalgotrade_fetchFromGitHub = callPackage ./example_python {
  #   stdenv = stdenv;
  #   buildPythonPackage = pkgs.python37Packages.buildPythonPackage;
  #   fetchFromGitHub = fetchFromGitHub;
  #   matplotlib = pkgs.python37Packages.matplotlib;
  #   numpy = pkgs.python37Packages.numpy;
  #   python-dateutil = pkgs.python37Packages.python-dateutil;
  #   pytz = pkgs.python37Packages.pytz;
  #   requests = pkgs.python37Packages.requests;
  #   retrying = pkgs.python37Packages.retrying;
  #   scipy = pkgs.python37Packages.scipy;
  #   six = pkgs.python37Packages.six;
  #   tornado = pkgs.python37Packages.tornado;
  #   tweepy = pkgs.python37Packages.tweepy;
  #   ws4py = pkgs.python37Packages.ws4py;
  # };

})