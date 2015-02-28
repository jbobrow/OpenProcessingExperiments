
PVector[] circles = new PVector[5];
float t = 0;
int r = 100;

void setup() {
  size(1000, 1000);
  background(255);
  
  for(int i=0; i<5; i++) {
    circles[i] = new PVector(r/2+random(width-r), r/2+random(height-r));
  }
}

void draw() {
  for(int i=0; i<5; i++)
    circles[i].x = (circles[i].x+noise(t+i*2)*r/5)%width;
  t += 0.01;
  
  background(255);
  for(int i=0; i<5; i++) {
    colorMode(HSB, 255);
    fill(255/5*i, noise(t+i*2)*255-50, 255);
    ellipse(circles[i].x, circles[i].y, r, r);
  }
}
