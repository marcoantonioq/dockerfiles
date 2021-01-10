## Criar imagem
docker build -f hello/Dockerfile -t mysql-image .

## Criar container
docker run -d --rm --name mysql-container mysql-image