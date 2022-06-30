/*//Part 1.1
//modify the program so that
//the screen is 640 by 320
//complete 2 periods of the sin wave
//the points at the top and bottom of the screen are not clipped
//that the graph includes 150 points
void setup()
{
  size(640, 320);
  background(255,255,255);
}

void draw()
{
  float step=(2*PI)/75;                             // Step is 1/50 of interval [0,2PI]
  
  for(float theta=0;theta<=(4*PI)+step;theta+=step) // Loop theta values on range [0,2PI]
  {
    float screen_x=map(theta,0,4*PI,5,width-5);       // Calculate screen x position from theta
    float y=sin(theta);
    float screen_y=map(y,-1,1,height-5,5); // Calculate screen y posn. corresponding sine theta

    ellipse(screen_x,screen_y,6,6);
    
  } // Repeat for each theta value 
}   //Redraw the new screen*/

//part1.2
void setup()
{
  size(400, 400);
  background(255,255,255);
}

void draw()
{
  float step=(2*PI)/120;                               // 50 steps on interval [0,2PI]
  
  float theta_start=0;                                 // Starting theta value
  
  float old_sx=map(theta_start,0,2*PI,4,width-4);      // Calculate screen x position from theta
  float old_sy1=map(sin(theta_start),-1,1,height-4,4);  // Calculate screen y position corresponding to sine theta
  
  float old_sy2= map(cos(theta_start),-1,1,height-4,4);// ADD YOUR CODE Calculate screen y position coresponding cosine theta

  
  for(float theta=step;theta<=(2*PI)+step;theta+=step) // Loop theta values on range [0+1step,2PI]
  {
    float screen_x=map(theta,0,2*PI,4,width-4);        // Calculate screen x position from theta
    float screen_y1=map(sin(theta),-1,1,height-4,4);    // Calculate screen y position coresponding sine theta
    
    float screen_y2=map(cos(theta),-1,1,height-4,4);// ADD YOUR CODE

    //stroke(255,0,0);
   // line(old_sx,old_sy1,screen_x,screen_y1);             // Draw line from old point to the new point
    
    //stroke(0,255,0);
    //line(old_sx,old_sy2,screen_x,screen_y2);           // Draw line from old point to the new
    
    stroke(0,0,255);
    line(old_sy1,old_sy2,screen_y1,screen_y2);  // sine vs cosine
 
    old_sx=screen_x;                                   // The current new points updates old points
    old_sy1=screen_y1;
    old_sy2=screen_y2;
   
  } // Repeat for each theta value 
}   //Redraw the new screen*/
