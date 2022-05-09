default:
	docker build . -t benchmarks
	docker run -d --name go-benchmarks benchmarks

clean-sh:
	sed -i -e 's/\r$//' *.sh