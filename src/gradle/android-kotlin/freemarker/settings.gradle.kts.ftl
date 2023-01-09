<#-- 
 ~ Copyright 2023 Mayeku Khisa
 ~
 ~ Use of this source code is governed by a MIT license as appearing in the
 ~ LICENSE file included in the root of this source tree.
 -->
pluginManagement {
   repositories {
      gradlePluginPortal()
      google()
      mavenCentral()
   }
}

dependencyResolutionManagement {
   repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
   repositories {
      google()
      mavenCentral()
   }
}

rootProject.name = "${projectName}"
include(":app")
