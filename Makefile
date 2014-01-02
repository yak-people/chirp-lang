GO_DIRS=$(shell find . -type f -name '*.go' | grep -o '.*/' | sort | uniq)
TEST_DIRS=$(shell find . -type f -name '*_test.go' | grep -o '.*/' | sort | uniq)
MAIN_DIRS=$(shell find . -type f -name 'main.go' | grep -o '.*/' | grep -v _full | sort | uniq)

all: clean test build

# This prevents offline work.
# Also, I don't understand it.  
# Anyway, I don't think it should be automatic. --strick
get:
	go get $(GO_DIRS)

test:
	go test $(TEST_DIRS)

build:
	go build $(MAIN_DIRS)

clean:
	go clean $(GO_DIRS)
