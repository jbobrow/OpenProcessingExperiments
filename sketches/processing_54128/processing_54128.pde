
class BarUnit {

  float xPosition, yPosition, zPosition, boxDims, boxH;
  color boxColor, strokeColor;
  int boxStroke;

  BarUnit() {
    
    boxStroke = 1;
  }


  void drawBar(float x, float y, float z, float s, float h, color f, color t) { 
    xPosition = x;
    yPosition = y;
    zPosition = z;
    boxDims = s;
    boxH = h;
    boxColor = f;
    strokeColor = t;
    pushMatrix();
    translate(xPosition, yPosition, boxH/2);
    fill(boxColor);
    strokeWeight(boxStroke);
    stroke(strokeColor);
    box(boxDims, boxDims, boxH);
    popMatrix();
  }


}



