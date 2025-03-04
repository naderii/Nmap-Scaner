#!/bin/bash

# Automated Nmap Scan Script
# Author: Nader Naderinia

# Colors for output
RED="\e[31m"
GREEN="\e[32m"
BLUE="\e[34m"
YELLOW="\e[33m"
CYAN="\e[36m"
BOLD="\e[1m"
RESET="\e[0m"

printf "\n${YELLOW}Enter the target domain/IP (or 'q' to exit): ${RESET}"
read target

# Set output file name based on the target and date
output_file="scan_report_${target}_$(date +%Y%m%d_%H%M%S).log"

echo -e "${YELLOW}✅ Scanning in progress... Please wait.${RESET}"

# 1 - Scan for open ports and service versions
echo -e "${BLUE}🔍 Scanning open ports and detecting service versions...${RESET}"
nmap -sV -T4 -oN $output_file $target

# 2 - Scan for known vulnerabilities
echo -e "${BLUE}🔍 Scanning for vulnerabilities...${RESET}"
nmap --script vuln -oN $output_file $target

# 3 - Scan SSL security and encryption protocols
echo -e "${BLUE}🔍 Checking SSL security...${RESET}"
nmap --script ssl-enum-ciphers -p 443 -oN $output_file $target

# 4 - Detect CMS (WordPress, Joomla, Drupal, etc.)
echo -e "${BLUE}🔍 Checking CMS and web server info...${RESET}"
nmap --script http-enum,http-title,http-headers -p 80,443 -oN $output_file $target

# 5 - Analyze network path to the target
echo -e "${BLUE}🔍 Running traceroute analysis...${RESET}"
nmap --traceroute -oN $output_file $target

# 6 - Check security of common services (FTP, SMB, SSH)
echo -e "${BLUE}🔍 Checking security of FTP, SMB, SSH services...${RESET}"
nmap --script ftp-anon,smb-os-discovery,smb-vuln* -p 21,22,445 -oN $output_file $target

# 7 - Save and display scan results
echo -e "${GREEN}✅ Scan completed!${RESET}"
echo -e "${BOLD}📂 Results saved in: ${output_file}${RESET}"
