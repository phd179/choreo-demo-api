import ballerina/test;

@test:Config{}
function testGetData() {
    // Invoke the resource function
    var response = check graphqlClient->get("/graphql/data");

    // Assert the response status code
    test:assertEquals(response.statusCode, 200, "Unexpected status code");

    // Assert the response payload
    json expectedPayload = {
        "id": "1",
        "name": "John Doe"
    };
    json actualPayload = check response.getJsonPayload();
    test:assertEquals(actualPayload, expectedPayload, "Unexpected response payload");
}