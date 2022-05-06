.PHONY: bootstrap setup update run console clean build test cibuild
.DEFAULT_GOAL := help

help:
	echo "Primary goals are build, run, test, verify. 'make run' to execute"

bootstrap:
	echo "'Bootstrap' currently has not steps"

run: build
	java -jar ./build/libs/LevelUpGame-0.0.1-SNAPSHOT.jar

clean:
	./gradlew clean

build: test
	./gradlew build -x test

test: clean
	echo "Running unit tests"
	./gradlew test

verify: stagetests
	echo "Running cucumber tests"
	./gradlew cucumberCli

all-tests: test verify

stagetests:
	mkdir -p ./output
	cp -R src/test/resources/images output

cibuild: test verify build

package:
	./gradlew assemble