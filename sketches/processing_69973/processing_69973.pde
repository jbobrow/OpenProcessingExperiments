
int rad = 200;

void setup() {
  size(600, 600);
  background(255);
}

void draw() {
  translate(width/2, height/2);

  stroke(random(255), random(255), random(255));

  float angle1 = random(255);
  float angle2 = random(255);
  //converting radians to degrees
  float x1 = sin(angle1) * rad;
  float y1 = cos (angle1) * rad;
  float x2 = sin(angle2) * rad;
  float y2 = cos (angle2) * rad;
  strokeWeight(1);
  line(x1, y1, x2, y2);
}


