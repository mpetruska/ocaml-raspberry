
vagrant ssh -c "cp /vagrant/install-opam.sh /home/vagrant/ && sb2 -t raspberry -eR puppet apply -e \"include raspbian\" && sb2 -t raspberry -eR ./install-opam.sh"
