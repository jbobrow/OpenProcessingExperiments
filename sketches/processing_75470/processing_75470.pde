
int x, y;
color c;

void setup() {
  size(400, 400);
  x = width/2;
  y= height/2;
  colorMode(HSB);
  c = color(255);
}
void draw() {
  background(0);
  if (keyPressed) {
    fill(c);
    ellipse(x, y, 50, 50);
    fill(0);
    text(key, width/2, height/2);

    if (key==CODED) {
      if (keyCode==UP) {
        y--;
      }
      if (keyCode==DOWN) {
        y++;
      }
      if (keyCode==LEFT) {
        x--;
      }
      if (keyCode==RIGHT) {
        x++;
      }
    }

      c = color(256.0*x/width,256.0*y/height,255);
    
  }
}


/*

 */

