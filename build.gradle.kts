/*
 * Copyright 2023 Mayeku Khisa
 *
 * Use of this source code is governed by a MIT license as appearing in the
 * LICENSE file included in the root of this source tree.
 */
import com.diffplug.spotless.extra.wtp.EclipseWtpFormatterStep

repositories {
   mavenCentral()
}

plugins {
   distribution
   id("com.diffplug.spotless") version "6.23.3"
}

spotless {
   kotlinGradle {
      target("**/*.kts")
      targetExclude("**/src/**/*.kts", "**/build/**/*.kts")
      ktlint()
      licenseHeaderFile(
         rootProject.file("spotless/copyright/kotlin.txt"),
         "^(?![\\/ ]\\*).",
      ).updateYearWithLatest(true)
   }

   with(rootProject.file("spotless/config/prettierrc.yml")) {
      json {
         target("**/*.json")
         targetExclude("**/build/**/*.json")
         prettier().configFile(this@with)
      }

      format("Markdown") {
         target("**/*.md")
         targetExclude("**/build/**/*.md")
         prettier().configFile(this@with)
      }

      format("Yaml") {
         target("**/*.yml")
         targetExclude("**/build/**/*.yml")
         prettier().configFile(this@with)
      }
   }

   kotlin {
      target("**/src/**/*.kt", "**/src/**/*.kts")
      ktlint()
   }

   format("FreeMarker") {
      target("**/src/**/*.ftl")
      licenseHeaderFile(
         rootProject.file("spotless/copyright/freemarker.txt"),
         "^(?!<#| ~| -).",
      ).updateYearWithLatest(true)
   }

   format("Xml") {
      target("**/src/**/*.xml")
      eclipseWtp(EclipseWtpFormatterStep.XML).configFile(
         rootProject.file("spotless/config/xml.prefs"),
      )
   }
}

version = rootProject.file("version.txt").readText().trim()

distributions {
   main {
      contents {
         from(".") {
            include("src/**", "catalog.json", "LICENSE", "version.txt")
         }
      }
   }
}

tasks {
   named<Tar>("distTar") {
      compression = Compression.GZIP
      archiveExtension.set("tar.gz")
   }
}
