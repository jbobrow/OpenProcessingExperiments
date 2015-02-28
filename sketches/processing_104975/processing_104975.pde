
int xPos; 
int yPos; 
int diam;
int xVel;



void setup() {
  size(600, 600);
  xPos = width/2;
  yPos = height/2;
  diam = 100;
  xVel = 5;
 
}
  
void draw(){
  background(0, 255, 232);
  noStroke();
  smooth();
  fill(250, 13, 200); 
  ellipse(xPos, yPos, diam, 100);
  
  if(mouseX > 0) {
    xPos += xVel;
  }
  if((xPos <= diam/2) || (xPos >= width - diam/2)) {
    xVel = -xVel;
  }
  
}
