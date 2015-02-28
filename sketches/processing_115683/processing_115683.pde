
float hx, hy;

void setup() {
  size(800, 800);
  smooth();
  noLoop();
}

void draw() {
  background(240);

  for (int i = 50; i <= width; i += 100) {
    brush( i, 100, int(random(3, 6)), int(random(100, 200)), int(random(10, 48)) );
  }
  brush( width/2, 500, 4, 230, 48);
}

void brush(float a, float y, int number, int size, int d) {
  noStroke();
  //handle
  fill(0, 230, 255);
  float c = 80;
  float e = 100 + size/1.2;
  quad(a-size/2+c, y, a-size/2+c, y + e, a+size/2-c, y + e, a+size/2-c, y);
  //brush head------------------------------

  float steps = size/number;
  float value = 255/number;

  for ( int i = 0; i < number; i++) {
    float x = a - i*5;
    float rx = size - i*steps - 60/(i+1);
    float ry = size - i*steps + i*15;

    fill(value*i + 100, 255, 255);
    ellipse(x, y, rx, ry);

    //hairs--------------------------------
    float inc = TWO_PI / d;
    for (int h=1; h<=d; h++) {
      float sw = i*0.7 + 0.5;
      float xn = x+cos(h*inc - HALF_PI) * rx/2;
      float yn = y+sin(h*inc - HALF_PI) * ry/2;
      strokeWeight(sw);
      if ( h <= d/2) {
        line(xn, yn, xn - 30, yn);
        stroke(0, 255);
      } 
      else {
        line(xn, yn, xn - 20, yn);
        stroke(0, 150);
      }
    }
  }
}



