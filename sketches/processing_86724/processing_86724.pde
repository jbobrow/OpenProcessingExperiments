
// Homework 3
// © Joseph Oak 2013

void setup() {
  
  size(400,400);
  background(0);
  smooth();
  frameRate(30);
  
}

void draw() {
  
  noFill();
  stroke(255);
  strokeWeight(.5);
  rect(100, 100, 200, 200);

  // Lines
  if (mousePressed == true) {
    stroke(255);
    strokeWeight(.75);
    line(100, 100, mouseX, mouseY);
    line(width - 100, 100, mouseX, mouseY);
    line(width - 100, height - 100, mouseX, mouseY);
    line(100, height - 100, mouseX, mouseY);
  }
  
}

