// PongServer.pde
import processing.net.*;

Server s;
Client c;
String input;
int data[];

int left_paddle=150;
int right_paddle=150;

int ballx=40;
int bally=300;

int dx=2;
int dy=2;

int score_left=0;
int score_right=0;
int right_click=0;

int serve=1; // 0:in play 1: left serve 2: right serve

void setup() 
{
  size(600, 300);
  background(204);
 // frameRate(15); // You may need to slow it down a little
 textSize(40);
 
  s = new Server(this, 12345); // Start a simple server on a port
}

void draw() 
{
  background(255);

  // Receive position of right paddle from client 
  c = s.available();
  if (c != null) 
  {
    input = c.readString();
    int i=input.indexOf("\n"); 
    if(i>0)
    {
    input = input.substring(0, i); // Only up to the newline
    data = int(split(input, ",")); // Split values into an array
    
    // Client sends paddle and mouse click state
    if(data.length==2)
    {
    right_paddle=data[0];
    right_click=data[1];
    }
    }
  }
  
  left_paddle=mouseY;
  fill(255,0,0);
  rect(10,left_paddle-30,20,60);
  
  // Send position of left paddle and ball to client
  s.write(left_paddle + ","+ballx+"," +bally+","+score_left+"," +score_right+"\n");
  
  fill(0,0,255);
  rect(560,right_paddle-30,20,60);
  
  // Draw ball
  fill(0,255,0);
  rect(ballx-5,bally-5,10,10);
  
  if (ballx<0)     {dx=-2; ballx=550; serve=2; score_left++;}
  if (ballx>width) {dx=2; ballx=40; serve=1; score_right++;}

  if(serve==0) // in play
  {
   // If ball is "out" hits either end
   ballx+=dx;
    
  // Bouce off top/bottom edge
  bally+=dy;
  if ((bally>height)||(bally<0)) {dy=-dy; bally+=dy;}
  
  // if balle hits left paddle
  if ((abs(left_paddle-bally)<30)&&((ballx>30)&&(ballx<=(30+abs(dx))))) {dx=-dx; ballx+=dx;}

  // if balle hits right paddle
  if ((abs(right_paddle-bally)<30)&&((ballx>560-abs(dx))&&(ballx<=(560)))) {dx=-dx; ballx+=dx;}
  }
  
  if(serve==1)
  {
   bally=mouseY; 
   if (mousePressed==true) serve=0;
  }
  
  if(serve==2)
  {
   bally=right_paddle; 
   if (right_click==1) serve=0;
  }
  
  fill(0);
  text(""+score_left,40,40);
  text(""+score_right,530,40);
}
