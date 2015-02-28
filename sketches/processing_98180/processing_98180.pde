
float x;

void setup(){
  smooth();
  size(300,300);
  background(0);
  frameRate(100);
  x = width;
}

void draw(){
  stroke(255);
  point(x,mouseY);
  x = x-1;
  if (x<0) {
    x=width;
  }
}
