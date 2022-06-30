/* CS171
Lab 2
13/10/20
Jessica Krapfl*/

//Part 1 and 2
/*long product=1;

for(long count=1;count<=19; count++)
{
product=product*count;
  //println("Count="+count+" Product="+product);//prints each time around the loop to fix errors
}

println("Product="+product);*/


//part 3
/*
int x=250;  // Horizontal position of ball
int direction_x=2;// Change in horizontal position each time draw() executed
int y=150;// Vertical position of ball
int direction_y=2;// Change in horizontal position each time draw() executed

int lives = 3;
int score = 0;

void setup()
{
  size(400,400); // Create a window 400x400 pixels
}

void draw()
{
  background(255,255,255); // Clear screen to white  
  //fill(255,0,0); // Set fill colour to red
  fill(0,255,0); //set fill color to green
  rect(mouseX-60,380,120,20); // Position rectangle using mouse //<>//
  
  fill(255,0,0);
  ellipse(x,y,20,20); //draw a red circle centered on x,y with diameter 20
  
  x=x+direction_x;  // New position equals old position plus change in direction
  if(x<10)         direction_x=-direction_x;  // Reverse direction if hit boundary
  if(x>(width-10)) direction_x=-direction_x;

  y=y+direction_y;
  if(y<10)          direction_y=-direction_y;
  // if(y>(height-10)) direction_y=-direction_y;
  
  if(y>(height-10))           // If ball bits bottom of screen then miss..
  {
     direction_y=-direction_y; // Bounce
     lives--;                  // Reduce lives by one  
     if(lives==0) exit();      // If lives is zero then quit 
  }
  
  if((y>(height-30))&&(abs(mouseX-x)<60)) // If ball has bit paddle then..
  {
    direction_y=-direction_y;             // Bounce
    score++;                              // Increase score by one
  }
  
  textSize(32);                
  fill(0,0,255);
  text(score, 10, 30);        // Display score
  text(lives,width-30, 30);   // Display lives
}
*/


//Do part 3 but the bat is on the side

int x=250;  // Horizontal position of ball
int direction_x=2;// Change in horizontal position each time draw() executed
int y=150;// Vertical position of ball
int direction_y=2;// Change in horizontal position each time draw() executed

int lives = 3;
int score = 0;

void setup()
{
  size(400,400); // Create a window 400x400 pixels
}

void draw()
{
  //draws ths green bat to the left side and uses the mouse Y coordinate
  background(255,255,255); // Clear screen to white
  fill(0,255,0); //set fill color to green
  rect(0,mouseY-60,20,120); // Position rectangle using mouse
  
  //draws the ball
  fill(255,0,0);
  ellipse(x,y,20,20); //draw a red dick centered on x,y with diameter 20
  
  //adding movement to the ball
  //since the game is being played on the left side i need to use the x coordinate instead of the y
  x=x+direction_x;  // New position equals old position plus change in direction
  if(x>(width -10)) direction_x=-direction_x;//if x hits the right side bounce
  
  if(x<10)//if x hits the left and misses the paddle
  {         
    direction_x=-direction_x;  // Reverse direction if hit boundary
    x=30;                      //force x to beyond the paddle on a restart
    lives--;                  // Reduce lives by one  
    if(lives==0) exit();      // If lives is zero then quit 
  }
  
  //y direction
  y=y+direction_y;
  if(y<10)          direction_y=-direction_y;//if y hits the top bounce
  if(y>(height-10)) direction_y=-direction_y;//if y hits the bottom bounce
  
  
  //if x hits the paddle
  if ((x<30)&&(abs(mouseY-y)<60))
  {
    direction_x=-direction_x;
    score++;
  }
  
  textSize(32);                
  fill(0,0,255);
  text(score, 10, 30);        // Display score
  text(lives,width-30, 30);   // Display lives
}
