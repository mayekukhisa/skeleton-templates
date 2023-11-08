import com.diffplug.spotless.extra.wtp.EclipseWtpFormatterStep

plugins {
   val agpVersion = "8.1.3"
   id("com.android.application") version agpVersion apply false
   id("com.android.library") version agpVersion apply false

   id("com.diffplug.spotless") version "6.22.0"
   kotlin("android") version "1.9.20" apply false
}

spotless {
   mapOf(
      "ktlint_standard_comment-wrapping" to "disabled",
      "ktlint_standard_discouraged-comment-location" to "disabled",
      "ktlint_standard_function-naming" to "disabled",
   ).let { ktlintRules ->
      kotlin {
         target("**/*.kt")
         targetExclude("**/build/**/*.kt")
         ktlint().editorConfigOverride(ktlintRules)
      }

      kotlinGradle {
         target("**/*.kts")
         targetExclude("**/build/**/*.kts")
         ktlint().editorConfigOverride(ktlintRules)
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
