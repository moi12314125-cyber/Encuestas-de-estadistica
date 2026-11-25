# Encuesta UTI · FMO con Supabase

Contenido del proyecto:
- `index.html`  → la encuesta pública (envía las respuestas a Supabase).
- `resultados.html` → panel privado con porcentajes, gráficos y estadística descriptiva.
- `admin.sql` → da permiso de lectura solo al administrador.
- `setup.sql` → crea la tabla `respuestas` y sus reglas de seguridad.
- `logo.png` → escudo (lo usa el panel de resultados).

## 1. Crear el proyecto en Supabase
1. Entra a https://supabase.com, crea una cuenta y un proyecto nuevo (plan gratuito).
2. **SQL Editor** → New query → pega todo `setup.sql` → **Run**.
   (Si ya lo ejecutaste, no lo repitas: la tabla ya existe.)

## 2. Conectar la encuesta
En **Project Settings → API Keys** copia:
- **Project URL** (está en Project Overview) → `SUPABASE_URL`
- **Publishable key** (`sb_publishable_...`) → `SUPABASE_KEY`

Pégalos en las líneas 57 y 58 de `index.html`.
**Nunca uses la clave `secret` ni `service_role`** en la página.

## 3. Publicar la encuesta en GitHub Pages
Sube `index.html` (y `logo.png`) a un repositorio → Settings → Pages → Branch `main` → Save.
**No subas `resultados.html` si no quieres que otros lo vean**; úsalo solo en tu computadora.

## 4. Crear el administrador (para ver las estadísticas)
1. Abre `admin.sql`, cambia `TU_CORREO@gmail.com` por tu correo y ejecútalo en **SQL Editor**.
2. Supabase → **Authentication → Users → Add user → Create new user**: escribe ese mismo correo y una contraseña, y marca **Auto Confirm User**.
3. En **Authentication → Sign In / Providers** desactiva **Allow new users to sign up**
   (el nombre puede variar un poco). Así nadie más puede crear cuentas.

## 5. Ver las estadísticas
1. Pega `SUPABASE_URL` y `SUPABASE_KEY` (las mismas de `index.html`) al inicio del script de `resultados.html`.
2. Abre `resultados.html`, entra con tu correo y contraseña de administrador.
3. Verás totales, porcentajes, gráficos, media, mediana y desviación estándar. **Actualizar datos** trae las respuestas nuevas.
4. **Guardar como PDF / imprimir** genera el informe.

Solo el correo del administrador puede leer la tabla; el público solo puede enviar respuestas.
Como alternativa sin conexión, `resultados.html` también acepta el CSV exportado desde Table Editor → Export.
