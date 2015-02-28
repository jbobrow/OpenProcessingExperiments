
float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width

float ex, ey;    // ellipse x- and y-coordinate
float ed = 106;  // ellipse diameter

void setup() {
  size(640, 360);
  smooth();
  noStroke();

  // Set the x- and y-coordinates for the rectangle
  rx = width * 0.33 - rd/2;
  ry = height * 0.5 - rd/2;

  // Set the x- and y-coordinates for the ellipse
  ex = width * 0.66;
  ey = height * 0.5;
}

void draw() {
  background(200);
  rect(rx, ry, rd, rd);
  ellipse(ex, ey, ed, ed);
  if (mouseY > (height * 0.5) - 50 && mouseY < (height * 0.5) +50 && mouseX > (width * 0.33) - 50 && mouseX < (width * 0.33) + 50) {
    fill(137, 32, 32);
    rect(rx, ry, rd, rd);
    fill(255);
    ellipse(ex, ey, ed, ed);
    if (mousePressed) {
      for (float x = rx; x <=rx+100; x += 10) {
        stroke(200);
        line(x, 130, mouseX, mouseY);
      }
      for (float y = rx; y <=rx+100; y += 10) {
        stroke(200);
        line(y, 230, mouseX, mouseY);
      }
      for (float a = ry; a <= rx+100; a +=10){
        stroke(200);
        line(rx, a, mouseX, mouseY);      }
        for (float a = ry; a <= rx+100; a +=10){
        stroke(200);
        line(rx+100, a, mouseX, mouseY);      }
    }
  }
  else { 
    fill(255);
  }
  if (dist(ex, ey, mouseX, mouseY) <= ed * 0.5) {
    fill(32, 36, 137);
    ellipse(ex, ey, ed, ed);
    fill(255);
    rect(rx, ry, rd, rd);
  }
}


