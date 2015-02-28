
float angle = 0.0;
float offset;
float scalar = 2;
float speed = 0.05;

void setup() {
  size(500, 500);
  fill(30,40,92);
  smooth();
  offset = width/2;
}
void draw() {
  float x = offset + cos(angle) * scalar;
  float y = offset + sin(angle) * scalar;
  rect(x, y, 2, 2);
  angle += speed; 
  scalar += speed;
}


