
class Label {
 
  String txt;

  Label(String txt_) {
    txt = txt_;
  }
  
  void display(float x, float y) {
    
    // get text width
    textFont(font); 
    float labelW = textWidth(txt);
    float labelH = 100;
    
    // check if label would go beyond screen dims
    if (x + labelW + 20 > width) {
      x -= labelW + 20;
    }
    if (y - labelH/2 < 0) {
      y += labelH/2 + 20;
    }
    
    // draw bg
    fill(0);
    noStroke();
    rectMode(CORNER); // note: this is the default mode. confusing b/c similar to CORNERS (plural)
    rect(x + 10, y - labelH/2, labelW + 10, labelH/2); 
    
    // draw text  
    fill(255);
    text(txt, x + 15, y - 15);
  }
}

