
float newrot;
int newhue;
void setup() {
  size(600, 600);
  smooth();
  noFill();
  colorMode(HSB);
  rectMode(CENTER);
  noStroke();
}

void draw() {
  fill(random(0,255), random(0,255), random(0,255), 127);


  for (int x=0; x<=width; x+=100) {
    for (int y=0; y<height; y+=100) {
      pushMatrix();
      pushMatrix();
      translate(x+50, y+50);
      rotate(newrot);
      rect(0, 0, 100, 100);
      popMatrix();
      translate(x,y);
      rotate(newrot);
      popMatrix();
    }
  }

  newhue++;
  newrot+=0.02;
  if (newhue==255) {
    newhue=0;
  }
}

