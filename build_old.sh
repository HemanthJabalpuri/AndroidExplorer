#!/bin/sh

rm -rf gen obj

echo " aapt"
mkdir gen
aapt p -I android.jar --rename-manifest-package "com.iamtrk.androidexplorer" --auto-add-overlay -S res -S libs/res-appcompat -S libs/res-cardview -S libs/res-design -S libs/res-recyclerview -M AndroidManifest.xml -m -J gen --extra-packages android.support.v7.appcompat:android.support.v7.cardview:android.support.design:android.support.v7.recyclerview -F res.apk

for i in libs/*.jar; do
  libs="$libs:$i"
  dxlibs="$dxlibs $i"
done
libs="${libs#:}"

echo " javac"
mkdir obj
javac -source 1.7 -target 1.7 -bootclasspath android.jar -cp $libs -sourcepath java:gen $(find java gen -type f -name '*.java') -d obj
rm -rf gen

echo " dx"
dx --dex --output=classes.dex obj $dxlibs
rm -rf obj

echo " add dex"
aapt a res.apk classes.dex
rm -f classes.dex

echo " sign"
jarsigner -keystore debug.keystore -storepass android -keypass android -signedjar out-signed.apk res.apk androiddebugkey
rm -f res.apk

echo " zipalign"
zipalign 4 out-signed.apk final.apk
rm -f out-signed.apk
