
#!/bin/bash

# STEP 1 - Create React App
npx create-react-app .

# STEP 2 - Initialize Git and create GitHub repository
git status
git add .
git commit -m "Initial React app"

gh auth login
gh repo create propeller-logo-task --public --source=. --remote=origin

git branch -M master
git push -u origin master

# STEP 3 - Create and switch to update_logo branch
git checkout -b update_logo

# STEP 4 - Replace existing logo
Invoke-WebRequest -Uri "https://cdn-ikponof.nitrocdn.com/vGqfYAGlOLDkYkJqZhYIYKEsibdbZnkc/assets/images/optimized/rev-f684a87/www.propelleraero.com/wp-content/uploads/2023/05/footer-logo.svg" -OutFile "src\logo.svg"

# STEP 5 - Replace existing link
# Updated src/App.js:
# https://reactjs.org
# to
# https://www.propelleraero.com/dirtmate/

# STEP 6 - Commit and push changes
git status
git add src\App.js src\logo.svg
git commit -m "Update logo and link"
git push -u origin update_logo

# STEP 7 - Create Pull Request
gh pr create --base master --head update_logo --title "Update logo and link" --body "Replaced the existing logo and updated the link to the Propeller Aero DirtMate page."

gh pr view

# STEP 8 - Merge Pull Request
gh pr merge --merge

git checkout master
git pull origin master

# REPO_URL https://github.com/PriyanshuRaj0019/propeller-logo-task
