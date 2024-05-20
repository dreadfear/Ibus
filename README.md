# Android studio qemu-system-x86_64 quit unexpectedly
Tool > Device Manager > Edit Virtural Device> Elemulate Performance: Hardware

# Add enviroment for fedora
nano ~/.bashrc
export PATH="/home/sven/FlutterSDK/flutter/bin/:$PATH"

# SDK and Android studio dir
flutter config --enable-linux-desktop
flutter config --android-sdk=/home/sven/Android/Sdk
flutter config --android-studio-dir=/home/sven/Android/android-studio

#Java SDK 
setting.json
	"java.configuration.runtimes": [
		{
			"name": "JavaSE-11",
			"path": "/home/sven/Java-11-JDK",
			"sources": "/home/sven/Java-11-JDK/lib/src.zip",
			"javadoc": "https://docs.oracle.com/en/java/javase/11/docs/api",
			"default": true
		}
	]
