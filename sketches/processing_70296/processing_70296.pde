
float radius=150;
float angle1;
float angle2;


void setup() {
  background(0);
  size(400, 400);
}
void draw() {
  smooth();
  translate(width/2, height/2);
  angle1 = radians(random(360));
   angle2 = radians(random(360));
  stroke(random(255), random(255), random(255),random(255));
  line(sin(angle1)* radius, cos(angle1)*radius, sin(angle2)*radius, cos(angle2)*radius);
}

