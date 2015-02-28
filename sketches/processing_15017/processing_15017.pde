

void setup() {
  size(400,400);
  background(200,80,125);
}

void draw() {
}

void mouseMoved() {
  ellipse(mouseX,mouseY,80,80);
  
  if(mouseX+40 >= 400) {
    fill(50,125,255);
  }
  if(mouseX-40 <= 0) {
    fill(50,255,125);
  }
  if(mouseY+40 >= 400) {
    fill(0,125,50);
  }
  if(mouseY-40 <= 0) {
    fill(255,255,255);
  }
}
