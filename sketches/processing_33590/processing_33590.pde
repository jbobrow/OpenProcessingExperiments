
void setup() {
  size(500, 500);
  smooth();
  background(0);
}

void draw() {

  fill(255);
  ellipse(width/2, height/2, 250, 150);
  fill(0);

    float ell2X=map(mouseX, 0, width, 100, 200);
    float ell2Y=map(mouseY, 0, height, 0, 50);
    ellipse(ell2X+100, height/2, ell2Y+10, 150);
    line(10,10,10,10);
 }

