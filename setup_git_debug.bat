@echo off
cd /d d:\Projects\f1-telemetry-dashboard
echo Starting > git_setup.log
if exist front-end\.git (
    echo Removing nested git... >> git_setup.log
    rmdir /s /q front-end\.git >> git_setup.log 2>&1
)
echo Initializing git... >> git_setup.log
git init >> git_setup.log 2>&1
echo Adding remote... >> git_setup.log
git remote add origin https://github.com/KhalidFinny/f1-telemetry-dashboard.git >> git_setup.log 2>&1
echo Adding files... >> git_setup.log
git add . >> git_setup.log 2>&1
echo Committing... >> git_setup.log
git commit -m "Initial commit of full project" >> git_setup.log 2>&1
echo Renaming branch... >> git_setup.log
git branch -M main >> git_setup.log 2>&1
echo Done. >> git_setup.log
