# cafe_apps2go

## Iniciar firebase en fluter como backend

### Agregar dependencias en pubspec.yaml:
- En el archivo pubspec.yaml agregar las siguiente líneas
  
  dependencies:
    firebase_core: "0.7.0"
    firebase_auth: "^0.20.1"
    cloud_firestore: "^0.16.0+1"

### Para Android:
- agregar en **android/build.gradle**
  
  dependencies {
    // ... otras dependencias
    classpath 'com.google.gms:google-services:4.3.3'
  }
  
- agregar en **android/app/build.gradle**
  
  apply plugin: 'com.google.gms.google-services'
  
  android {
    defaultConfig {
        // ... otras configuraciones
        minSdkVersion 16
        targetSdkVersion 28
        multiDexEnabled true
      }
  }

  dependencies {
    implementation 'com.android.support:multidex:1.0.3'
  }
