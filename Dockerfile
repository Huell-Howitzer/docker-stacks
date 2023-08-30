# Use jupyter/scipy-notebook image as a parent image
FROM jupyter/scipy-notebook:2023-08-19

# Set the working directory in /app
WORKDIR /app

# Add the current directory contents into the container at /app
COPY . /app

# Install postgresql-dev and Python dependencies
USER root
RUN apt-get update && apt-get install -y libpq-dev
USER jovyan
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port
EXPOSE 8888

# Run jupyter notebook when the container launches
CMD ["jupyter", "notebook", "--ip='*'", "--port=8888", "--no-browser", "--allow-root"]