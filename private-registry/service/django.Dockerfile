FROM python:3.8-bullseye
WORKDIR /app
ARG PROJECT_NAME=project
ENV PORT=8080
COPY requirements.txt .
EXPOSE ${PORT}
RUN pip install -r requirements.txt
RUN python -m django startproject "${PROJECT_NAME}"
WORKDIR /app/${PROJECT_NAME}
RUN python manage.py migrate
RUN sed -i '/^ALLOWED_HOSTS/c\ALLOWED_HOSTS = ["service.local"]' ${PROJECT_NAME}/settings.py
CMD ["sh", "-c", "python manage.py runserver 0.0.0.0:${PORT}"]