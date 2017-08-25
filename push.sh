#!/bin/sh

set -xeu

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_website_files() {

  cat output.txt
  git add output.txt
  git commit -m "updated docs $TRAVIS_BUILD_NUMBER"
  git status -s
}

upload_files() {
  git remote add github  https://${GH_TOKEN}@github.com/$TRAVIS_REPO_SLUG > /dev/null 2>&1
  git push github $TRAVIS_BRANCH
}

setup_git
commit_website_files
upload_files
