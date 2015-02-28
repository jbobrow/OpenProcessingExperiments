
/* Circle of Confusion 03
   krismkelley 04.16.09
   Adding some Color!
*/

void setup(){
  size(400, 400);
  colorMode(RGB, 255,255,255,100);
  background(0);
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
  stroke(255, 0, 0, 50);
  translate(width/2, height/2);
  rotate(rad+aX);
  line(width, height, width/2, height/2-aY);
  
  pushMatrix();
  popMatrix();
  stroke(188, 167, 0, 50);
  translate(width/2, height/2);
  rotate(rad+aX);
  line(width, height, width/2, height/2);
  
  aX = aX + .1;
  aY = aY + .2;
  rad = rad + 1;
  
}



