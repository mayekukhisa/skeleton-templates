import com.diffplug.spotless.extra.wtp.EclipseWtpFormatterStep

plugins {
   alias(libs.plugins.android.application) apply false
   alias(libs.plugins.kotlin.android) apply false
   alias(libs.plugins.diffplug.spotless)
}

spotless {
   mapOf("ktlint_function_naming_ignore_when_annotated_with" to "Composable").let { config ->
      kotlin {
         target("**/*.kt")
         targetExclude("**/build/**/*.kt")
         ktlint().editorConfigOverride(config)
      }

      kotlinGradle {
         target("**/*.kts")
         targetExclude("**/build/**/*.kts")
         ktlint().editorConfigOverride(config)
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
