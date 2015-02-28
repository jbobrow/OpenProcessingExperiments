
void setup(){
  size(800,600);
}

void draw(){
  background(0);
  frameRate(50);
  noFill();
  noCursor();
  stroke(255);
  strokeWeight(3);
  float r = random(500);
  ellipse(mouseX,mouseY,r,r);
}
  
