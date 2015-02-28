
int RATIO = 20;
float x1, y1, x2, y2;

void setup() {
  size(200, 200);
  background(0);
  frameRate(1000);
  stroke(255, 10);
}

void draw() {
  x1 = width/2 + randomGaussian()*RATIO;
  y1 = height/2 + randomGaussian()*RATIO;
  x2 = width/2 + randomGaussian()*RATIO;
  y2 = height/2 + randomGaussian()*RATIO;

  line(x1, y1, x2, y2);
}



