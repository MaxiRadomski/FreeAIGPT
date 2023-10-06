FROM python:3.10-slim-buster  
  
WORKDIR /app  
  
COPY requirements.txt requirements.txt  
  
RUN python -m venv venv  
ENV PATH="/app/venv/bin:$PATH"  
  
RUN apt-get update && \  
    apt-get install -y --no-install-recommends build-essential libffi-dev cmake libcurl4-openssl-dev  

RUN pip install --upgrade pip --no-cache-dir
RUN pip3 install  -r requirements.txt 
RUN pip3 install git+https://github.com/ostix360/gpt4free.git
COPY . .  
  
RUN chmod -R 777 translations  
  
CMD ["python3", "./run.py"]  
