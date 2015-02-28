
void setup() {
  size(256, 256);
  colorMode(HSB);
  background(0);
  dragon( 96, 64, 96, 192, 17);
}
void dragon(float x1, float y1, float x2, float y2, int i) {
  if (i>1) {
    dragon( x1, y1, (x1+x2)/2 - (y1-y2)/2, (y1+y2)/2 + (x1-x2)/2, i-1);
    dragon( x2, y2, (x1+x2)/2 - (y1-y2)/2, (y1+y2)/2 + (x1-x2)/2, i-1);
  }
  if (i==1) {
    stroke(2*sqrt(sq(y2-128)+sq(x1-128))%256, 192, 255);
    line(x1, y1, x2, y2);
  }
}



