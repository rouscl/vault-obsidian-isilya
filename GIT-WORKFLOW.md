# Flujo git simple con Codex

Este documento define como trabajar con git en este vault con la menor friccion posible: la usuaria pide el resultado final en lenguaje normal y Codex traduce eso a pasos git trazables.

## Principio base

La usuaria no tiene que pedir ramas, commits, staging ni mensajes tecnicos salvo que quiera. Por defecto, Codex debe encargarse de:

1. Entender la funcionalidad o resultado final pedido.
2. Revisar `GUIDELINES.md` antes de tocar el vault.
3. Comprobar el estado git antes de editar.
4. Separar los cambios nuevos de cualquier cambio previo de la usuaria.
5. Hacer cambios pequeños y coherentes.
6. Verificar lo que sea razonable verificar.
7. Si se ha subido a GitHub, comprobar que CI ha terminado en verde.
8. Explicar al cierre que se ha cambiado, que queda pendiente y que comandos git se han ejecutado.

## Politica automatica

La usuaria no debe tener que decidir si se crea una rama, si se hace merge, si se prepara staging o como se llama un commit. Codex debe tomar esas decisiones de forma conservadora y explicarlas al final.

Por defecto:

- Si la tarea cambia contenido del vault o su configuracion de trabajo, Codex debe usar una rama de trabajo salvo que ya haya una rama adecuada.
- Si hay cambios previos de la usuaria, Codex debe protegerlos y no mezclarlos con la tarea actual.
- Si la tarea queda completa y verificada, Codex debe dejarla lista para revision con commits claros cuando sea seguro hacerlo.
- Si hay remoto configurado y la usuaria ha pedido subir o publicar el trabajo, Codex debe hacer push de la rama.
- Los merges no son decision de la usuaria por defecto: Codex solo debe proponerlos o ejecutarlos cuando el estado del repo lo haga seguro y util. Si hay conflictos o riesgo de mezclar trabajo ajeno, debe parar y explicar el bloqueo.

La parte importante no es que la usuaria controle git; es que cada cambio pueda reconstruirse despues sin hacer espiritismo forense.

## Ramas

Usar una rama por unidad de trabajo cuando la tarea vaya mas alla de una edicion menor. El nombre debe ser corto y legible:

```text
codex/<area>-<resultado>
```

Ejemplos:

```text
codex/sesion-33-cronica
codex/actualizar-npcs-castimandra
codex/revisar-lineas-argumentales
```

Si ya hay cambios locales antes de empezar, Codex debe:

- no perderlos;
- no revertirlos;
- no mezclarlos en commits nuevos salvo permiso explicito;
- avisar si impiden crear o cambiar de rama con seguridad.

## Commits verbosos

Un commit debe representar una unidad entendible de resultado, no una lista de microacciones. Debe ser especialmente verboso en el cuerpo para permitir trazabilidad completa si algo sale mal.

Formato recomendado del titulo:

```text
<tipo>: <resultado en infinitivo o sustantivo claro>
```

Tipos habituales:

- `cronica`: sesiones, resumen narrativo o continuidad de partida.
- `canon`: cambios en NPCs, lugares, panteon, casas, objetos o tramas.
- `gestion`: plantillas, indices, normas o estructura de trabajo.
- `fix`: correcciones concretas.

Ejemplos:

```text
cronica: documentar sesion 33
canon: actualizar consecuencias en Castimandra
gestion: definir flujo git simple
fix: corregir enlaces de Alyre
```

El cuerpo del commit es obligatorio para cambios de contenido, canon, estructura o automatizacion. Debe incluir:

```text
Motivo:
- Que se queria conseguir.
- Por que se toca esta parte del vault.

Cambios:
- Que notas, carpetas o reglas se tocaron.
- Que se ha dejado explicitamente fuera.

Verificacion:
- Que se reviso para evitar romper continuidad, enlaces o estructura.
- Que comprobaciones automaticas o manuales se ejecutaron.

Riesgos:
- Dudas, limites de la verificacion o supuestos importantes.
```

Si el commit afecta a canon o cronica, el cuerpo debe mencionar la fuente usada: `resumen.md`, el vault existente, `Trasfondo Alyre.md` o indicacion directa de la usuaria.

## Staging

Codex debe preparar para commit solo los archivos relacionados con la tarea actual. En especial:

- No incluir cambios previos de la usuaria sin permiso.
- No incluir `.obsidian/` salvo que la tarea sea configuracion de Obsidian.
- No incluir imagenes nuevas salvo que sean parte explicita del resultado.
- No incluir PDFs de origen salvo peticion expresa.

Antes de cerrar con commit, Codex debe revisar el diff de lo que va a incluir.

## CI

El repositorio debe tener comprobaciones automaticas para reducir friccion y obligar a dejar rastro util:

- `Commit trace`: comprueba que los commits tengan titulo valido y cuerpo con `Motivo:`, `Cambios:`, `Verificacion:` y `Riesgos:`.
- `Vault validation`: comprueba que existen los documentos de control principales y que los enlaces Obsidian apuntan a notas o archivos existentes.

Si CI falla, Codex debe tratarlo como parte normal del cierre de la tarea: leer el fallo, corregir lo que proceda y volver a verificar. No debe pedir a la usuaria que decida detalles tecnicos salvo que el fallo revele una decision de canon o una mezcla peligrosa de cambios.

Codex no debe decir que una tarea subida a GitHub esta terminada, cerrada o bien hasta que los workflows de GitHub Actions asociados a ese commit hayan terminado correctamente. Las validaciones locales sirven para anticipar problemas, pero no sustituyen el verde real de CI.

## Trazabilidad al final

Cuando Codex termine una tarea con git, debe informar de forma breve:

- rama usada;
- commit creado, si lo hay;
- archivos principales modificados;
- verificacion realizada;
- estado de CI en GitHub, si se ha hecho push;
- cambios existentes que se dejaron fuera, si los habia.

Si no se ha podido ejecutar git, debe decir exactamente que ha fallado y que accion manual queda pendiente.

## Reglas de seguridad

- Nunca usar `git reset --hard`, `git checkout -- <archivo>` ni comandos destructivos sin permiso explicito.
- No reescribir historial (`rebase`, `commit --amend`, `push --force`) salvo peticion expresa.
- Si hay conflicto entre trazabilidad git y continuidad del vault, prima la continuidad del vault.
- Si una decision de canon es ambigua, parar y preguntar antes de consolidarla en commit.
