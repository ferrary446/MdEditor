curl -Ls https://install.tuist.io | bash
tuist install 4.23.0
tuist fetch
tuist generate
xcodebuild clean -quiet
xcodebuild test\
    -workspace 'MdEditor.xcworkspace' \
    -scheme 'MdEditor' \
    -destination 'platform=iOS Simulator,name=iPhone 15 Pro'