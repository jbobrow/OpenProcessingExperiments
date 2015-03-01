

void setup() {
 
  size(600, 600);
  frameRate(500);
}

void draw() {
}

void mouseMoved() {
  background(0);
  stroke(random(240, 250),30,mouseY, 240);
  strokeWeight (mouseY/8);
  line(-mouseX+600, mouseY+50, mouseX/4+100, mouseY/4);
}



