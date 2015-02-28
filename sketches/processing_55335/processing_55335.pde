
//Mitsuko Verdery 
//Copyright 2012
//hw#8 loops

float x, y, x1, y1;
PImage p;
color eyecolor;

void setup() {
  size (560, 550); 
  x = 0;
  y = 0;
  x1 = 0;
  y1 = 0;
  p = loadImage( "eazye.jpeg");
  eyecolor = color(255, 13, 25);
}

void draw() 
{
 image (p, x1, y1);
 ellipse(280, 90, 10, 10);
 fill(eyecolor);
 ellipse(345, 92, 10, 10);
 fill(eyecolor);
 righteye();
 lefteye();
}

void lefteye()
{
 pushMatrix();
 translate(280,90);
 x = 0; 
 rotate(map(mouseX,0,width,PI/2,PI+PI/4));
 while(x < 100)
 {
  stroke(random(255), random(255), random(255));
  line(0,0,width,x);
  x++;
  }
  popMatrix();
}

void righteye()
{
  pushMatrix();
 translate(345,92);
  x = 0;
  rotate(map(mouseY,0,width,TWO_PI + PI/2,PI+(3*PI)/4));
 while(x < 100)
 {
  stroke(random(255), random(255), random(255));
  line(0,0, width, x);
  x++;
 }
 popMatrix();
}

void keyPressed() 
{
 eyecolor = color(random(255), random(255), random(255));
}


