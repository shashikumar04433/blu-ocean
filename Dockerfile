# Use an official Python runtime as base image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy requirements file
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY app.py .

# Expose port 5000
EXPOSE 5000

# Run the Flask app
CMD ["python", "app.py"]
