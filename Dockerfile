# Use an official lightweight Python image
FROM python:3.10

# Set the working directory in the container
WORKDIR /app

# Copy the application files
COPY . /app

# Upgrade pip, setuptools, and wheel BEFORE installing dependencies
RUN pip install --upgrade pip setuptools wheel

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the Flask app port
EXPOSE 5000

# Run the application with Gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:5000", "edithra_ai:app"]
