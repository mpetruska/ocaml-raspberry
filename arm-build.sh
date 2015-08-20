
mkdir -p provisioning/raspberry-devbox-master/app/src
cp -f app/_oasis provisioning/raspberry-devbox-master/app/
cp -f app/build.sh provisioning/raspberry-devbox-master/app/
cp -rf app/src/* provisioning/raspberry-devbox-master/app/src/

cd provisioning/raspberry-devbox-master

vagrant ssh -c "cp -rf /vagrant/app . && echo \"cd /home/vagrant/app && ./build.sh\" | sb2 -eR"
vagrant ssh -c "mkdir -p /vagrant/arm_out && cp -f /home/vagrant/app/main.byte /vagrant/arm_out"

cp -rf arm_out ../../
