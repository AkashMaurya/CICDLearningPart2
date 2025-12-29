FROM python:3.13-slim

# Environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Working directory
WORKDIR /app

# Upgrade pip
RUN pip install --upgrade pip

# Copy requirements and install
COPY requirements/ requirements/
RUN pip install --no-cache-dir -r requirements/prod.txt


# Copy project
COPY . .

# Collect static files
RUN python manage.py collectstatic --noinput


# Expose port
EXPOSE 8000

# Run server (Gunicorn for production)
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "core.wsgi:application"]