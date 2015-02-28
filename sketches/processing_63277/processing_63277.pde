
float posLeft=100;
float posRight=400;
float posCenter=250;
float r;
float g;
float b;


void setup() {
  size(500, 500);
  background(mouseX, mouseY);
  smooth();
  fill(255);
  quad(posLeft, 50, posCenter, 75, posCenter, 300,posLeft, 375);
  quad(posCenter, 75, posRight, 50, posRight, 375, posCenter, 300);
}

void draw() {
  if (posLeft>=posCenter)return;
  r=random(255);
  g=random(255);
  b=random(255);
  fill(r, g, b, 100);
  noStroke();
  posLeft=posLeft + 1;
  posRight=posRight - 1;
  quad(posCenter, 75, posCenter, 300, posLeft, 375, posLeft, 50);
  quad(posCenter, 75, posRight, 50, posRight, 375, posCenter, 300);

}




