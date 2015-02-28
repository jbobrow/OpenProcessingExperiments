
float zoom = 150;
final long sand = (long)random(10000);
void setup() {
  size(512, 512, P2D);
  background(255);
  II(random(-1, 1), random(-1, 1), 5);
}
void draw() {
  noStroke();
  fill(255, 255, 255, 220);
  rect(0, 0, width, height);
  stroke(0);
  randomSeed(sand);
  for(int i = 0; i < 2; i++)
    II(random(-1, 1), random(-1, 1), 14);
  
}
void II(float a, float b, int n) {
  point(a*zoom+width/2, b*zoom+height/2);
  a -= ((float)mouseX-width/2)/40;
  b -= ((float)mouseY-height/2)/40;
  float ta = rSr(a, b);
  float tb = iSr(a, b);
  a = ta;
  b = tb;
  point(a*zoom+width/2, b*zoom+height/2);
  if(n>0) {
    II(a, b, n-1);
    II(-a, -b, n-1);
  }
}
float signum(float a) {
  float g = 0;
  if(a>0)
    g = 1;
  if(a<0)
    g = -1;
  return g;
}
float rSr(float a, float b) {
  return sqrt((a+sqrt(a*a+b*b))/2);
}
float iSr(float a, float b) {
  return signum(b)*sqrt((-a+sqrt(a*a+b*b))/2);
}

