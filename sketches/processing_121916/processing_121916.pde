
void setup() {
  size(500, 500);
  
  smooth();
  background(0);
  
  mouseX=width/2; mouseY=height/2;
}

void draw() {
  float r = random(200);
  fill(0,0,random(255));
  ellipse(mouseX, mouseY, r, r);
}


