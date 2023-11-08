<#-- 
 ~ Copyright 2023 Mayeku Khisa
 ~
 ~ Use of this source code is governed by a MIT license as appearing in the
 ~ LICENSE file included in the root of this source tree.
 -->
plugins {
   application
   id("com.diffplug.spotless") version "6.22.0"
   kotlin("jvm") version "1.9.20"
}

kotlin {
   jvmToolchain(17)
}

spotless {
   kotlin {
      target("**/*.kt")
      targetExclude("**/build/**/*.kt")
      ktlint()
   }

   kotlinGradle {
      target("**/*.kts")
      targetExclude("**/build/**/*.kts")
      ktlint()
   }

   with(rootProject.file("spotless/config/prettierrc.yml")) {
      json {
         target("**/*.json")
         targetExclude("**/build/**/*.json")
         prettier().configFile(this@with)
      }

      format("Yaml") {
         target("**/*.yml")
         targetExclude("**/build/**/*.yml")
         prettier().configFile(this@with)
      }
   }
}

repositories {
   mavenCentral()
}

dependencies {
   testImplementation(kotlin("test"))
}

group = "${packageName}"
version = "0.1.0"

application {
   mainClass.set("${r"${"}project.group}.MainKt")
}

tasks {
   named<Test>("test") {
      useJUnitPlatform()
   }
}
