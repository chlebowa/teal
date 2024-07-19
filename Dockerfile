# Fetch base image
FROM rocker/rstudio:4.4

# Set up workspace and copy dependencies
WORKDIR /workspace
COPY ./DESCRIPTION /workspace/
COPY ./docker_script.R /workspace/

# Install required system packages
RUN sudo apt update && sudo apt install \
  libcairo2-dev \
  libfontconfig1-dev \
  libfreetype6-dev \
  libfribidi-dev \
  libharfbuzz-dev \
  libjpeg-dev \
  libpng-dev \
  libtiff5-dev \
  libxml2-dev \
  zlib1g-dev \
  -y

# Install this branch
# Dependencies installed from Github tu use development versions.
RUN R -e '\
  options(repos = c("https://cran.r-project.org")); \
  install.packages("remotes"); \
  remotes::install_github("insightsengineering/teal.widgets"); \
  remotes::install_github("insightsengineering/teal.reporter"); \
  remotes::install_local(path = ".", force = FALSE, dependencies = TRUE, upgrade = FALSE) \
'

# Remove unneded dependencies
RUN sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y

RUN R -s -f ./docker_script.R

# Run RStudio
CMD ["/init"]
