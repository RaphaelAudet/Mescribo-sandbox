#!/bin/sh

set -xeu

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_website_files() {

  cat output.txt
  env
  git add output.txt
  git commit -m "updated docs $TRAVIS_BUILD_NUMBER"
  git checkout -b travisbranch

  git remote add github  https://${GH_TOKEN}@github.com/$TRAVIS_REPO_SLUG > /dev/null 2>&1
  git checkout $TRAVIS_PULL_REQUEST_BRANCH
  git merge travisbranch
  git push github $TRAVIS_PULL_REQUEST_BRANCH --force
}

setup_git
commit_website_files
