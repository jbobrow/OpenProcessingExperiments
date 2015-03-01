
void setup() {
  size(500, 500);
  frameRate(30);
  background(#66E7EA);
}

float theta = 0;

void draw() {
  smooth();
  //background(#66E7EA);
  noStroke();
  fill(#3C8BCE);
  int n = 3;
  for(int i = 0; i < n; i++){
    drawPoint(250, 250, theta, (((abs(sin(i+theta)))*400)/n));
  }
  theta += (PI/100);
}

void drawPoint(float ox, float oy, float angle, float radius) {
  float x = (ox - cos(angle) * radius);
  float y = (oy - sin(angle) * radius);
  ellipse(x, y, 2, 2);
}



