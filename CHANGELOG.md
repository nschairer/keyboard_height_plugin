## 0.2.0

**BREAKING CHANGES:**
This version requires modern Android build tooling. For projects using older versions, please continue using version 0.1.5.

### Requirements
- Android Gradle Plugin 8.6.0+
- Gradle 8.7+
- Kotlin 2.1.0+
- Java 17+

### Android Updates
* **BREAKING:** Update compileSdkVersion from 31 to 34 (fixes #14)
* **BREAKING:** Update Android Gradle Plugin from 7.2.0 to 8.6.0
* **BREAKING:** Update Kotlin from 1.7.10 to 2.1.0
* **BREAKING:** Migrate to declarative Gradle plugin system (Gradle 8.x requirement)
* Add namespace declaration for AGP 8.6+ compatibility
* minSdkVersion remains 16 (Android 4.1+) - no change to device compatibility

### iOS Updates
* Add Privacy Manifest (PrivacyInfo.xcprivacy) required for App Store submissions (fixes #6)
* Fix example app Podfile configuration to eliminate RunnerTests errors

### Infrastructure
* Add comprehensive CI/CD pipeline with GitHub Actions
* Add automated testing for code analysis, formatting, and builds
* Add PR template with testing checklist
* Add TESTING.md documentation
* Update example app .gitignore for Flutter-generated files

### Migration Guide
If you need to upgrade from 0.1.5:
1. Update your project to use AGP 8.6+, Gradle 8.7+, Kotlin 2.1+, and Java 17+
2. Follow the Flutter AGP migration guide: https://docs.flutter.dev/release/breaking-changes/flutter-gradle-plugin-apply

If your project cannot upgrade these dependencies yet, remain on version 0.1.5.

## 0.0.1

* Initial release.

## 0.0.2

* Documentation.

## 0.0.3

* More documentation.

## 0.0.4

* N/A

## 0.0.5

* Support for AGP 8.0.0

## 0.1.5
* Merge in fix for incorrect height when navigation bar is not visible. https://github.com/nschairer/keyboard_height_plugin/pull/8/files
