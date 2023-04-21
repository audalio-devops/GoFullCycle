FROM golang

LABEL description="Usando o container golang, gera a aplicacao que exibira a mensagem"

WORKDIR /go/src/

COPY /src/app.go .

COPY /src/go.mod .

RUN CGO_ENABLED=0 GOOS=linux go build  -ldflags "-s -w" -o app .


FROM scratch

LABEL description="Usando o container scratch, copia a app gerada anteriormente e executa a mesma."

WORKDIR /root/

COPY --from=0 /go/src/app    .

CMD ["./app"]
