
void setup() {
  size(500,500);
  background(0);
  smooth();
}

void draw()
{
  fill(255);
  int x = 0;
  int y = 0;
  float angle = 0;

  for (x = 0; x <= width; x+=20) {
    for (y = 0; y <= height; y+=20) {
      pushMatrix();

      translate(x, y);
      angle = atan2(mouseY-height/2, mouseX-width/2);
      rotate(angle);
      float distance = dist (mouseX, mouseY, x, y);
      //stroke(distance); 
      line(0, 0, distance/angle, 5);
      ellipse (0, 0, angle, angle);
      popMatrix();
    }
  }
}
