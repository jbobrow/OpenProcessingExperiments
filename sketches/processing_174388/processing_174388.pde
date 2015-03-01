
int n = 5;
int sizes = 1000;
float speed = 2;
float time;
int ix;
int iy;
float sat;
float add;
float noiseScale = 0.2;
float r1 = random(1);
float r2 = random(1);

void setup() {
  size(sizes - sizes%n,sizes - sizes%n,P2D);
  colorMode(HSB, 100, 100, 100);
  background(0);
  rectMode(CORNERS);
  noStroke();
}

void draw() {
  time = (millis())*0.01;
  //noiseScale = 0.1*(int(n*mouseY/height + 1) + int(n*mouseX/width + 1))/n;
for (ix = 0; ix < width; ix = ix + width/n) {
  for (iy = 0; iy < height; iy = iy + height/n) {
  //sat = 20*(3.732*(0.5 + 0.5*sin(ix)) + 1.43*(0.5 + 0.5*sin(iy)));
  sat = 1000*noise(r1*ix*noiseScale + (sin(iy))*r2*iy*noiseScale);
  add = (sat + speed*time)%100;
  fill(add, 75, 75);
  rect(ix, iy, ix + width/n + 1, iy + width/n + 1);
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
