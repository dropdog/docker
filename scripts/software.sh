#!/usr/bin/env bash
# Print versions of installed software
# bash /scripts/software.sh >> /SOFTWARE.txt

# Print distribution info
echo -e "$(uname -a)"
echo -e "---------------------------------- \n"

# Print date created
echo -e "Date: $(date +%Y%m%d-%H%M)\n"

# Prints installed packages
# 6 items list
dpkg --list | grep -E '(^|\s)php5-cli($|\s)|(^|\s)phpmyadmin($|\s)|(^|\s)mysql-server($|\s)|(^|\s)apache2($|\s)|(^|\s)supervisor($|\s)|(^|\s)php5-xdebug($|\s)' \
            | awk '{ print NR ". " $2 ": " $3 }'

# Print Drush version
echo "7. drush: $(drush --version | awk '{print $4}')"

# Print drupal console version
echo "8. drupal: $(drupal --version | awk '{print $4}')"

# Print composer version
echo -e "9. composer: $(composer --version | awk '{ print $3}')"
