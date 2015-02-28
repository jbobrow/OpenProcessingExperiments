
int rad = 200;
int ballSize = 20;

void setup() {
  size(500, 500);
  background(0);
}

void draw() {
  translate(width/2, height/2);
  
  float angle = random(radians(360));
  float angle2 = random(radians(360));

  float x = cos(angle) * rad;
  float y = sin (angle) * rad;
  float x2 = cos (angle2) * rad;
  float y2 = sin (angle2) * rad;

  stroke (random(255), random(255), random(255));

  line (x, y, x2, y2);
}
