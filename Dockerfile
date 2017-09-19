FROM swift
COPY . home/app
WORKDIR home/app
SHELL ["/bin/bash", "-c"] 
RUN swift build
ENTRYPOINT ["./.build/debug/introSwift" ]