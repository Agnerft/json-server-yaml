FROM nginx:mainline-alpine3.17-slim

#RUN apt-get update
RUN apk update && \
    apk upgrade && \
    apk add bash curl && \
    apk add --update nodejs npm
     
COPY ./bd.json /home/data/
COPY ./run.sh /home/data/



#CMD [ "curl", "-LO", "https://dl.k8s.io/release/v1.27.2/bin/linux/amd64/kubectl" ]
#CMD [ "install", "-o", "root", "-g", "root", "-m", "0755", "kubectl", "/usr/local/bin/kubectl" ]
#CMD [ "git", "clone", "https://github.com/ahmetb/kubectx", "/opt/kubectx" ]
#CMD [ "ln", "-s", "/opt/kubectx/kubectx", "/usr/local/bin/kubectx" ]
#CMD [ "ln", "-s", "/opt/kubectx/kubens", "/usr/local/bin/kubens" ]

#RUN curl -LO https://dl.k8s.io/release/v1.27.2/bin/linux/amd64/kubectl && \
 #   install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
  #  git clone https://github.com/ahmetb/kubectx /opt/kubectx && \
   # ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx && ln -s /opt/kubectx/kubens /usr/local/bin/kubens

#RUN git clone https://github.com/Agnerft/kube ~/.kube/

#ENTRYPOINT ["kubectl","get", "pods", "--all-namespaces", "--field-selector=status.phase=Failed" ]

#ENTRYPOINT ["kubectl", "delete", "pods", "--all-namespaces", "--field-selector=status.phase=Failed" ]

#ENTRYPOINT [ "npm", "install", "-g", "json-server" ]
RUN npm install -g json-server
#RUN json-server --watch /home/data/bd.json --port ${PORT}
EXPOSE 8080/tcp 8181/tcp 4848/tcp 8686/tcp 9009/tcp
ENTRYPOINT [ "sh", "/home/data/run.sh" ]


#ENTRYPOINT ["kubectl","get", "pods", "--all-namespaces", "--field-selector=status.phase=Failed" ]

#kubectl delete pods --namespace=services --field-selector=status.phase=Failed

#ENTRYPOINT [ "kubectl", "get", "pods", "--all-namespaces", "--field-selector=status.phase=Failed" ]
#kubectl get pods --all-namespaces --field-selector=status.phase=Failed
