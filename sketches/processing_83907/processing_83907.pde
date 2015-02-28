
int f;
void setup() {
  size(256, 256, P2D);
  background(255);
  fill(255, 255, 255);
  stroke(0, 0, 0, 100);
  smooth();
  frameRate(30);
}
void draw() {
  f++;
  filter(BLUR, 0.6);
  if(f%10==0)
    su(0, 0, width-2, height-2, 0);
}
void su(int x, int y, int wx, int wy, float n) {
  pushMatrix();
  translate(x+wx/2, y+wy/2);
  rotate(n/10);
  rect(-wx/2+1, -wy/2+1, wx, wy);
  popMatrix();
  if((random(1)>.4&&wx>2)||wx==width-2) {
    su(x+wx/2, y+wy/2, wx/2, wy/2, n+random(-1, 1));
    su(x, y+wy/2, wx/2, wy/2, n+random(-1, 1));
    su(x+wx/2, y, wx/2, wy/2, n+random(-1, 1));
    su(x, y, wx/2, wy/2, n+random(-1, 1));
  }
}

