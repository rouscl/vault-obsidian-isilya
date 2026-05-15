# Guidelines generales del vault y del proyecto

Este documento define cómo trabajar con el vault de Obsidian de Isilya y con el proyecto en general. Debe revisarse al inicio de cada intervención en este proyecto, antes de crear, editar, mover o resumir contenido.

## Regla obligatoria para Codex

- Al entrar a trabajar en este proyecto, revisar siempre este archivo antes de tocar el vault o los archivos relacionados.
- Si una petición del usuario contradice estas guidelines, seguir la petición del usuario y, si procede, proponer actualizar este documento.
- No asumir que el vault está completo: tratarlo como canon vivo y contrastar la información con las notas existentes.

## Naturaleza del proyecto

- El vault es una base de conocimiento narrativa para una campaña ambientada en Isilya.
- El contenido combina crónica de sesiones, lugares, NPCs, personajes, panteón, casas nobles, imágenes y plantillas.
- El objetivo principal es conservar continuidad, coherencia interna y facilidad de consulta durante la campaña.

## Estructura del vault

Mantener la organización actual salvo instrucción explícita:

- `0 - templates`: plantillas para notas nuevas.
- `0 - img`: imágenes y recursos visuales del vault.
- `1 - Crónica`: sesiones jugadas, ordenadas por número.
- `2 - Lugares`: regiones, ciudades, asentamientos y ubicaciones.
- `3 - NPCs`: personajes no jugadores.
- `4 - Personajes`: personajes jugadores o fichas centrales.
- `5 - Panteón`: dioses, entidades divinas y culto.
- `6 - Casas nobles`: casas, linajes y facciones nobiliarias.
- `7 - Objetos importantes`: objetos mágicos, reliquias, cartas, armas, artefactos y recursos relevantes para la continuidad.
- `8 - Misiones`: encargos, objetivos narrativos activos y misiones cerradas que convenga seguir de forma independiente.
- `9 - Líneas argumentales`: tramas abiertas, conflictos de largo recorrido, misterios, profecías y desarrollos recurrentes.
- `10 - Gestión y recursos`: notas prácticas de jugabilidad, organización del vault, recordatorios de mesa y recursos de consulta que no sean historia dentro del mundo.

Si una nota encaja en varias categorías, elegir la carpeta donde sea más útil consultarla y enlazar desde las demás notas relacionadas.

No crear una carpeta específica para facciones no nobles. Integrarlas en la categoría que mejor encaje según su función en el vault.

## Estilo de escritura

- Escribir siempre en español de España.
- Traducir al español de España cualquier texto fuente salvo nombres propios, lenguajes fantásticos, términos de ambientación que funcionen mejor en otro idioma o terminología en inglés que deba mantenerse por convención.
- Mantener un tono de crónica fantástica claro, evocador y concreto, pero sin sobreactuar la épica.
- Evitar párrafos artificialmente cortos, frases sueltas dramáticas o cortes de ritmo tipo "Pero la calma no duró" si no aportan nada real a la escena.
- Priorizar una narrativa fluida, natural y bien hilada, con párrafos desarrollados cuando la escena lo pida.
- Usar frases breves solo cuando tengan una función narrativa clara: impacto, cambio de ritmo, revelación o cierre.
- Evitar especulaciones dentro de la narrativa principal.
- Priorizar hechos jugados, información establecida y percepciones explícitas de los personajes.
- Separar con claridad lo que es canon, rumor, sospecha o interpretación.
- Recoger las especulaciones, teorías o interpretaciones dudosas en un apartado final propio, nunca mezcladas como si fueran hechos del resumen.
- Escribir la crónica con narrador omnisciente.
- Evitar reescribir el estilo de notas antiguas salvo que el usuario pida una homogeneización.
- No borrar matices narrativos importantes para abreviar una nota.
- Usar nombres propios de forma consistente con las notas existentes.

## Canon y continuidad

- El documento fuente para actualizar el vault será siempre el archivo Markdown llamado `resumen.md`, alojado en la carpeta raíz del proyecto: `C:\Users\rousc\Documents\New project\resumen.md`.
- Siempre que se vaya a crear contenido nuevo o añadir información nueva al vault, extraer la información relevante de `resumen.md` y usarla como fuente principal de trabajo.
- Siempre que se vaya a consultar, revisar, contrastar o responder sobre información que ya esté en el vault, usar el propio vault como fuente.
- Para consultas sobre el pasado de [[Alyre A'Dariir|Alyre]] anterior al inicio de la crónica, usar también el archivo Markdown `Trasfondo Alyre.md`, alojado en la carpeta raíz del proyecto.
- Regla simple: para crear o añadir, consultar `resumen.md`; para revisar o acceder a información existente, consultar el vault.
- Si hay otros documentos en la raíz del proyecto, no usarlos como fuente para actualizar el vault salvo instrucción explícita del usuario. La excepción conocida es `Trasfondo Alyre.md` para información precrónica de Alyre.
- Antes de introducir o modificar información relevante, buscar referencias existentes en el vault.
- Si aparecen versiones contradictorias, no resolverlas inventando: señalar la contradicción o pedir criterio al usuario.
- No cambiar parentescos, alianzas, muertes, revelaciones, geografía, religión o cronología sin comprobar notas relacionadas.
- Cuando una sesión establezca un cambio importante, actualizar o sugerir actualizar las notas afectadas.
- Si una información procede de una sesión concreta, enlazar la sesión cuando sea útil.
- El usuario es la jugadora de [[Alyre A'Dariir|Alyre]], no el DM. No tratar información privada de DM como fuente disponible salvo que aparezca explícitamente en los documentos de trabajo o el usuario la proporcione.

## Enlaces internos

- Usar enlaces Obsidian con doble corchete: `[[Nombre de la nota]]`.
- Usar tags en el frontmatter y enlaces internos; no elegir entre una cosa u otra.
- Enlazar NPCs, lugares, personajes, dioses, casas nobles y facciones cuando aparezcan por primera vez en una sección relevante.
- No saturar cada párrafo con enlaces repetidos si ya está claro el referente.
- Comprobar el nombre exacto de la nota antes de crear enlaces nuevos.
- Si aparece un nombre aparentemente relevante y no tiene nota propia, crearle una nota usando la plantilla de NPCs.
- Si el enlace que se va a añadir no encaja como NPC, revisar primero el resto de plantillas disponibles y usar la que corresponda mejor.
- Si ninguna plantilla existente encaja con la entidad relevante, no inventar una estructura nueva por cuenta propia: mencionar que haría falta una plantilla nueva y validarlo con el usuario antes de crearla.

## Plantillas

Usar las plantillas existentes como base:

- NPCs: `0 - templates/NPC.md`.
- Lugares: `0 - templates/Lugares.md`.
- Personajes: `0 - templates/Ficha de personaje.md`.
- Casas nobles: `0 - templates/Casas nobles.md`.
- Dioses: `0 - templates/Dioses.md`.
- Sesiones: `0 - templates/Sesión.md`.

Al crear notas nuevas, adaptar la plantilla sin dejar campos de `?` innecesarios si se conoce la información. Si un dato no existe todavía, mantenerlo como desconocido de forma limpia.

Para nombres relevantes sin nota previa, la opción por defecto es crear una nota de NPC. Solo usar otra plantilla si la entidad encaja claramente mejor como lugar, personaje, casa noble, dios, sesión u otra categoría ya existente.

Las carpetas `7 - Objetos importantes`, `8 - Misiones`, `9 - Líneas argumentales` y `10 - Gestión y recursos` existen como categorías del vault, pero no tienen plantilla específica todavía. Si una nota nueva de estas categorías necesita una estructura propia, proponer una plantilla nueva y validarla con el usuario antes de crearla.

## Crónica de sesiones

Para nuevas sesiones o resúmenes:

- Mantener la estructura actual: frontmatter, personajes que aparecen, lugares visitados, información relevante y capítulo narrativo.
- Registrar los hechos importantes en formato consultable antes del texto narrativo.
- En la sección narrativa, conservar causalidad, tono y consecuencias sin introducir especulaciones.
- Añadir al final un apartado de especulaciones cuando hayan aparecido hipótesis, teorías o dudas relevantes durante la sesión.
- Si no hay especulaciones relevantes, dejar constancia breve o eliminar el apartado según convenga al formato de la nota.
- Tras procesar una sesión nueva, revisar las especulaciones de sesiones anteriores para comprobar si alguna queda confirmada, descartada o resuelta por los hechos de la sesión recién creada.
- Si una especulación pasada se resuelve en la sesión nueva, registrar la resolución en la sesión nueva y añadir un vínculo a la sesión donde se especuló por primera vez.
- Cuando sea útil para continuidad, actualizar también la especulación original con una nota breve de resolución y un enlace a la sesión donde se resolvió.
- Cerrar con enlaces de navegación si corresponde.
- No adelantar información que los personajes no conocen salvo que la fuente indique claramente que es una escena fuera de cámara.
- Marcar una escena como fuera de cámara solo si el documento fuente usa una formulación explícita como "escena que nuestros personajes no ven", "fuera de cámara", "en otra parte", o si el texto deja claro que los personajes no la presencian. Si hay duda, no asumirlo y mencionarlo como ambigüedad.

## NPCs y personajes

Para NPCs:

- Distinguir nombre, raza, género, lugar de encuentro y relación con el grupo cuando se conozca.
- Registrar motivaciones, lealtades, secretos revelados y estado actual.
- Actualizar relaciones si cambian durante una sesión.

Para personajes jugadores:

- No alterar trasfondo, vínculos, clase, panteón o eventos personales sin confirmarlo en notas existentes o con el usuario.
- Tratar sus decisiones como canon central de la campaña.

## Lugares

Para lugares:

- Describir función narrativa, rasgos visibles, política, religión, sociedad y conexiones con otros lugares.
- Enlazar sublugares, gobernantes, casas, conflictos y eventos importantes.
- Mantener separadas la descripción objetiva, la información conocida por el grupo y los rumores si esa distinción importa.

## Panteón, casas nobles y facciones

- Tratar dioses, casas y facciones como estructuras con memoria histórica y consecuencias políticas.
- Registrar símbolos, dominios, miembros relevantes, alianzas, enemistades y conflictos activos.
- No simplificar una facción a "buena" o "mala" si las notas muestran ambigüedad.

## Imágenes y recursos

- Guardar recursos visuales dentro de `0 - img` salvo motivo claro para otro lugar.
- Usar embeds de Obsidian como `![[imagen.png]]`.
- No renombrar ni mover imágenes sin actualizar las referencias.
- Si se genera o añade una imagen nueva, usar nombres descriptivos y consistentes.

## Edición técnica

- Mantener los archivos Markdown en UTF-8.
- Respetar frontmatter YAML existente.
- No hacer cambios masivos de formato sin necesidad.
- Evitar tocar `.obsidian` salvo que el usuario pida cambios de configuración.
- Antes de ediciones amplias, revisar notas relacionadas con búsqueda textual.
- No eliminar notas, imágenes o secciones completas sin confirmación explícita.

## Flujo recomendado de trabajo

1. Leer este documento.
2. Determinar si el trabajo consiste en crear/añadir información nueva o en revisar/consultar información existente.
3. Si se crea o añade información nueva, revisar `resumen.md` en la carpeta raíz del proyecto como fuente principal.
4. Si se consulta o revisa información existente, acudir al vault como fuente principal.
5. Si la consulta trata del pasado de [[Alyre A'Dariir|Alyre]] anterior a la crónica, revisar también `Trasfondo Alyre.md`.
6. Identificar las carpetas y notas afectadas.
7. Buscar referencias existentes con nombres, lugares y términos clave cuando la edición pueda afectar a continuidad.
8. Hacer cambios pequeños y coherentes con el estilo local.
9. Tras procesar una sesión nueva, revisar especulaciones pasadas y enlazar cualquier resolución con la sesión donde se formuló por primera vez.
10. Revisar enlaces internos y nombres propios.
11. Señalar dudas de canon, contradicciones o decisiones pendientes.

## Preguntas pendientes para afinar estas guidelines

- No hay preguntas pendientes ahora mismo.
