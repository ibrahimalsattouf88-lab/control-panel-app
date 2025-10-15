def flutterVersionCode = 1
def flutterVersionName = "1.0.0"

plugins {
    id "com.android.application"
    id "kotlin-android"
    id "dev.flutter.flutter-gradle-plugin"
}

android {
    namespace "com.example.smart_assistant_app"   // <- هنا الـnamespace
    compileSdkVersion flutter.compileSdkVersion

    defaultConfig {
        applicationId "com.example.smart_assistant_app"  // اسم الحزمة للتوزيع
        minSdkVersion flutter.minSdkVersion
        targetSdkVersion flutter.targetSdkVersion
        versionCode flutterVersionCode
        versionName flutterVersionName
        multiDexEnabled true
    }

    buildTypes {
        release {
            signingConfig signingConfigs.debug
            minifyEnabled false
            shrinkResources false
        }
        debug {
            debuggable true
        }
    }

    kotlinOptions {
        jvmTarget = '17'
    }

    packagingOptions {
        resources {
            excludes += ['META-INF/DEPENDENCIES', 'META-INF/LICENSE', 'META-INF/LICENSE.txt', 'META-INF/NOTICE', 'META-INF/NOTICE.txt']
        }
    }
}

flutter {
    source '../..'
}

dependencies {
    implementation "org.jetbrains.kotlin:kotlin-stdlib-jdk8"
}
