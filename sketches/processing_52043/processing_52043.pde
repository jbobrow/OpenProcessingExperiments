
float x = 200;
float y = 200;
float w = 100;
float h = 50;
float pupilleW = 30;
float pupilleH = 30;
 
void setup() {
  size(400,400);
  smooth();
  noStroke();
}
 
 
void draw() {
  background(0);
  fill(255);
  //noFill();
  stroke(0);
  ellipse(x,y,w,h);
  
  float radians = atan2(mouseY-y,mouseX-x);
  float distance = dist(mouseX,mouseY,x,y);
  
  float distanceW = constrain(distance,0,w/2- pupilleW/2);
  float distanceH = constrain(distance,0,h/2- pupilleH/2);
  
  
  float pupilleX = cos(radians)* distanceW + x;
  float pupilleY = sin(radians)* distanceH + y;
  
  fill(0);
  ellipse(pupilleX,pupilleY,pupilleW,pupilleH);
  }
                                
