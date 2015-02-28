

void setup() {

  size(500, 500);
 background(0 , 0, 255);
  stroke(random(255));
  noFill();
  smooth();
}

void draw() {
}


void mouseDragged() { 
  stroke(random(255));
  fill(0, 20);
  rect(random(255), random(255), 500, 500);
  fill(random(225));
  ellipse (mouseX, mouseY, 50, 50);
}

void keyPressed() {
  if (key == 's') {
    fill(32, 23, 243);
    rect(0, 0, 500, 500);
  }
}


