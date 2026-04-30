FROM runpod/pytorch:2.5.0-py3.10-cuda12.1.0-devel

WORKDIR /app

RUN pip install voxcpm soundfile runpod

# preload model (important!)
RUN python -c "from voxcpm import VoxCPM; VoxCPM.from_pretrained('openbmb/VoxCPM2')"

COPY handler.py .

CMD ["python", "-u", "handler.py"]