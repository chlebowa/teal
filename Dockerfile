# Fetch base image
FROM rocker/rstudio:4.4

# Set up workspace and copy dependencies
WORKDIR /workspace
COPY ./DESCRIPTION /workspace/
COPY ./docker_script.R /workspace/

# Install required system packages
RUN sudo apt update && sudo apt install \
  libxml2-dev \
  libfontconfig1-dev \
  zlib1g-dev \
  -y

# Install dependencies
RUN R -e 'options(repos = c("https://cran.r-project.org")); \
        install.packages("remotes"); \
        remotes::install_local(path = ".", force = FALSE, dependencies = TRUE, upgrade = FALSE)'

# Remove unneded dependencies
RUN sudo apt update && sudo apt autoremove -y

RUN R -s -f ./docker_script.R

# Run RStudio
CMD ["/init"]
