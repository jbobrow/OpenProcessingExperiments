
float r;
float t, dt;

void setup() {
  size(700, 600);
  background(#ffaa00);
  smooth();
  strokeWeight(2);
  t = 0;
  dt = 0.005;
}

void draw() {
  fill(255,196,00,20);
  noStroke();
  rect(0, 0, width, height);
  
  fill(random(150, 255), random(150, 255), random(0, 200), 90);
  stroke(255, 0, 0, 140);
  strokeWeight(2);
  
  ellipse(
    random(30, width-30),
    random(30, height-30),
    r = 25 + random(0, 130),
    r
  );
  
  drawJam();
}

void drawJam() {
  t += dt;
  
  fill(255, 255, 255, 56);
  stroke(255, 0, 0, 80);
  strokeWeight(5);
  ellipse(width / 2, height / 2, 400, 400);
  line(
    width / 2,
    height / 2,
    width / 2 + 190 * sin(t),
    height / 2 - 190 * cos(t)
  );
  line(
    width / 2,
    height / 2,
    width / 2 + 100 * sin(t*t),
    height / 2 - 100 * cos(t*t)
  );
  ellipse(
    width / 2 + 100 * sin(9*t),
    height / 2 + 100 * cos(9*t),
    20 + 60 * sin(tan(5*t)),
    20 + 60 * sin(tan(5*t))
  );
}
