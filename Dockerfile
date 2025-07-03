FROM python:3.13.4-alpine3.22

# Set work directory
WORKDIR /app
# Copy requirements if exists, else install manually
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt || true
# Copy application code
COPY . .
# Expose port
EXPOSE 8000
# Run the FastAPI app with uvicorn
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]