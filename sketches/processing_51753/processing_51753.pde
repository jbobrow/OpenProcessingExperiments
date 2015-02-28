
class Caption {
  
  PFont elementa;
  String txt;
  float x;
  float y;
 
  Caption(String txt_, float x_, float y_) {
    txt = txt_;
    x = x_;
    y = y_;
     
    // get text width
    float labelW = textWidth(txt);
     
    // check if label would go beyond screen dims
    if (x + labelW + 20 > width) {
      x -= labelW + 20;
    }
     
   
   //void display() {
    // draw bg
    noFill();
    noStroke();
    rectMode(CORNER); // note: this is the default mode. confusing b/c similar to CORNERS (plural)
    rect(x+10, y-30, labelW+10, 22);
     
    // draw text 
    fill(0);
    elementa = createFont("Elementa-Regular-48.vlw", 14);
    textFont(elementa);
    text(txt, x+15, y-15);
  }
  
}


