# Use an official jupyter image as a parent image
FROM jupyter/scipy-notebook:2023-08-19

# Set the working directory to /app
WORKDIR /app

# Add the current directory contents into the container at /app
ADD . /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8888 available to the world outside this container
EXPOSE 8888

# Run jupyter notebook when the container launches
CMD ["jupyter", "notebook", "--ip='*'", "--port=8888", "--no-browser", "--allow-root"]