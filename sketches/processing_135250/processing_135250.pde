
void setup() {
  size(900, 900, P3D);
}
void mousePressed() {
  background(random(255), random(255), random(255), random(255));
}

void draw()
{
  if (dist(mouseX, mouseY, width/2, height/2)>200) {
    smooth(8);
    fill(random(100, 255), random(100, 255), random(100, 255), random(100, 255));
    translate(mouseX, mouseY, random(999));
    rotate(random(1, 5));
    box(10);
  }
  if (dist(mouseX, mouseY, width/2, height/2)<200) {
    smooth(8);
    fill(random(100, 255), random(100, 255), random(100, 255), random(100, 255));
    translate(mouseX, mouseY, random(9));
    rotate(random(1, 5));
    box(60);
  }
  
}
