#!/usr/bin/env bash

rm -rf platforms plugins node_modules www package-lock.json
mkdir www
npm install
cordova platform add ios
tail -n 20 platforms/ios/test/test-Info.plist
