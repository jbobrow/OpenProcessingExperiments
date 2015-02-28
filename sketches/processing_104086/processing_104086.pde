
float vx;
float vy;
float a;
float b;



void ZERO () {
  vx = pmouseX;
  vy = pmouseY;
  a= random (TWO_PI);
  b= 0;
}

void setup () {

  size (600, 600);
  background (255);
  colorMode (HSB, 100);
  smooth();
  noFill();
}

void draw() {
  stroke (0, 100, random(10, 30));
  strokeWeight (b);
  float nx = vx + cos(a) * 6;
  float ny = vy + sin(a) * 6;
  line (vx, vy, nx, ny);
  vx =nx;
  vy= ny;
  a=a + random (-0.5, 0.5);
  b= b + 0.1;
  if (vx < 0 || vy <0 || vx > width || vy > height || mousePressed ) {
    ZERO();
  }
}


