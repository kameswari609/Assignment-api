# Use slim base image
FROM python:3.10-slim

# Set environment vars (best practices)
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app

# Install system deps for pip and FastAPI
RUN apt-get update 

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the app
COPY api ./api

# Expose port
EXPOSE 8000

# Run the app
CMD ["uvicorn", "api.main:app", "--host", "0.0.0.0", "--port", "8000"]
