
vagrant ssh -c "sb2 -t raspberry -eR puppet apply -e \"include raspbian\" && sb2 -t raspberry -eR ./install-opam.sh"
