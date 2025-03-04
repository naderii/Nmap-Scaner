#!/bin/bash

# Author: Nader Naderinia


# Define colors
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Check if nmap is installed
if ! command -v nmap &>/dev/null; then
    echo -e "${YELLOW}nmap not found, installing...${NC}"
    sudo apt update && sudo apt install -y nmap
fi

# Function to check if input is a valid domain or IP
validate_input() {
    if [[ "$1" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ || "$1" =~ ^[a-zA-Z0-9.-]+$ ]]; then
        return 0
    else
        return 1
    fi
}

while true; do
    # Get domain from user
    printf "\n${YELLOW}Enter the target domain/IP (or 'q' to exit): ${NC}"
    read domain

    if [[ "$domain" == "q" ]]; then
        echo -e "${RED}Exiting...${NC}"
        exit 0
    fi

    # Validate input
    if ! validate_input "$domain"; then
        echo -e "${RED}Invalid input! Please enter a valid domain or IP.${NC}"
        continue
    fi

    # Display menu
    echo -e "\n${GREEN}Select a scan type for ${domain}:${NC}"
    options=(
        "Scan open ports"
        "Detect operating system"
        "Full scan with NSE scripts"
        "Detect service versions"
        "Check for common vulnerabilities"
        "Aggressive scan (detect firewall)"
        "Stealth scan (quick & hidden)"
        "Trace route analysis"
        "DNS enumeration scan"
        "Brute-force attack scripts"
        "CMS detection (WordPress, Joomla, etc.)"
        "CMS vulnerability check"
        "Exploit search using Exploit-DB"
        "SSL/TLS security check"
        "Hidden directory and file discovery"
        "SQL Injection vulnerability scan"
        "Remote Code Execution (RCE) vulnerability scan"
    )

    for i in "${!options[@]}"; do
        echo "$(($i + 1))) ${options[$i]}"
    done
    echo "q) Exit"

    # Get user choice
    read -p "Select an option: " choice

    # Define scan commands
    scan_commands=(
        "nmap -Pn $domain"
        "nmap -O $domain"
        "nmap -sC -sV $domain"
        "nmap -sV $domain"
        "nmap --script vuln $domain"
        "nmap -A $domain"
        "nmap -sS -T2 $domain"
        "nmap --traceroute $domain"
        "nmap --script dns-brute $domain"
        "nmap --script brute $domain"
        "nmap --script http-enum $domain"
        "nmap --script http-vuln* $domain"
        "nmap --script exploit $domain"
        "nmap --script ssl-enum-ciphers,ssl-cert $domain"
        "nmap --script http-robots.txt,http-config-backup,http-backup-finder $domain"
        "nmap --script http-sql-injection $domain"
        "nmap --script http-rce* $domain"
    )

    # Execute selected scan
    if [[ "$choice" == "q" ]]; then
        echo -e "${RED}Exiting...${NC}"
        exit 0
    elif [[ "$choice" =~ ^[0-9]+$ ]] && ((choice >= 1 && choice <= ${#scan_commands[@]})); then
        echo -e "${GREEN}Running: ${scan_commands[$((choice - 1))]}${NC}"
        log_file="scan_results_$(date +%Y-%m-%d_%H-%M-%S).log"
        ${scan_commands[$((choice - 1))]} | tee "$log_file"
        echo -e "${YELLOW}Results saved to: $log_file${NC}"
    else
        echo -e "${RED}Invalid selection!${NC}"
    fi
done
