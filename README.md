This app is taken from https://github.com/iamtrk/Device-Explorer v1.0

This is a quick example of building android app with support library from command line without Gradle/Ant.
For building this app you need to setup android-sdk-build-tools, sdklib, android.jar.

Put android-sdk-build-tools in PATH and copy android.jar to this repo.

Clone this  
`git clone https://github.com/HemanthJabalpuri/AndroidExplorer`  

Change directory to it.  
`cd AndroidExplorer`  

Copy android.jar to this folder.  
`cp /path/to/android.jar .`  

Finally build it.  
`sh build_new.sh`  
or  
`sh build_old.sh`  

You can see final.apk after completion of build.
