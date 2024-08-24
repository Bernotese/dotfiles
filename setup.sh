#!/bin/bash

# Funktion zur Überprüfung, ob ein Befehl verfügbar ist
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Betriebssystem feststellen
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
else
    echo "Nicht unterstütztes Betriebssystem: $OSTYPE"
    exit 1
fi

# Überprüfen, ob Python installiert ist
if ! command_exists python3; then
    echo "Python3 ist nicht installiert. Versuche es zu installieren..."

    if [[ "$OS" == "linux" ]]; then
        sudo apt update
        sudo apt install -y python3 python3-venv python3-pip
    elif [[ "$OS" == "macos" ]]; then
        brew install python3
    fi
else
    echo "Python3 ist bereits installiert."
fi

# Sicherstellen, dass python3-venv installiert ist (nur für Linux/Ubuntu)
if [[ "$OS" == "linux" ]]; then
    if ! dpkg -s python3-venv >/dev/null 2>&1; then
        echo "Das Paket python3-venv ist nicht installiert. Installiere es jetzt..."
        sudo apt install -y python3-venv
    fi
fi

# .venv Ordner erstellen, falls er nicht existiert
if [ ! -d ".venv" ]; then
    echo "Erstelle das virtuelle Umfeld im .venv Ordner..."
    python3 -m venv .venv
else
    echo "Das virtuelle Umfeld existiert bereits."
fi

# Aktivieren des virtuellen Umfelds
source .venv/bin/activate

# Installieren von Ansible im virtuellen Umfeld
echo "Installiere Ansible im virtuellen Umfeld..."
pip install --upgrade pip  # Sicherstellen, dass pip auf dem neuesten Stand ist
pip install ansible

# Bestätigung der Installation
if command_exists ansible; then
    echo "Ansible wurde erfolgreich installiert."
else
    echo "Fehler bei der Installation von Ansible."
fi

# Deaktivieren des virtuellen Umfelds
deactivate

echo "Fertig!"
