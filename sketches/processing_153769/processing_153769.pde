
int r = 25;
int num = 450 / r;
int x;

void setup() {
  frameRate(10);
  size(450, 450);
  background(255);
  smooth();
  noStroke();
}

void draw()
 {
  fill(0,255,255);
  for (int i=0; i<num; i++)
  {
    for (int j=0; j<num+1; j++)
     {
      if (j % 2 == 0) {
        x = i * r * 2;
      }
      else {
        x = i * r * 2 + r;
      }
      float h=random(-60,60);
      ellipse(x-h, j*r, r, r);
    }
  }
  fill(255, 255/2);
  rectMode(CORNER);
  rect(0, 0, width, height);
}
