
int radius = 200;

void setup() {
  size(700,700);
  smooth();
  background(0);
}

void draw() {
  translate(width/2, height/2);
  
  // Point 1
  int deg1 = int(random(0,360));
  float angle1 = radians(deg1);
  float x1 = cos(angle1) * radius;
  float y1 = sin(angle1) * radius;
  
  // Point 2
  int deg2 = int(random(0,360));
  float angle2 = radians(deg2);
  float x2 = cos(angle2) * radius;
  float y2 = sin(angle2) * radius;
  
  stroke(random(255),random(255),random(255));
  line(x1, y1, x2, y2);
}
