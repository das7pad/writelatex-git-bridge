# git-bridge makefile


run: package
	java -jar target/writelatex-git-bridge-1.0-SNAPSHOT-jar-with-dependencies.jar conf/local.json


build:
	mvn package


test:
	mvn test


clean:
	mvn clean


package: clean
	mvn package


.PHONY: run package build clean test
