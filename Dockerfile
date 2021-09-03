## We specify the base image we need for our
## go application
FROM golang:latest
## We create an /app directory within our
## image that will hold our application source
## files
RUN mkdir /app
## We copy everything in the root directory
## into our /app directory
ADD . /app
## We specify that we now wish to execute 
## any further commands inside our /app
## directory
WORKDIR /app
## we run go build to compile the binary
## executable of our Go program


## Add this go mod download command to pull in any dependencies
RUN go mod download
## Our project will now successfully build with the necessary go libraries included.
RUN go build -o main .

##RUN go mod init
## Our start command which kicks off
## our newly created binary executable
CMD ["/app/main"]

## docker build -t test-go-app .  
## docker run -p 8080:8081 -it test-go-app 