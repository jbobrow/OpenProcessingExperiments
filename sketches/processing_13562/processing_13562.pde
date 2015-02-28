

class InfoBubble
{
  // center of the small bubble
  int xpos;
  int ypos;
  // where the big info bubble is centered with respect to the small bubble
  // translation coordinates - hence can be negative
  int xtrans;
  int ytrans;
  // information to print out in the bubble
  InfoData data;
  
  InfoBubble(int tempX, int tempY, int tempXt, int tempYt, InfoData tempData)
  {
    xpos = tempX;
    ypos = tempY;
    xtrans = tempXt;
    ytrans = tempYt;
    data = tempData;
  }
  
  void HiddenBubble(int rr)
  {
    noStroke();
    fill(255,0,0,128);
    ellipse(xpos, ypos, rr, rr);
  }
  
  void ShowBubble()
  {
    stroke(255, 0, 0);
    fill(200, 255, 255);
    strokeWeight(1);
    //ellipseMode(RADIUS);
    noStroke();
    //fill(227, 151, 23);
    //ellipse(xpos+xtrans, ypos+ytrans, data.bigRadius, data.bigRadius);
    fill(255);
    textAlign(CENTER);
    textSize(16);
    text(data.title, 500, 10, 140, 50);// xpos+xtrans, ypos+ytrans - sqrt(data.bigRadius), sqrt(data.bigRadius), sqrt(data.bigRadius));
    textAlign(RIGHT);
    textSize(14);
    text(data.comment, 430, 40, 200, 300);//xpos+xtrans, ypos+ytrans, sqrt(data.bigRadius), sqrt(data.bigRadius));
  }

}


