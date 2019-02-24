.PHONY: 01 02 03 03-stop 04 04-stop

01:
	docker build -f Dockerfile-01 -t introduction-01 .
	docker run introduction-01

02:
	docker build -f Dockerfile-02 -t introduction-02 .
	docker run introduction-02

03:
	docker build -f Dockerfile-03 -t introduction-03 .
	docker run -d --rm --name intro-py-dev -p 5000:5000 introduction-03
	sleep 1 && curl localhost:5000

03-stop:
	docker stop intro-py-dev

04:
	docker build -f Dockerfile-04 -t introduction-04 .
	docker run -d --rm --name intro-py-prod -p 5000:5000/tcp introduction-04
	sleep 1 && curl localhost:5000

04-stop:
	docker stop intro-py-prod
