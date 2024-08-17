import ballerina/test;
import ballerina/io;

@test:Config
function testMain() {
    io:println("Running testMain");
    io:println("Hello, World!");
}