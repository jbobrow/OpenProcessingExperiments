
import processing.pdf.*;
void setup() {
  size(750, 750);
  noFill();
  smooth();
  background(255);
}

void makeShape() {
  if (millis()<149) {
    stroke(0, 255);
    float change = radians(360)/random(2);
    strokeWeight(2);
    float center = mouseX-width/3;
    translate(width/2, height/2);
    beginShape();
    for (int i = 0; i<=100; i= i+1) {
      float x = center*sin(change*i);
      float y = center*tan(change*i);
      vertex(x, y);
    }
  }
}

void draw() {
  makeShape();
  endShape();
  if (keyPressed == true) {
    if (key == 's') {
      saveFrame("Design.jpeg");
    }
  }
}

