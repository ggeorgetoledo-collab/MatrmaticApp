# MatematicApp

Página web y app Android para hacer matemática con el teléfono (iPhone y Android): medir el mundo real y llevar esos datos a un modelo matemático. Es la app hermana de [FisicApp](https://github.com/ggeorgetoledo-collab/FisicApp).

**Cámara**
- **Alturas** (trigonometría): se apunta la cruz del visor a la punta de un árbol o edificio. *Con distancia*: h = h₀ + d · tan α. *Dos ángulos* (cuando no se llega a la base): h = h₀ + s · tan α₁ · tan α₂ / (tan α₁ − tan α₂). Cada registro guarda el desarrollo del cálculo y una foto del visor.
- **Funciones en fotos**: sobre una foto (un puente, un arco, el chorro de agua) se marcan puntos con lupa, se fija el origen y la escala, y se ajusta un modelo **lineal**, **cuadrático** o **exponencial** con R². Entrega pendiente y coeficiente de posición, vértice, eje de simetría, discriminante y ceros, o valor inicial y factor de crecimiento.

**Sensores de movimiento**
- **Pendientes** (función afín): con el teléfono apoyado en una rampa entrega el ángulo θ, la pendiente m = tan θ, el porcentaje y la razón 1 : n, comparado con la referencia de accesibilidad (8 %).

**Azar**
- **Dados y monedas** (probabilidad): moneda, dado o suma de dos dados, simulados o registrando lanzamientos reales. Tabla de frecuencias, gráfico de frecuencia relativa frente a probabilidad teórica (regla de Laplace) y gráfico de convergencia (ley de los grandes números).

Todo queda en **Datos**: tablas con CSV, fotos y experimentos guardados.

Ábrela en: https://ggeorgetoledo-collab.github.io/MatrmaticApp/

**App Android (APK):** https://github.com/ggeorgetoledo-collab/MatrmaticApp/releases/download/apk/MatematicApp.apk

El APK se compila solo con GitHub Actions (`.github/workflows/apk.yml`) usando Capacitor: `apk/preparar.sh` arma el proyecto Android desde `index.html`, con permiso de cámara, ícono propio y pantalla siempre encendida. `apk/iconos.py` genera los íconos de `apk/res`.

Profesor Gonzalo George Toledo
