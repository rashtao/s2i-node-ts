FROM node
RUN npm i typescript -g

ENV BUILDER_VERSION 1.0

LABEL io.k8s.description="node-ts" \
      io.k8s.display-name="node-ts" \
      io.openshift.expose-services="3000:http" \
      io.openshift.tags="builder,nodejs,typescript" \
      io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"

COPY ./.s2i/bin/ /usr/libexec/s2i

EXPOSE 3000
CMD ["/usr/libexec/s2i/usage"]
