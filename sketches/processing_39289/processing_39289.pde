
void setup() {
  size(300, 300);
  colorMode(HSB);
}

void draw() {
  background(0,0,0);
  if (mouseX>width/2) {
    fill(mouseY,100,100);
    ellipse(mouseX, mouseY, 60, 60);
  }
  else{
    background(100);
    rectMode(CENTER);
    fill(mouseX,100,100);
    rect(mouseX,mouseY,60,60);
  }
}


