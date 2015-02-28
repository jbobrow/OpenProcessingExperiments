

class InfoBubble
{
  int xpos;
  int ypos;
  InfoData data;
  
  InfoBubble(int tempX, int tempY, InfoData tempData)
  {
    xpos = tempX;
    ypos = tempY;
    data = tempData;
  }
  
  void HiddenBubble(int rr)
  {
    //stroke(255,0,0,128);
    noStroke();
    fill(255,0,0,128);
    //strokeWeight(3);
    ellipse(xpos, ypos, rr, rr);
  }
  
  void ShowBubble()
  {
    stroke(255, 0, 0);
    fill(200, 255, 255);
    strokeWeight(1);
    ellipseMode(RADIUS);
    float bubbleRadius = data.radiusCalc();
    //println(bubbleRadius);
    float bigradius = data.radius2*bubbleRadius;
    noStroke();
    fill(227, 151, 23);
    ellipse(scale*620, scale*(800-bigradius), scale*bigradius, scale*bigradius);
    fill(190, 94, 33);
    ellipse(scale*620, scale*(800-bubbleRadius), scale*bubbleRadius, scale*bubbleRadius);
    fill(0);
    textAlign(LEFT);
    String line2 = "SKA SA " + nfc(data.SA_only, 0) + ' ' + data.unit;
    String line1 = "SKA Africa\n" + nfc(data.Africa, 0) + ' ' + data.unit;
    textSize(20);
    text(data.title, scale*50, scale*520, scale*400, scale*300);
    textSize(14);
    text(data.comment, scale*20, scale*580, scale*440, scale*300);
    textAlign(CENTER);
    textSize(10);
    text(data.source, scale*20, scale*740, scale*460, scale*300);
    textSize(20);
    text(line1, scale*450, scale*(800-bigradius*1.8), scale*300, scale*300);
    textSize(16);
    text(line2, scale*470, scale*(800-bubbleRadius), scale*300, scale*300);
  }

}


