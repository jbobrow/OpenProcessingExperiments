
 /*
 Konkuk University
 SOS iDesign
  
 Name: KIM Mirae
 ID: 201420064
  
 */
 int x = 0;
 int y = 0;
 int xspeed = 5;
 int yspeed = 5; 
 float xPos = 0; 
 float diameter = 15;

  void setup() {
  background(600);
  size(600, 600);
  frameRate(20);
  }

void draw() {
  
  //pattern (white and black)
  for (int i = 10; i < width; i += 20) {
  for (int j = 10; j < height; j += 20) {
    rectMode(CENTER);
    fill(0);
    rect(i, j, 0, 10);
    fill(0);
    rect(j, i, 10, 0); 
    fill(0);
    rect(i, j, 10, 0);
    fill(0);
    rect(j, i, 0, 10);
  }
  }

  
  
 //ellipse - xPos
   xPos = xPos + 3; // modify the position on x-axis
  if (xPos > height + diameter) {
    xPos = -diameter;
  }
  noStroke();
  fill(#26907b);
  ellipse (0, xPos , diameter, diameter);
  noStroke();
  fill(#ffffff);
  ellipse (600, xPos , diameter, diameter);
  noStroke();
  fill(#26907b);
  ellipse (xPos , 0, diameter, diameter);
  fill(#ffffff);
  ellipse (xPos ,600, diameter, diameter);
  
  
   //move space-1
   stroke(#ffffff);
   //green
   fill(#A0B983);
   quad (x, y, width-x, 0, 0, height-y, width-x,height-y);
   //white green
   fill(#DEF2C7);
   quad (x, y, 0, height-y, width-x, 0, x, y);
   //light blue
   fill(#7ECABB);
   quad (x, y, width-x,height-y,width-x,0, x, y);
 
  
   //move space-2
  
   fill(#ffffff);
   ellipse (width-x,height-y,x,0);
   fill(#ffffff);
   ellipse (width-x,height-y,0,y);
  
  
   x = x + xspeed;
   y = y + yspeed;
   if ((x>width) || (x<0)) {
     xspeed = xspeed*-1;
   }
   if ((y>height) || (y<0)) {
     yspeed = yspeed*-1;
   }
}






