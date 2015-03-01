


int[] angles = { 30, 30, 30, 10};

void setup() {
  size(400, 400);
  noStroke();
}

void draw() {
  background(0, 200, 210);
  pieChart(mouseX, angles);
  fill(0);
  ellipse(100,100, 100, 100);
  ellipse(200, 100, 100, 100);
  fill(190);
  rect(100, 100, 200, 10);
}

void pieChart(float diameter, int[] data) {
  float lastAngle = 0;
  for (int i = 0; i < data.length; i++) {
    float gray = map(i, 0, data.length, 0, 255);
    fill(gray);
    arc(width/2, height/2, diameter, diameter, lastAngle, lastAngle+radians(angles[i]));
    lastAngle += radians(angles[i]);
  }
}


