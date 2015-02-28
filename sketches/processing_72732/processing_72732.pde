
void setup() {
  size(1200, 750);
  smooth();
}

void draw() {
  background(0);
  int mid = 100;
  for (int i = 0; i < 9; i++) {
    for (int j = 0; j < 7; j++) {
      fractal(150 * i, 150 * j, 50, 3, 120);
    }
  }
}

void single(float xc, float yc, int r, int c) {
  stroke(random(100, 230), 150, 150);
  line(xc + r*2, yc, xc - r*2, yc);
  line(xc+r/cos(PI/4), yc + r/sin(PI/4), xc-r/cos(PI/4), 
       yc-r/sin(PI/4));
  line(xc, yc+r*2, xc, yc-r*2);
  line(xc+r/sin(PI/4), yc-r/cos(PI/4), xc-r/sin(PI/4), 
       yc+r/cos(PI/4));
  for (int i = 0; i < 4; i++) {
    fill(random(i, 60*i), random(0, c), 20);      
    noStroke();
    ellipse(xc, yc, i*1.5, i*1.5);
  }
}

void fractal(float xc, float yc, int r, int level, int c) {
  if (level == 1)
    single(xc, yc, r, r);
  else {
    for (int i = 0; i < 8; i++) {          
      single(xc, yc, r, c);
      fractal(xc-2*r*cos(i*PI/4), yc-2*r*sin(i*PI/4), r/4, 
              level-1, c - 50);
    }
  }
}
