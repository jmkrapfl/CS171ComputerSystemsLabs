/*Lab1
CS171
Jessica Krapfl*/

//Part 1 print hello world

//println("Hello World");


//part 2 adding graphics

//size(400,400);
//fill(150,90,0); //part 3 adding color (it matters where this goes)
//rect(160,160,80,80);

//part 4 drawing primitives
//fill(255, 0,255);

//triangle(100,300,300,300,200,100); //triangle

//rect(120,120,160,160); //rectangle

//quad(120,270,340,280,320,80,90,140); //quadrilateral

//ellipse(200,200,200,100); //ellipse

//arc(200,200,200,100,PI/2,TWO_PI); //arc

//strokeWeight(10); //width of a line
//stroke(128,0,255); //color of a line
//line(100, 100, 300, 300); //location of the line

//strokeWeight(20); // Width of a point
//stroke(0,0,0);    // Color of a point
//point(200, 200); //location of the point

//textSize(64); //text size
//fill(255,0,255); //color of the text
//text("Text", 120, 200); //the text and the location of the text


//part 5 Animation

/*void setup()
{
  size(400,400); //create window
}

void draw()
{
  background(255,255,255); //clear the screen
  fill(255,0,0); //red
  //rect(frameCount,180,40,40); //draw rectangle
  //rect(frameCount%360,180,40,40); //draw rectangle and brings it back 
  rect(180,360-frameCount%360,40,40); //draw and going up the screen and brings it back
}*/


//part 6 Mouse input
 /*void setup()
 {
   size(400,400); //create window
 }

void draw()
{
  background(255,255,255); //clear the screen
  fill(255,0,0); //red
  rect(mouseX-10,mouseY-10,20,20); //draw rectangle using mouse input
}*/

//part 7 random numbers

/*void setup()
{
  size(400,400); //create window
}

void draw()
{
  fill(random(255),random(255),random(255)); //random color
  rect(random(400),random(400),20,20);
}*/

//part 8

void setup()
{
  size(800,800); //create window
}

void draw()
{
  background(255,255,255); //clear background
  
  fill(243,187,119); //color of the dogs face
  //ellipse(200,200,180,200); //circle for the dogs face (stationary)
  ellipse(mouseX,mouseY,180,200); //circle for the dogs face (moving)
  
  fill(112,76,53);//color of the dogs ear
  //triangle(103,257,171,101,100,115); //left ear (stationary)
  triangle(mouseX-97,mouseY+57,mouseX-29,mouseY-99,mouseX-100,mouseY-85);//left ear (moving)
  
  fill(112,76,53);//color of the dogs ear
  //triangle(307,261,226,104,303,115); //right ear(stationary)
  triangle(mouseX+107,mouseY+61,mouseX+26,mouseY-96,mouseX+103,mouseY-85);//right ear (moving)
  
  fill(0,0,0); //color of the nose
  //triangle(196,262,174,224,224,224); //nose (stationary)
  triangle(mouseX-4,mouseY+62,mouseX-26,mouseY+24,mouseX+24,mouseY+24);//nose (moving)
  
  fill(0,0,0); //color of the left eye
  //ellipse(170,180,15,15); //left eye (stationary)
  ellipse(mouseX-30,mouseY-20,15,15);//left eye (moving)
  
  fill(0,0,0); //color of the right eye
  //ellipse(230,180,15,15); //right eye (stationary)
  ellipse(mouseX+30,mouseY-20,15,15);//right eye (moving)
}
