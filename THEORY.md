# MARCO TEÓRICO: PSICOLOGÍA COGNITIVA APLICADA A CIBERSEGURIDAD
## Fundamentación del proyecto SE-SCANNER

Este documento detalla los fundamentos científicos y operacionales que sustentan el motor heurístico de **SE-SCANNER**. El objetivo es proporcionar una base teórica para la detección de vectores de ataque en ingeniería social mediante la operacionalización de procesos psicológicos.

---

## 1. ARQUITECTURA DEL JUICIO Y TOMA DE DECISIONES

El proyecto se fundamenta en la teoría de los procesos duales descrita por el Premio Nobel **Daniel Kahneman** (2011), la cual explica cómo el cerebro procesa la información y evalúa el riesgo:

* **SISTEMA 1 (rápido):** opera de manera automática y heurística. Es emocional, requiere mínimo esfuerzo y es propenso a sesgos. Es el sistema responsable de las reacciones inmediatas ante una amenaza percibida o una oportunidad urgente.
* **SISTEMA 2 (lento):** responsable del pensamiento lógico, analítico y el cálculo complejo. Requiere atención consciente y esfuerzo. Es el sistema que debería verificar la validez de un remitente o la coherencia de una solicitud financiera.

**VULNERABILIDAD TÉCNICA:** La ingeniería social opera mediante el **"secuestro cognitivo" del Sistema 1**. El atacante introduce disparadores (triggers) diseñados para generar una respuesta emocional (miedo, codicia, urgencia) que inhibe la activación del Sistema 2, impidiendo que la víctima realice un análisis crítico del mensaje.

---

## 2. PRINCIPIOS DE PERSUASIÓN COMO EXPLOITS PSICOLÓGICOS

Basado en los trabajos de **Robert Cialdini** (1984), el motor de **SE-SCANNER** identifica indicadores de compromiso (IoC) semánticos vinculados a los "atajos" mentales más utilizados en el fraude digital:

### [A] ESCASEZ (operacionalizado como urgencia)
Al imponer una restricción de tiempo o disponibilidad, el atacante induce ansiedad. La ciencia cognitiva demuestra que la ansiedad reduce la capacidad de la memoria de trabajo, forzando al usuario a tomar decisiones apresuradas bajo el dominio del Sistema 1.
* *IoC detectados:* términos de inmediatez y consecuencias irreversibles.

### [B] AUTORIDAD
Se explota la tendencia biológica y social de sumisión ante jerarquías legítimas. El miedo a la sanción o el respeto al estatus produce una obediencia automática que bypasses el razonamiento lógico.
* *IoC detectados:* cargos ejecutivos, entidades regulatorias y terminología legal.

### [C] RECIPROCIDAD (operacionalizado como recompensa)
La expectativa de un beneficio gratuito dispara la liberación de dopamina, un neurotransmisor que nubla el juicio crítico y reduce la percepción de riesgo en favor de la recompensa esperada.
* *IoC detectados:* bonos, beneficios exclusivos y obsequios no solicitados.

---

## 3. EL CONCEPTO DE TRIAJE COGNITIVO (CAPA 8)

En ciberseguridad operativa, el triaje es el proceso de clasificación de incidentes por su nivel de riesgo. **SE-SCANNER** traslada este concepto a la **Capa 8 (el factor humano)**.

En lugar de analizar la reputación de una IP, la herramienta analiza la **reputación de la intención** oculta en el lenguaje. Al identificar los principios de Cialdini en un texto, el script permite al analista realizar un screening rápido de la carga cognitiva del ataque, determinando si el mensaje está diseñado para engañar al sistema operativo humano.

### Selección de vectores
Se han priorizado estos tres vectores (escasez, autoridad, reciprocidad) debido a que su impacto en el texto corto es inmediato y medible mediante heurísticas semánticas. Otros principios como la *simpatía* o la *prueba social* requieren una interacción prolongada o contexto social que excede el alcance de un análisis forense de mensaje único.

---

## 4. REFERENCIAS BIBLIOGRÁFICAS

1.  **Cialdini, R. B. (1984).** *Influence: The Psychology of Persuasion*. Harper Business.
2.  **Kahneman, D. (2011).** *Thinking, Fast and Slow*. Farrar, Straus and Giroux.
3.  **Hadnagy, C. (2010).** *Social Engineering: The Art of Human Hacking*. Wiley.

---
**Autor:** F. Ubilla (@fivur-me)
**Licencia:** MIT
