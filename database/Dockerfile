FROM mysql:latest

# Change ownership of MySQL data directory to allow modifications
RUN chown -R mysql:root /var/lib/mysql

# Set up environment variables for database configuratio
# Expose MySQL port
EXPOSE 3306

ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD

ENV MYSQL_DATABASE=$MYSQL_DATABASE
ENV MYSQL_USER=$MYSQL_USER
ENV MYSQL_PASSWORD=$MYSQL_PASSWORD
ENV MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD

# Copy SQL initialization script to Docker container
COPY init.sql /docker-entrypoint-initdb.d/

# Set the entrypoint script to start MySQL and ensure it runs on boot
#ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

# Set the default command to start MySQL
CMD ["mysqld"]
