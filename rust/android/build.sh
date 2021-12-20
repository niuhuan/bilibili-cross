
# must docker is running

rsync -a ../main/ ./main/

cross build --release --target armv7-linux-androideabi
cp target/armv7-linux-androideabi/release/*.so ../../android/app/src/main/jniLibs/armeabi-v7a/

cross build --release --target aarch64-linux-android
cp target/aarch64-linux-android/release/*.so ../../android/app/src/main/jniLibs/arm64-v8a/

cross build --release --target i686-linux-android
cp target/i686-linux-android/release/*.so ../../android/app/src/main/jniLibs/x86/

cross build --release --target x86_64-linux-android
cp target/x86_64-linux-android/release/*.so ../../android/app/src/main/jniLibs/x86_64/
