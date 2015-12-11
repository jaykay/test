FROM jboss/wildfly:9.0.2.Final
MAINTAINER weclapp GmbH - info@weclapp.com

ADD ./postgresql-9.4-1205.jdbc4.jar /opt/jboss/wildfly/standalone/deployments/

# Add the weclapp war (when finished)
# ADD ./weclapp.war /opt/jboss/wildfly/standalone/deployments/

# This is a placeholder for testing purposes
ADD ./wildfly-kitchensink.war /opt/jboss/wildfly/standalone/deployments/

# Adding the configuration files
ADD ./standalone.xml /opt/jboss/wildfly/standalone/configuration/
ADD ./standalone.conf /opt/jboss/wildfly/bin/

# Setting the correct permissions
USER root
RUN chown jboss:jboss -R /opt/jboss/wildfly/standalone/deployments/

USER jboss
