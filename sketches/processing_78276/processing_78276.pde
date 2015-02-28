
//changing color and erasing background

void setup() {
  size(800,600);
  background(255);
  rectMode(CENTER);
}

void draw() {
  mouseline();
}

void keyReleased() {
 if (key == '1') {
   stroke(250, 200, 0);
 }
 else if (key == '2') {
   stroke(0, 250, 200);
 }
 else if (key == '3') {
   stroke(200, 0, 250);
 }
 else if (key == '4') {
   stroke(0, 0, 0);
 }
 else if (key == ENTER) {
   background(255);
 }
}

void mouseline() {
  if (mousePressed==true) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}

