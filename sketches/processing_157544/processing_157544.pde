
float px = 0;

void setup () {
  size (333, 333);
}
void draw() {
  px +=0.06;


  if (px>TWO_PI) {
    px=0;
  }

  noStroke();
  fill(random(255), random(255), random(255));
  ellipse(mouseX, mouseY, 50, 50);
  fill(random(255));
  arc(mouseX, mouseY, 50, 50, 0, px);

  fill(random(255), random(255), random(255));
  ellipse(mouseY, mouseX, 50, 50);
  fill(random(255));
  
  arc(mouseY, mouseX, 50, 50, 0, px);
}
