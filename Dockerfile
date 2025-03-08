# Use an official lightweight Python image
FROM python:3.10

# Set the working directory in the container
WORKDIR /app

# Copy the application files
COPY . /app

# Upgrade pip, setuptools, and wheel before installing dependencies
RUN pip install --upgrade pip setuptools wheel

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the Flask app port
EXPOSE 5000

# Run the application
CMD ["python", "edithra_ai.py"]
