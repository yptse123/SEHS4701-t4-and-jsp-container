# My JSP Web Application

This project is a simple web application built using JavaServer Pages (JSP) and Servlets. It provides a web form to accept two input numbers, calculates their sum, and displays the result.

## Project Structure

```
my-jsp-webapp
├── src
│   ├── main
│   │   ├── java
│   │   │   └── com
│   │   │       └── example
│   │   │           └── servlet
│   │   │               └── SumServlet.java
│   │   ├── resources
│   │   └── webapp
│   │       ├── WEB-INF
│   │       │   └── web.xml
│   │       └── index.jsp
├── Dockerfile
├── docker-compose.yaml
├── pom.xml
└── README.md
```

## Prerequisites

- Docker
- Docker Compose

## Building the Application

1. Clone the repository or download the project files.
2. Navigate to the project directory.

## Running the Application

To build and run the application using Docker, execute the following command:

```bash
docker-compose up --build
```

This command will build the Docker image and start the Tomcat server.

## Accessing the Application

Once the application is running, you can access it in your web browser at:

```
http://localhost:8080/
```

## Usage

1. Enter two numbers in the input fields.
2. Click the "Calculate Sum" button.
3. The result will be displayed on the next page.

## License

This project is licensed under the MIT License.