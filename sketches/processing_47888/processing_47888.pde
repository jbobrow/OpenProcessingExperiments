
int c,f;
void setup() {
  size(640,480);
  c=0;
  f=255;
  colorMode(HSB);
}
void draw() {
  background(color(c,f,f));
  ellipse(320,240,c,c);
  c=(c++>255)?0:c;
}

                
                                
