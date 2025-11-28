FROM nosana/whisper:latest

# Создадим папку для моделей и кэшируем туда модели заранее
ENV HF_HOME=/root/.cache/huggingface
RUN mkdir -p $HF_HOME

# Копируем небольшой тестовый файл внутрь контейнера
COPY media/test_video.mp4 /tmp/test_video.mp4

# Предзагрузим модель medium
RUN whisper /tmp/test_video.mp4 --model medium --language Russian || true
