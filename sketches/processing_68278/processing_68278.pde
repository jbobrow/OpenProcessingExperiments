
int num = 20;
float t;


void setup() {
  size(500, 350);
  background(0);
  smooth();

  //noLoop();

  fill(0);
  stroke(255, 80);
  strokeWeight(3);
}

void draw() {
  background(0);

  for (int j = 0;j <= 3; j++) {
    for (int i = 1; i <= num;i++) {
      int y = i * 15 +20;
      float x1 = width/3 * j;
      float x2 = width/3 * (j+1);
      float w1 = 100 * abs(sin(t*i+j));
      float w2 = 100 * abs(sin(t*i+(j+1)));
      float h = 80 * abs(sin(t*i+j));

      arc(x1, y, w1, h, -PI, 0);
      line(x1+w1/2, y, x2-w2/2, y);

      t+= 0.000025;
    }
  }
}


