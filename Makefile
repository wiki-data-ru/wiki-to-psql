
d=docker
name=814ck5n0w
container_name=psql_wiki

build: 
	docker build -t $(name)-$(container_name) . 

start: build
	docker run -p 5432:5432 --name $(name)-$(container_name) $(name)-$(container_name)
	
clean:
	docker volume prune -f
	docker system prune -f