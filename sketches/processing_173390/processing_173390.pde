
float newrot;
int newhue;
void setup() {
  size(600, 600);
  smooth();
  noStroke();
  colorMode(HSB);
  //rectMode(CENTER);
}

void draw() {
  fill(newhue, 255, 255);


  for (int x=0; x<=width; x+=100) {
    for (int y=0; y<height; y+=100) {
      pushMatrix();
      translate(x,y);
      rotate(newrot);
      pushMatrix();
      translate(x, y);
      rotate(newrot);
      rect(0, 0, 100, 100);
      popMatrix();
      popMatrix();
    }
  }

  newhue++;
  newrot+=0.02;
  if (newhue==255) {
    newhue=0;
  }
}

