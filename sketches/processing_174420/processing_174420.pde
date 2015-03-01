
int n = 5;
int sizes = 800;
float speed = 2;
float h1;
float time;
int ix;
int iy;
float sat;
float add;
float add2;
float add3;
float noiseScale = 0.2;
float r1 = random(1);
float r2 = random(1);
int Y_AXIS = 1;
int X_AXIS = 2;
color c1, c2;

void setup() {
  size(sizes - sizes%n,sizes - sizes%n,P2D);
  colorMode(HSB, 100, 100, 100);
  background(0);
  rectMode(CORNERS);
  noStroke();
  h1 = height;
}

void draw() {
  time = (millis())*0.01;
  //noiseScale = 0.1*(int(n*mouseY/height + 1) + int(n*mouseX/width + 1))/n;
  //speed = 10*(1-mouseY/h1);
for (ix = 0; ix < width; ix = ix + width/n) {
  for (iy = 0; iy < height; iy = iy + height/n) {
  sat = 1000*noise((sin(ix))*r1*ix*noiseScale + (sin(iy))*r2*iy*noiseScale);
  setGradient(ix, iy, width/n, width/n, X_AXIS);
}
}
}

void mousePressed() {
  r1 = random(1);
  r2 = random(1);
}

void keyPressed() {
  if (keyCode == UP) {
    n = constrain(n + 1, 1, 100);
  }
  if (keyCode == DOWN) {
    n = constrain(n - 1, 1, 100);
  }
  if (keyCode == LEFT) {
    speed = constrain(speed - 0.5, 0.5, 10);
  }
  if (keyCode == RIGHT) {
    speed = constrain(speed + 0.5, 0.5, 10);
  }
}

void setGradient(int gx, int gy, float gw, float gh, int axis ) {

  noFill();
  
    for (int gi = gx; gi <= gx+gw; gi++) {
      float inter = map(gi, gx, gx+gw, 0, 1);
      add = (sat + speed*time);
      add2 = (sat + speed*time - 10);
      add3 = (lerp(add, add2, inter))%100;
      color c = color(add3, 75, 75);
      stroke(c);
      line(gi, gy, gi, gy+gh);
    }
  }
