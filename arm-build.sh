
cp app/_oasis provisioning/raspberry-devbox-master/app/
cp app/src/* provisioning/raspberry-devbox-master/app/src/

cd provisioning/raspberry-devbox-master
vagrant ssh -c "sb2 -eR cd /vagrant/app && sb2 -eR oasis setup && sb2 -eR ocaml setup.ml -configure && sb2 -eR ocaml setup.ml -build"

sb2 < "cd /vagrant/app && oasis setup && ocaml setup.ml -configure && ocaml setup.ml -build"

echo "eval `opam config env` && cd /vagrant/app && oasis setup && ocaml setup.ml -configure && ocaml setup.ml -build" | sb2
