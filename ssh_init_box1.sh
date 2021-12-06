#!/bin/bash
printf "=======\n"
printf "Custom script started:\n"
printf "=======\n"
sudo su

echo -e "192.168.56.102 box2\n192.168.56.101 box1" >> /etc/hosts
sed -i 's/nameserver 127.*/nameserver 8.8.0.0/g' /etc/resolv.conf
printf "=======\n"
printf "Added box1 and box2 IP addresses in hosts file\n"
printf "=======\n"

# SSH setup through vagrant user
sed -i 's|#PubkeyAuthentication|PubkeyAuthentication|g' /etc/ssh/sshd_config
sed -i 's|#AuthorizedKeysFile|AuthorizedKeysFile|g' /etc/ssh/sshd_config
sed -i 's|#PasswordAuthentication yes|PasswordAuthentication no|g' /etc/ssh/sshd_config
systemctl restart sshd
printf "=======\n"
printf "SSH setup with keys\n"
printf "=======\n"

# pub/priv keys added to be able to access the server trough SSH
mkdir /root/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDAGQwuPOla9AvpqiV3MRBh3hXrrSwGHZRNWzBWwtkZi7ZAIx0z4P/v6Q8oAg7C1fA/pGhYrUG/lnDsnEEtSRhA9wCLTRiQXJDnlBkE6428jm5lRSkAbMd5ccGiW2jbwYJQnFtIQYmBhbegZ/spH0dK+azdNxTOkv3a5Fkwr2yEn1+8/X52K0dHN0ifbc4s9fd0YwCyiQJQpx0QdaqLfikGJVLfxUvMZ8ftnOCZwMOIQ4SKCrzcHEKJkyrMOQJuhR/dg2TtgpEOTtqM8HekX6e6pGt6bBghV8PyhnVCheUa4ERCZaG2nAFwIUTKErM200fghSnZ+/oDLPg1dwPGjvf/VwryQrCS8+KJm/hgWgjp1Di2wo22PDBPMXFYxbLiQr54d3F2VUxh82NEEjSv2hchqlPiAVYwkClgkjNb7LK6/6CoHxQAzcybfY5rU4UVD620AS/GqC9FWm03uRjP2yjs0L1vgvfduy17aZ2h4Jc+f4mK2VGYWrLhhxDlyvqrIBU= yonder\cmuraru@cMuraru-LAP" > /root/.ssh/authorized_keys
echo -e "-----BEGIN OPENSSH PRIVATE KEY-----\n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\n-----END OPENSSH PRIVATE KEY-----" >> /root/.ssh/id_rsa
chmod 600 /root/.ssh/authorized_keys /root/.ssh/id_rsa
eval `ssh-agent -s` > /dev/null && ssh-add /root/.ssh/id_rsa > /dev/null
printf "=======\n"
printf "Added keys to the server to be able to make connections between servers through SSH\n"
printf "=======\n"

printf "=======\n"
printf "Installing required software:\n"
printf "=======\n"

apt-get -qq update
apt-get -qq install -y zfsutils-linux > /dev/null
printf "=======\n"
printf "Installed zfsutils\n"
printf "=======\n"

apt-get -qq install -y python3-pip > /dev/null
pip3 install pyznap
printf "=======\n"
printf "Installed pyzsnap\n"
printf "=======\n"

apt-get -qq install -y postgresql > /dev/null
sed -i 's|port = 5432|port = 5430|g' /etc/postgresql/10/main/postgresql.conf
systemctl restart postgresql
printf "=======\n"
printf "Installed postgresql\n"
printf "=======\n"

# creating zfs pool and dataset for postgres
mkdir /disk
dd if=/dev/zero of=/disk/vhd.img bs=1M count=4800
mkfs.ext4 /disk/vhd.img
zpool create pool /disk/vhd.img
zfs create pool/pg_dataset
zfs create pool/pg_wal
printf "=======\n"
printf "ZFS pool created in /pool and PG dataset in /pool/pg_dataset\n"
printf "=======\n"

# installing prereq for docker
apt-get -qq install -y ca-certificates curl gnupg lsb-release > /dev/null
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get -qq update
apt-get -qq install -y docker-ce docker-ce-cli containerd.io > /dev/null

printf "=======\n"
printf "Installed docker\n"
printf "=======\n"

docker run --name postgresqldb -e POSTGRES_USER=pguser -e POSTGRES_PASSWORD=securepassword -p 192.168.56.101:5432:5432 -v /pool/pg_dataset:/var/lib/postgresql/data -d postgres
printf "=======\n"
printf "Started docker with postgres instance using dataset in /pool/pg_dataset\n"
printf "=======\n"
################

wget -o /dev/null https://ftp.postgresql.org/pub/projects/pgFoundry/dbsamples/world/dbsamples-0.1/dbsamples-0.1.tar.gz && tar xzf dbsamples-0.1.tar.gz
export PGPASSWORD='securepassword' && psql -h box1 -p 5432 -U pguser -c "create database world" && psql -h box1 -p 5432 -U pguser world < dbsamples-0.1/world/world.sql
rm -rf dbsamples-0.1/ dbsamples-0.1.tar.gz

printf "=======\n"
printf "Downloaded a dummy sql file and imported it in database world \n"
printf "=======\n"

pyznap setup
echo -e "[pool/pg_dataset]\nfrequent = 4\nsnap = yes\nclean = yes\ndest = pool/backup\ncompress = gzip" > /etc/pyznap/pyznap.conf
pyznap snap --full
ssh-keyscan box2 >> $HOME/.ssh/known_hosts
pyznap send -s pool/pg_dataset -d ssh:22:root@box2:pool/backup -i /root/.ssh/id_rsa --dest-auto-create

touch /etc/cron.d/backup_pg && chmod +x /etc/cron.d/backup_pg
echo -e "*/1 * * * * root pyznap snap --take; pyznap send -s pool/pg_dataset -d ssh:22:root@box2:pool/backup -i /root/.ssh/id_rsa --dest-auto-create" > /etc/cron.d/backup_pg

printf "==DONE===\n"
printf "=======\n"
#########################
