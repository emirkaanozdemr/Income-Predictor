FROM python:3.9-slim
WORKDIR /Income Predictor
COPY . /Income Predictor
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 5000
ENV FLASK_APP=app.py
CMD ["flask", "run", "--host=0.0.0.0"]
