
void setup() {
  size(600, 600);


  background(150, 150, 0);
  translate(width/2, height/2);

  float radius = 10;
  int counter = 0;
  float circleRadius = 600.0;
  float rd = 60.0;
  float grn = 0.0;
  float blu = 200.0;

  strokeWeight(5);

  for (; counter < 40; counter++) {
    stroke(rd, grn, blu, 100);
    ellipse(0, 0, circleRadius, circleRadius);
    circleRadius = circleRadius - 5;
    blu = blu - random(13);
    grn = grn + random(10);
  }

  counter = 0;

  for (; counter < 40; counter++) {
    stroke(rd, grn, blu, 100);
    ellipse(0, 0, circleRadius, circleRadius);
    circleRadius = circleRadius - 5;
    grn = grn - random(10);
    rd = rd + random(10);
  }

  counter = 0;

  for (; counter < 40; counter++) {
    stroke(rd, grn, blu, 100);
    ellipse(0, 0, circleRadius, circleRadius);
    circleRadius = circleRadius - 5;
    rd = rd - random(7);
    blu = blu + random(13);
  }
}


