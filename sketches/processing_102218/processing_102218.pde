
void setup() {
  size(400, 400);
 
}

void draw() {
    if (mousePressed == true) {
      stroke(255);
    } else {
      stroke(0);
    }
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
