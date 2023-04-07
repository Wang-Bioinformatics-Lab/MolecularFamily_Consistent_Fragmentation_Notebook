from jupyter/datascience-notebook:lab-3.4.4

COPY requirements.txt /
RUN pip install -r /requirements.txt
RUN pip install jupyterlab-git
RUN pip install git+https://github.com/Wang-Bioinformatics-Lab/GNPSDataPackage.git@cff3f96d27666c3232c66fe6a470d1ce451e2e85
RUN pip install itables

## Setting up the proper premissions
ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}