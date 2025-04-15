# FROM jenkins/jenkins:lts

# # Enable root user to install plugins and other dependencies.
# USER root

# # Update packages and clean up cache to keep the image slim
# RUN apt-get update && \
#     apt-get upgrade -y && \
#     apt-get clean && \
#     rm -rf /var/lib/apt/lists/*

# RUN apt-get update 
# RUN apt-get install -y python3
# RUN apt install -y python3-pip
# RUN apt install -y python3-pytest
# #RUN pip install pytest

# # Install Jenkin plugins
# RUN jenkins-plugin-cli --plugins role-strategy

# # Switch back to the Jenkins user
# USER jenkins


# ======================================


FROM jenkins/jenkins:lts

# Enable root user to install plugins and other dependencies.
USER root

# Update packages and clean up cache to keep the image slim
RUN apt-get update && \
    apt-get upgrade -y 
    #&& \
    #apt-get clean && \
   # rm -rf /var/lib/apt/lists/* 

RUN apt-get update 
RUN apt-get install -y python3
RUN apt-get install -y twine
RUN apt install -y python3-pip
RUN apt install -y python3-pytest
RUN apt install -y python3-build
RUN apt install -y python3-venv
RUN apt install -y python3-pkginfo


# Install Jenkin plugins
RUN jenkins-plugin-cli --plugins role-strategy

# Switch back to the Jenkins user
USER jenkins