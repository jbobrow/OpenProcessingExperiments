
void setup() {
  size(500, 500);
  background(255);
}

void draw() {
  stroke(0);
  if (mousePressed == true) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}

void keyPressed() {
  switch(key) {
  case '1':
    background(255);
    break;
  }
} 


