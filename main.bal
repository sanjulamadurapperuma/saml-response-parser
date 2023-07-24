import ballerina/io;
import ballerina/url;
import ballerina/lang.'array as arr;
import ballerina/lang.'string as str;

public function main() returns error? {

    // Initializes the text path and the content.
    string filePath = "./files/SAMLValue.txt";
    string samlValue = check io:fileReadString(filePath);

    // URL Decode the SAML Value
    string urlDecoded = check url:decode(samlValue, "UTF-8");
    io:println("URL decoded value: \n\n", urlDecoded);
    io:println("");
    io:println("");

    // Decode the URL decoded SAML Value
    byte[] samlDecoded = check arr:fromBase64(urlDecoded);
    string decodedString = check str:fromBytes(samlDecoded);
    io:println("SAML decoded value: \n\n", decodedString);
}
