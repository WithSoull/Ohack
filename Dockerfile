# Используем базовый образ с Python
FROM python:3.12-slim

# Устанавливаем рабочую директорию в контейнере
WORKDIR /project/

# Копируем файл зависимостей в контейнер
COPY requirements.txt .

# Устанавливаем зависимости
# RUN pip install --no-cache-dir -r requirements.txt

# Копируем все содержимое проекта в контейнер
COPY . .

# Убедимся, что файл .env существует, если он нужен (опционально)
# ENV PATH_TO_ENV_FILE="/app/.env"

# Указываем команду по умолчанию для запуска приложения
CMD ["python", "app/runserver.py"]
