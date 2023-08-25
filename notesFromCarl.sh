#!/bin/bash
#SBATCH --job-name=install_conda    ### Job Name
#SBATCH --output=install_conda.%j.out       ### File in which to store job output
#SBATCH --error=install_conda.%j.err        ### File in which to store job error messages
#SBATCH --qos=long         ### Quality of Service (like a queue in PBS)
#SBATCH --time=2-00:00:00     ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --nodes=1             ### Node count required for the job
#SBATCH --ntasks-per-node=1   ### Number of tasks to be launched per Node
#SBATCH --cpus-per-task=20      # Number of threads per task (OMP threads)
#SBATCH --partition=centos7      # use centos 7 operation system

#CentOS7 nodes are currently all being used. You probably have to wait for a while. Once you get logging in,
#If you haven’t set, set CONDA_ENVS_PATH to somewhere common in your group, for example,
export CONDA_ENVS_PATH=/lustre/project/taw/Wu_analysis/conda_envs
module load anaconda3/2020.07
unset PYTHONPATH
#If you want to create a new local environment, for example, wu-base,
#conda create -y -n wu-base python
#Install ‘conda’
#conda install -y -n wu-base -c defaults conda
#Activate the environment,
source $CONDA_ENVS_PATH/wu-base/etc/profile.d/conda.sh
conda activate wu-base
#Check the version of ‘conda’
conda --version
#It should be 23.7.3

conda install -c conda-forge mamba

mamba --version