#!/bin/bash
cd /jdk_src
if [ -z $debug_level ];then
    export debug_level=slowdebug
fi
echo debug_level:$debug_level
sleep 1
bash  configure --enable-debug-symbols   --with-debug-level=$debug_level --with-jvm-variants=server --with-native-debug-symbols=internal   --with-boot-jdk=/usr/lib/jvm/java-1.8.0-openjdk-amd64  --with-freetype-include=/usr/include/freetype2 --with-freetype-lib=/usr/lib/x86_64-linux-gnu
if [ $? -ne 0 ];then
    echo "use --with-native-debug-symbols failed"
    sleep 1
    bash  configure  --with-debug-level=$debug_level  --with-jvm-variants=server  --with-boot-jdk=/usr/lib/jvm/java-1.8.0-openjdk-amd64 --enable-debug-symbols  --with-freetype-include=/usr/include/freetype2 --with-freetype-lib=/usr/lib/x86_64-linux-gnu
fi
make