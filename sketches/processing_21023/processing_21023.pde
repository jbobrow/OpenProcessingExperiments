
class Creature {

  int currentX, currentY;
  int lastX, lastY;

  float stepRange;
  float v = 0;
  float inc = 20;
  float numCircs;
  float bugSize;
  color lineColor;
  color fillColor;


  // called as new creature is drawn:
  public Creature(int x, int y, float stepRange, float numCircs, float bugSize, color lineColor, color fillColor) {
    currentX = lastX = x; 
    currentY = lastY = y;

    this.stepRange = stepRange;
    this.numCircs = numCircs;
    this.bugSize = bugSize;
    this.lineColor = lineColor;
    this.fillColor = fillColor;
  }


  public void update() {
    lastX = currentX;
    lastY = currentY;

    // add a random increment to x and y
    currentX += int(random(-stepRange, stepRange));
    currentY += int(random(-stepRange, stepRange));

    // make sure that the position never leaves the screen
    currentX = constrain(currentX, 0, width);
    currentY = constrain(currentY, 0, height);
  }



  public void draw() {

    //brownian stuff:
    stroke(fillColor);
    strokeWeight(random(10));
    //line(currentX-10, currentY-10, currentX, currentY);

    //draw circles until it is equal to the numCircs number that's passed in above
    for (float i=0; i<numCircs; i++) {
      float circX = currentX + random( -stepRange, stepRange );
      float circY = currentY + random( -stepRange, stepRange );
      
      stroke(lineColor);
      strokeWeight(random(5));
      
      fill(fillColor);
      ellipse(circX+mouseX/5, circY+mouseY/5, bugSize, bugSize);
    }
  }
}


