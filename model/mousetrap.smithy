namespace mousetrap

use aws.protocols#restJson1
use aws.auth#sigv2

@sigv4(name: "mousetrap")
@restJson1
service Mousetrap {
    version: "2012-12-08",
	operations: [
	    GetMouse
	]
}

@pattern("^[A-Za-z0-9 ]+$")
string MouseName

@readonly
@http(method: "GET", uri: "/mouse/{Name}")
operation GetMouse {
    input: GetMouseInput,
    output: GetMouseOutput,
    errors: [NoSuchResource]
}

structure GetMouseInput {
    @required
	@httpLabel
    Name: MouseName
}

structure GetMouseOutput {
    @required
    Name: MouseName,

    @required
    Tags: Tags,
}

list Tags {
    member: Tag
}

structure Tag {
    @required
    Key: String,

    @required
    Value: String,
}

@error("client")
structure NoSuchResource {
    @required
    ResourceType: String
}
