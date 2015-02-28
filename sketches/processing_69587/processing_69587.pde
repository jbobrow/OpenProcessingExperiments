
//Katherine Y. Lee
//Assignment#4
//Copyright 2012


/* 

  I N S T R U C T I O N S
Move your cursor around the window to draw stars and create a galaxy.
Press SPACE BAR to erase all the stars and restart.

*/

float wd, ht, a, b, c, d;
int x1,x2,x3,y1,y2,y3;

void setup()
{
  size(400, 400);
  smooth();
  fill(0, 223, 124);
  wd= 20;
  ht= 20;
  a= 40;
  b= 40;
  c= 60;
  d= 60;
  
//The background image
  PImage img;
  img = loadImage("space3.jpeg");
  background(img);
  
}

void draw()
{
  
//The star following the cursor
  fill(#ffffff, 5);
  noStroke();
  triangle(mouseX + 20, mouseY - 10, mouseX + 0, mouseY + 21, mouseX - 20, mouseY - 10);
  triangle (mouseX - 20, mouseY + 10, mouseX + 0, mouseY - 21, mouseX + 20, mouseY + 10);


//The random stars
fill(#ffffff);
  ellipse( mouseX + random(100), mouseY + random(100), random(3), random(3) );
  ellipse( mouseX - random(100), mouseY - random(100), random(3), random(3) );
  ellipse( mouseX + random(100), mouseY - random(100), random(3), random(3) );
  ellipse( mouseX - random(100), mouseY + random(100), random(3), random(3) );

}




//Space bar to erase everything
void keyPressed() 
{
  if (key == ' ')
{
    PImage img;
  img = loadImage("space3.jpeg");
  background(img);
}
}




