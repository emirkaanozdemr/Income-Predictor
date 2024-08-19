DOCKER_IMAGE_NAME=income-predictor
DOCKER_CONTAINER_NAME=income-predictor-container

build:
    docker build -t $(DOCKER_IMAGE_NAME) .

run:
    docker run -p 5000:5000 --name $(DOCKER_CONTAINER_NAME) $(DOCKER_IMAGE_NAME)

stop:
    docker stop $(DOCKER_CONTAINER_NAME) && docker rm $(DOCKER_CONTAINER_NAME)

clean:
    docker rmi $(DOCKER_IMAGE_NAME) || true
    docker rm $(DOCKER_CONTAINER_NAME) || true
