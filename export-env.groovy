import jenkins.model.*;
import hudson.slaves.EnvironmentVariablesNodeProperty;
list = Jenkins.getInstance().getGlobalNodeProperties().getAll(EnvironmentVariablesNodeProperty.class).get(0).getEnvVars()
list.each {
    println '- key: "' + it.getKey() + '"'
    println '  value: "' + it.getValue() + '"'
}