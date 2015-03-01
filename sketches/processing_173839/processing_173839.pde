
float clockDiameter;
int cx, cy;
PFont f, d;
color value;

void setup(){
  size(640, 640);
  stroke(255);
  clockDiameter = 500;
  cx = width / 2;
  cy = height / 2;
  print(second(), minute(), hour());
  printArray(PFont.list());
  f = createFont("Bebas Neue", 150);
  textFont(f);
}

void draw() {
  background(255);
  color value = color( second()*0.07, minute()*4.24, hour()*21.25);
  fill(value);
  noStroke();
  ellipse(cx, cy, clockDiameter, clockDiameter);
  if (mousePressed == true) {
     fill(255);
     text(hour(), 100, 380);
     text(":", 220, 370);
     text(minute(), 240, 380);
     text(":", 365, 370);
     text(second(), 400, 380);
  }
}




