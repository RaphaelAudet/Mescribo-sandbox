#!/bin/sh

set -xeu

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_website_files() {


  git add. output.txt
  git commit -m "updated docs $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add origin-pages https://${GH_TOKEN}@github.com/$TRAVIS_REPO_SLUG > /dev/null 2>&1
  git push origin $TRAVIS_BRANCH
}

setup_git
commit_website_files
upload_files
