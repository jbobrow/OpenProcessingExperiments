
int newrot;
int newhue;
void setup() {
  size(200, 200);
  smooth();
  noStroke();
  colorMode(HSB);
}

void draw() {
  fill(newhue, 255, 255);
  pushMatrix();
  //translate(width/2,height/2);
  rotate(newrot);

  rect(50, 50, 100, 100);

  popMatrix();

  newhue++;
  newrot++;
  if (newhue==255) {
    newhue=0;
  }
}

