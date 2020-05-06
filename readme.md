# Docker + Laravel + Vitrualbox

Краткий мануал по настройке Docker'a для Laravel на VirtualBox с пробросом портов на хостовую Windows. 

**Первое**. Настраиваем базовую конфигурацию Docker'a по мануалу от [Digitalocean](https://www.digitalocean.com/community/tutorials/how-to-set-up-laravel-nginx-and-mysql-with-docker-compose). И разибраемся с правами по [мануалу](https://docs.docker.com/engine/install/linux-postinstall/).

**Второе**. Создаём в VirtualBox общую папку folder и выполняем на виртуальной машине следующие команды: 

```sh
sudo mkdir /media/folder
sudo chmod 777 /media/folder
sudo -s
sudo mount -t vboxsf folder /media/folder
sudo echo folder /media/folder vboxsf defaults 0 0 >> /etc/fstab 
```

**Третье**. Пробрасываем порты с виртуальной машины на хост. Для этого выключаем виртуальную машину далее в её настройках: **Сеть** - **Адаптер 1** выбираем тип подключения NAT.

Далее настройках *Проброс портов* создаём два правила: **Порт хоста** - 2222, **Порт гостя** - 22 и **Порт хоста** - 80, **Порт гостя** - 80, оба протокола *TCP*.

Далее создаём второе подключение через **Адаптер 2**, выбирая тип подключения - *Внутренняя сеть*.

Далее прописываем в файле **hosts** (Windows\System32\drivers\etc\hosts) правило:

```sh
127.0.0.1 example.com
```

Done!