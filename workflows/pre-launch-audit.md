# Workflow: Pre-Launch Production Audit

Ejecuta este checklist obligatorio antes de publicar cualquier cambio o lanzar un sitio a producción.

## 1. Auditoría Automática y Compilación
```bash
node scripts/audit-site.mjs .
npm run build
```
- **Requisito:** 0 errores de TypeScript/compilación y 0 alertas críticas en el auditor.

## 2. Checklist Rápido de Calidad
- [ ] **Visual:** ¿Se eliminaron fuentes cliché (`Inter`/`Space Grotesk`/`Geist`), eyebrows en MAYÚSCULAS, puntos en `H1/H2` y exceso de bordes/badges?
- [ ] **Color:** ¿Hay máximo 3 colores protagonistas y las fotos/productos tienen el mayor peso visual?
- [ ] **Móvil:** ¿Todos los inputs tienen `>=16px`, se usa `100dvh` en lugar de `100vh` y no hay scroll horizontal ni *scroll-hunting*?
- [ ] **Seguridad:** ¿Rutas admin validadas en servidor, cookie `__session` para proxies CDN, UUIDs impredecibles, CORS y rate-limit activos, y cero secretos en el cliente?
- [ ] **Legal:** ¿Existen `/privacidad`, `/cookies` y `/terminos`, sin reseñas inventadas?
- [ ] **SEO:** ¿`robots.txt` bloquea `/admin` y `/api/`, `sitemap.xml` está actualizado, hay exactamente un `<h1>` por página y JSON-LD válido?
- [ ] **Resiliencia:** ¿Si falla la red al enviar un formulario, el usuario conserva sus datos y ve un botón de Reintentar + Contacto directo?

## 3. Despliegue Seguro
1. Compila en local (`npm run build`).
2. Despliega a producción y verifica la URL en vivo.
3. Haz `git add`, `git commit` y `git push` para respaldo y trazabilidad.
4. En el día 1 de lanzamiento: registra el sitio en **Google Search Console** (`/sitemap.xml`) y crea el **Google Business Profile** si es un negocio local.
