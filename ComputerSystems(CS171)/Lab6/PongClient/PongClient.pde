// PongClient
import processing.net.*;

Client c;
String input;
int data[];

int right_paddle=150;
int left_paddle=150;
int click=0;

int ballx=300;
int bally=150;

int score_left=0;
int score_right=0;

void setup() 
{
  size(600, 300);
  background(204);
  textSize(40);
  //frameRate(15); // You may need to slow it down a little
  // Connect to the server&apos;s IP address and port
  c = new Client(this, "127.0.0.1", 12345); // Replace with your server&apos;s IP and port
}

void draw() 
{
  background(255);

  // Receive position of left paddle from server
  if (c.available() > 0) 
  {
    input = c.readString();
    int i=input.indexOf("\n");
    if(i>0) // Check there is data
    {
    input = input.substring(0, i); // Only up to the newline
    data = int(split(input, ",")); // Split values into an array
    // Update game state sent from server
    if(data.length==5)  // A full line should contain 5 pieces of data
    {
    left_paddle=data[0];
    ballx=data[1];
    bally=data[2];
    score_left=data[3];
    score_right=data[4];
    }
    }
  }
  
  fill(255,0,0);
  rect(10,left_paddle-30,20,60);
  
  right_paddle=mouseY;
  if (mousePressed==true) click=1; else click=0;
  fill(0,0,255);
  rect(560,right_paddle-30,20,60);
  c.write(right_paddle +","+click+"\n");
  
  // Draw ball
  fill(0,255,0);
  rect(ballx-5,bally-5,10,10);
  
  fill(0);
  text(""+score_left,40,40);
  text(""+score_right,530,40);
}
