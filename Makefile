# build file
GOCMD=go
# Use -a flag to prevent code cache problems.
GOBUILD=$(GOCMD) build -ldflags -s -v

BIN_BINARY_NAME=docker-events-monitor
monitor:
	$(GOBUILD) -o $(BIN_BINARY_NAME) cmd/main.go
	@echo "Build $(BIN_BINARY_NAME) successfully. You can run ./$(BIN_BINARY_NAME) now.If you can't see it soon,wait some seconds"

BIN_SUPERVISOR=supervisor-events-listening
sup:
	$(GOBUILD) -o $(BIN_SUPERVISOR) cmd/supervisor/main.go
	@echo "Build $(BIN_SUPERVISOR) successfully. You can run ./$(BIN_SUPERVISOR) now.If you can't see it soon,wait some seconds"

update:
	go mod tidy
	go mod vendor