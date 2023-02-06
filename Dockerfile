FROM maven as build
WORKDIR /app
COPY . .
RUN mvn install
