#!/bin/bash

# Local testing script to verify changes before pushing
# Run this script to test the plugin locally

set -e

echo "🧪 Starting local tests for keyboard_height_plugin..."
echo ""

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Test 1: Install dependencies
echo -e "${BLUE}📦 Installing plugin dependencies...${NC}"
flutter pub get
echo ""

# Test 2: Format check
echo -e "${BLUE}✨ Checking code formatting...${NC}"
dart format --output=none --set-exit-if-changed . || {
    echo "❌ Format check failed. Run: dart format ."
    exit 1
}
echo -e "${GREEN}✓ Format check passed${NC}"
echo ""

# Test 3: Analyze code
echo -e "${BLUE}🔍 Analyzing code...${NC}"
flutter analyze --no-fatal-infos
echo -e "${GREEN}✓ Analysis passed${NC}"
echo ""

# Test 4: Run tests
echo -e "${BLUE}🧪 Running tests...${NC}"
flutter test
echo -e "${GREEN}✓ Tests passed${NC}"
echo ""

# Test 5: Build Android example
echo -e "${BLUE}🤖 Building Android example app...${NC}"
cd example
flutter pub get
flutter build apk --debug
echo -e "${GREEN}✓ Android build passed${NC}"
echo ""

cd ..

# Test 6: Build iOS example (only on macOS)
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo -e "${BLUE}🍎 Building iOS example app...${NC}"
    cd example
    flutter build ios --debug --no-codesign
    echo -e "${GREEN}✓ iOS build passed${NC}"
    cd ..
else
    echo "ℹ️  Skipping iOS build (not on macOS)"
fi

echo ""
echo -e "${GREEN}✅ All tests passed!${NC}"
echo "You can safely push your changes."
