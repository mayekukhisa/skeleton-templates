<#-- 
 ~ Copyright 2023-2024 Mayeku Khisa
 ~
 ~ Use of this source code is governed by a MIT license as appearing in the
 ~ LICENSE file included in the root of this source tree.
 -->
package ${packageName}.ui.theme

import android.os.Build
import androidx.compose.foundation.isSystemInDarkTheme
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.darkColorScheme
import androidx.compose.material3.dynamicDarkColorScheme
import androidx.compose.material3.dynamicLightColorScheme
import androidx.compose.material3.lightColorScheme
import androidx.compose.runtime.Composable
import androidx.compose.ui.platform.LocalContext

private val darkColorScheme = darkColorScheme(
   primary = purple80,
   secondary = purpleGrey80,
   tertiary = pink80,
)

private val lightColorScheme = lightColorScheme(
   primary = purple40,
   secondary = purpleGrey40,
   tertiary = pink40,
   /*
    Other default colors to override:

    background = Color(0xFFFFFBFE),
    surface = Color(0xFFFFFBFE),
    onPrimary = Color.White,
    onSecondary = Color.White,
    onTertiary = Color.White,
    onBackground = Color(0xFF1C1B1F),
    onSurface = Color(0xFF1C1B1F),
    */
)

@Composable
fun AppTheme(
   isDarkTheme: Boolean = isSystemInDarkTheme(),
   // Dynamic color is available on Android 12+
   isDynamicColor: Boolean = true,
   content: @Composable () -> Unit,
) {
   val colorScheme = when {
      isDynamicColor && Build.VERSION.SDK_INT >= Build.VERSION_CODES.S -> {
         val context = LocalContext.current
         if (isDarkTheme) dynamicDarkColorScheme(context) else dynamicLightColorScheme(context)
      }

      isDarkTheme -> darkColorScheme
      else -> lightColorScheme
   }

   MaterialTheme(colorScheme = colorScheme, typography = typography, content = content)
}
