### Adding a flavor for Android 
  - in app's build.gradle
    ```
    android {
      // ... 

      flavorDimensions "default"
      productFlavors {
          development {
              dimension "default"
              buildConfigField("String", "FLAVOR_CONFIGURATION", '"development"')
          }
          production {
              dimension "default"
              buildConfigField("String", "FLAVOR_CONFIGURATION", '"production"')
          }
      }
      // ... 
    }
    ```
  - Now able to add specific flavor files to app/src/development/$build_type or app/src/production/$build_type (e.g. google-services.json)

### Adding a flavor to iOS
  - iOS flavors are not quite as intuitive or straight forward
  - Under the project info section, duplicate the Debug configuration and the Release configuration and name them Debug-Development, Debug-Production, Release-Development, and Release-Production
  - Under the target build settings, click the + and add User-Defined Setting named FLAVOR_CONFIGURATION and for each buuld configuration, give it a value (debug or production)
  - In XCode, Product > Scheme > New Scheme, and create two new schemes, Development and Production
  - In XCode, Product > Scheme > Manage Schemes, and delete the default Runner Scheme
  - In XCode, Product > Scheme > Edit Schemes, and for each build option set the proper build configuration for Development and Production schemes.  i.e. development should be using and $config-development, and production $config-production.
  - In the info.plist for target Runner add the following key/value {"FlavorConfiguration" : "${FLAVOR_CONFIGURATION}"}

### Specifying a flavor from the command line
  - flutter run --flavor $flavor_name

### Accessing flavor information from Android
  Kotlin or Java
  - Able to access configuration values natively with `BuildConfig.FLAVOR_CONFIGURATION`

### Accessing flavor information from iOS
  - Objective-C
    `NSString *flavorConfig = (NSString *) [[NSBundle mainBundle] objectForInfoDictionaryKey:@"FlavorConfiguration"];`
  - Swift
    `let flavorConfig = Bundle.main.object(forInfoDictionaryKey: "FlavorConfiguration")!`
