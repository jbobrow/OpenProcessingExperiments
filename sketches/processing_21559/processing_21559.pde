
class creature_1 {
  int currentX, currentY;
  int lastX, lastY;
  float stepRange = 3;


  public creature_1(int x, int y, float stepRange)
  {
    currentX = lastX = x;
    currentY = lastY = y;
    this.stepRange = stepRange;
  }

  public void update()
  {
    lastX = currentX;
    lastY = currentY;


    currentX += int(random(-stepRange, stepRange));
    currentY += int(random(-stepRange, stepRange));

    currentX = constrain(currentX, 0, width);
    currentY = constrain(currentY, 0, height);
  }

  public void draw()
  {
    pushMatrix();
    translate(currentX,currentY);
    noFill();
    stroke(random(255),random(255),random(255));
    strokeWeight(2);
    ellipse(56, 46, 55, 55);
    popMatrix();
  }
}


