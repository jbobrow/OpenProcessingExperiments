
//Homework 3
//Reproduction of the following processing code without consent is strictly prohibited
//Coral Pais

//Move mouse to change color and draw rotating circles
//Click mouse to clear screen


float x,y, wd, ht;
float value;

void setup ( )
{
  size (400,400);
    background (255);
  value=random(255);
  frameRate (10);
  fill(0);
  rect (0,0,width, height);
  
}

void draw ()
{
  
  
  stroke (mouseX, mouseY, value);
  line (mouseX, mouseY, random(0,200), random (0,200));
  line (mouseX, mouseY, random(200,400), random (0,200));
  line (mouseX, mouseY, random(200,400), random (200,400));
  line (mouseX, mouseY, random(0,200), random (200,400));
  
  
}

void mousePressed() 
{
  setup( );
  
}




