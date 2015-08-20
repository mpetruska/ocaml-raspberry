#!/bin/bash

eval `opam config env`
oasis setup
ocaml setup.ml -configure > /dev/null
ocaml setup.ml -build
