# -------------------------
# Stage 1: Build the Node app
# -------------------------
FROM node:20.19.5-alpine3.22 AS build    
WORKDIR /opt/server                       
COPY package.json .                        
COPY server.js .                           
RUN npm install                            

# -------------------------
# Stage 2: Run
# -------------------------
FROM node:20.19.5-alpine3.22              
WORKDIR /opt/server                        

# Create roboshop user & group (non-root best practice)
RUN addgroup -S roboshop && \ 
    adduser -S roboshop -G roboshop && \
    chown -R roboshop:roboshop /opt/server

# App environment variables
ENV MONGO="true" \
    MONGO_URL="mongodb://mongodb:27017/catalogue"

COPY --from=build /opt/server /opt/server 
# Switch to non-root user
USER roboshop                             
CMD [ "node", "server.js" ]               


# FROM node:20
# WORKDIR /opt/server
# COPY package.json .
# COPY server.js .
# RUN npm install
# ENV MONGO="true" \
#     MONGO_URL="mongodb://mongodb:27017/catalogue"
# CMD [ "node", "server.js" ]