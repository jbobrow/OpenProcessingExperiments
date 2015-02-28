
float angle = 0.0;
float offset = 60;
float scalar = 2;
float speed = 0.9;

void setup() {
  size(440,220);
  fill(0);
  smooth();
}

void draw() {
//background(10);
float x = offset + cos(angle) * scalar;
float y = offset + sin(angle) * scalar;
//float z = offset + sin(angle+0.8) * scalar;

ellipse(x,y,5,5);
////ellipse(120,y,70,70);
//ellipse(160,z,2,2);

angle+=speed;
scalar+=speed;
}
