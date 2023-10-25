#!/bin/bash
#SBATCH -A sds_dl_phd
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --ntasks=1

#SBATCH -t 1-00:00:00
#SBATCH -J ml3_assignment3
#SBATCH -o training-%A.out
#SBATCH -e training-%A.err

module purge

module load anaconda
module load cuda/11.4.2
module load singularity pytorch/2.0.1
source activate falcon_40B
#pip install -U -r requirements.txt
pip install torchvision
conda install -y cudatoolkit
python train.py 