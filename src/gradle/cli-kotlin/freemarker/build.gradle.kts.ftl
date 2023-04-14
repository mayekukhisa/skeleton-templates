<#-- 
 ~ Copyright 2023 Mayeku Khisa
 ~
 ~ Use of this source code is governed by a MIT license as appearing in the
 ~ LICENSE file included in the root of this source tree.
 -->
plugins {
   application
   id("com.diffplug.spotless") version "6.12.0"
   kotlin("jvm") version "1.8.10"
}

kotlin {
   jvmToolchain(17)
}

spotless {
   /*
    Spotless does not yet support .editorconfig settings with Ktlint.
    We have to provide them manually.
    */
   mapOf(
      "indent_size" to 3,
      "max_line_length" to 120,
      "ij_kotlin_allow_trailing_comma" to true,
      "ij_kotlin_allow_trailing_comma_on_call_site" to true,
   ).let {
      kotlin {
         target("**/*.kt")
         targetExclude("**/build/**/*.kt")
         ktlint().editorConfigOverride(it)
      }

      kotlinGradle {
         target("**/*.kts")
         targetExclude("**/build/**/*.kts")
         ktlint().editorConfigOverride(it)
      }
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
