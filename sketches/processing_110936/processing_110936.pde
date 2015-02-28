
color back_fill = color(250, 250, 255);
boolean mouseRight = false;
boolean mouseLeft = false;
 
void setup() {
  size(500, 500);
  background(back_fill);
  noStroke();
}
 
void draw() {
  if (mouseRight) {
    fill(252, 252, 250);
    quad(mouseY, mouseX, mouseX+mouseY, 2*(mouseY-mouseX),
         pmouseX+pmouseY, 2*(pmouseY-pmouseX), pmouseY, pmouseX);
  }
  
  if (mouseLeft) {
    fill(255);
    quad(mouseY, mouseX, mouseX-mouseY, mouseY-2*mouseX,
         pmouseX-pmouseY, pmouseY-2*pmouseX, pmouseY, pmouseX);
  }
}
 
void keyPressed() {
  if (key == ' ') background(back_fill);
}

void mousePressed() {
  if (mouseButton == LEFT) {
    mouseLeft = true;
  }
  if (mouseButton == RIGHT) {
    mouseRight = true;
  }
}

void mouseReleased() {
    if (mouseButton == LEFT) {
    mouseLeft = false;
  }
  if (mouseButton == RIGHT) {
    mouseRight = false;
  }
}
