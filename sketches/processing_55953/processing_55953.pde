
class Button {


  float x;
  float y;
  float w;
  float h;
  boolean isPressed;
  String label;

  Button (float x_, float y_, float w_, float h_, String label_, boolean isPressed_) {

    x = x_;
    y = y_;
    w = w_;
    h = h_;
    label = label_;
    
    isPressed = isPressed_;
  }

  void display () {
    
   // rectMode (CORNER);

    if (!isPressed) {
      fill (90);
    } 
    else {
      fill (color (162, 65, 165));
    } 
    smooth();
    textFont(title_light, 17); 
    rect (x, y, w, h);
    fill (255);
    //textAlign(CENTER); 
    text (label, x+7,y+15);
  }

  void position () {

    
  }

  void checkButtonPressed (float mx, float my) {
    if ((mx > x - w) && (mx < x + w) && (my > y - h) && (my < y + h)) {
      isPressed = true;
    }
  }
}

