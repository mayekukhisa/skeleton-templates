<#-- 
 ~ Copyright 2023-2024 Mayeku Khisa
 ~
 ~ Use of this source code is governed by a MIT license as appearing in the
 ~ LICENSE file included in the root of this source tree.
 -->
plugins {
   alias(libs.plugins.android.application)
   alias(libs.plugins.kotlin.android)
}

kotlin {
   jvmToolchain(17)
}

android {
   namespace = "${packageName}"
   compileSdk = 34

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
      release {
         isMinifyEnabled = true
         proguardFiles(
            getDefaultProguardFile("proguard-android-optimize.txt"),
            "proguard-rules.pro",
         )
      }
   }

   buildFeatures {
      compose = true
   }

   composeOptions {
      kotlinCompilerExtensionVersion = "1.5.10"
   }

   packaging {
      resources {
         excludes += "/META-INF/{AL2.0,LGPL2.1}"
      }
   }
}

dependencies {
   implementation(platform(libs.androidx.compose.bom))
   implementation(libs.androidx.activity.compose)
   implementation(libs.androidx.core.ktx)
   implementation(libs.androidx.lifecycle.runtime.ktx)
   implementation(libs.androidx.material3)
   implementation(libs.androidx.ui)
   implementation(libs.androidx.ui.tooling.preview)

   debugImplementation(libs.androidx.ui.test.manifest)
   debugImplementation(libs.androidx.ui.tooling)

   testImplementation(libs.junit)

   androidTestImplementation(platform(libs.androidx.compose.bom))
   androidTestImplementation(libs.androidx.espresso.core)
   androidTestImplementation(libs.androidx.junit.ktx)
   androidTestImplementation(libs.androidx.ui.test.junit4)
}
