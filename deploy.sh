#!/bin/bash
#cd $1
git checkout master
cd htck
npm cache clean
npm install
bower install
grunt build
ls
cd ..
ls htck
git branch -D gh-pages 
cp -R htck/dist/ /tmp/
ls /tmp
git checkout --orphan gh-pages
# Remove all git tracked files (keeps libs and node_modules)
git ls-files -z | xargs -0 rm -f
rm .gitignore
mv /tmp/dist/* .
ls
git add content/ images/ index.html  scripts/ styles/ views/
git commit -am "Deploying to gh-pages"
git push --delete origin gh-pages
git push --set-upstream origin gh-pages
git checkout master