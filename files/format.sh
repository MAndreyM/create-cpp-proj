#!/bin/bash
set -e

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🎨 Formatting Code...${NC}"

# Форматирование исходного кода
docker-compose run --rm dev bash -c "
    echo 'Formatting C++ files...'
    find src/ tests/ -name '*.cpp' -o -name '*.h' | xargs clang-format -i -style=file
"

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ Code formatted successfully!${NC}"
    
    # Показываем измененные файлы
    echo -e "${YELLOW}📝 Formatted files:${NC}"
    git diff --name-only || find src/ tests/ -name '*.cpp' -o -name '*.h'
else
    echo -e "${RED}❌ Code formatting failed${NC}"
    exit 1
fi
