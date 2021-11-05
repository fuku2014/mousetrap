namespace mousetrap

service Mousetrap {
    version: "2012-12-08",
    resources: [Mouse]
}

resource Mouse {
    identifiers: { Name: MouseName },
    read: GetMouse,
}

@pattern("^[A-Za-z0-9 ]+$")
string MouseName

@readonly
operation GetMouse {
    input: GetMouseInput,
    output: GetMouseOutput,
    errors: [NoSuchResource]
}

structure GetMouseInput {
    @required
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
