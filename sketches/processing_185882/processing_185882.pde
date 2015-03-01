
int i = 20;
void setup() {
  size(800, 800);
  colorMode(HSB);
  strokeWeight(10);
  noFill();
  noCursor();
}

void draw() {
 // for (int i=500; i>0;i=i-1) {

    stroke((i/2)+(mouseX/5), 550, 450);
 // }
  background(0);
  ellipse(mouseX, mouseY, i*20, i*20);
}

