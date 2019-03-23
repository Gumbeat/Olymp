echo "РАСПАКОВОЧКА ДОКЕРА"
tar xzvf ./docker-18.06.3-ce.tgz

echo "КОПИРОВАНИЕ ДОКЕРА"
sudo cp docker/* /usr/bin

echo "ЗАПУСКАНИЕ ДОКЕРА"
sudo dockerd &

sudo usermod -aG docker $(whoami)

#sudo groupadd docker
#sudo gpasswd -a ${USER} docker
#sudo service docker restart
#newgrp docker

# echo "УСТАНОВКА ЧАСОВ"
# sudo apt update && sudo apt install watch

# echo "ПОДГРУЖАЕМ РЕДИС"
# sudo docker load -i redis.tar

# echo "ПОДГРУЖАЕМ ПОСТГРЕС"
# docker load -i postgres.tar

echo "ПОДГРУЗКА ЗАДНЕГО КОНЦА"
docker load -i olymp_oj-backend.tar

echo "ПОДГРУЖАЕМ СЕРВЕР"
docker load -i judge_server.tar

docker-compose up -d
# if [ -x "$(command -v watch)" ]; then
    # watch -n 1 -d docker ps
# else
    # docker ps
# fi
