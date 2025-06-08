TUGAS BESAR INTEGRASI APLIKASI ENTERPRISE

Service Oriented Application/ Multi-container Application


### sementara

di dalem root auth-service, buat build image
docker build -t gateway-auth-service .

buat jalanin image
docker run -p 3001:3001 gateway-auth-service


TODO: TAMBAHIN DATABASE 
TODO: BUILD VEHICLE dan ROUTE 
TODO: BIKIN DOCKER COMPOSE