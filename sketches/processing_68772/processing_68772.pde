
//Lillie Ferris
//liferris@andew.cmu.edu
//September 4th 2012

//float a, b;
int value = 0;

 
 
void setup()
{
  size (400,400);
  smooth();
  background(255);
//  a = 20;
//  b = 20;
}
 
void draw()
{
  //background(255, 255, 255);
  fill(random(0), random(20), random(0), 0);
  stroke(random(0), random(0), random(0), 05);
  strokeWeight(value);
  line(mouseX, mouseY, pmouseX, pmouseY);
}
 
 

void mousePressed() //russellandrews copyright
{
  if(value == 0) {
    value = 300;
  } else {
    value = 0;
  }
}

void keyPressed() 
{
  background (255);
  
  }
  
//saveFrame("CAP3 - Animation");


