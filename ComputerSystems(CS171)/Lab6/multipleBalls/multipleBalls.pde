// Physical Constants
float g=-9.81;  // Gravity
float k=0.0;    // Friction const (Try 0.02)
float m=0.25;   // Mass kg
float dt=0.01;  // Time step 10ms

//Ball b;
Ball [] b;

void setup()
{
  //b=new Ball(i);
  b=new Ball[5];
  
  for(int i =0; i<5; i++)
  {
   b[i]=new Ball(); 
  }
  
  size(500, 500); // but region of interest [0,0],[1,1]
}

void draw()
{
  background(255);          // White background
  
  //b.advance();
  //b.draw_ball();
  
  for(int i=0; i<5; i++)
  {
    b[i].advance();
      int r=Collision(i,b); // Check if ball i collides with any balls in array b
      if(r!=-1)             // -1 means no collision, r is index that identifies ball in b
      {
          //b[i].c=color(0,0,0);
          //b[r].c=color(0,0,0);
          
          float nvxj = (b[i].vx * (b[i].radius - b[r].radius) + (2 * b[r].radius * b[r].vx)) / (b[i].radius + b[r].radius);
          float nvyj = (b[i].vy * (b[i].radius - b[r].radius) + (2 * b[r].radius * b[r].vy)) / (b[i].radius + b[r].radius);
          float nvxr = (b[r].vx * (b[r].radius - b[i].radius) + (2 * b[i].radius * b[i].vx)) / (b[i].radius + b[r].radius);
          float nvyr = (b[r].vy * (b[r].radius - b[i].radius) + (2 * b[i].radius * b[i].vy)) / (b[i].radius + b[r].radius);   
  
          b[i].vx=nvxj;
          b[i].vy=nvyj;
          b[r].vx=nvxr;
          b[r].vy=nvyr;

      }
    b[i].draw_ball();
  }
}

int Collision(int j, Ball b[])
{
  int res = -1;
  for(int i=0;i<5;i++)
  {
    if(i !=j)
    {
      float sep=sqrt(pow(b[i].x-b[j].x,2)+pow(b[i].y-b[j].y,2));
      float rads=b[i].radius+b[j].radius;
      if(sep<rads){res = i;}
    }
  }
  return(res);
}

class Ball
{
  float vy;     // Initial vertical velocity
  float y;    // Initial vertical position
  float x;      // Initial horizontal position 
  float vx;   // Initial horizontal velocity
  float t;      // Initial time
  
  color c;
  float radius;

  Ball()
  {
    //vy=0;
    //y=0.9;
    //x=0;
    //vx=0.8;
    //t=0;
    
    y=random(0.1,0.9);
    vy=random(-1,1);
    x=random(0.1,0.9);
    vx=random(-1,1);
    
    c=color(random(255),random(255),random(255));
    radius=0.01+random(0.04);
    
    t=0;
  }
  
  void advance()
  {
    vy=vy+(g-((k/m)*vy))*dt;
    y=y+(vy*dt);
    
    vx=vx+(-((k/m)*vx))*dt;
    x=x+(vx*dt);
    
    t=t+dt;
    
    if (y<=0)  {vy=-vy; y=y+(vy*dt);}
    if (x<=0)  {vx=-vx; x=x+(vx*dt);} 
    if (x>=1)  {vx=-vx; x=x+(vx*dt);} 
  }
  
  void draw_ball()
  {
    float sx=map(x,0,1,0,width);     // Scale x on [0,0][1,1] to the screen
    float sy=map(y,0,1,height-1,0);
    
    float rx=map(radius,0,1,0,width);
    float ry=map(radius,0,1,0,height);
  
    //fill(255,0,0);                   // Draw the ball
    //ellipse(sx,sy,10,10);
    fill(c);
    ellipse(sx,sy,2*rx,2*ry);
  }
}
