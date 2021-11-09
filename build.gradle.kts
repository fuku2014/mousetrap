plugins {
    java
    id("software.amazon.smithy").version("0.5.3")
}

buildscript {
    dependencies {
    	classpath("software.amazon.smithy:smithy-openapi:1.13.1")
		classpath("software.amazon.smithy:smithy-aws-traits:1.13.1")
    }
}

repositories {
    mavenLocal()
    mavenCentral()
}

dependencies {
    implementation("software.amazon.smithy:smithy-aws-traits:1.13.1")
	implementation("software.amazon.smithy:smithy-go-codegen:0.1.0")
}

//configure<software.amazon.smithy.gradle.SmithyExtension> {
//    // Uncomment this to use a custom projection when building the JAR.
//    // projection = "foo"
//}

tasks["jar"].enabled = false
