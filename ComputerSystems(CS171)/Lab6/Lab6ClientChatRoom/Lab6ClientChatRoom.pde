import javax.swing.JOptionPane;
import processing.net.*;
import java.net.InetAddress;

InetAddress inet;
Client c;
String input;
int data[];

void setup() 
{
  size(50, 50);
  background(204);
  c = new Client(this, "192.168.2.156", 12345); // Replace with your IP and port
}

void draw() 
{
  String myIP;
  try {
    inet = InetAddress.getLocalHost();
    myIP = inet.getHostAddress();
  }
  catch (Exception e) {
    e.printStackTrace();
    myIP = "couldnt get IP";
  }
  println(myIP);

  
  String r = JOptionPane.showInputDialog(null,"1223", "Text input", JOptionPane.QUESTION_MESSAGE);
  c.write(r+"\n");
}
