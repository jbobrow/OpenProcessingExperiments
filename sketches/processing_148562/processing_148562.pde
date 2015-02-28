
int RATIO = 50;
float x1, y1, x2, y2;
 
void setup() {
  size(500, 500);
  background(0);
  frameRate(700);
  stroke(200,250);
}
 
void draw() {
  x1 = width/2 + randomGaussian()*RATIO;
  y1 = height/2 + randomGaussian()*RATIO;
  x2 = width/2 + randomGaussian()*326;
  y2 = height/2 + randomGaussian()*45;
 
  line(x1, y1, x2, y2);
}

