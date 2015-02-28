
class BarUnit {

  float xPosition, yPosition, zPosition, boxDims, boxH;
  color boxColor, strokeColor;
  int boxStroke;

  BarUnit() {
    boxColor = color(255);
    strokeColor = color(128);
    boxStroke = 5;
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



