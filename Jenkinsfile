@Library('jenkins-shared-library') _

def configMap = [
    project: "robomart", 
    component: "catalogue"
]

if ( !env.BRANCH_NAME.equalsIgnoreCase("main") ) {
    echo "Deploying on non-prod branch"
    nodeJSEKSpipeline(configMap)

} else {
    echo "Kindly follow the CR process"
}