
void setup() {
  size(900,450);
  smooth();
  background(0);
  noStroke();
}

void draw() {
  for (int x = 0; x < 1000; x = x+40) {
  for (int y = 0; y < 500; y = y+20) {
    float a = random(255);
    fill(a);    //Colour
    triangle(0+x,10+y,20+x,0+y,20+x,20+y);
    float d = random(255);
    fill(d);
    triangle(20+x,0+y,40+x,10+y,20+x,20+y);
    float g = random(255);
    fill(g);
    triangle(0+x,10+y,20+x,20+y,0+x,30+y);
    float j = random(255);
    fill(j);
    triangle(20+x,20+y,40+x,10+y,40+x,30+y);
}
  }}
