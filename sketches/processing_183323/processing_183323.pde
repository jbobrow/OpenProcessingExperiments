
PImage i1, i2;
color c1;
color c2;

void setup() {
  size(1920, 1200);
  noStroke();
}
void draw() {
  background(0);
  cc();
  for (int i=0; i<width; i= i+35) {
    if (random(10) >9) {
      cc();
    }

    for (int j=0; j<height; j= j+25) {
      if (random(100) >99) {
        cc();
      }
      fill(lerpColor(c1, c2, norm(j, 0, width)));
      
      rect(i, j, 25, 35);
    }
    //stop();
  }

}

void cc() {
  c1 = color(random(255), random(255), random(255));
  c2 = color(random(255), random(255), random(255));
}

