
float x1;
float y1;
float x2;
float y2;
float randomStrokeWeight;
float rValue;
float gValue;
float bValue;
float alphaValue;
 
void setup() {
  size(960,680);
  background(255);
  smooth();
}
 
void draw() {
  x1 = random(width);
  y1 = random(height);
  x2 = mouseX;
  y2 = mouseY;
  
  randomStrokeWeight = random(1,5);
  strokeWeight(randomStrokeWeight);
   
  rValue = random(100,200);
  gValue = random(100,200);
  bValue = random(100,200);
  alphaValue = random(100,200);
   
  stroke(rValue, gValue, bValue, alphaValue);
  fill(rValue,gValue,bValue,25);
  ellipse(x1, y1, x2, y2);
  fill(255,255,255,15);
  rect(0,0,960,680);
}

void keyPressed() {
  background(255);
}
 
void mousePressed() {
  saveFrame("thumbnail.png");
}


