import ballerina/io;
import ballerina/url;
import ballerina/lang.'array as arr;
import ballerina/lang.'string as str;

public function main() returns error? {
    string value = "<SAMLResponse_value>";
    string urlDecoded = check url:decode(value, "UTF-8");
    io:println("URL decoded value: ", urlDecoded);
    io:println("");
    io:println("");

    byte[] samlDecoded = check arr:fromBase64(urlDecoded);
    string decodedString = check str:fromBytes(samlDecoded);
    io:println("SAML decoded value: ", decodedString);
}
