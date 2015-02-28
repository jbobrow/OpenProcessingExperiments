
class Button {
  boolean hovered;
  float centerx, centery;
  float bwidth;
  float bheight;
  float textY;
  color normFill, hoverFill;
  color normStroke, hoverStroke;
  String butText;
  PFont font;
  
  Button (float centerx_, float centery_, float bwidth_, float bheight_, String butText_, color normFill_, color hoverFill_, color normStroke_, color hoverStroke_, PFont font_) {
    centerx = centerx_;
    centery = centery_;
    bwidth = bwidth_;
    bheight = bheight_;
    normFill = normFill_;
    hoverFill =  hoverFill_;
    normStroke = normStroke_;
    hoverStroke = hoverStroke_;
    butText = butText_;
    textY = centery_;
    font = font_;
    
    hovered = false;
  }
  
  void drawButton() {
    rectMode(CENTER);
    if (hovered) {
      fill(hoverFill);
      stroke(hoverStroke);
    } else {
      fill(normFill);
      stroke(normStroke);
    }
    strokeWeight(4);
    rect(centerx, centery, bwidth, bheight);
    
    textAlign(CENTER,CENTER);
    textFont(font, bheight*.5);
    
    if (hovered) {
      fill(hoverStroke);
    } else {
      fill(normStroke);
    }
    
    text(butText, centerx, textY-3);
  }
  
  void update() {
    hovered = (mouseX > centerx-bwidth/2 && mouseX < centerx+bwidth/2) && (mouseY > centery-bheight/2 && mouseY < centery+bheight/2);
    drawButton();
  }
  
}

