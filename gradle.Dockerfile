FROM zeroc-docker-image:latest

# Install SDKMan
RUN curl -s "https://get.sdkman.io" | bash

# Install Java 8 JDK
RUN sdk install java 8.0.422-tem

# Install Gradle
RUN sdk install gradle
