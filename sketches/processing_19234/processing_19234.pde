


void setup() {
  background(0);
  size(640, 320);
  smooth();
}

void draw() {
  if (keyPressed) {
    background(0);
  } else 
    fill(random(255),random(255),random(255),50);
 
  rect(mouseX, mouseY,40, 40);

ellipse(mouseX,mouseY,10,10);
  }


