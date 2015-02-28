
class CreatureA {
  //very stripped down and basic i suppose, but still doing the particle thing.
  //particles really were kind of difficult to get my head wrapped around 100% at first
  //Matte's example really helped me to get it more fully
  int currentX, currentY;
  int lastX, lastY;

  float stepRange;
  float jazz;//names that are just fun
  float v = 0;
  float inc = 20;

  public CreatureA(int tempX, int tempY, float range, float snowboard) {
    currentX = tempX; 
    currentY = tempY;
    stepRange = range;
    jazz = snowboard;//more good names
  }

  public void update() {
    currentX += int(random(-stepRange, stepRange));
    currentY += int(random(-stepRange, stepRange));

    currentX = constrain(currentX, 0, width);
    currentY = constrain(currentY, 0, height);

    stroke(0);
    strokeWeight(4);
    rect(currentX-20, currentY-20, currentX+20, currentY+20);
  }
}


