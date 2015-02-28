
/*
 * OP - sketch, kof 12
 */

/////////////////////////
float w = 6;
float h = 5;

float speed = 241.3;
float cycle = 50.0;
float amp= 600.0;


boolean inverse = false;
/////////////////////////
void setup() {
  size(800, 450, P2D);
}
void draw() {
  background(inverse?0:255);
  noStroke();

  int cnt = 0;
  for (float x = 0 ;x<width ;x+=w) {
    for (float y = (int)(-amp) ;y<height + amp;y+=h*2) {

      float shift = sin(x/cycle +frameCount / speed)*amp;
      fill(inverse?255:0);
      rect(x, y+shift, w, h);
    }
    stroke(0);
    line(x, 0, x, height);
  }
}
//////////////////////////

