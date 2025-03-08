# Use an official lightweight Python image
FROM python:3.10

# Set the working directory in the container
WORKDIR /app

# Copy the application files
COPY . /app

# Install system dependencies
RUN apt-get update && apt-get install -y build-essential libffi-dev python3-dev

# Upgrade pip, setuptools, and wheel before installing dependencies
RUN pip install --upgrade pip setuptools wheel

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the Flask app port
EXPOSE 5000

# Explicitly set Flask environment variables
ENV FLASK_APP=edithra_ai.py
ENV FLASK_ENV=production

# Run the application with Gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:5000", "edithra_ai:app"]
