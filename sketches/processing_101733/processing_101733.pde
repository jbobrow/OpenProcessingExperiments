
float x = 10;
float y = 10;
float a = 0;
float b = 0;

void setup() {
  size(550, 550);
  background(0);
  noStroke();
  smooth();
}

void draw_circles(float x_, float y_, float co, float s1, float s2) {
  x = x_;
  y = y_;

  float x2 = sin(a) * s1;
  float y2 = cos(a) * s1;

  float x3 = sin(b) * s2;
  float y3 = cos(b) * s2;

  fill(co);
  ellipse(x + x2 + x3, y + y2 + y3, 4, 4);
}

void draw() {  

  int i = 1;
  int c = 4;
  while (i < c) {  
    draw_circles(width/2, height/2, i * (255/c), 30, (300/c) * i);
    i +=1;
  }
  a = a + 0.1;
  b = b + 0.01;

  //if (a > 6*TWO_PI) {
  //  noLoop();
  //}
}
