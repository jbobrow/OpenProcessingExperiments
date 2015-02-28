
class BarUnit {

  float xPosition, yPosition, zPosition, boxDims, boxH;
  color boxColor, strokeColor;
  int boxStroke;

  BarUnit() {
    boxColor = color(255,0,0);
    strokeColor = color(0);
    boxStroke = 1;
  }


  void drawBar(float x, float y, float z, float s, float h) { 
    xPosition = x;
    yPosition = y;
    zPosition = z;
    boxDims = s;
    boxH = h;
    pushMatrix();
    translate(xPosition, yPosition, boxH/2);
    fill(boxColor);
    strokeWeight(boxStroke);
    stroke(strokeColor);
    box(boxDims, boxDims, boxH);
    popMatrix();
  }


}



