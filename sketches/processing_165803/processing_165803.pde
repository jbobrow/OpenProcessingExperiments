
float angle = 0.5;
float speed = 0.01;

void setup () {
  size (300, 300);
  noStroke ();
  smooth ();
  fill (255, 180);
}
void draw () {
  background (126, 126, 65);
  circlePhase (0.0);
  circlePhase (QUARTER_PI);
  circlePhase (HALF_PI);
  circlePhase (PI/8);

  angle += speed * 2;
}

void circlePhase (float phase) {
  fill (5, 3, 62, 50);
  float diameter  = 150 + (sin(angle +phase) * 45);
  float diameter2 = 150 + (cos (angle + phase) * 45);
  rect (0, 0, diameter, diameter);
  rect (50, 50, diameter, diameter);
  rect (100, 100, diameter, diameter);
  fill (74, 72, 155, 190);
  ellipse (50, 50, diameter2, diameter2);
  ellipse (100, 100, diameter2, diameter2);
  ellipse (150, 150, diameter2, diameter2);
  
}



