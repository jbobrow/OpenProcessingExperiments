
/*
Jennifer Presto
DIY Mondrian
Unleash your inner Dutch artistic genius!

Original created August 16, 2012.
Re-exported as javascript for OpenProcessing
on April 8, 2013.
*/

void setup() {
  size(630, 630);
  noFill();
  noStroke();
  rectMode(CENTER);
  background(255);
}
void draw() {
}
void keyPressed() {
  if (keyCode==UP) {
    for (int y=0; y<630; y++) {
      fill(0);
      rect(mouseX, mouseY-y, 15, 15);
    }
  }
  if (keyCode==DOWN) {
    for (int y=0; y<630; y++) {
      fill(0);
      rect(mouseX, mouseY+y, 15, 15);
    }
  }
  if (keyCode==LEFT) {
    for (int x=0; x<630; x++) {
      fill(0);
      rect(mouseX-x, mouseY, 15, 15);
    }
  }
  if (keyCode==RIGHT) {
    for (int x=0; x<630; x++) {
      fill(0);
      rect(mouseX+x, mouseY, 15, 15);
    }
  }
  if (key=='r' || key=='R') {
    fill(255, 0, 0);
    rect(mouseX, mouseY, random(40, 150), random(40, 150));
  }
  if (key=='b' || key == 'B') {
    fill(0, 0, 255);
    rect(mouseX, mouseY, random(40, 250), random(40, 250));
  }
  if (key=='y' || key=='Y') {
    fill(255, 255, 0);
    rect(mouseX, mouseY, random(10, 300), random(10, 300));
  }
}



