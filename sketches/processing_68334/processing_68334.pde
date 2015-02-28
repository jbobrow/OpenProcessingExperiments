
/*
Cardioid
Use mouse to control the angle and scale of the curve.
*/
int cx, cy;  // Center of canvas.
int px, py;  // For keeping previous (x, y).

void setup() {
  size(400, 400);
  background(0);
  noFill();
  smooth();
  
  cx = width / 2;
  cy = height / 2;
}

void draw() {
  float x, y;
  float r;
  float ratio = 2 * mouseX * 1.0 / width;
  float crvScale = 5 * mouseY * 1.0 / height;

  // Background
  fill(0, 15);
  rect(0, 0, width, height);

  // Draw X- and Y-axis.
  drawAxes();

  // Draw cardioid curve.
  stroke(250);
  strokeWeight(1);
  beginShape();
  for (float t = 0; t <= TWO_PI * ratio; t = t + 0.05) {
    r = (1 + crvScale * sin(t)) * 30;
    x = round(r * cos(t) + width / 2);
    y = round(r * sin(t) + height / 2);
    //point(round(x), round(y));
    vertex(x, y);
    px = int(x);
    py = int(y);
  }
  endShape();
  
  stroke(180, 180, 20);
  line(cx, cy, px, py);
}

void drawAxes() {
  stroke(75);
  strokeWeight(1);
  line(0, cy, width, cy);  // X-axis
  line(cx, 0, cx, height); // Y-axis
}

