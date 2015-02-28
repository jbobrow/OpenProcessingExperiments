
void setup() {
  size(400,400);
  smooth();
  frameRate(30);
  
} 


void draw() {
  
  background(127);
  
  pushMatrix();
  translate(200,200);
  rotate(frameCount*0.01);
  translate(100,0);
  float mX = screenX(0,0);
  float mY = screenY(0,0);
 
  
  float distance = dist(mX,mY,mouseX,mouseY);
  if ( distance < 15 ) fill(255,0,0);
  else fill(255);
  
  ellipse(0,0,30,30);
  popMatrix();
  
}
