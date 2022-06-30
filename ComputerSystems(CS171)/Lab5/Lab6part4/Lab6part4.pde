float g=-9.81;
float k=0.2;    // Spring constant
float m=0.25;   // Mass kg
float dt=0.01;  // Time step 50ms

float vy=0;     // Initial velocity
float y=0.95;   // Initial position

float t=0;      // Initial time

float vx = 1;//initalizethe horizontal component #3 and it starts with a nonzero velocity#4
float x=0.5;

void setup()
{
  size(500, 500);
}

void draw()
{
  background(255);//clears screen each time #1
  vy=vy+(g-((k/m)*vy))*dt; 
  y=y+(vy*dt); 
  
  vx=vx+(0-((k/m)*vx))*dt;//equations for the horizontal components#3
  x=x+(vx*dt);

  t=t+dt;

  float sx=map(x,0,1,0,width);//change x value to x #3
  float sy=map(y,0,1,height-1,0);
  fill(255,0,0);
  ellipse(sx,sy,10,10);
  
  if(sy>495)//when it hits the bottom reverse its velocity #2
  {
    vy = -vy;
  }
  if(sx<5 || sx>495)//ball bounces on the sides #5
  {
   vx = -vx; 
  }
}
