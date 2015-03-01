
int x = 200;
int y = 150;
int r = 185;
int n = 8; 
int rs = 22;


void setup() {
  size(500,500);
  noStroke();
  smooth();
  noLoop();
  randomSeed(rs);
  background(200, 200, 10, 120);
}

void draw() {
  drawCircle(x, y, r, n);
}

void drawCircle(float x, float y, int radius, int num) {
  float value = 126* num/6.0;
  fill(value, 100, 100, 110);
  ellipse(x, y, radius*2, radius*2);
  if(num>1) {
    num = num -1;
    int branches = int(random(2, 6));
    for (int i = 0; i<branches; i++) {
      float a = random(0, TWO_PI);
      float newx = x + cos(a) * 6.0 * num;
      float newy = y + sin(a) * 6.0 *num;
      drawCircle(newx, newy, radius/2, num);
    }
  }
}



