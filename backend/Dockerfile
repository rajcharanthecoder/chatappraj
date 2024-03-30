FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    nano \
    python3 \
    python3-pip \
    python3-dev \
    default-libmysqlclient-dev \
    build-essential \
    git \
    python3-venv \
    mysql-client

# Clone the application repository
RUN git clone https://github.com/peyyala7hills/new_chatapp app

# Set working directory
WORKDIR /app

# Create and activate virtual environment
RUN python3 -m venv venv

# Copy Django settings file
COPY settings.py ./fundoo/fundoo/

# Copy entrypoint script from host
COPY entrypoint.sh /app

# Make entrypoint script executable
RUN chmod +x /app/entrypoint.sh

# Install dependencies
RUN . venv/bin/activate && \
    pip3 install mysqlclient && \
    pip3 install -r requirements.txt && \
    cd ./fundoo && \
    pip3 install python-dotenv

# Expose port
EXPOSE 8000

# Define entrypoint
ENTRYPOINT ["/app/entrypoint.sh"]
