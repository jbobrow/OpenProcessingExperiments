
void setup () {
  size(500,500);
  background(255,255,255);
  smooth();
  strokeWeight(5);
}

void draw () {
  background(255,255,255);
  translate(width/2, height/2);
  clock(0,0,500);
}
 void clock (int x, int y, int r) {
  if (r>10) {
  rotate(radians(frameCount%360));
  ellipse(x,y,r,r);
  r=r/2;
  translate(r/2,0);
  rotate(radians(frameCount%360));
  clock(x,y,r);
 }
 }

