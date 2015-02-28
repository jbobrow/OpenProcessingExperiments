
 //Ana Vlajnic: FINAL
 
int d = 1;
PFont font;
 
void setup() {
  size(400, 400);
 // font = createFont ("Arial", 10, true);
  frameRate(20);
  background(0);
  strokeWeight(70);
  noFill();
}
 
void draw() {

  if (mouseX < 200 && mouseY < 200) {
    if (mousePressed) {
      stroke(100, 100, 255, 25);
      ellipse(mouseX, mouseY, d, d);
      d += 5;
    }
    else {
      d = 5;
    }
  }
  if (mouseX > 200 && mouseY < 200) {
    if (mousePressed) {
      stroke(100, 255, 150, 25);
      ellipse(mouseX, mouseY, d, d);
      d += 5;
    }
    else {
      d = 5;
    }
  }
    if (mouseX > 200 && mouseY > 200) {
    if (mousePressed) {
      stroke(255, 100, 100, 25);
      ellipse(mouseX, mouseY, d, d);
      d += 5;
    }
    else {
      d = 5;
    }
  }
    if (mouseX < 200 && mouseY > 200) {
    if (mousePressed) {
      stroke(250, 240, 100, 25);
      ellipse(mouseX, mouseY, d, d);
      d += 5;
    }
    else {
      d = 5;
    }
  }
}



