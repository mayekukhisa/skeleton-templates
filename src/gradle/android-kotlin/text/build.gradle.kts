import com.diffplug.spotless.extra.wtp.EclipseWtpFormatterStep

plugins {
   val agpVersion = "7.3.1"
   id("com.android.application") version agpVersion apply false
   id("com.android.library") version agpVersion apply false

   id("com.diffplug.spotless") version "6.12.0"
   kotlin("android") version "1.7.20" apply false
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

   format("Xml") {
      target("**/*.xml")
      targetExclude("**/build/**/*.xml")
      eclipseWtp(EclipseWtpFormatterStep.XML).configFile(
         rootProject.file("spotless/config/xml.prefs"),
      )
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
