
void setup()
{
  size(400, 400);
  smooth();
}

void draw() {
  background(240,235,220);

  stroke(220,95,255, 200);
  strokeWeight(10);
  for (int x=0; x<=width; x+=40)
  {
    for (int y=0; y<=height; y+=40)
    {
      pushMatrix();
      translate(x, y);
      float a = atan2(mouseY-y, mouseX-x); //Calculate the angle btw mouse & center
      rotate(a);                           //Pass that angle to rotate()

      line(-20, 0, 20, 0); //Simple Arrow, facing to the right
      line(12, -14, 20, 0);
      line(12, 14, 20, 0);
      popMatrix();
    }
  }
}


