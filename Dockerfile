# Use a imagem Amazon Corretto 21 com Alpine como base
FROM amazoncorretto:21-alpine

ENV DD_API_KEY="" \
    DD_LOGS_ENABLED=true \
    DD_SITE="us5.datadoghq.com" \
    DD_APPLICATION_KEY="" \
    DD_SERVICE="SIMPLE_DD_ECS_TERRAFORM_APP" \
    DD_APM_ENABLED=true \
    DD_APM_NON_LOCAL_TRAFFIC=true

# Defina o diretório de trabalho
WORKDIR /app

# Instale o wget
RUN apk add --no-cache wget

# Baixe o datadog-agent.jar e coloque-o na pasta /opt/datadog
RUN mkdir -p /opt/datadog && \
    wget -O /opt/datadog/datadog-agent.jar https://dtdg.co/latest-java-tracer

# Copie o .jar da aplicação para o diretório /app
COPY *.jar /app/application.jar

# Exponha a porta que a aplicação Spring Boot usará (geralmente 8080)
EXPOSE 9001

# Comando para iniciar a aplicação
CMD ["java", "-javaagent:/opt/datadog/datadog-agent.jar", "-jar", "/app/application.jar"]