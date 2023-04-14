<#-- 
 ~ Copyright 2023 Mayeku Khisa
 ~
 ~ Use of this source code is governed by a MIT license as appearing in the
 ~ LICENSE file included in the root of this source tree.
 -->
plugins {
   id("com.android.application")
   kotlin("android")
}

android {
   namespace = "${packageName}"
   compileSdk = 33

   defaultConfig {
      applicationId = namespace
      minSdk = 24
      targetSdk = compileSdk
      versionCode = 1
      versionName = "0.1.0"

      testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"

      vectorDrawables {
         useSupportLibrary = true
      }
   }

   buildTypes {
      getByName("release") {
         isMinifyEnabled = true
         proguardFiles(
            getDefaultProguardFile("proguard-android.txt"),
            "proguard-rules.pro",
         )
      }
   }

   compileOptions {
      sourceCompatibility = JavaVersion.VERSION_17
      targetCompatibility = JavaVersion.VERSION_17
   }

   kotlinOptions {
      jvmTarget = "17"
   }

   buildFeatures {
      compose = true
   }

   composeOptions {
      kotlinCompilerExtensionVersion = "1.4.4"
   }

   packaging {
      resources {
         excludes += "/META-INF/{AL2.0,LGPL2.1}"
      }
   }
}

dependencies {
   val composeBom = platform("androidx.compose:compose-bom:2023.04.00")
   implementation(composeBom)
   androidTestImplementation(composeBom)

   implementation("androidx.activity:activity-compose:1.7.0")
   implementation("androidx.compose.material3:material3")
   implementation("androidx.compose.ui:ui")
   implementation("androidx.compose.ui:ui-tooling-preview")
   implementation("androidx.core:core-ktx:1.10.0")
   implementation("androidx.lifecycle:lifecycle-runtime-ktx:2.6.1")
   implementation("com.google.accompanist:accompanist-systemuicontroller:0.30.1")

   debugImplementation("androidx.compose.ui:ui-test-manifest")
   debugImplementation("androidx.compose.ui:ui-tooling")

   testImplementation("junit:junit:4.13.2")

   androidTestImplementation("androidx.compose.ui:ui-test-junit4")
   androidTestImplementation("androidx.test.espresso:espresso-core:3.5.1")
   androidTestImplementation("androidx.test.ext:junit-ktx:1.1.5")
}
