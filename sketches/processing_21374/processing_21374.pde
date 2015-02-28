
class Creature {
  int currentX, currentY, currentXmouse, currentYmouse;
  int lastX, lastY;
  float stepRange = 1;
  int r=1;



  public Creature(int x, int y, float stepRange) {
    currentX = lastX = x;
    currentY = lastY = y;

    this.stepRange = stepRange;
  }

  public void update() {
    lastX = currentX;
    lastY = currentY;


    // add a random increment to x and y
    currentX += int(random(-stepRange, stepRange));
    currentY += int(random(-stepRange, stepRange));
    currentXmouse = mouseX;
    currentYmouse = mouseY;

    // make sure that the position never leaves the screen
    currentX = constrain(currentX, 0, width);
    currentY = constrain(currentY, 0, height);
  }


  // class drawing function
  public void draw() {
    fill(220,160,0);
    ellipse(lastX,lastY,50,50);
    fill(255);    
    ellipse(lastX+5,lastY+5,20,20);
    fill(0);
    text("1", lastX+1, lastY+11);
  }
}


