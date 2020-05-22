# Keys in Info.plist overwritten 

When using following plugins: cordova-plugin-facebook4, cordova-plugin-googleplus and ionic-plugin-deeplinks together, `CFBundleURLSchemes` key in Info.plist is not merged but overwritten.
I figured out that this happens when `<pods use-frameworks="true">` in plugin.xml is set. When set to `false`, keys are merged as expected.

# Steps to reproduce

1. set `use-frameworks` keys in libs/*/plugin.xml to true or false
2. ./build.sh
3. check `platforms/ios/test/test-Info.plist` for result. 

Expected values:
`
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>fb1234567890</string>
        </array>
    </dict>
    <dict>
        <key>CFBundleTypeRole</key>
        <string>Editor</string>
        <key>CFBundleURLName</key>
        <string>REVERSED_CLIENT_ID</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>REVERSED_CLIENT_ID</string>
        </array>
    </dict>
    <dict>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>URL_SCHEME</string>
        </array>
    </dict>
</array>
`

Actual values:
`
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>fb1234567890</string>
        </array>
    </dict>
</array>
`

