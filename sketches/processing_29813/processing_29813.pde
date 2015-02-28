
class Bar {
  float yPos;
  float valueLeft, valueRight;
  float barSizeLeft, barSizeRight;
  float barHeight;
  String label;

  void render() {

    noStroke();

    fill(55,70,80);
    float barSizeLeft = valueLeft/maxValue*(width/2-10);
    rect(width/2-barSizeLeft, yPos, barSizeLeft, barHeight);

    fill(0,80,80);
    float barSizeRight = valueRight/maxValue*(width/2-10);
    rect(width/2, yPos, barSizeRight, barHeight);

    fill(0);
    textAlign(CENTER, CENTER);
    text(label, width/2, yPos+barHeight/2-10);

    fill(0,0,70);
    if (valueLeft > 0) {
      textAlign(RIGHT);
      text(str(round(valueLeft*10)/10.0), width/2-10, yPos+barHeight/2+10);
    }
    if (valueRight > 0) {
      textAlign(LEFT);
      text(str(round(valueRight*10)/10.0), width/2+10, yPos+barHeight/2+10);
    }
  }
}


