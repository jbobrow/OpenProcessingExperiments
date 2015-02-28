
/*
RESOURCE: http://www.openprocessing.org/sketch/11712 - Brenda Wooldridge
*/

PImage img;
float x =0;


void setup(){
   
   size(700,430);
   frameRate(20);
   img = loadImage("kat1ed.jpg");

}

void draw(){

  background(0);
   image(img, 0, 0);
   
   {
  if (x>125)
{
   
  x=-x;
 
}
  noStroke();
  smooth();

  fill(100,100,100,155);
  ellipse(100,125,x,x);
  x=x+1.5;
   
   
  }
}


