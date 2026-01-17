#!/bin/bash
# ==============================================================================
# SE-SCANNER (Motor heurístico de análisis cognitivo)
# Autor: Fabián Ubilla (@fivur-dev)  | GitHub: FivuR
# Versión: 1.0
# Descripción: Herramienta de triaje cognitivo para análisis de ingeniería social.
# Creación: Enero 2026
# Licencia: MIT
# Uso ético: Exclusivamente para análisis defensivo, formación y concienciación.
# ==============================================================================

# ---------------------------------------------------------
# CONFIGURACION VISUAL (Colores de alto contraste)
# ---------------------------------------------------------
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Variables globales
SCORE=0
TEXTO_ANALISIS=""

# ---------------------------------------------------------
# FUNCIONES DE INTERFAZ
# ---------------------------------------------------------

banner() {
    clear
    echo -e "${CYAN}"
    echo "   ____  _____      ____   ____    _    _   _ "
    echo "  / ___|| ____|    / ___| / ___|  / \  | \ | |"
    echo "  \___ \|  _| ____ \___ \| |     / _ \ |  \| |"
    echo "   ___) | |__|_____|___) | |___ / ___ \| |\  |"
    echo "  |____/|_____|    |____/ \____/_/   \_\_| \_|"
    echo "         SE-SCANNER v1.0 | Edición Español    "
    echo -e "${NC}"
    echo -e "${BLUE}[*] Motor heurístico de análisis cognitivo aplicado a ingeniería social${NC}"
    echo -e "--------------------------------------------------------"
}

barra_progreso() {
    echo -ne "${YELLOW}[RUN] Iniciando análisis de patrones... ${NC}"
    for i in {1..20}; do
        echo -ne "■"
        sleep 0.02 
    done
    echo -e " [OK]"
    echo ""
}

# ---------------------------------------------------------
# MENU PRINCIPAL (BUCLE INFINITO)
# ---------------------------------------------------------

while true; do
    banner
    echo -e "${WHITE}[?] Seleccione fuente de evidencia:${NC}"
    echo "    1) Payload de prueba (vector 'CEO Fraud')"
    echo "    2) Entrada manual (pegar bloque de texto)"
    echo "    3) Importar artefacto (.txt / .eml)"
    echo "    4) Salir del programa"
    echo ""
    read -p ">> Ingrese opción (1-4): " opcion

    case $opcion in
        1)
            # Vector de ataque simulado
            TEXTO_ANALISIS="URGENTE: Hola, el gerente general indica que ganaste un bono que expira hoy. Contacta a soporte legal inmediato o sufriras un bloqueo definitivo de tu cuenta corporativa."
            break # Rompe el bucle y avanza
            ;;
        2)
            echo -e "\n${YELLOW}[INPUT] Pegue el cuerpo del mensaje.${NC}"
            echo -e "${YELLOW}        (Presione ENTER y luego Ctrl+D al finalizar):${NC}"
            TEXTO_ANALISIS=$(cat)
            break # Rompe el bucle y avanza
            ;;
        3)
            echo -e "\n${YELLOW}[INPUT] Ingrese ruta del archivo:${NC}"
            read ruta_archivo
            if [ -f "$ruta_archivo" ]; then
                TEXTO_ANALISIS=$(cat "$ruta_archivo")
                echo -e "${GREEN}[OK] Evidencia cargada.${NC}"
                break # Rompe el bucle y avanza
            else
                echo -e "${RED}[ERROR] Archivo no accesible. Intente nuevamente.${NC}"
                sleep 2
            fi
            ;;
        4)
            echo -e "\n${BLUE}[*] Cerrando motor cognitivo. Hasta luego.${NC}"
            exit 0
            ;;
        *)
            echo -e "\n${RED}[ERROR] Opción no válida. Intente nuevamente.${NC}"
            sleep 1
            ;;
    esac
done

# ---------------------------------------------------------
# MOTOR DE ANÁLISIS (HEURÍSTICA CIALDINI)
# ---------------------------------------------------------

echo -e "\n${BLUE}=== EVIDENCIA CAPTURADA ===${NC}"
echo -e "${WHITE}${TEXTO_ANALISIS:0:300}..."
echo -e "${BLUE}===========================${NC}\n"

barra_progreso

# Normalización: conversión a minúsculas y saneamiento de caracteres (ASCII folding)
texto_min=$(echo "$TEXTO_ANALISIS" | tr '[:upper:]' '[:lower:]' | sed 'y/áéíóúüñ/aeiouun/')

# --- DICCIONARIOS (VECTORES COGNITIVOS - SANEADOS) ---
escasez=("urgente" "expira" "inmediato" "hoy" "ahora" "24 horas" "12 horas" "limite" "final" "ya" "plazo" "suspension" "cierre" "aviso" "critico" "oportunidad" "rapido" "limitado" "bloqueo" "accion requerida" "tarde" "consecuencias" "irreversible" "proximas horas" "ultimo aviso")

autoridad=("gerente" "director" "ceo" "legal" "policia" "sii" "hacienda" "jefe" "seguridad" "admin" "soporte" "banco" "validacion" "financiero" "rrhh" "recursos humanos" "superior" "oficial" "auditor" "compliance" "ejecutivo" "jefatura" "administracion" "directiva" "instruccion" "judicial" "abogado" "comite")

reciprocidad=("ganaste" "bono" "premio" "regalo" "gratis" "oferta" "reembolso" "factura" "beneficio" "compensacion" "liberado" "seleccionado" "exclusivo" "sorpresa" "incentivo" "gratuito" "descuento" "promocion" "cupon" "recompensa" "obsequio" "preferencial" "acreditado" "bonificacion" "saldo" "extra" "dinero" "valor anadido")


# Funcion de analisis formateada
analizar_vector() {
    local nombre=$1
    local desc=$2
    shift 2
    local keywords=("$@")
    local lista_visual=""

    for word in "${keywords[@]}"; do
        if echo "$texto_min" | grep -q "$word"; then
            if [ -z "$lista_visual" ]; then
                lista_visual="'$word'"
            else
                lista_visual="$lista_visual, '$word'"
            fi
            ((SCORE++))
        fi
    done

   if [ -n "$lista_visual" ]; then
    echo -e "${RED}[!] ALERTA: se ha detectado un vector de engaño [$nombre]${NC}"
    echo -e "    ${YELLOW}> Objetivo del vector:${NC} $desc"
    echo -e "    ${RED}> IoC (semánticos detectados):${NC} $lista_visual"
else
    echo -e "${GREEN}[v] Vector [$nombre]: no detectado${NC}"
fi


    echo -e "--------------------------------------------------------"
}

# Ejecucion con descripciones operativas
analizar_vector "ESCASEZ" "intento de bloquear el juicio crítico mediante sensación de urgencia y presión temporal." "${escasez[@]}"
sleep 0.05
analizar_vector "AUTORIDAD" "intento de inducir obediencia automática a través de figuras de poder o jerarquía." "${autoridad[@]}"
sleep 0.05
analizar_vector "RECIPROCIDAD" "intento de reducir la alerta crítica ofreciendo recompensas o beneficios aparentes." "${reciprocidad[@]}"

# ---------------------------------------------------------
# REPORTE DE TRIAJE (SOC)
# ---------------------------------------------------------

echo -e "\n${BLUE}=== DICTAMEN PRELIMINAR (SOC) ===${NC}"

case $SCORE in
    0) 
        NIVEL="${GREEN}BAJO${NC}"
        BARRA="${GREEN}[----------]${NC}"
        RECOMENDACION="cerrar ticket como falso positivo (sujeto a revisión técnica)."
        ;;
    1|2) 
        NIVEL="${YELLOW}MEDIO${NC}"
        BARRA="${YELLOW}[|||||-----]${NC}"
        RECOMENDACION="investigar remitente (SPF/DKIM) y validar identidad por canal alterno."
        ;;
    *) 
        NIVEL="${RED}CRITICO${NC}"
        BARRA="${RED}[||||||||||]${NC}"
        RECOMENDACION="posible BEC/Spear Phishing. Analizar headers y detonar adjuntos/links en Sandbox."
        ;;
esac

echo -e "Nivel de riesgo:  $NIVEL"
echo -e "Score heurístico: $BARRA ($SCORE hits)"
echo -e "\n${WHITE}[Acción recomendada (playbook)]:${NC}"
echo -e "$RECOMENDACION"
echo -e "\n========================================================"
echo ""