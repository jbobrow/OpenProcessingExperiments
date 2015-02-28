
void setup(){
  size(500,500);
  smooth();
  stroke(255);
  background(0);
}

void draw(){
  float r = random(50);
  fill(random(255),20,r);
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY,r,r);
}

