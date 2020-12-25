{ pkgs ? import <nixpkgs> {}, cudaSupport ? false, cudatoolkit ? null
, nvidia_x11 ? null, fixDarwinDylibNames ? null }:

  with pkgs;
  # with python38Packages;

let
  projects_path = "https://github.com/nokx"; # can be local !

  fetchRepo = repo_name: revision:
    (builtins.fetchGit {
      url = (if builtins.isPath projects_path then
        projects_path + "/" + repo_name
      else
        projects_path + "/" + repo_name + ".git");
      rev = builtins.toString revision;
    });

  

in {

  dummy = callPackage ./dummy { pkgs = pkgs; };

  golden = callPackage ./golden {  fetchRepo=fetchRepo;};
  # fetchgitPrivate ? pkgs.fetchgitPrivate,
  # golden_cpp = callPackage ./golden_cpp {
  #   inherit stdenv;
  #   fetchgitPrivate=fetchFromGitHub;
  #   inherit cudaSupport;
  #   inherit cudatoolkit
  #   inherit nvidia_x11
  # };
  # golden_python = callPackage ./golden_python {
  #   inherit stdenv;
  #   buildPythonPackage ? pkgs.python37Packages.buildPythonPackage 
  #   fetchgitPrivate=fetchFromGitHub;
  #   inherit cudaSupport;
  #   inherit cudatoolkit
  #   inherit nvidia_x11
  # };

  aboutme = {
    email = "nokx@nokx.ch";
    github = "nokx";
    githubId = 11722712;
    name = "Nono Koukouk";
  };

  meta = with pkgs.stdenv.lib; {
    maintainers = [ aboutme ];
    homepage = "https://nokx.ch";
    description = description;
    licences = licenses.mit;
    platforms = platforms.linux;
  };

}
