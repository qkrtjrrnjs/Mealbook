#!/bin/bash

set -eo pipefail

xcodebuild \
  -project Mealbook.xcodeproj \
  -scheme Mealbook \
  -sdk iphonesimulator \
  -destination 'platform=iOS Simulator,name=iPhone 12,OS=15.0' \
  test
