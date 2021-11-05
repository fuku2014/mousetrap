plugins {
    id("software.amazon.smithy").version("0.5.3")
}

repositories {
    mavenLocal()
    mavenCentral()
}

dependencies {
    implementation("software.amazon.smithy:smithy-model:1.13.1")
}

configure<software.amazon.smithy.gradle.SmithyExtension> {
    // Uncomment this to use a custom projection when building the JAR.
    // projection = "foo"
}

// Uncomment to disable creating a JAR.
//tasks["jar"].enabled = false
