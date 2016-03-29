Drupal development with Docker
==============================

It contains a LAMP stack and an SSH server, along with an up to date version of Drush. It is based on [Debian Jessie](https://wiki.debian.org/DebianJessie).

[![](https://badge.imagelayers.io/dropdog/docker:latest.svg)](https://imagelayers.io/?images=dropdog/docker:latest 'Get your own badge on imagelayers.io')

Software
---------

This image contains:

* Apache 2.4
* MySQL 5.5
* PHP 5.6
* Drush dev.
* Composer
* PHPMyAdmin

When launching, the container will contain a fully-installed, ready to use infrastructure for Drupal 8.x development.

### Passwords

* Drupal: `admin:admin`
* MySQL: `root:` (no password)
* SSH: `root:root`

### Exposed ports

* 80 (Apache)
* 22 (SSH)
* 3306 (MySQL)


### Docker repository

Get the image:

```docker pull dropdog/docker```

#### Tags

You can specify the specific Drupal version you want, like `latest`. For example:

```docker pull dropdog/docker:latest```

### Running tests

If you want to run tests, you may need to take some additional steps. Drupal's Simpletest will use cURL to simulate user interactions with a freshly installed site when running tests. This "virtual" site resides under `http://localhost:[forwarded ip]`. This gives issues, though, as the *container* uses port `80`. By default, the container's virtual host will actually listen to *any* port, but you still need to tell Apache on which ports it should bind. By default, it will bind on `80` *and* `8080`, so if you use the above examples, you can start running your tests straight away. But, if you choose to forward to a different port, you must add it to Apache's configuration and restart Apache. You can simply do the following:

  # If you forwarded to another port than 8022, change accordingly.
  # Password is "root".
  ```ssh root@localhost -p 8022```
  # Change the port number accordingly. This example is if you forward
  # to port 8081.
  ```echo "Listen 8081" >> /etc/apache2/ports.conf
  /etc/init.d/apache2 restart```

Or, shorthand:

  ```ssh root@localhost -p 8022 -C 'echo "Listen 8081" >> /etc/apache2/ports.conf && /etc/init.d/apache2 restart'```

### MySQL and PHPMyAdmin

PHPMyAdmin is available at `/phpmyadmin`. The MySQL port `3306` is exposed. The root account for MySQL is `root` (**no password**).
