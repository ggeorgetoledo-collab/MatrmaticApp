#!/usr/bin/env bash
# Prepara el proyecto Android de MatematicApp (Capacitor) a partir de index.html.
# Uso: bash apk/preparar.sh   (luego: cd android && ./gradlew assembleRelease ...)
set -euo pipefail
cd "$(dirname "$0")/.."

rm -rf www && mkdir -p www && cp index.html www/
[ -d android ] || npx cap add android

# Ícono y pantalla de carga
cp -r apk/res/. android/app/src/main/res/

# Permisos: cámara (Alturas y fotos) y ubicación (Área del terreno)
M=android/app/src/main/AndroidManifest.xml
add(){ grep -q "$1" "$M" || sed -i "s|<uses-permission android:name=\"android.permission.INTERNET\" />|&\\n    $2|" "$M"; }
add 'permission.CAMERA' '<uses-permission android:name="android.permission.CAMERA" />'
add 'permission.ACCESS_FINE_LOCATION' '<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />'
add 'permission.ACCESS_COARSE_LOCATION' '<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />'
add 'hardware.camera"' '<uses-feature android:name="android.hardware.camera" android:required="false" />'
add 'hardware.location.gps' '<uses-feature android:name="android.hardware.location.gps" android:required="false" />'

# La pantalla no se apaga mientras la app está abierta
A=$(find android/app/src/main/java -name MainActivity.java)
cat > "$A" <<'JAVA'
package cl.matematicapp.app;

import android.os.Bundle;
import android.view.WindowManager;
import com.getcapacitor.BridgeActivity;

public class MainActivity extends BridgeActivity {
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
    }
}
JAVA

# Número de versión (en GitHub Actions, el número de compilación)
N=${VERSION_CODE:-1}
sed -i -E "s/versionCode [0-9]+/versionCode $N/; s/versionName \"[^\"]*\"/versionName \"1.$N\"/" android/app/build.gradle

npx cap sync android
echo "Proyecto Android listo (versión 1.$N)"
