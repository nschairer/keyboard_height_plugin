# Testing Guide

This document explains how to test changes to the keyboard_height_plugin without requiring physical devices.

## Automated Testing (CI/CD)

Every push to `main` or any pull request automatically runs tests via GitHub Actions:

### What Gets Tested Automatically:

1. **Code Analysis** (`flutter analyze`)
   - Catches Dart/Flutter static analysis issues
   - Ensures code follows best practices

2. **Format Check** (`dart format`)
   - Verifies code is properly formatted

3. **Unit Tests** (`flutter test`)
   - Runs all test suites

4. **Android Build**
   - Builds the example app as an APK
   - Verifies Android compilation works
   - Tests gradle configuration and dependencies
   - **Validates compileSdk version compatibility**

5. **iOS Build** (macOS)
   - Builds the example app for iOS
   - Verifies iOS compilation works
   - Tests CocoaPods integration

### Viewing Test Results

1. Go to your PR or commit on GitHub
2. Scroll to the bottom to see "Checks"
3. All checks must pass (green ✓) before merging

## Local Testing

### Option 1: Quick Test Script

Run the automated test script:

```bash
./test_local.sh
```

This runs all checks locally before pushing.

### Option 2: Manual Testing

Run individual commands:

```bash
# Install dependencies
flutter pub get

# Check formatting
dart format --output=none --set-exit-if-changed .

# Analyze code
flutter analyze --no-fatal-infos

# Run tests
flutter test

# Build Android (validates compileSdk and gradle config)
cd example
flutter pub get
flutter build apk --debug

# Build iOS (macOS only)
flutter build ios --debug --no-codesign
```

## Why This Approach Works

### For compileSdk Changes:
- The Android build process will **fail immediately** if compileSdk is incompatible
- Gradle validates all dependency version requirements during build
- If the example app builds successfully, the compileSdk change is safe

### For Code Changes:
- Static analysis catches most common errors
- Build process validates platform-specific code
- Tests verify functionality hasn't regressed

## Testing Without Physical Devices

You **don't need physical devices** for most changes because:

1. **Build Verification**: If it compiles, the API level changes are compatible
2. **Static Analysis**: Catches type errors, null safety issues, etc.
3. **CI/CD**: Tests on fresh environments, catching environment-specific issues
4. **Example App**: Ensures the plugin integrates correctly

### What You Can't Test Without Devices:

- Actual keyboard behavior on different devices
- Runtime performance
- Device-specific bugs (e.g., Huawei gesture navigation)

For these cases, rely on:
- Community testing via beta releases
- PR contributors who have the affected devices
- Specific testers for critical changes

## Best Practices

1. **Always run tests locally first** with `./test_local.sh`
2. **Wait for CI to pass** before merging PRs
3. **For critical changes**, request testing from users with affected devices
4. **Tag releases properly** to allow rollback if issues are found

## Example: Testing compileSdk Update

When updating `compileSdkVersion 31` → `34`:

1. Local test: `cd example && flutter build apk --debug`
   - ✅ Build succeeds = change is safe
   - ❌ Build fails = incompatibility found

2. Push changes, CI automatically:
   - Tests on clean Ubuntu environment
   - Uses multiple Java versions
   - Validates against latest Flutter stable

3. Merge when all checks pass ✅
