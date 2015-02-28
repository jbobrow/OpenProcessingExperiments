
int d= 2;
int h = 0;


void setup() {
  size( 400, 400);
}
void draw() {
  background(0);
  colorMode(HSB);
  fill(h, 255, 255);
  ellipse(height/2, width/2, d, d);
  if ( mousePressed) {
    d = d + 1;
  }

  if (d > 600) {

    d = 10;
    h=h+20;
    fill(255, 0, 0);
    ellipse(height/2, width/2, d, d);
  }
}
