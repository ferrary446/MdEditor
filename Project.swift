import ProjectDescription

let infoPlist: [String: Plist.Value] = [
    "UIApplicationSceneManifest": [
        "UIApplicationSupportsMultipleScenes": false,
        "UISceneConfigurations": [
            "UIWindowSceneSessionRoleApplication": [
                [
                    "UISceneConfigurationName": "Default Configuration",
                    "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
                ]
            ]
        ]
    ],
    "UILaunchStoryboardName": "LaunchScreen",
    "UISupportedInterfaceOrientations": ["UIInterfaceOrientationPortrait"]
]

let swiftLintScript: TargetScript = {
    let script = """
        export PATH="$PATH:/opt/homebrew/bin"
        if which swiftlint > /dev/null; then
            swiftlint
        else
            echo: "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
            exit 1
        fi
    """

    return .pre(
        script: script,
        name: "Run SwiftLint",
        basedOnDependencyAnalysis: false
    )
}()

let dataStructuresPackage: Package = .local(
    path: .relativeToManifest("Packages/DataStructuresPackage")
)

let taskManagerPackage: Package = .local(
    path: .relativeToManifest("Packages/TaskManagerPackage")
)

let target: Target = .target(
    name: "MdEditor",
    destinations: .iOS,
    product: .app,
    bundleId: "ru.IY.MdEditor",
    deploymentTargets: .iOS("15.0"),
    infoPlist: .extendingDefault(with: infoPlist),
    sources: "Sources/**",
    scripts: [swiftLintScript],
    dependencies: [
        .package(product: "DataStructuresPackage"),
        .package(product: "TaskManagerPackage")
    ]
)

let testTarget: Target = .target(
    name: "MdEditorTests",
    destinations: .iOS,
    product: .unitTests,
    bundleId: "ru.IY.MdEditorTests",
    deploymentTargets: .iOS("15.0"),
    sources: "Tests/**",
    scripts: [swiftLintScript],
    dependencies: []
)

let project = Project(
    name: "MdEditor",
    packages: [dataStructuresPackage, taskManagerPackage],
    targets: [target, testTarget],
    schemes: [
        .scheme(
            name: "MdEditor",
            shared: true,
            buildAction: .buildAction(targets: ["MdEditor"]),
            testAction: .targets(["MdEditorTests"])
        )
    ]
)
