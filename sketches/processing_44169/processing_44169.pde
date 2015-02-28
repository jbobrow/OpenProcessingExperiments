
class LineDup {

  int recCount;
  int plyCount;
  color lineVal;
  int strokeW;
  int xOff;
  int yOff;

  boolean reCorded;
  boolean plaYed;

  int[] xPoints;
  int[] yPoints;



  LineDup() {
    recCount = 1;
    plyCount = 0;
    reCorded = false;
    plaYed = false;
    lineVal = color(int(random(255))/*,int(random(255)),int(random(255))*/);
    strokeW = int(random(20));
    xOff = int(random(2*width)-width/2);
    yOff = int(random(2*height)-height/2);
    xPoints = new int[0];
    yPoints = new int[0];
  }

  void reset() {
    if (plaYed == true) {
      int[] xPoints = new int[0];
      int[] yPoints = new int[0];
      recCount = 1;
      plaYed = false;
    }
  }

  void recLine() {
    if (mousePressed == true) {
      xPoints = expand(xPoints, recCount);
      yPoints = expand(yPoints, recCount);
      line(mouseX, mouseY, pmouseX, pmouseY);
      xPoints[recCount-1] = mouseX;
      yPoints[recCount-1] = mouseY;
      recCount += 1;
      reCorded = true;
      plyCount = 0;
    }
  }

  void drawLine() {
    if (mousePressed == false && reCorded == true && plyCount < xPoints.length-1) {
      stroke(lineVal);
      strokeWeight(strokeW);
      line(xPoints[plyCount]+xOff, yPoints[plyCount]+yOff, xPoints[plyCount+1]+xOff, yPoints[plyCount+1]+yOff);
      plyCount += 1;
      plaYed = true;
    }
  }
}


