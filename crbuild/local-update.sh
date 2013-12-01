#!/bin/bash

# Updates this project with the Chrome build files.
# This script assumes the Chromium Source is local and available in ~/chromium

# Clean up.
rm -r assets/*
rm -r libs/*
rm -rf src/com/googlecode/*
rm -rf src/org/chromium/*

# ContentShell core -- use this if android_webview doesn't work out.
#scp $BLD:chromium/src/out/Release/content_shell/assets/* assets/
#rm libs/**/gdbserver
#cp -r ~/chromium/src/out/Release/content_shell_apk/libs/* libs
#cp -r ~/chromium/src/content/shell/android/java/res/* res
#cp -r ~/chromium/src/content/shell/android/java/src/* src
#cp -r ~/chromium/src/content/shell_apk/android/java/res/* res

# android_webview
cp -r ~/chromium/src/out/Release/android_webview_apk/assets/*.pak assets
cp -r ~/chromium/src/out/Release/android_webview_apk/libs/* libs
rm libs/**/gdbserver
cp -r ~/chromium/src/android_webview/java/src/* src/

## Dependencies inferred from android_webview/Android.mk

# Resources.
cp -r ~/chromium/src/content/public/android/java/resource_map/* src/
cp -r ~/chromium/src/ui/android/java/resource_map/* src/

# ContentView dependencies.
cp -r ~/chromium/src/base/android/java/src/* src/
cp -r ~/chromium/src/content/public/android/java/src/* src/
cp -r ~/chromium/src/media/base/android/java/src/* src/
cp -r ~/chromium/src/net/android/java/src/* src/
cp -r ~/chromium/src/ui/android/java/src/* src/
cp -r ~/chromium/src/third_party/eyesfree/src/android/java/src/* src/

# Grab this resource file or org.chromium.chrome.browser.ResourceId.java won't compile
cp -r ~/chromium/src/out/Release/chromium_testshell/gen/* src/

# Strip a ContentView file that's not supposed to be here.
rm src/org/chromium/content/common/common.aidl

# Get rid of the .svn directory in eyesfree.
rm -r src/com/googlecode/eyesfree/braille/.svn

# Browser components.
cp -r ~/chromium/src/components/web_contents_delegate_android/android/java/src/* src/
cp -r ~/chromium/src/components/navigation_interception/android/java/src/* src/

# Generated files.
cp -r ~/chromium/src/out/Release/gen/templates/* src/

# JARs.
cp -r ~/chromium/src/out/Release/lib.java/guava_javalib.jar libs/
cp -r ~/chromium/src/out/Release/lib.java/jsr_305_javalib.jar libs/

# android_webview generated sources. Must come after all the other sources.
cp -r ~/chromium/src/android_webview/java/generated_src/* src/
