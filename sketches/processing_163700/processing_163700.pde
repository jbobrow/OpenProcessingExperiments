
float x=0.0;
float y=0.0;
float a=20.0;

void setup() {
  size(500, 500);
  smooth();
  fill(0);
}

void draw() {
  frameRate(100);
  background(192,43,88);
  colorMode(HSB,360,100,100);
  noStroke();
  fill(x*0.3,200,150);
  rect(x, y, a,a);
  x +=0.5;
  y +=0.5;
  a ++;
  if (x>500) {
    x=0;
    y=0;
    a=0;
  }
}



