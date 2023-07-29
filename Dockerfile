# Dockerfile
FROM tiangolo/uvicorn-gunicorn-fastapi:python3.8

# Set working directory in the container
WORKDIR /app

# Copy the requirements.txt and install dependencies
COPY ./app/requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

# Copy the FastAPI app code into the container
COPY ./app /app

# Expose the port on which FastAPI is running
EXPOSE 80

# Command to start the server
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80", "--reload"]
