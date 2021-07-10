FROM python:3

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install debugpy
RUN pip install uwsgi

COPY . .

CMD uwsgi --socket :3031 --wsgi-file myflaskapp.py --callable app --processes 4 --threads 2 --stats :9191