# 🚀 CI/CD Pipeline for Python Web Application 🐍

This document outlines the Continuous Integration and Continuous Deployment (CI/CD) pipeline established for the Python web application. The pipeline automates the processes of building, testing, containerizing, and deploying the application using Jenkins and Docker.

## 📋 Pipeline Stages

The pipeline comprises the following stages:

1. **🔄 Checkout**
2. **🏗️ Build Docker Image**
3. **🧪 Test Application**
4. **📤 Push Docker Image**
5. **🚀 Deploy Application**

### 1. 🔄 Checkout

**Purpose:**  
Retrieve the latest codebase from the source code repository.

**Tools Used:**
- **Jenkins SCM**: Manages source code retrieval within Jenkins.

**Process:**
- Jenkins fetches the latest code from the specified repository, ensuring the pipeline operates on the most recent version of the application.

### 2. 🏗️ Build Docker Image

**Purpose:**  
Create a Docker image encapsulating the application and its dependencies.

**Tools Used:**
- **Docker**: Facilitates containerization of the application.

**Process:**
- Execute the command `make image` to build the Docker image as defined in the `Makefile`. This process uses the `Dockerfile` to package the application into a container.

### 3. 🧪 Test Application

**Purpose:**  
Run automated tests to verify the application's functionality and stability.

**Tools Used:**
- **Python Virtual Environment (`venv`)**: Isolates the project's Python dependencies.
- **`pip`**: Manages Python package installations.
- **`pytest`**: Executes the test cases.

**Process:**
- Create a virtual environment using `python3 -m venv .venv`.
- Activate the virtual environment with `. .venv/bin/activate`.
- Upgrade `pip` and install required packages from `requirements.txt`.
- Run tests located in the `tests/` directory using `pytest`.

### 4. 📤 Push Docker Image

**Purpose:**  
Upload the built Docker image to Docker Hub for storage and accessibility.

**Tools Used:**
- **Docker Hub**: A cloud-based repository for Docker images.
- **Jenkins Credentials**: Securely manages authentication details.

**Process:**
- Authenticate to Docker Hub using credentials stored in Jenkins (`your-dockerhub-creds-id`).
- Execute the command `make push` to push the Docker image to the repository.

### 5. 🚀 Deploy Application

**Purpose:**  
Deploy the Docker image as a running container to serve the application.

**Tools Used:**
- **Docker**: Manages container lifecycle.

**Process:**
- Run the Docker container using the command:
  ```bash
  docker run -d --rm -p 5000:5000 prasads01/python-webapp:latest
  ```
  This starts the application and makes it accessible on port 5000.

## 🛠️ Tools Utilized

- **Jenkins**: Automates the CI/CD pipeline, orchestrating the stages from code retrieval to deployment.
- **Docker**: Provides containerization, ensuring consistency across development, testing, and production environments.
- **Python**: The programming language used for developing the web application.
- **`pytest`**: A testing framework for Python, used to write and execute test cases.

## ⚙️ Prerequisites

- **Jenkins Setup:**
  - Jenkins installed and configured.
  - Necessary plugins installed (e.g., Pipeline, Docker Pipeline).
  - Credentials for Docker Hub added to Jenkins.

- **Docker Setup:**
  - Docker installed on the Jenkins agent and deployment server.
  - Access to Docker Hub for image storage.

- **Source Code Repository:**
  - Access to the repository containing the application code, `Dockerfile`, `Makefile`, and test cases.

## 📝 Notes

- Ensure that the `Makefile` contains the appropriate targets (`image` and `push`) to build and push the Docker image.
- The `Dockerfile` should be correctly configured to containerize the Python application.
- Test cases should be comprehensive to maintain application quality and reliability.

This pipeline streamlines the development workflow by automating critical processes, thereby enhancing efficiency and reducing the potential for human error in deploying the Python web application.
```

