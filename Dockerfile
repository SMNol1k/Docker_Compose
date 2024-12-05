FROM python:3.9

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# ENTRYPOINT ["sh", "-c", "python manage.py migrate && python manage.py collectstatic --noinput && gunicorn -w 3 stocks_products.wsgi -b 0.0.0.0:8000"]
ENTRYPOINT ["sh", "-c", "gunicorn -w 3 stocks_products.wsgi -b 0.0.0.0:8000"]
