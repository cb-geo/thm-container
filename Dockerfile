FROM fedora:30
MAINTAINER Krishna Kumar <krishnak@utexas.edu>

# Update to latest packages, remove vim-minimal & Install Git, GCC, Clang, Autotools and VIM
RUN dnf update -y && \
    dnf remove -y vim-minimal python sqlite && \
    dnf install -y boost boost-devel clang clang-analyzer clang-tools-extra cmake cppcheck eigen3-devel \
                   findutils gcc gcc-c++ git hdf5 hdf5-devel kernel-devel lcov \
                   make openmpi openmpi-devel tar tbb tbb-devel \
                   valgrind vim vtk vtk-devel wget && \
dnf clean all

# Load OpenMPI module
# RUN source /etc/profile.d/modules.sh && export MODULEPATH=$MODULEPATH:/usr/share/modulefiles && module load mpi/openmpi-x86_64
ENV PATH="/usr/lib64/openmpi/bin/:${PATH}"

# Create a user cbgeo
RUN useradd cbgeo
USER cbgeo

# Create a research directory
# RUN mkdir -p /home/cbgeo/research/

# Create a research directory and clone git repo of dealii code
RUN cd /home/cbgeo/Downloads && \
    git clone https://github.com/dealii/dealii.git && \
    cd dealii && git checkout dealii-9.1 \
    mkdir build && cd build \
    cmake -DCMAKE_INSTALL_PREFIX=/home/cbgeo/research/dealii/ .. && \
    make install -j 2


# Create a research directory and clone git repo of thm code
# RUN cd /home/cbgeo/research && \
#    git clone https://github.com/cb-geo/thm.git

# Done
# WORKDIR /home/cbgeo/research/thm

RUN /bin/bash "$@"
