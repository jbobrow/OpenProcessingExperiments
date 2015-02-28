
void setup() {
  size(900, 900, P3D);
}
void mousePressed() {
  background(random(255), random(255), random(255), random(255));
}

void draw()
{
  if (dist(mouseX, mouseY, width/2, height/2)>200) {
    fill(random(100), random(100), random(100), random(100));
    translate(mouseX, mouseY, random(400));
    rotate(random(1, 5));
    box(50);
  }
}

