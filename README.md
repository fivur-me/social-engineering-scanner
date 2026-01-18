# SE-SCANNER

![Version](https://img.shields.io/badge/release-v1.0-blue) ![License](https://img.shields.io/badge/license-MIT-green) ![Type](https://img.shields.io/badge/type-Training_%26_Triage-purple)

Motor heurístico de análisis cognitivo aplicado a ingeniería social — herramienta CLI para triaje operativo y entrenamiento cognitivo de analistas.

---

## Tabla de contenidos

- [Descripción técnica](#descripción-técnica)  
- [Doble propósito](#doble-propósito)  
  - [Dimensión operativa (triaje)](#dimensión-operativa-triaje)  
  - [Dimensión formativa (entrenamiento)](#dimensión-formativa-entrenamiento)  
- [Threat model](#threat-model)  
- [Vectores de análisis (base Cialdini)](#vectores-de-análisis-base-cialdini)  
- [Características técnicas](#características-técnicas)  
- [Ejemplo de ejecución](#ejemplo-de-ejecución)  
- [Instalación](#instalación)  
- [Alcance y limitaciones](#alcance-y-limitaciones)  
- [Uso ético](#uso-ético)  
- [Autor y licencia](#autor-y-licencia)

---

## Descripción técnica

SE-SCANNER es una herramienta CLI de doble propósito: triaje operativo para incidentes de ingeniería social y plataforma de entrenamiento cognitivo para analistas (Blue Team). Opera sobre la capa semántica para identificar patrones lingüísticos que explotan sesgos cognitivos humanos; el foco está en la intención psicológica, no en malware.

---

## Doble propósito

### Dimensión operativa (triaje)
- Evaluación rápida de correos sin payload técnico detectable.  
- Identificación de indicadores de compromiso semánticos (IoC) en BEC / CEO Fraud.  
- Apoyo a decisiones tempranas de escalamiento en un SOC.

### Dimensión formativa (entrenamiento)
- Augmentación cognitiva: el analista internaliza mecanismos del atacante.  
- Explicabilidad: cada alerta detalla el principio psicológico y su evidencia textual.  
- Entrena al analista para reconocer patrones sin dependencia absoluta de la herramienta.

---

## Threat model

Ataca correos de ingeniería social (BEC / CEO Fraud / Spear Phishing) que:
- No contienen malware ni adjuntos maliciosos.  
- Evaden filtros tradicionales (SEG, AV, reputación).  
- Dependen de manipulación cognitiva del receptor humano.

---

## Vectores de análisis (base Cialdini)

- Escasez  
  - Mecanismo: urgencia artificial.  
  - Impacto: bloqueo del juicio crítico; decisiones impulsivas.

- Autoridad  
  - Mecanismo: explotación de jerarquías y roles.  
  - Impacto: obediencia automática (efecto Click-Whirr).

- Reciprocidad  
  - Mecanismo: ofrecimiento de beneficios no solicitados.  
  - Impacto: reducción del umbral de sospecha por deuda moral percibida.

---

## Características técnicas

- Detección de IoC semánticos mediante patrones lingüísticos.  
- Normalización defensiva (ASCII folding) para neutralizar evasión por tildes/caracteres.  
- Reporte educativo que enlaza evidencia textual con principios psicológicos.  
- Score heurístico acumulativo para estimación preliminar de riesgo.

---

## Ejemplo de ejecución

```bash
$ ./se_scanner.sh
# Seleccione fuente de evidencia:
# 1) Payload de prueba (vector 'CEO Fraud')
# 2) Entrada manual (pegar bloque de texto)
# 3) Importar artefacto (.txt / .eml)
# 4) Salir
# >> Ingrese opción (1-4): 2
#
# Resultado del análisis:
# [!] ALERTA: Vector de engaño [ESCASEZ]
#   > Objetivo: bloqueo del juicio crítico mediante urgencia temporal
#   > IoC detectados: 'hoy', 'inmediato', 'plazo'
# --------------------------------------------------------
# DICTAMEN PRELIMINAR (SOC)
# Nivel de riesgo: CRÍTICO
# Score heurístico: 9/10
# Acción recomendada: posible BEC / Spear Phishing
```

---

## Instalación

Script Bash autocontenido; requiere entorno UNIX estándar:

```bash
git clone https://github.com/fivur-dev/social-engineering-scanner.git
cd social-engineering-scanner
chmod +x se_scanner.sh
./se_scanner.sh
```

Modos de input:
- Payload demo: vector CEO Fraud precargado.  
- Stdin (manual): pegar bloques de texto multilínea.  
- File artifact: analizar archivos .txt o .eml.

---

## Alcance y limitaciones

Lo que NO hace:
- No reemplaza firewalls, SEG ni soluciones antimalware.  
- No analiza binarios, ni reputación de dominios/IPs.  
- No emite veredictos forenses finales.

Lo que SÍ hace:
- Refuerza la "Capa 8" (factor humano).  
- Aporta una lente psicológica al análisis de incidentes.  
- Complementa controles técnicos cuando no hay alertas.

---

## Uso ético

Diseñada exclusivamente para análisis defensivo, formación y concienciación. No debe utilizarse para generar, optimizar o ejecutar ataques de ingeniería social.

---

## Autor y licencia

- Autor: F. Ubilla (@fivur-dev)
- GitHub: [FivuR](https://github.com/fivur-dev)  
- Licencia: MIT
