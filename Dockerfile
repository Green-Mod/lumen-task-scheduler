FROM domenicogaeni/php:8.0-base

RUN apt-get install -y cron

ENV APP_HOME /var/www/html

# Copy source and install dependencies
COPY . $APP_HOME
RUN composer install --optimize-autoloader --no-dev

# Clean
RUN rm -rf .git .github .vscode private tests .gitignore .php_cs.dist captainhook.json composer.json composer.lock Dockerfile docker-compose.yml LICENSE phpunit-printer.yml phpunit.xml psalm.xml README.md

# Change ownership of our applications
RUN chown -R www-data:www-data $APP_HOME

# Change uid and gid of apache to docker user uid/gid
RUN usermod -u 1000 www-data && groupmod -g 1000 www-data
COPY private/crontab /etc/cron.d/custom_crontab
RUN chmod 0644 /etc/cron.d/custom_crontab
RUN crontab /etc/cron.d/custom_crontab
RUN touch /var/log/cron.log

CMD cron && tail -f /var/log/cron.log
