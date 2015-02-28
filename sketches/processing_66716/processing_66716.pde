
float f=50, i, a, b;
void setup() { 
  size(100, 100);
}
void draw() {
  background(255);
  for (i=0.1;i<TWO_PI+0.1;i+=.1) {
    line(sin(i)*f+f, cos(i)*f+f, sin(i*a)*sin(b)*f+f, cos(i*a)*cos(b)*f+f);
  }
  a+=.017;
  b+=.007;
}
