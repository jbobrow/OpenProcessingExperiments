
 PImage bg;
int a; 
import processing.pdf.*;
boolean savePDF = false;
 
 float x;
float angle = 0.0;
float radius = 360.0;

void setup() 
{
  size(400, 400); 
  noStroke();
  rectMode(CENTER);
  smooth();
  frameRate(50);
  
    bg = loadImage("image4.jpg");
  background(bg);
}

void draw() 
{    
  noFill();
  ellipse(mouseX, height/10, mouseY/2+30, mouseY/2+30);
  noFill();
  int inverseX = width-mouseX;
  int inverseY = height-mouseY;
  ellipse(mouseY, height/1.5, mouseY/2+30, mouseY/2+30);
  ellipse(inverseX, height/2.5, (inverseY/2)+50, (inverseY/2)+50);
  ellipse(inverseY, height/2.5, (inverseY/2)+50, (inverseY/2)+50);
  
   //fill(#B7D8E0,1);
  //rect(0,0,width,height);
  noFill();
  angle = angle + 0.05;
  translate (200,200);
  rotate(angle);
  stroke(#D7E3F4);
  strokeWeight(0.03);
  ellipse(50,50,500,500);
}



