# Use the latest Python base image
FROM python:3.10-slim

# Set the working directory inside the container
WORKDIR /app

# Copy all project files to the container
COPY . .

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libc6 \
    && rm -rf /var/lib/apt/lists/*

# Install required Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the Flask port
EXPOSE 5000

# Set environment variables
ENV FLASK_APP=edithra_ai.py
ENV FLASK_ENV=production

# Start the application using Gunicorn
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "edithra_ai:app"]
