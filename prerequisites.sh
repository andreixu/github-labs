#!/bin/bash
echo "This should be a message from the script, showing in GitHub Summary 😎" >> $GITHUB_STEP_SUMMARY
echo "Try a git clone..." >> $GITHUB_STEP_SUMMARY
if [[ -z "$REPO_ORG" || -z "$REPO_NAME" ]]; then
  echo "**<span style="color:red">ERROR:</span>** REPO_ORG and REPO_NAME environment variables must be set." >> $GITHUB_STEP_SUMMARY
  exit 1
fi
echo "\`\`\`" >> $GITHUB_STEP_SUMMARY
git clone https://github.com/$REPO_ORG/$REPO_NAME.git >> $GITHUB_STEP_SUMMARY 2>&1
git_clone_exit_code=$?
echo "Git clone exit code: $git_clone_exit_code" >> $GITHUB_STEP_SUMMARY
echo "\`\`\`" >> $GITHUB_STEP_SUMMARY
if [[ $git_clone_exit_code -ne 0 ]]; then
  echo -n "\$\${\\color{red}ERROR:}\$\$" >> $GITHUB_STEP_SUMMARY
  echo " Failed to clone the repository." >> $GITHUB_STEP_SUMMARY
  exit 1
fi