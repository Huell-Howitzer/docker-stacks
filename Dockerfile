# Use jupyter/scipy-notebook image as a parent image
FROM rmhowell/rocketpy:latest

LABEL authors="Ryan M. Howell"


# Set the working directory in /app
WORKDIR /app

# Add the current directory contents into the container at /app

# Install postgresql-dev and Python dependencies
USER root
RUN apt-get update && apt-get install -y libpq-dev
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install jupyter
RUN pip install openai
RUN pip install rich
RUN pip install python-dotenv
RUN pip install netCDF4
RUN pip install pymongo
# Expose the port
EXPOSE 8888
COPY . /app

# Run jupyter notebook when the container launches
CMD ["jupyter", "notebook", "--ip='*'", "--port=8888", "--no-browser", "--allow-root"]