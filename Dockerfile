FROM python:alpine

WORKDIR /bot
COPY . /bot

RUN pip3 install -r requirements.txt

COPY example.env .env
ARG DISCORD_BOT_TOKEN
ARG BARD_TOKEN
RUN sed -i 's/DISCORD_BOT_TOKEN="xxxx"/DISCORD_BOT_TOKEN="${DISCORD_BOT_TOKEN}"/' .env
RUN sed -i 's/BARD_TOKEN="xxxx"/BARD_TOKEN="${BARD_TOKEN}"/' .env

CMD python3 main.py
