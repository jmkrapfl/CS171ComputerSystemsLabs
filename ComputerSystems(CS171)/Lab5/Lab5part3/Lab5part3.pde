import javax.swing.JOptionPane;

void setup()
{
//size(200,500);
size(800,500);
}

void draw()
{
 float b,r;
 background(255);
 
 for(b=1.0;b<=4.0;b+=0.003)
  {   
    // Run forward for 100 stps to allow system to settle
    r=0.5; 
    for(int i=0;i<100;i++) r=r*b*(1.0-r);
  
    // Plot r value(s) as a function of b
    for(int i=0;i<600;i++)
    {
     r=r*b*(1.0-r);
     
     float screenx=map(b,1.0,4.0,0,width);
     float screeny=map(r,0.0,1.0,height,0);
     
     point(screenx,screeny);
    }
  } 

 //background(255); 
 fill(0); 

 b=readFloat("B=");

 r=0.5; 
 
 for(int i=0;i<200;i++)
 {
     r=r*b*(1.0-r);
 }

 for(int i=0;i<20;i++)
 {
     r=r*b*(1.0-r);
     
     text(r,10,i*20);
 }
 
}
   
// Routine to read from keyboard
float readFloat(String text)
{
 float f = 0;
 String s = JOptionPane.showInputDialog(null,text, "Enter float:", JOptionPane.QUESTION_MESSAGE);
 try {
      f = Float.parseFloat(s);
     }   
 catch(NumberFormatException e) 
 {
  println("you did not enter a number!");
 }
 return f;
}


/*float a=3.11,b=3.88;
void setup()
{
  size(500,500);
  strokeWeight(2);
  textSize(24);
  fill(0);
}
void draw()
{
  background(255);
  float r=0.3,f=0.15,rt;
  
  if(mousePressed)
  {
    a=map(mouseX,0,width, 1,4);
    b=map(mouseY,0,height,1,4);
  }
  
  String sa = nf(a, 1, 3);
  String sb = nf(b, 1, 3);
  text("a:"+sa+" b:"+sb,width-200,20);
  
  for(int i=0;i<40000;i++)
  {
   rt=a*r*(1.0-r-f);
   f=b*r*f;
   r=rt;
   
   float screenx=map(r,0.0,1.0,0,width);
   float screeny=map(f,0.0,1.0,height,0);
   point(screenx,screeny);
  }
}*/
