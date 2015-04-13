# docker-vector
Dockerfile to create and run Netflix vector

# building
cd docker-vector

docker build -t vector_img . 

# running
docker run -name vector_ins -t -i -p 45001:8080 vector_img 

cd /opt/vector/

gulp && 

service pcp start

# questions
mail me. 
