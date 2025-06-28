FROM python:3.13-slim

# Install system dependencies
RUN apt-get update && apt-get install -y python3-distutils && rm -rf /var/lib/apt/lists/*

# Set workdir
WORKDIR /app

# Copy project files into container
COPY . .

# Install Python dependencies (including Django)
RUN pip install --upgrade pip && pip install -r requirements.txt

# Expose port
EXPOSE 8000

# Command to run server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]


