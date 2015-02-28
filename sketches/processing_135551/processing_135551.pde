
float a;
void setup() {
  size(640,360);
  stroke(255);
  a=height/2;
}
void draw() {
  background (200);
rect(0,a,width,a);
  a=a-0.5;
  if (a < 0) {
    a=height;
  }
}
