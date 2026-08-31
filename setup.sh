#!/bin/sh

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}[1/3] Updating packages...${NC}"
apk update && echo -e "${GREEN}[1/3] Update complete${NC}"

echo -e "${BLUE}[2/3] Upgrading packages...${NC}"
apk upgrade && echo -e "${GREEN}[2/3] Upgrade complete${NC}"

echo -e "${BLUE}[3/3] Checking PHP...${NC}"
if command -v php &> /dev/null; then
    echo -e "${GREEN}[3/3] PHP is already installed${NC}"
else
    echo -e "${YELLOW}[3/3] PHP not found${NC}"
    echo -e "${BLUE}[3/3] Installing PHP...${NC}"
    apk add php && echo -e "${GREEN}[3/3] PHP installed successfully${NC}"
fi

echo -e "${GREEN}All done${NC}"