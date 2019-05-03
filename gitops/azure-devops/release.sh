# Source build.sh
. build.sh --source-only

# Initialization
verify_access_token
init
helm init
get_os

# Fabrikate
get_fab_version
download_fab

# Clone HLD repo
git_connect

echo "FAB SET"
fab set --environment $(Release.EnvironmentName) --subcomponent $SUBCOMPONENT $YAML_PATH=$YAML_PATH_VALUE

echo "GIT STATUS"
git status

echo "GIT ADD"
git add -A

# Set git identity
git config user.email "admin@azuredevops.com"
git config user.name "Automated Account"

echo "GIT COMMIT"
git commit -m "$COMMIT_MESSAGE"

echo "GIT PUSH"
git_push