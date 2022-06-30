import processing.net.*;

Server s;
Client c;
String input;
int data[];
int line=0;

void setup() 
{
  size(600, 500);
  background(204);
  textSize(48);
  fill(0);
  s = new Server(this, 12345); // Start a simple server on a port 12345
  // Connect to the server&apos;s IP address and port
  c = new Client(this, "192.168.2.156", 12345); // Replace with your server&apos;s IP and port

}

void draw() 
{
  // Receive data from client
  c = s.available();
  if (c != null) 
  {
    input = c.readString();
    input = input.substring(0, input.indexOf("\n")); // Only up to the newline

    text(input,10,48+48*(line));
    line++;
    if(line==10) {line=0; background(204);}
  }
}
