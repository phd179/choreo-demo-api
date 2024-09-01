import ballerina/http;

service /graphql on new http:Listener(8080) {

    # Description.
    # + return - return value description
    resource function get data() returns json|error {
        string graphqlEndpoint = "https://example.com/graphql";

        string query = "{ user(id: \"1\") { id name } }";

        json requestPayload = {
            "query": query
        };

        http:Client graphqlClient = check new(graphqlEndpoint);

        // Send the GraphQL request
        http:Response response = check graphqlClient->post("/", requestPayload);

        // Handle the response
        json result = check response.getJsonPayload();
        return result;
    }
}
