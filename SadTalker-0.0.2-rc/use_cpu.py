import torch
import os
os.environ['CUDA_VISIBLE_DEVICES'] = ''  # Disable CUDA
torch.cuda.is_available = lambda: False  # Force CPU mode

from launcher import *

if __name__ == "__main__":
    prepare_environment()
    start()