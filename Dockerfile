FROM ubuntu

# Set the working directory to /app
WORKDIR /app

# Copy the necessary files into the image
COPY requirements.txt /app/
COPY devops /app/devops/

# Update the package list, install Python, pip, and virtualenv
RUN apt-get update && \
    apt-get install -y --no-install-recommends python3 python3-pip python3-venv && \
    python3 -m venv /app/venv && \
    /app/venv/bin/pip install --upgrade pip && \
    /app/venv/bin/pip install -r /app/requirements.txt && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Activate the virtual environment
ENV PATH="/app/venv/bin:$PATH"

# Set the working directory to /app/devops
WORKDIR /app/devops

# Set the entry point to use Python 3 from the virtual environment
ENTRYPOINT ["python3"]

# Run the Django development server by default
CMD ["manage.py", "runserver", "0.0.0.0:8000"]




