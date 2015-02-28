
/* Circle of Confusion 01
   krismkelley 04.16.09
   Sometimes Processing can make a bad day better.
*/

void setup(){
  size(400, 400);
  colorMode(RGB, 255,255,255,100);
  background(128);
  rectMode(CENTER);
  frameRate(30);
}

float deg = 45;
float rad = radians(deg);
float aX = 0;
float aY = 0;

void draw(){
  pushMatrix();
  popMatrix();
  translate(width/2, height/2);
  rotate(rad);
  line(width/2, height/2, width/2-aX, height/2-aY);
  aX = aX + .1;
  aY = aY + .2;
  rad = rad + 1;
  
}



