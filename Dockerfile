# Gebruik de officiële NGINX-image
FROM nginx:latest

# Installeer git om de bestanden van GitHub te kunnen klonen
RUN apt-get update && \
  apt-get install -y git && \
  rm -rf /var/lib/apt/lists/*

# Map waar NGINX standaard bestanden serveert
WORKDIR /usr/share/nginx/html

# Haal de website-bestanden binnen van GitHub
RUN rm -rf ./* && \
  git clone https://github.com/indriit/simple-portfolio.git . && \
  rm -rf .git

# Container luistert op poort 80
EXPOSE 80

# Start de NGINX server
CMD ["nginx", "-g", "daemon off;"]
