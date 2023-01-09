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
      minSdk = 21
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
      sourceCompatibility = JavaVersion.VERSION_11
      targetCompatibility = JavaVersion.VERSION_11
   }

   kotlinOptions {
      jvmTarget = "11"
   }

   buildFeatures {
      compose = true
   }

   composeOptions {
      kotlinCompilerExtensionVersion = "1.3.2"
   }

   packagingOptions {
      resources {
         excludes += "/META-INF/{AL2.0,LGPL2.1}"
      }
   }
}

dependencies {
   val composeVersion = "1.3.2"

   implementation("androidx.activity:activity-compose:1.6.1")
   implementation("androidx.compose.material3:material3:1.0.1")
   implementation("androidx.compose.ui:ui:$composeVersion")
   implementation("androidx.compose.ui:ui-tooling-preview:$composeVersion")
   implementation("androidx.core:core-ktx:1.9.0")
   implementation("androidx.lifecycle:lifecycle-runtime-ktx:2.5.1")
   implementation("com.google.accompanist:accompanist-systemuicontroller:0.28.0")

   debugImplementation("androidx.compose.ui:ui-test-manifest:$composeVersion")
   debugImplementation("androidx.compose.ui:ui-tooling:$composeVersion")

   testImplementation("junit:junit:4.13.2")

   androidTestImplementation("androidx.compose.ui:ui-test-junit4:$composeVersion")
   androidTestImplementation("androidx.test.espresso:espresso-core:3.5.1")
   androidTestImplementation("androidx.test.ext:junit-ktx:1.1.5")
}
