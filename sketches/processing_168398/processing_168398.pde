
int x=5;
void setup() {
  size (400, 400);
}

void draw() {
  if(x <400) {
    float n = norm(x, 0.0, 250.0);
    for (float y= pow (n, 8); y <400; y +=10) {
      float g = y++;
      fill (200, g=g-1, 19);
      noStroke ();
      ellipse (x, y, 20, y++);
    }
    x+=5;
  }
}

