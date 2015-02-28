
void setup() {
  size(700, 700);
  smooth();
  noStroke();
}

void draw() {
  background(map(mouseY,0, 500, 98, 52), map(mouseY, 0, 500, 2, 199), map(mouseY, 0, 500, 178, 255));
  float esize;
  float col;
  float opacity;
  int cloudDistance = 20;
  
  for (int x=0; x<=width; x=x+cloudDistance)
  {
    for (int y=0; y<=height+20; y=y+cloudDistance) {
      esize = 20 + random(mouseY/15);
      col = map(mouseY, 0, 500, 120, 255);
      opacity = random(mouseY/2);
      fill(col, opacity);
      arc(x, y, esize, esize, PI, 2*PI);
    }
  }
}
